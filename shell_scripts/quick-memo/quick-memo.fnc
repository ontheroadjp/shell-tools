QUICK_MEMO_MARKDOWN="${QUICK_MEMO_DATA_DIR}/quick_memo.md"

function _init() {
    if ! type gsed > /dev/null 2>&1; then
        echo "error: you need to install gsed (gnu-sed)"
        echo "install: brew install gnu-sed"
        return
    fi
    mkdir -p ${QUICK_MEMO_DATA_DIR}
}

function _send_mail_quick_memo() {
    [ -z $1 ] && echo "need e-mail address to send email." && return

    local subject="Quick Memo ($(date))"
    cat ${QUICK_MEMO_MARKDOWN} | mail -s "${subject}" "$1"
    echo "e-mail (quick memo) has been sent to $1"
}

function _quick_memo() {
    _init
    # header="## =====> $(date '+%Y%m%d %H:%M:%S') <=====\n\n"
    header="## =====> $(date) <=====\n\n"
    gsed -i -e "1s/^/${header}/" ${QUICK_MEMO_MARKDOWN}
    vim ${QUICK_MEMO_MARKDOWN}
}

function _quick_memo_todo() {
    _init
    if [ -z $1 ]; then
        less ${QUICK_MEMO_MARKDOWN} | rg '\[ \]'
    else
        contents="## =====> $(date) <=====\n"
        todo=''
        for i in $@; do
            todo+="[ ] ${i}\n"
            echo "add todo: $i"
        done
        contents+="${todo}\n"
        gsed -i -e "1s/^/${contents}/" ${QUICK_MEMO_MARKDOWN}
    fi
}
alias qmmail='_send_mail_quick_memo'
alias qm='_quick_memo'
alias todo='_quick_memo_todo' $@

