#!/bin/bash
# mts_to_mp4.sh - Convert *.MTS files in the current directory to H.265 MP4
#
# set -e is intentionally omitted: a failed conversion of one file must not
# stop the remaining files. Each ffmpeg failure is reported and cleaned up.

set -uo pipefail

case "${1:-}" in
    -h|--help)
        cat <<'EOF'
Usage: mts_to_mp4

Convert all *.MTS files (case-insensitive) in the current directory
to H.265 MP4 files under ./mp4/.

- Existing output files are skipped
- Recording time (MTS mtime) is kept as creation_time metadata and file mtime
EOF
        exit 0
        ;;
esac

shopt -s nullglob nocaseglob

mkdir -p mp4

for file in *.MTS; do
    output="mp4/${file%.*}.mp4"
    temp="mp4/${file%.*}.part.mp4"

    if [[ -e "$output" ]]; then
        echo "SKIP: $output"
        touch -r "$file" -- "$output"
        continue
    fi

    echo "Converting: $file"

    rm -f -- "$temp"

    # MTS の更新日時を録画日時として mp4 のメタデータに埋め込む
    creation_time=$(date -u -r "$file" +%Y-%m-%dT%H:%M:%S.000000Z)

    if ffmpeg -nostdin -i "$file" \
        -vf "bwdif=mode=send_field,scale=1920:1080,setsar=1,format=yuv420p" \
        -c:v libx265 -preset fast -b:v 5M \
        -tag:v hvc1 \
        -c:a aac -b:a 192k \
        -metadata creation_time="$creation_time" \
        -movflags +faststart \
        "$temp"; then

        mv -- "$temp" "$output"
        touch -r "$file" -- "$output"
        echo "OK: $output"
    else
        echo "ERROR: $file" >&2
        rm -f -- "$temp"
    fi
done

echo "Done."
