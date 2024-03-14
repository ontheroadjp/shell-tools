#!/bin/bash

function _today() {
    echo ''
    _show_wareki
    date +'%m月 %d日'
    _display_weather
    echo ''
    _print_world_time
    echo 'enjyo! :-)'
    echo ''
}

alias today='_today'
