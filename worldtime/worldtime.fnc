function _print_world_time() {
    printf "Sydney:\t\t" && TZ=Australia/Sydney date "+[%l:%M %p] %A, %h %d, %Y"
    printf "Tokyo:\t\t" && TZ=Asia/Tokyo date "+[%l:%M %p] %A, %h %d, %Y"
    printf "Shanghai:\t" && TZ=Asia/Shanghai date "+[%l:%M %p] %A, %h %d, %Y"
    printf "London:\t\t" && TZ=Europe/London date "+[%l:%M %p] %A, %h %d, %Y"
    printf "New York:\t" && TZ=America/New_York date "+[%l:%M %p] %A, %h %d, %Y"
    printf "Los Angeles:\t" && TZ=America/Los_Angeles date "+[%l:%M %p] %A, %h %d, %Y"
}

function _show_world_time() {
    [ $# -eq 0 ] && {
        _print_world_time
    } || {
        while (( $# > 0 )); do
            _print_world_time | grep -i ${1:-''}
            shift
        done
    }
}
alias wt='_show_world_time'

function _show_timezone() {
    local tz
    local tz_version
    [ $# -eq 0 ] && {
        tz_version="$(find /var/db/timezone/tz -type d -maxdepth 1 \
                                | sort \
                                | tail -1 \
                                | rev \
                                | cut -d '/' -f 1 \
                                | rev)"
        tz=$(find /var/db/timezone/tz/${tz_version}/zoneinfo -type f \
            | sed -e "s:/var/db/timezone/tz/${tz_version}/zoneinfo/::g" \
            | peco --prompt "which city ? >")
    } || {
        tz=$1
    }

    [ ! -z ${tz} ] && printf "${tz}: "; TZ=${tz} date
}
alias tz="_show_timezone"


