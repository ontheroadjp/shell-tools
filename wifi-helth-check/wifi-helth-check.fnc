_red() { xargs -I{} echo $'\e[31m{}\e[m' }
_yellow() { xargs -I{} echo $'\e[33m{}\e[m' }
_green() { xargs -I{} echo $'\e[32m{}\e[m' }

_wifi_check_lookup() {
    egrep "$1" | awk '{print $2}'
}

_wifi_check_airlookup() {
    echo "${air}" | _wifi_check_lookup $1
}

_wifi_check_okng() {
    while read line; do
        int=`echo $line | cut -f1 -d.`
        if [ "$int" -eq 0 ]; then
            echo OK | _green
        else
            echo NG | _red
        fi
    done
}

_wifi_check_color() {
    while read line; do
        int=$(echo ${line} | cut -f1 -d. | perl -ne '$_ =~ /(\d+)/; print $1')
        if [ "${int}" -gt $1 ]; then
            echo ${line} | _green
        elif [ "${int}" -gt $2 ]; then
            echo ${line} | _yellow
        else
            echo ${line} | _red
        fi
    done
}

_wifi_check_colorlt() {
    while read line; do
        int=`echo $line | cut -f1 -d.`
        if [ "$int" -lt $1 ]; then
            echo $line | _green
        elif [ "$int" -lt $2 ]; then
            echo $line | _yellow
        else
            echo $line | _red
        fi
    done
}

function _display_internet_info() {
    airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport

    address=$(ifconfig en0 | _wifi_check_lookup "inet ")
    gateway=$(netstat -nr | _wifi_check_lookup ^default | head -n 1)

    echo Address: ${address}
    echo Gateway: ${gateway}

    # run ping
    ping_result=$(ping -i0.1 -t1 -c10 ${gateway})
    loss=$(echo "${ping_result}" | tail -n2 | head -1 | awk '{print $7}' | cut -f1 -d '%')
    ok=$(echo 100 - ${loss} | bc | cut -f1 -d. | _wifi_check_color 99 59)
    ttl=$(echo "${ping_result}" | tail -n1 | cut -f6 -d/)
    echo Ping:   $(echo ${ttl} | _wifi_check_colorlt 1 9) ms \(${ok}% packets transmitted\)

    # run dig
    dig +short jp. SOA | egrep dns\.jp >/dev/null 2>&1
    dig_result=$?
    echo DNS:   `echo $? | _wifi_check_okng`
    echo
}

function _display_wifi_info() {
    airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport

    # Check bssid
    air=`${airport} -I`

    #bssid=`echo "$air" | _wifi_check_lookup BSSID`
    ssid=$(_wifi_check_airlookup "\sSSID")
    bssid=$(_wifi_check_airlookup BSSID)
    channel=$(_wifi_check_airlookup channel)
    rssi=$(_wifi_check_airlookup agrCtlRSSI)
    noise=$(_wifi_check_airlookup agrCtlNoise)
    snr=$(echo ${rssi} - ${noise} | bc)
    txrate=$(_wifi_check_airlookup lastTxRate)
    maxrate=$(_wifi_check_airlookup maxRate)
    mcs=$(_wifi_check_airlookup MCS)

    channel=$(echo ${channel} | cut -d ',' -f1)

    if [ "${channel}" -lt 15 ]; then
        band="2.4GHz"
    elif [ "${channel}" -lt 141 ]; then
        case "${channel}" in
            34 | 38 | 42 | 46) band="5GHz(J52)";;
            36 | 40 | 44 | 48) band="5GHz(W52)";;
            52 | 56 | 60 | 64) band="5GHz(W53)";;
            100 | 104 | 108 | 112 | 116 | 120 | 124 | \
            128 | 132 | 136 | 140) band="5GHz(W56)";;
        esac
    else
        band="Unknown"
    fi

    echo SSID:   $(echo ${ssid} | _green)
    echo BSSID:  $(echo ${bssid} | _green)
    echo CHANNEL: $(echo ${channel}ch\: ${band} | _wifi_check_color 15 15)
    echo
}

function _display_radio_info() {
    echo RSSI:   $(echo ${rssi} | _wifi_check_color -55 -70) / $(echo ${noise} | _wifi_check_colorlt -80 -70)  \(S/N: $(echo $snr | _wifi_check_color 30 20)\)
    echo Rate:   $(echo ${txrate} | _wifi_check_color 47 28) / $(echo ${maxrate} | _wifi_check_color 70 36)
    echo MCS:    $(echo ${mcs} | _wifi_check_color 7 5)
    echo
}

alias inetinfo='_display_internet_info'
alias wifiinfo='_display_wifi_info'
alias radioinfo='_display_radio_info'
alias wificheck='_display_internet_info && _display_wifi_info && _display_radio_info'

