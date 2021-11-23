function _display_weather() {
    #curl -s wttr.in/${1:-Tokyo}?lang=ja | head -n 7
    curl -s wttr.in/${1:-Tokyo} | head -n 7
}

alias wttr="_display_weather"
