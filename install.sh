#!/bin/bash

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
BIN_DIR="${BIN_DIR:-${HOME}/dotfiles/bin}"

_find_scripts() {
    find "${REPO_ROOT}/tools" -mindepth 3 -maxdepth 3 -type f \
        \( -name "*.sh" -o -name "*.zsh" -o -name "*.py" \) | sort
}

_tool_name() {
    local f; f="$(basename "$1")"
    echo "${f%.*}"
}

_category() {
    echo "$1" | awk -F'/' '{print $(NF-2)}'
}

_list() {
    printf "  %-24s  %s\n" "TOOL" "CATEGORY"
    printf "  %-24s  %s\n" "------------------------" "--------------------"
    while IFS= read -r script; do
        printf "  %-24s  %s\n" "$(_tool_name "$script")" "$(_category "$script")"
    done < <(_find_scripts)
}

_link_one() {
    local script="$1"
    local name; name="$(_tool_name "$script")"
    local link="${BIN_DIR}/${name}"

    if [ -L "${link}" ] && [ ! -e "${link}" ]; then
        # dangling symlink (e.g. after directory reorganization) → update
        rm "${link}"
        ln -s "${script}" "${link}"
        echo "updated: ${name}"
        return 0
    elif [ -L "${link}" ] && [ -e "${link}" ]; then
        echo "skip:    ${name}"
        return 2
    elif [ -e "${link}" ]; then
        echo "error:   ${name} (file already exists, not a symlink)"
        return 1
    else
        ln -s "${script}" "${link}"
        echo "linked:  ${name}"
        return 0
    fi
}

_install_all() {
    mkdir -p "${BIN_DIR}"
    local linked=0 skipped=0 errors=0

    while IFS= read -r script; do
        _link_one "$script"
        case $? in
            0) (( linked++  )) ;;
            1) (( errors++  )) ;;
            2) (( skipped++ )) ;;
        esac
    done < <(_find_scripts)

    echo ""
    echo "BIN_DIR: ${BIN_DIR}"
    echo "done.    linked=${linked} skipped=${skipped} errors=${errors}"
}

_install_named() {
    mkdir -p "${BIN_DIR}"
    local linked=0 skipped=0 errors=0 notfound=0

    for name in "$@"; do
        local script=""
        while IFS= read -r s; do
            [ "$(_tool_name "$s")" = "$name" ] && script="$s" && break
        done < <(_find_scripts)

        if [ -z "$script" ]; then
            echo "error:  ${name} (not found — run './install.sh list' to see available tools)"
            (( notfound++ ))
        else
            _link_one "$script"
            case $? in
                0) (( linked++  )) ;;
                1) (( errors++  )) ;;
                2) (( skipped++ )) ;;
            esac
        fi
    done

    echo ""
    echo "BIN_DIR: ${BIN_DIR}"
    echo "done.    linked=${linked} skipped=${skipped} errors=${errors} not_found=${notfound}"
}

_unlink_one() {
    local name="$1"
    local link="${BIN_DIR}/${name}"

    if [ -L "${link}" ]; then
        local target; target="$(readlink "${link}")"
        if [[ "${target}" == "${REPO_ROOT}"* ]]; then
            rm "${link}"
            echo "removed: ${name}"
            return 0
        else
            echo "skip:    ${name} (symlink points outside this repo)"
            return 2
        fi
    elif [ -e "${link}" ]; then
        echo "error:   ${name} (not a symlink, skipping)"
        return 1
    else
        echo "skip:    ${name} (not installed)"
        return 2
    fi
}

_uninstall_all() {
    local removed=0 skipped=0 errors=0

    while IFS= read -r script; do
        _unlink_one "$(_tool_name "$script")"
        case $? in
            0) (( removed++  )) ;;
            1) (( errors++   )) ;;
            2) (( skipped++  )) ;;
        esac
    done < <(_find_scripts)

    echo ""
    echo "BIN_DIR: ${BIN_DIR}"
    echo "done.    removed=${removed} skipped=${skipped} errors=${errors}"
}

_uninstall_named() {
    local removed=0 skipped=0 errors=0 notfound=0

    for name in "$@"; do
        local found=false
        while IFS= read -r s; do
            [ "$(_tool_name "$s")" = "$name" ] && found=true && break
        done < <(_find_scripts)

        if ! $found; then
            echo "error:   ${name} (not found — run './install.sh list' to see available tools)"
            (( notfound++ ))
        else
            _unlink_one "$name"
            case $? in
                0) (( removed++  )) ;;
                1) (( errors++   )) ;;
                2) (( skipped++  )) ;;
            esac
        fi
    done

    echo ""
    echo "BIN_DIR: ${BIN_DIR}"
    echo "done.    removed=${removed} skipped=${skipped} errors=${errors} not_found=${notfound}"
}

case "${1:-}" in
    list)      _list ;;
    uninstall) shift; [ $# -eq 0 ] && _uninstall_all || _uninstall_named "$@" ;;
    "")        _install_all ;;
    *)         _install_named "$@" ;;
esac
