function _dirmarks() {
    dirmarks="${HOME}/.data"
    mkdir -p ${dirmarks}

    case $1 in
        mark )
            pwd > ${dirmarks}/${2}${2}
            echo 'markd!'
            return 0
            ;;
        jump )
            [ -f ${dirmarks}/${2}${2} ] && {
                cat ${dirmarks}/${2}${2}
                cd $(cat ${dirmarks}/${2}${2})
            } || echo "not set."
            return 0
            ;;
    esac
}

alias mm='_dirmarks mark m'
alias nn='_dirmarks mark n'
alias ii='_dirmarks mark i'
alias oo='_dirmarks mark o'

alias m='_dirmarks jump m'
alias nn='_dirmarks jump n'
alias ii='_dirmarks jump i'
alias oo='_dirmarks jump o'
