#!/bin/bash

if [ -z "$1" ]; then
    place=$({
        echo "Sapporo"
        echo "Sendai"
        echo "Fukushima"
        echo "Tokyo"
        echo "Shizuoka"
        echo "Niigata"
        echo "Fukui"
        echo "Kanazawa"
        echo "Nagano"
        echo "Nagoya"
        echo "Osaka"
        echo "Kyoto"
        echo "Okayama"
        echo "Hiroshima"
        echo "Fukuoka"
        echo "Kumamoto"
        echo "Kagoshima"
        echo "Okinawa"
    } | peco)
else
    place="$1"
fi

[ -n "${place}" ] && curl -s "wttr.in/${place}?format=%l:+%c+%t+%h+%p+%m+%M\n"
