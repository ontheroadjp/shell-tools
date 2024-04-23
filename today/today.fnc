#!/bin/bash

function _display_today() {
    echo $(_show_wareki)年 $(date +'%m月 %d日') $(_print_weather tokyo)
    _print_world_time
    echo 'enjyo! :-)'
}

alias today='_display_today'
