#!/bin/bash

_red()    { xargs -I{} echo $'\e[31m{}\e[m'; }
_yellow() { xargs -I{} echo $'\e[33m{}\e[m'; }
_green()  { xargs -I{} echo $'\e[32m{}\e[m'; }

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

is_mac()   { [[ "$OSTYPE" =~ 'darwin' ]]; }
is_linux() { [[ "$OSTYPE" =~ 'linux' ]]; }

# ---- macOS ----

_mac_collect_wifi_data() {
    local airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
    local air=$("$airport" -I)
    ssid=$(    echo "$air" | awk '/^ *SSID/{print $2}')
    bssid=$(   echo "$air" | awk '/BSSID/{print $2}')
    channel=$( echo "$air" | awk '/channel/{print $2}' | cut -d, -f1)
    rssi=$(    echo "$air" | awk '/agrCtlRSSI/{print $2}')
    noise=$(   echo "$air" | awk '/agrCtlNoise/{print $2}')
    snr=$(echo "${rssi} - ${noise}" | bc)
    txrate=$(  echo "$air" | awk '/lastTxRate/{print $2}')
    maxrate=$( echo "$air" | awk '/maxRate/{print $2}')
    mcs=$(     echo "$air" | awk '/MCS/{print $2}')

    if [ "${channel}" -lt 15 ]; then
        band="2.4GHz"
    else
        case "${channel}" in
            34|38|42|46)                                    band="5GHz(J52)";;
            36|40|44|48)                                    band="5GHz(W52)";;
            52|56|60|64)                                    band="5GHz(W53)";;
            100|104|108|112|116|120|124|128|132|136|140)   band="5GHz(W56)";;
            *)                                              band="5GHz";;
        esac
    fi
}

_mac_display_internet_info() {
    local address gateway ping_result loss ok ttl
    address=$(ifconfig en0 | awk '/inet /{print $2}')
    gateway=$(netstat -nr | awk '/^default/{print $2; exit}')
    echo "Address: ${address}"
    echo "Gateway: ${gateway}"
    ping_result=$(ping -i0.1 -t1 -c10 "${gateway}")
    loss=$(echo "${ping_result}" | tail -n2 | head -1 | awk '{print $7}' | cut -f1 -d'%')
    ok=$(echo "100 - ${loss}" | bc | cut -f1 -d. | _color 99 59)
    ttl=$(echo "${ping_result}" | tail -n1 | cut -f6 -d/)
    echo "Ping: $(echo "${ttl}" | _colorlt 1 9) ms (${ok}% packets transmitted)"
    dig +short jp. SOA | grep dns\.jp >/dev/null 2>&1
    echo "DNS:   $(echo $? | _okng)"
    echo
}

# ---- Linux ----

_linux_get_wifi_iface() {
    iw dev 2>/dev/null | awk '/Interface/{print $2; exit}' || \
    iwconfig 2>/dev/null | awk '/ESSID/{print $1; exit}'
}

_linux_collect_wifi_data() {
    local iface=$(_linux_get_wifi_iface)
    if [ -z "$iface" ]; then
        ssid="unknown"; bssid="unknown"; channel="0"; rssi="0"
        noise="-95"; snr="0"; txrate="0"; maxrate="0"; mcs="0"; band="unknown"
        return 1
    fi

    local link=$(iw dev "$iface" link 2>/dev/null)
    ssid=$(  echo "$link" | awk '/SSID/{print $2}')
    bssid=$( echo "$link" | awk '/Connected to/{print $3}')
    channel=$(iw dev "$iface" info 2>/dev/null | awk '/channel/{print $2}')
    rssi=$(  echo "$link" | awk '/signal/{print $2}')
    txrate=$(echo "$link" | awk '/tx bitrate/{print $3}')
    noise="-95"; snr=""; mcs=""; maxrate="$txrate"

    if [ -n "$channel" ] && [ "$channel" -le 14 ]; then
        band="2.4GHz"
    else
        band="5GHz"
    fi
}

_linux_display_internet_info() {
    local iface address gateway ping_result loss ok ttl
    iface=$(_linux_get_wifi_iface)
    address=$(ip addr show "$iface" 2>/dev/null | awk '/inet /{print $2}' | cut -d/ -f1)
    gateway=$(ip route 2>/dev/null | awk '/^default/{print $3; exit}')
    echo "Address: ${address}"
    echo "Gateway: ${gateway}"
    ping_result=$(ping -i0.2 -W1 -c10 "${gateway}" 2>/dev/null)
    loss=$(echo "${ping_result}" | tail -n2 | head -1 | awk '{print $7}' | cut -f1 -d'%')
    ok=$(echo "100 - ${loss:-100}" | bc | cut -f1 -d. | _color 99 59)
    ttl=$(echo "${ping_result}" | tail -n1 | cut -f6 -d/ | awk '{print $1}')
    echo "Ping: $(echo "${ttl}" | _colorlt 1 9) ms (${ok}% packets transmitted)"
    dig +short jp. SOA 2>/dev/null | grep dns\.jp >/dev/null 2>&1
    echo "DNS:   $(echo $? | _okng)"
    echo
}

# ---- shared display ----

_display_wifi_info() {
    echo "SSID:    $(echo "${ssid}"  | _green)"
    echo "BSSID:   $(echo "${bssid}" | _green)"
    echo "CHANNEL: $(echo "${channel}ch: ${band}" | _color 15 15)"
    echo
}

_display_radio_info() {
    echo "RSSI:  $(echo "${rssi}"   | _color -55 -70)"
    [ -n "$noise"  ] && echo "Noise: $(echo "${noise}"  | _colorlt -80 -70)"
    [ -n "$snr"    ] && echo "S/N:   $(echo "${snr}"    | _color 30 20)"
    echo "Rate:  $(echo "${txrate}" | _color 47 28)"
    [ -n "$mcs"    ] && echo "MCS:   $(echo "${mcs}"    | _color 7 5)"
    echo
}

# ---- dispatch ----

if is_mac; then
    _collect_wifi_data()      { _mac_collect_wifi_data; }
    _display_internet_info()  { _mac_display_internet_info; }
elif is_linux; then
    _collect_wifi_data()      { _linux_collect_wifi_data; }
    _display_internet_info()  { _linux_display_internet_info; }
else
    echo "Unsupported OS: $OSTYPE" >&2; exit 1
fi

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
