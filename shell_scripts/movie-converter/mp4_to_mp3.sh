#!/bin/bash
# safe_mp4_to_mp3.sh - Convert MP4 files to MP3 safely

set -Ceu

function _mp4_to_mp3() {
    # $@ : files or directories
    for input in "$@"; do
        if [ -d "$input" ]; then
            # ディレクトリの場合、findで安全にファイル取得
            while IFS= read -r file; do
                [[ "${file##*.}" == "mp4" ]] && _exec "$file"
            done < <(find "$input" -type f -print)
        elif [ -e "$input" ]; then
            _exec "$input"
        else
            echo "Warning: '$input' not found." >&2
        fi
    done
}

function _exec() {
    local file="$1"
    local outfile="${file%.*}.mp3"
    # ffmpegで変換
    ffmpeg -y -i "$file" "$outfile"
    echo "$file"
}

# 標準入力対応
STASH_IFS=$IFS
IFS=$'\n'

if [ -p /dev/stdin ]; then
    while IFS= read -r file; do
        _mp4_to_mp3 "$file"
    done
else
    _mp4_to_mp3 "$@"
fi

IFS=$STASH_IFS
