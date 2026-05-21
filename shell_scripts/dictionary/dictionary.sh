#!/bin/bash

SELF_DIR="$(cd "$(dirname "$0")" && pwd)"

[ -z "$1" ] && echo "Usage: $(basename "$0") <word>" && exit 1

"${SELF_DIR}/lib/dictionary.swift" "$1"
w3m "http://ejje.weblio.jp/content/$1" | grep "用例"
