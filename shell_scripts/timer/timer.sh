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
osascript -e "display notification \"${sec} seconds elapsed.\" with title \"Timer\""
afplay /System/Library/Sounds/Glass.aiff
afplay /System/Library/Sounds/Submarine.aiff
afplay /System/Library/Sounds/Ping.aiff
