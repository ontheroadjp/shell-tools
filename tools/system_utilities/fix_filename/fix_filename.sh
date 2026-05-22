#!/bin/bash

set -Ceu

usage() {
    echo "Usage: ${0##*/} [-c <conf_file> ...] <file|dir> ..." >&2
    exit 1
}

conf_files=()
while getopts "c:" opt; do
    case $opt in
        c) conf_files+=("$OPTARG") ;;
        *) usage ;;
    esac
done
shift $((OPTIND - 1))

[ ${#conf_files[@]} -eq 0 ] && usage

for f in "${conf_files[@]}"; do
    [ -f "$f" ] || { echo "${0##*/}: conf file not found: $f" >&2; exit 1; }
done

[ $# -eq 0 ] && ! [ -p /dev/stdin ] && usage

sed_args=()
for conf in "${conf_files[@]}"; do
    while IFS= read -r line || [ -n "$line" ]; do
        [[ -z "$line" || "$line" == \#* ]] && continue
        if [[ "$line" == *,* ]]; then
            pattern="${line%%,*}"
            replacement="${line#*,}"
        else
            pattern="$line"
            replacement=""
        fi
        sed_args+=(-e "s,${pattern},${replacement},g")
    done < "$conf"
done

_exec() {
    local file="$1"
    local new_file="$file"

    if [ ${#sed_args[@]} -gt 0 ]; then
        new_file=$(echo "${new_file}" | sed "${sed_args[@]}")
    fi

    local new_dir dir
    new_dir=$(dirname "${new_file}")
    dir=$(dirname "${file}")

    [ ! -e "${new_dir}" ] && {
        mkdir "${new_dir}"
        mv $(find "${dir}" -mindepth 1) "${new_dir}" 2>/dev/null || true
        [ $(find "${dir}" -mindepth 1 | wc -l) -eq 0 ] && rm -rf "${dir}"
    }
    mv -n "${file}" "${new_file}"
    echo "${new_file}"
}

_rename() {
    for file in "$@"; do
        if [ -d "$file" ]; then
            for f in $(find "$file" -mindepth 1 -type f); do
                _exec "$f"
            done
        elif [ -e "$file" ]; then
            _exec "$file"
        fi
    done
}

STASH_IFS=${IFS}
IFS=$'\n'
if [ -p /dev/stdin ]; then
    _rename $(cat -)
else
    _rename "$@"
fi
IFS=${STASH_IFS}
