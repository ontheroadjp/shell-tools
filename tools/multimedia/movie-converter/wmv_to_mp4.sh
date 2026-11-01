#!/usr/bin/env bash

set -euo pipefail

if [ $# -eq 0 ]; then
  echo "使用方法: $0 <ファイルパス または ディレクトリパス>"
  exit 1
fi

TARGET="$1"

if ! command -v ffmpeg &> /dev/null; then
  echo "エラー: ffmpeg がインストールされていません。"
  exit 1
fi

convert_file() {
  local input="$1"
  local output="${input%.*}.mp4"

  if [ -f "$output" ]; then
    echo "[スキップ] 既に存在します: $output"
    return 0
  fi

  echo "========================================"
  echo "変換開始: $input"
  echo "出力先  : $output"
  echo "========================================"

  # -stats: 進捗行（frame, fps, time, bitrate, speed）をリアルタイム更新表示
  # -loglevel info: 進行状況を表示するログレベル
  # < /dev/null: while read の標準入力横取りのみを遮断
  if ffmpeg -nostdin -loglevel info -stats \
    -i "$input" \
    -c:v libx264 -crf 18 -preset fast \
    -c:a aac -b:a 192k \
    -movflags +faststart \
    "$output" < /dev/null; then
    echo -e "\n[完了] $output"
  else
    echo -e "\n[失敗] 変換に失敗しました: $input" >&2
    [ -f "$output" ] && rm -f "$output"
  fi
}

if [ -f "$TARGET" ]; then
  case "$TARGET" in
    *.wmv|*.WMV)
      convert_file "$TARGET"
      ;;
    *)
      echo "エラー: 指定されたファイルは .wmv ではありません: $TARGET"
      exit 1
      ;;
  esac

elif [ -d "$TARGET" ]; then
  # 件数の事前カウント
  TOTAL=$(find "$TARGET" -type f \( -iname "*.wmv" \) | wc -l)
  echo "変換対象ファイル数: ${TOTAL} 件"

  COUNT=0
  while IFS= read -r -d '' file; do
    COUNT=$((COUNT + 1))
    echo -e "\n[進捗: ${COUNT}/${TOTAL}]"
    convert_file "$file"
  done < <(find "$TARGET" -type f \( -iname "*.wmv" \) -print0)

else
  echo "エラー: 指定されたパスが存在しません: $TARGET"
  exit 1
fi

echo "========================================"
echo "すべての処理が終了しました。"
