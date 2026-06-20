#!/bin/bash

set -Ceu

SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
WORDS_CONF="${SCRIPT_DIR}/specific_words.conf"
ZEN2HAN_AWK="${SCRIPT_DIR}/_zen2han.awk"
HAN2ZEN_AWK="${SCRIPT_DIR}/_han2zen.awk"

usage() {
    cat <<__USAGE >&2
Usage: ${0##*/} [OPTIONS] [file ...]
       find . | ${0##*/} [OPTIONS] --rename [dir ...]

Conversion options (at least one required):
  -z, --zen       Full-width -> half-width
  -h, --han       Half-width -> full-width
  -s, --space     Spaces -> underscores
  -w, --words     Apply substitution rules from specific_words.conf

Mode:
      --rename    Transform filenames (mv); default: transform file contents
                  Without file args, reads paths from stdin (one per line).
                  Directories are expanded recursively.

Other:
  -n, --dry-run   Show what would be done without making changes
__USAGE
    exit 1
}

do_zen=0; do_han=0; do_space=0; do_words=0; do_rename=0; dry_run=0
targets=()
while [[ $# -gt 0 ]]; do
    case "$1" in
        -z|--zen)      do_zen=1 ;;
        -h|--han)      do_han=1 ;;
        -s|--space)    do_space=1 ;;
        -w|--words)    do_words=1 ;;
        --rename)      do_rename=1 ;;
        -n|--dry-run)  dry_run=1 ;;
        --help)        usage ;;
        --)            shift; targets+=("$@"); break ;;
        -*)            usage ;;
        *)             targets+=("$1") ;;
    esac
    shift
done

[[ $((do_zen + do_han + do_space + do_words)) -eq 0 ]] && usage
[[ $do_zen -eq 1 && $do_han -eq 1 ]] && {
    echo "${0##*/}: -z/--zen and -h/--han are mutually exclusive" >&2; exit 1
}

words_sed_args=()
if [[ $do_words -eq 1 ]]; then
    [[ ! -f "$WORDS_CONF" ]] && {
        echo "${0##*/}: words conf not found: $WORDS_CONF" >&2; exit 1
    }
    while IFS= read -r line || [[ -n "$line" ]]; do
        [[ -z "$line" || "$line" == \#* ]] && continue
        if [[ "$line" == *,* ]]; then
            pattern="${line%%,*}"
            replacement="${line#*,}"
        else
            pattern="$line"
            replacement=""
        fi
        words_sed_args+=(-e "s,${pattern},${replacement},g")
    done < "$WORDS_CONF"
fi

_zen2han_filter() { if [[ $do_zen   -eq 1 ]]; then awk -f "$ZEN2HAN_AWK"; else cat; fi }
_han2zen_filter() { if [[ $do_han   -eq 1 ]]; then awk -f "$HAN2ZEN_AWK"; else cat; fi }
_space_filter()   { if [[ $do_space -eq 1 ]]; then sed 's/[ 　]/_/g'; else cat; fi }
_words_filter()   {
    if [[ $do_words -eq 1 && ${#words_sed_args[@]} -gt 0 ]]; then
        sed "${words_sed_args[@]}"
    else
        cat
    fi
}

_convert_stream() { _zen2han_filter | _han2zen_filter | _space_filter | _words_filter; }
_convert_string() { printf '%s\n' "$1" | _convert_stream; }

_ask_confirm() {
    printf 'Proceed? [Y/n] '
    local reply
    read -r reply </dev/tty
    case "${reply}" in
        [Nn]*) echo "Aborted." >&2; exit 0 ;;
    esac
}

# ---------------------------------------------------------------------------
# Rename mode
# ---------------------------------------------------------------------------

_compute_rename() {
    local file="$1" name new_name
    name="${file##*/}"
    new_name=$(_convert_string "$name")
    if [[ "$name" != "$new_name" ]]; then
        printf '%s\t%s\n' "$file" "${file%/*}/${new_name}"
    fi
}

_list_entries() {
    local target="$1"
    if command -v fd &>/dev/null; then
        fd --hidden --no-ignore --min-depth 1 . "$target"
    else
        find "$target" -mindepth 1
    fi
}

_collect_renames_for() {
    local target="$1"
    if [[ -d "$target" ]]; then
        local -a entries
        mapfile -t entries < <(_list_entries "$target" | sort -r)
        [[ ${#entries[@]} -eq 0 ]] && return 0

        local -a new_names
        mapfile -t new_names < <(printf '%s\n' "${entries[@]##*/}" | _convert_stream)

        local i f name new_name dir
        for i in "${!entries[@]}"; do
            f="${entries[$i]}"
            name="${f##*/}"
            new_name="${new_names[$i]}"
            if [[ "$name" != "$new_name" ]]; then
                dir="${f%/*}"
                printf '%s\t%s\n' "$f" "${dir}/${new_name}"
            fi
        done
    elif [[ -e "$target" ]]; then
        _compute_rename "$target"
    else
        echo "${0##*/}: not found: $target" >&2
    fi
}

_rename_mode() {
    local -a pairs=()
    local line src dst

    if [[ ${#targets[@]} -gt 0 ]]; then
        for t in "${targets[@]}"; do
            while IFS= read -r line; do
                [[ -n "$line" ]] && pairs+=("$line")
            done < <(_collect_renames_for "$t")
        done
    elif [[ -p /dev/stdin ]]; then
        while IFS= read -r t; do
            [[ -z "$t" ]] && continue
            while IFS= read -r line; do
                [[ -n "$line" ]] && pairs+=("$line")
            done < <(_collect_renames_for "$t")
        done
    else
        usage
    fi

    if [[ ${#pairs[@]} -eq 0 ]]; then
        echo "Nothing to rename." >&2; exit 0
    fi

    local label
    if [[ $dry_run -eq 1 ]]; then
        label="[DRY RUN] Would rename:"
    else
        label="Will rename:"
    fi

    echo "$label"
    for pair in "${pairs[@]}"; do
        src="${pair%%	*}"; dst="${pair##*	}"
        printf '  %s  →  %s\n' "${src##*/}" "${dst##*/}"
    done

    [[ $dry_run -eq 1 ]] && exit 0

    _ask_confirm

    for pair in "${pairs[@]}"; do
        src="${pair%%	*}"; dst="${pair##*	}"
        mv -n "$src" "$dst" && echo "$dst"
    done
}

# ---------------------------------------------------------------------------
# Content mode
# ---------------------------------------------------------------------------

_content_mode() {
    if [[ ${#targets[@]} -eq 0 ]]; then
        _convert_stream
        return
    fi

    if [[ $dry_run -eq 1 ]]; then
        echo "[DRY RUN] Would modify in place:"
        for t in "${targets[@]}"; do echo "  $t"; done
        exit 0
    fi

    echo "Will modify in place:"
    for t in "${targets[@]}"; do echo "  $t"; done
    _ask_confirm

    local tmp
    tmp=$(mktemp)
    for t in "${targets[@]}"; do
        _convert_stream < "$t" >| "$tmp"
        mv "$tmp" "$t"
    done
}

# ---------------------------------------------------------------------------
# Entry point
# ---------------------------------------------------------------------------

if [[ $do_rename -eq 1 ]]; then
    _rename_mode
else
    _content_mode
fi
