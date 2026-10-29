#!/bin/bash

set -Ceu

SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
WORDS_CONF="${SCRIPT_DIR}/specific_words.conf"
ZEN2HAN_AWK="${SCRIPT_DIR}/_zen2han.awk"
HAN2ZEN_AWK="${SCRIPT_DIR}/_han2zen.awk"

usage() {
    cat <<__USAGE >&2
Usage: ${0##*/} [OPTIONS] [file_or_dir ...]
       find . | ${0##*/} [OPTIONS]

Rename files and directories. Without path args, reads paths from stdin
(one per line). Directories are expanded to their direct children only.

Default conversions (all on): full-width -> half-width, spaces -> underscores,
and substitution rules from specific_words.conf.

Conversion options:
      --han       Half-width -> full-width (replaces the default full -> half)
      --no-zen    Skip full-width -> half-width
      --no-space  Skip spaces -> underscores
      --no-words  Skip specific_words.conf rules

Other:
  -r, --recursive Include files and directories in all subdirectories
      --dry-run   Show what would be done without making changes
__USAGE
    exit 1
}

do_zen=1; do_han=0; do_space=1; do_words=1; do_recursive=0; dry_run=0
targets=()
while [[ $# -gt 0 ]]; do
    case "$1" in
        --han)         do_han=1; do_zen=0 ;;
        --no-zen)      do_zen=0 ;;
        --no-space)    do_space=0 ;;
        --no-words)    do_words=0 ;;
        -r|--recursive) do_recursive=1 ;;
        --dry-run)     dry_run=1 ;;
        --help)        usage ;;
        --)            shift; targets+=("$@"); break ;;
        -*)            usage ;;
        *)             targets+=("$1") ;;
    esac
    shift
done

[[ $((do_zen + do_han + do_space + do_words)) -eq 0 ]] && usage

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

# Directory part of a path including the trailing slash; empty for a bare name
# (relative to the current directory).
_dirname_of() {
    local p="$1"
    [[ "$p" == */* ]] && printf '%s/' "${p%/*}"
    return 0
}

_compute_rename() {
    local file="$1" name new_name
    name="${file##*/}"
    new_name=$(_convert_string "$name")
    if [[ "$name" != "$new_name" ]]; then
        printf '%s\t%s\n' "$file" "$(_dirname_of "$file")${new_name}"
    fi
}

_list_entries() {
    local target="$1"
    local maxdepth=1
    [[ $do_recursive -eq 1 ]] && maxdepth=""
    if command -v fd &>/dev/null; then
        fd --hidden --no-ignore --min-depth 1 ${maxdepth:+--max-depth "$maxdepth"} . "$target"
    else
        find "$target" -mindepth 1 ${maxdepth:+-maxdepth "$maxdepth"}
    fi
}

_collect_renames_for() {
    local target="$1"
    if [[ -d "$target" ]]; then
        echo "${0##*/}: scanning ${target} (large trees may take a while)..." >&2
        local -a entries
        mapfile -t entries < <(_list_entries "$target" | sed 's,/$,,' | sort -r)
        [[ ${#entries[@]} -eq 0 ]] && return 0

        local -a new_names
        mapfile -t new_names < <(printf '%s\n' "${entries[@]##*/}" | _convert_stream)

        local i f name new_name
        for i in "${!entries[@]}"; do
            f="${entries[$i]}"
            name="${f##*/}"
            new_name="${new_names[$i]}"
            if [[ "$name" != "$new_name" ]]; then
                printf '%s\t%s\n' "$f" "$(_dirname_of "$f")${new_name}"
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

_rename_mode
