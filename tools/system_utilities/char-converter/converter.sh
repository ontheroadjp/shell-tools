#!/bin/bash

set -Ceu

SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
WORDS_CONF="${SCRIPT_DIR}/specific_words.conf"
ZEN2HAN_AWK="${SCRIPT_DIR}/_zen2han.awk"
HAN2ZEN_AWK="${SCRIPT_DIR}/_han2zen.awk"

usage() {
    cat <<__USAGE >&2
Usage: ${0##*/} [OPTIONS] [file|dir ...]
       find . | ${0##*/} [OPTIONS] --rename

Conversion options (at least one required):
  -z, --zen     Full-width -> half-width
  -h, --han     Half-width -> full-width
  -s, --space   Spaces -> underscores
  -w, --words   Apply substitution rules from specific_words.conf

Mode:
      --rename  Transform filenames (mv); default: transform file contents

Without --rename: reads from file args or stdin, writes to stdout.
With --rename:    renames files; accepts file/dir args or stdin (one path per line).
                  Directories are expanded recursively (files inside are renamed).
__USAGE
    exit 1
}

do_zen=0; do_han=0; do_space=0; do_words=0; do_rename=0
targets=()
while [[ $# -gt 0 ]]; do
    case "$1" in
        -z|--zen)    do_zen=1 ;;
        -h|--han)    do_han=1 ;;
        -s|--space)  do_space=1 ;;
        -w|--words)  do_words=1 ;;
        --rename)    do_rename=1 ;;
        --help)      usage ;;
        --)          shift; targets+=("$@"); break ;;
        -*)          usage ;;
        *)           targets+=("$1") ;;
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

_zen2han_filter() {
    if [[ $do_zen -eq 1 ]]; then awk -f "$ZEN2HAN_AWK"; else cat; fi
}
_han2zen_filter() {
    if [[ $do_han -eq 1 ]]; then awk -f "$HAN2ZEN_AWK"; else cat; fi
}
_space_filter() {
    if [[ $do_space -eq 1 ]]; then sed 's/[ 　]/_/g'; else cat; fi
}
_words_filter() {
    if [[ $do_words -eq 1 && ${#words_sed_args[@]} -gt 0 ]]; then
        sed "${words_sed_args[@]}"
    else
        cat
    fi
}

_convert_stream() {
    _zen2han_filter | _han2zen_filter | _space_filter | _words_filter
}

_convert_string() {
    printf '%s\n' "$1" | _convert_stream
}

_rename_file() {
    local file="$1" dir name new_name new_file
    dir=$(dirname "$file")
    name=$(basename "$file")
    new_name=$(_convert_string "$name")
    [[ "$name" == "$new_name" ]] && return 0
    new_file="${dir}/${new_name}"
    mv -n "$file" "$new_file"
    echo "$new_file"
}

_rename_target() {
    local target="$1"
    if [[ -d "$target" ]]; then
        while IFS= read -r f; do
            _rename_file "$f"
        done < <(find "$target" -mindepth 1 -type f | sort)
    elif [[ -e "$target" ]]; then
        _rename_file "$target"
    else
        echo "${0##*/}: not found: $target" >&2
        return 1
    fi
}

_rename_mode() {
    if [[ ${#targets[@]} -gt 0 ]]; then
        for t in "${targets[@]}"; do
            _rename_target "$t"
        done
    elif [[ -p /dev/stdin ]]; then
        while IFS= read -r t; do
            [[ -n "$t" ]] && _rename_target "$t"
        done
    else
        usage
    fi
}

_content_mode() {
    if [[ ${#targets[@]} -gt 0 ]]; then
        for t in "${targets[@]}"; do
            _convert_stream < "$t"
        done
    else
        _convert_stream
    fi
}

if [[ $do_rename -eq 1 ]]; then
    _rename_mode
else
    _content_mode
fi
