#!/bin/bash

airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport

_red()    { xargs -I{} echo $'\e[31m{}\e[m'; }
_yellow() { xargs -I{} echo $'\e[33m{}\e[m'; }
_green()  { xargs -I{} echo $'\e[32m{}\e[m'; }

_lookup() { egrep "$1" | awk '{print $2}'; }

_color() {
    while read line; do
        int=$(echo "${line}" | cut -f1 -d. | perl -ne '$_ =~ /(\d+)/; print $1')
        if [ "${int}" -gt "$1" ]; then
            echo "${line}" | _green
        elif [ "${int}" -gt "$2" ]; then
            echo "${line}" | _yellow
        else
            echo "${line}" | _red
        fi
    done
}

_colorlt() {
    while read line; do
        int=$(echo "$line" | cut -f1 -d.)
        if [ "$int" -lt "$1" ]; then
            echo "$line" | _green
        elif [ "$int" -lt "$2" ]; then
            echo "$line" | _yellow
        else
            echo "$line" | _red
        fi
    done
}

_okng() {
    while read line; do
        int=$(echo "$line" | cut -f1 -d.)
        if [ "$int" -eq 0 ]; then
            echo OK | _green
        else
            echo NG | _red
        fi
    done
}

_collect_wifi_data() {
    air=$("${airport}" -I)
    ssid=$(echo "${air}"   | _lookup "\sSSID")
    bssid=$(echo "${air}"  | _lookup BSSID)
    channel=$(echo "${air}"| _lookup channel | cut -d ',' -f1)
    rssi=$(echo "${air}"   | _lookup agrCtlRSSI)
    noise=$(echo "${air}"  | _lookup agrCtlNoise)
    snr=$(echo "${rssi} - ${noise}" | bc)
    txrate=$(echo "${air}" | _lookup lastTxRate)
    maxrate=$(echo "${air}"| _lookup maxRate)
    mcs=$(echo "${air}"    | _lookup MCS)

    if [ "${channel}" -lt 15 ]; then
        band="2.4GHz"
    elif [ "${channel}" -lt 141 ]; then
        case "${channel}" in
            34|38|42|46)                                    band="5GHz(J52)";;
            36|40|44|48)                                    band="5GHz(W52)";;
            52|56|60|64)                                    band="5GHz(W53)";;
            100|104|108|112|116|120|124|128|132|136|140)   band="5GHz(W56)";;
        esac
    else
        band="Unknown"
    fi
}

_display_internet_info() {
    address=$(ifconfig en0 | _lookup "inet ")
    gateway=$(netstat -nr | _lookup ^default | head -n 1)

    echo Address: ${address}
    echo Gateway: ${gateway}

    ping_result=$(ping -i0.1 -t1 -c10 "${gateway}")
    loss=$(echo "${ping_result}" | tail -n2 | head -1 | awk '{print $7}' | cut -f1 -d'%')
    ok=$(echo "100 - ${loss}" | bc | cut -f1 -d. | _color 99 59)
    ttl=$(echo "${ping_result}" | tail -n1 | cut -f6 -d/)
    echo Ping: $(echo "${ttl}" | _colorlt 1 9) ms "(${ok}% packets transmitted)"

    dig +short jp. SOA | egrep dns\.jp >/dev/null 2>&1
    echo "DNS:   $(echo $? | _okng)"
    echo
}

_display_wifi_info() {
    echo SSID:    $(echo "${ssid}"    | _green)
    echo BSSID:   $(echo "${bssid}"   | _green)
    echo "CHANNEL: $(echo "${channel}ch: ${band}" | _color 15 15)"
    echo
}

_display_radio_info() {
    echo "RSSI:  $(echo "${rssi}"    | _color -55 -70) / $(echo "${noise}" | _colorlt -80 -70)  (S/N: $(echo "${snr}" | _color 30 20))"
    echo "Rate:  $(echo "${txrate}"  | _color 47 28) / $(echo "${maxrate}" | _color 70 36)"
    echo "MCS:   $(echo "${mcs}"     | _color 7 5)"
    echo
}

case "$1" in
    inetinfo)
        _display_internet_info
        ;;
    wifiinfo)
        _collect_wifi_data
        _display_wifi_info
        ;;
    radioinfo)
        _collect_wifi_data
        _display_radio_info
        ;;
    ""|wificheck)
        _collect_wifi_data
        _display_internet_info
        _display_wifi_info
        _display_radio_info
        ;;
    *)
        echo "Usage: $(basename "$0") [inetinfo|wifiinfo|radioinfo|wificheck]"
        exit 1
        ;;
esac
