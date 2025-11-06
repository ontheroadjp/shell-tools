#!/bin/bash
set -euo pipefail

DIST_DIR="./dist"
mkdir -p "$DIST_DIR"

SIZE="300x300"
COLOR="white"
TEXT=""
FONT_SIZE=48
SHOW_TEXT=true

usage() {
    echo "Usage: $0 [-s size] [-c color] [-t text] [--no-text]"
    echo "  -s, --size      Image size (e.g., 800x600)"
    echo "  -c, --color     Background color (e.g., black, '#f0f0f0')"
    echo "  -t, --text      Custom text (default: size string)"
    echo "      --no-text   Do not display any text"
    exit 1
}

while [[ $# -gt 0 ]]; do
    case $1 in
        -s|--size) SIZE="$2"; shift 2 ;;
        -c|--color) COLOR="$2"; shift 2 ;;
        -t|--text) TEXT="$2"; shift 2 ;;
        --no-text) SHOW_TEXT=false; shift ;;
        -h|--help) usage ;;
        *) echo "Unknown option: $1"; usage ;;
    esac
done

OUTPUT_FILE="${DIST_DIR}/dummy_${SIZE}_${COLOR//[#]/}.png"

if [ "$SHOW_TEXT" = true ]; then
    if [ -z "$TEXT" ]; then
        TEXT="$SIZE"
    fi
else
    TEXT=""
fi

RGB_STR=$(magick -size 1x1 xc:"$COLOR" -format "%[pixel:u.p{0,0}]" info:)
if [[ $RGB_STR =~ ([0-9]+),([0-9]+),([0-9]+) ]]; then
    R=${BASH_REMATCH[1]}
    G=${BASH_REMATCH[2]}
    B=${BASH_REMATCH[3]}
    LUMINANCE=$(awk -v r=$R -v g=$G -v b=$B 'BEGIN{print (0.2126*r + 0.7152*g + 0.0722*b)}')
else
    LUMINANCE=255
fi

if (( $(echo "$LUMINANCE > 128" | bc -l) )); then
    TEXT_COLOR="black"
else
    TEXT_COLOR="white"
fi

if [ "$SHOW_TEXT" = true ]; then
    DRAW_TEXT=(-gravity center -fill "$TEXT_COLOR" -pointsize "$FONT_SIZE" -annotate 0 "$TEXT")
else
    DRAW_TEXT=()
fi

echo "🧩 Creating dummy image..."
echo "   Size:  $SIZE"
echo "   Color: $COLOR"
echo "   Text:  ${TEXT:-<none>}"
echo "   Text color: $TEXT_COLOR"
echo "   Output: $OUTPUT_FILE"

magick -size "$SIZE" xc:"$COLOR" "${DRAW_TEXT[@]}" "$OUTPUT_FILE"

echo "✅ Done: $OUTPUT_FILE"
