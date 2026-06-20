#!/bin/bash

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
BIN_DIR="${BIN_DIR:-${HOME}/dotfiles/bin}"
CONFIG_DIR="${CONFIG_DIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/shell-tools}"

_find_scripts() {
    find "${REPO_ROOT}/tools" -mindepth 3 -maxdepth 3 -type f \
        \( -name "*.sh" -o -name "*.zsh" -o -name "*.py" \) | sort
}

_find_credentials() {
    find "${REPO_ROOT}/tools" -mindepth 3 -maxdepth 3 -name "credentials" -type f | sort
}

_tool_name() {
    basename "$1" | sed 's/\.[^.]*$//'
}

_tool_dir_name() {
    basename "$(dirname "$1")"
}

_category() {
    basename "$(dirname "$(dirname "$1")")"
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
    local name="$(_tool_name "$script")"
    local link="${BIN_DIR}/${name}"

    if [ ! -x "$script" ]; then
        echo "warning: ${name} (script is not executable, skipped)"
        return 2
    fi

    if [ -L "${link}" ]; then
        local target="$(readlink "${link}")"
        if [ "${target}" = "${script}" ]; then
            echo "skip:    ${name} (already linked correctly)"
            return 2
        else
            # リンク先が異なる、あるいはリンク切れの場合は再作成
            rm "${link}"
            ln -s "${script}" "${link}"
            echo "updated: ${name} (target changed)"
            return 0
        fi
    elif [ -e "${link}" ]; then
        echo "error:   ${name} (file exists and is not a symlink)"
        return 1
    else
        ln -s "${script}" "${link}"
        echo "linked:  ${name}"
        return 0
    fi
}

_link_credential() {
    local cred="$1"
    local name="$(_tool_dir_name "$cred")"
    local link_dir="${CONFIG_DIR}/${name}"
    local link="${link_dir}/credentials"

    mkdir -p "${link_dir}"

    if [ -L "${link}" ]; then
        local target="$(readlink "${link}")"
        if [ "${target}" = "${cred}" ]; then
            echo "skip:    ${name}/credentials (already linked correctly)"
            return 2
        else
            rm "${link}"
            ln -s "${cred}" "${link}"
            echo "updated: ${name}/credentials (target changed)"
            return 0
        fi
    elif [ -e "${link}" ]; then
        echo "error:   ${name}/credentials (file exists and is not a symlink)"
        return 1
    else
        ln -s "${cred}" "${link}"
        echo "linked:  ${name}/credentials"
        return 0
    fi
}

_unlink_credential() {
    local name="$1"
    local link="${CONFIG_DIR}/${name}/credentials"

    if [ -L "${link}" ]; then
        local target="$(readlink "${link}")"
        if [[ "${target}" == "${REPO_ROOT}"* ]]; then
            rm "${link}"
            echo "removed: ${name}/credentials"
            return 0
        else
            echo "skip:    ${name}/credentials (symlink points outside this repo)"
            return 2
        fi
    elif [ -e "${link}" ]; then
        echo "error:   ${name}/credentials (not a symlink, skipping)"
        return 1
    else
        echo "skip:    ${name}/credentials (not installed)"
        return 2
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

    while IFS= read -r cred; do
        _link_credential "$cred"
        case $? in
            0) (( linked++  )) ;;
            1) (( errors++  )) ;;
            2) (( skipped++ )) ;;
        esac
    done < <(_find_credentials)

    echo ""
    echo "BIN_DIR:    ${BIN_DIR}"
    echo "CONFIG_DIR: ${CONFIG_DIR}"
    echo "done.    linked=${linked} skipped=${skipped} errors=${errors}"
}

_install_named() {
    mkdir -p "${BIN_DIR}"
    local linked=0 skipped=0 errors=0 notfound=0

    for name in "$@"; do
        # find の再帰呼び出しを避け、直接対象を検索する
        local script="$(find "${REPO_ROOT}/tools" -type f \( -name "${name}.sh" -o -name "${name}.zsh" -o -name "${name}.py" \) | head -n 1)"

        if [ -z "$script" ]; then
            echo "error:   ${name} (not found — run './install.sh list')"
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
        local target="$(readlink "${link}")"
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
        local script="$(find "${REPO_ROOT}/tools" -type f \( -name "${name}.sh" -o -name "${name}.zsh" -o -name "${name}.py" \) | head -n 1)"

        if [ -z "$script" ]; then
            echo "error:   ${name} (not found — run './install.sh list')"
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
