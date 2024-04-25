function _print_weather() {
    if [ -z ${1} ]; then
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
        } | peco )
    else
        place=${1}
    fi
    [ ! -z ${place} ] && {
        # curl -s wttr.in/${1:-Tokyo}?lang=ja | head -n 7
        # curl -s wttr.in/${1:-Tokyo}?lang=ja | head -n 17
        # curl -s wttr.in/${1:-Tokyo}?lang=ja | head -n 27
        # curl -s wttr.in/${place} | head -n 7
        # curl -s wttr.in/${1:-Tokyo} | head -n 17
        # curl -s wttr.in/${1:-Tokyo} | head -n 27
        # curl -s wttr.in/${1:-Tokyo}?lang=ja
        # curl -s wttr.in/${1:-Tokyo}
        curl -s "wttr.in/${place}?format=%l:+%c+%t+%h+%p+%m+%M\n"
    }
}
alias weather="_print_weather"

# more details: https://github.com/chubin/wttr.in
# To specify your own custom output format, use the special %-notation:
#    c    Weather condition,
#    C    Weather condition textual name,
#    x    Weather condition, plain-text symbol,
#    h    Humidity,
#    t    Temperature (Actual),
#    f    Temperature (Feels Like),
#    w    Wind,
#    l    Location,
#    m    Moon phase 🌑🌒🌓🌔🌕🌖🌗🌘,
#    M    Moon day,
#    p    Precipitation (mm/3 hours),
#    P    Pressure (hPa),
#    u    UV index (1-12),
#
#    D    Dawn*,
#    S    Sunrise*,
#    z    Zenith*,
#    s    Sunset*,
#    d    Dusk*,
#    T    Current time*,
#    Z    Local timezone.
#
#(*times are shown in the local timezone)
