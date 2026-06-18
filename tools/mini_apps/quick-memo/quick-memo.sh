#!/bin/bash

QUICK_MEMO_DATA_DIR="${QUICK_MEMO_DATA_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/shell-tools/quick-memo}"
QUICK_MEMO_MARKDOWN="${QUICK_MEMO_DATA_DIR}/quick_memo.md"

SED=$(command -v gsed 2>/dev/null || command -v sed)

_init() {
    mkdir -p "${QUICK_MEMO_DATA_DIR}"
    touch "${QUICK_MEMO_MARKDOWN}"
}

_send_mail() {
    if [ -z "$1" ]; then
        echo "need e-mail address to send email." >&2
        return 1
    fi
    _init
    local subject="Quick Memo ($(date))"
    mail -s "${subject}" "$1" < "${QUICK_MEMO_MARKDOWN}"
    echo "e-mail (quick memo) has been sent to $1"
}

_memo() {
    _init
    local header="## =====> $(date '+%Y-%m-%d %H:%M:%S') <=====\n\n"
    "$SED" -i "1s/^/${header}/" "${QUICK_MEMO_MARKDOWN}"
    "${EDITOR:-vim}" "${QUICK_MEMO_MARKDOWN}"
}

_todo() {
    _init
    if [ -z "$1" ]; then
        rg '\[ \]' "${QUICK_MEMO_MARKDOWN}"
    else
        local contents="## =====> $(date '+%Y-%m-%d %H:%M:%S') <=====\n"
        for item in "$@"; do
            contents+="[ ] ${item}\n"
            echo "add todo: ${item}"
        done
        contents+="\n"
        "$SED" -i "1s/^/${contents}/" "${QUICK_MEMO_MARKDOWN}"
    fi
}

case "$1" in
    mail)    shift; _send_mail "$@" ;;
    todo)    shift; _todo "$@" ;;
    ""|memo) _memo ;;
    *)
        echo "Usage: $(basename "$0") [memo|todo [items...]|mail <address>]" >&2
        exit 1
        ;;
esac
