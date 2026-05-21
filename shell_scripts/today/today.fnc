#!/bin/bash

function _display_today() {
    echo $(wareki)年 $(date +'%m月 %d日') $(weather tokyo)
    worldtime
    echo 'enjyo! :-)'
}

alias today='_display_today'

