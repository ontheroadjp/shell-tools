#!/bin/bash

QUICK_MEMO_DATA_DIR="${QUICK_MEMO_DATA_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/shell-tools/quick-memo}"
QUICK_MEMO_MARKDOWN="${QUICK_MEMO_DATA_DIR}/quick_memo.md"

SED=$(command -v gsed 2>/dev/null || command -v sed)

_init() {
    mkdir -p "${QUICK_MEMO_DATA_DIR}"
    touch "${QUICK_MEMO_MARKDOWN}"
}

_send_mail() {
    [ -z "$1" ] && echo "need e-mail address to send email." && exit 1
    _init
    local subject="Quick Memo ($(date))"
    cat "${QUICK_MEMO_MARKDOWN}" | mail -s "${subject}" "$1"
    echo "e-mail (quick memo) has been sent to $1"
}

_memo() {
    _init
    local header="## =====> $(date) <=====\n\n"
    "$SED" -i -e "1s/^/${header}/" "${QUICK_MEMO_MARKDOWN}"
    vim "${QUICK_MEMO_MARKDOWN}"
}

_todo() {
    _init
    if [ -z "$1" ]; then
        less "${QUICK_MEMO_MARKDOWN}" | rg '\[ \]'
    else
        local contents="## =====> $(date) <=====\n"
        local todo=''
        for i in "$@"; do
            todo+="[ ] ${i}\n"
            echo "add todo: $i"
        done
        contents+="${todo}\n"
        "$SED" -i -e "1s/^/${contents}/" "${QUICK_MEMO_MARKDOWN}"
    fi
}

case "$1" in
    mail)   shift; _send_mail "$@" ;;
    todo)   shift; _todo "$@" ;;
    ""|memo) _memo ;;
    *)
        echo "Usage: $(basename "$0") [memo|todo [items...]|mail <address>]"
        exit 1
        ;;
esac
