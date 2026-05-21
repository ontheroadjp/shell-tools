#!/bin/bash

_print_world_time() {
    printf "Sydney:\t\t"     && TZ=Australia/Sydney    date "+[%l:%M %p] %A, %h %d, %Y"
    printf "Tokyo:\t\t"      && TZ=Asia/Tokyo           date "+[%l:%M %p] %A, %h %d, %Y"
    printf "Shanghai:\t"     && TZ=Asia/Shanghai        date "+[%l:%M %p] %A, %h %d, %Y"
    printf "London:\t\t"     && TZ=Europe/London        date "+[%l:%M %p] %A, %h %d, %Y"
    printf "New York:\t"     && TZ=America/New_York     date "+[%l:%M %p] %A, %h %d, %Y"
    printf "Los Angeles:\t"  && TZ=America/Los_Angeles  date "+[%l:%M %p] %A, %h %d, %Y"
}

_show_timezone() {
    if [ $# -eq 0 ]; then
        tz_version=$(find /var/db/timezone/tz -type d -maxdepth 1 \
            | sort | tail -1 | rev | cut -d '/' -f 1 | rev)
        tz=$(find "/var/db/timezone/tz/${tz_version}/zoneinfo" -type f \
            | sed -e "s:/var/db/timezone/tz/${tz_version}/zoneinfo/::g" \
            | peco --prompt "which city ? >")
    else
        tz="$1"
    fi
    [ -n "${tz}" ] && printf "${tz}: " && TZ="${tz}" date
}

case "$1" in
    tz)     shift; _show_timezone "$@" ;;
    ""|wt)
        shift
        if [ $# -eq 0 ]; then
            _print_world_time
        else
            while (( $# > 0 )); do
                _print_world_time | grep -i "$1"
                shift
            done
        fi
        ;;
    *)
        _print_world_time | grep -i "$1"
        ;;
esac
