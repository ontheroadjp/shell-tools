# @(#)Commandline timer with notification center
# @(#)Usage: $0 [-h] <time h/m/s>
function _timer() {
    local sec=0
    local num unit
    local arg

    for arg in "$@"; do
        if [[ "$arg" =~ ([0-9]+)([hms]) ]]; then
            if [[ $SHELL == */bash ]]; then
                num="${BASH_REMATCH[1]}"
                unit="${BASH_REMATCH[2]}"
            elif [[ $SHELL == */zsh ]]; then
                num="${match[1]}"
                unit="${match[2]}"
            fi

            case "$unit" in
                h) (( sec += num * 3600 )) ;;
                m) (( sec += num * 60   )) ;;
                s) (( sec += num        )) ;;
            esac
        fi
    done

    echo "After $sec sec"
    sleep "$sec"
    osascript -e "display notification \"${sec} seconds elapsed.\" with title \"Timer\""
    afplay /System/Library/Sounds/Glass.aiff
    afplay /System/Library/Sounds/Submarine.aiff
    afplay /System/Library/Sounds/Ping.aiff
}
alias timer='_timer'
