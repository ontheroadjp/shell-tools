#!/bin/bash

TOOLS="$(cd "$(dirname "$0")/.." && pwd)"

wareki=$("${TOOLS}/wareki/wareki.sh")
weather=$("${TOOLS}/weather/weather.sh" tokyo)

echo "${wareki}年 $(date +'%m月 %d日') ${weather}"
"${TOOLS}/worldtime/worldtime.sh"
echo 'enjyo! :-)'
