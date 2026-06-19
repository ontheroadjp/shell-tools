#!/bin/bash

_usage() {
    echo "Usage: $(basename "$0") [-i] <dir>"
    echo "  <dir>   directory to scan for broken symlinks"
    echo "  -i      interactively remove broken symlinks (prompts Y/n for each)"
    exit 1
}

_find_broken() {
    find "$1" -type l ! -exec test -e {} \; -print
}

_interactive=false
_dir=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        -i) _interactive=true; shift ;;
        -*) _usage ;;
        *)  _dir="$1"; shift ;;
    esac
done

[[ -z "$_dir" ]] && _usage
[[ ! -d "$_dir" ]] && { echo "Error: '$_dir' is not a directory"; exit 1; }

mapfile -t _broken < <(_find_broken "$_dir")

if [[ ${#_broken[@]} -eq 0 ]]; then
    echo "No broken symlinks found in '$_dir'."
    exit 0
fi

if ! $_interactive; then
    printf '%s\n' "${_broken[@]}"
    exit 0
fi

echo "WARNING: The following broken symlinks will be removed:"
printf '  %s\n' "${_broken[@]}"
echo ""

for _link in "${_broken[@]}"; do
    printf "Remove '%s'? [Y/n] " "$_link"
    read -r _ans
    case "$_ans" in
        [Yy]|"")
            rm -- "$_link" && echo "  Removed: $_link" || echo "  Failed:  $_link"
            ;;
        *)
            echo "  Skipped: $_link"
            ;;
    esac
done
