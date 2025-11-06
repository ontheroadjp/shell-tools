#!/bin/bash
# create_dummy_files.sh
# Bash 3 対応、テストモード・実作成・ツリー・カラー対応

set -Ceu

SCRIPT_FILE_NAME=$(basename "$0")
SCRIPT_NAME=${SCRIPT_FILE_NAME%.*}

LOGGING=false
VERSION="1.4.0"
SEPARATER='---------------------------'
IS_APPLY=false
IS_EACH=false
OUT_FILE_EXT='txt'
OUT_FILE_NUMBER=1
WITH_WHITESPACE=false
ZENKAKU=false
IS_NO_SYMBOL=false
ARG_VALUES=()
DIRS=()

# -------------------------------------------------------------
# Color output
C_RED="\e[31m"
C_GREEN="\e[32m"
C_YELLOW="\e[33m"
C_BLUE="\e[34m"
C_MAGENTA="\e[35m"
C_RESET="\e[0m"

# -------------------------------------------------------------
# Logging
_log() {
    ${LOGGING} && echo -e "${C_RED}[DEBUG]${C_RESET} $*" || return 0
}

_test() {
    echo -e "${C_YELLOW}[TEST]${C_RESET} $*"
}

_ok() {
    echo -e "${C_GREEN}[OK]${C_RESET} $*"
}

# -------------------------------------------------------------
_usage() {
    echo "Usage: ${SCRIPT_NAME} [OPTIONS] [DESTINATION]..."
    echo "Options:"
    echo "  -h, --help            Show help"
    echo "  -v, --verbose         Show debug logs"
    echo "      --apply           Actually create files (default is test only)"
    echo "  -n, --number N        Number of files per directory"
    echo "  -e, --ext EXT         File extension (default: txt)"
    echo "      --each            Create files also in parent directories"
    echo
    echo "Example:"
    echo "  $SCRIPT_NAME tests/ -n 5 --apply"
    exit 0
}

# -------------------------------------------------------------
# Parse arguments
_analyze_args_and_options() {
    while (( $# > 0 )); do
        case $1 in
            -h|--help) _usage ;;
            -v|--verbose) LOGGING=true; shift ;;
            --apply) IS_APPLY=true; shift ;;
            --each) IS_EACH=true; shift ;;
            -n|--number) OUT_FILE_NUMBER=$2; shift 2 ;;
            -e|--ext) OUT_FILE_EXT=$2; shift 2 ;;
            *) ARG_VALUES+=("$1"); shift ;;
        esac
    done
}

_set_dirs() {
    : ${ARG_VALUES:=.}
    for i in "${ARG_VALUES[@]}"; do
        DIRS+=("${i%/}")
    done
    _log "DIRS after _set_dirs: ${DIRS[*]}"
}

# -------------------------------------------------------------
# Create files (or log in test mode)
_create_files() {
    local dest="$1"
    _log "_create_files called for dir: $dest, OUT_FILE_NUMBER=$OUT_FILE_NUMBER"

    local i fname seed char_count

    mkdir -p "$dest" 2>/dev/null || true

    for i in $(seq 1 "$OUT_FILE_NUMBER"); do
        seed='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
        ${IS_NO_SYMBOL} || seed="${seed}._-~%!$&'()*+,;=:@"
        ${ZENKAKU} && seed="${seed}あかさたなはまやらわいきしちにうくすつぬへめえれえわをん"

        ${WITH_WHITESPACE} && char_count=5 || char_count=10

        fname=$(echo "$seed" | fold -w1 | shuf | head -c"$char_count" | tr -d '\n')
        fname="${fname}.${OUT_FILE_EXT}"

        if ${IS_APPLY}; then
            touch "$dest/$fname"
            _log "created: $dest/$fname"
        else
            _test "would create: $dest/$fname"
        fi
    done
}

# -------------------------------------------------------------
# Show tree
_show_tree() {
    local dir="$1"
    _log "_show_tree called for dir: $dir"

    echo -e "${C_MAGENTA}Tree for $dir/${C_RESET}"
    for f in "$dir"/*."$OUT_FILE_EXT"; do
        [ -e "$f" ] || continue
        echo "├─ $(basename "$f")"
    done
}

# -------------------------------------------------------------
_main() {
    _log "_main called"

    local dir i

    for dir in "${DIRS[@]}"; do
        _log "Processing dir: $dir"
        _create_files "$dir"

        if ${IS_EACH}; then
            while [[ "$dir" == */* ]]; do
                dir="${dir%/*}"
                [ -z "$dir" ] && break
                _create_files "$dir"
            done
        fi

        # Always show tree for directory
        _show_tree "$dir"
    done
}

# -------------------------------------------------------------
# Entry point
_analyze_args_and_options "$@"
_set_dirs
_main
_ok "Done."
