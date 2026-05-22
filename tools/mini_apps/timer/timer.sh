#!/bin/bash

sec=0

for arg in "$@"; do
    if [[ "$arg" =~ ([0-9]+)([hms]) ]]; then
        num="${BASH_REMATCH[1]}"
        unit="${BASH_REMATCH[2]}"
        case "$unit" in
            h) (( sec += num * 3600 )) ;;
            m) (( sec += num * 60   )) ;;
            s) (( sec += num        )) ;;
        esac
    fi
done

if [ "$sec" -eq 0 ]; then
    echo "Usage: $(basename "$0") <time> (e.g. 1h30m, 45m, 90s)"
    exit 1
fi

echo "After $sec sec"
sleep "$sec"

_notify() {
    local msg="$1"
    if command -v osascript >/dev/null 2>&1; then
        osascript -e "display notification \"${msg}\" with title \"Timer\""
    elif command -v notify-send >/dev/null 2>&1; then
        notify-send "Timer" "$msg"
    else
        echo "Timer: $msg"
    fi
}

_play() {
    if command -v afplay >/dev/null 2>&1; then
        afplay /System/Library/Sounds/Glass.aiff
        afplay /System/Library/Sounds/Submarine.aiff
        afplay /System/Library/Sounds/Ping.aiff
    elif command -v paplay >/dev/null 2>&1; then
        sound=/usr/share/sounds/freedesktop/stereo/complete.oga
        [ -f "$sound" ] && paplay "$sound" && paplay "$sound" && paplay "$sound"
    elif command -v aplay >/dev/null 2>&1; then
        sound=/usr/share/sounds/alsa/Front_Center.wav
        [ -f "$sound" ] && aplay "$sound" && aplay "$sound" && aplay "$sound"
    fi
}

_notify "${sec} seconds elapsed."
_play
