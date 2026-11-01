#!/usr/bin/env bash

set -euo pipefail

if [ $# -eq 0 ]; then
  echo "使用方法: $0 <ファイルパス または ディレクトリパス>"
  exit 1
fi

TARGET="$1"
VAAPI_DEV="/dev/dri/renderD128"
SUCCESS=0
SKIPPED=0
FAILED_FILES=()

# 依存コマンドの確認
if ! command -v ffmpeg &> /dev/null; then
  echo "エラー: ffmpeg がインストールされていません。" >&2
  exit 1
fi

# GPU デバイスファイルの確認
if [ ! -e "$VAAPI_DEV" ]; then
  echo "エラー: VAAPI デバイス ($VAAPI_DEV) が見つかりません。" >&2
  exit 1
fi

# 1ファイル変換用の関数
convert_file() {
  local input="$1"
  local output="${input%.*}.mp4"

  if [ -f "$output" ]; then
    echo "[スキップ] 既に存在します: $output"
    SKIPPED=$((SKIPPED + 1))
    return 0
  fi

  echo "========================================"
  echo "変換開始 (VAAPI): $input"
  echo "出力先          : $output"
  echo "========================================"

  # -vaapi_device: Intel GPU デバイスを指定
  # -vf 'format=nv12,hwupload': 映像フレームを GPU メモリ空間へ転送
  # -c:v h264_vaapi: ハードウェアエンコーダ
  # -qp 20: 品質パラメータ（固定量子化値: 18〜23 が視覚的高品質）
  # -c:a aac -b:a 192k: 音声を AAC に変換
  # -movflags +faststart: Web / Jellyfin 向けメタデータ先頭配置
  if ffmpeg -nostdin -loglevel info -stats \
    -vaapi_device "$VAAPI_DEV" \
    -i "$input" \
    -vf 'format=nv12,hwupload' \
    -c:v h264_vaapi -qp 20 \
    -c:a aac -b:a 192k \
    -movflags +faststart \
    "$output" < /dev/null; then
    echo -e "\n[完了] $output"
    SUCCESS=$((SUCCESS + 1))
  else
    echo -e "\n[失敗] 変換に失敗しました: $input" >&2
    FAILED_FILES+=("$input")
    if [ -f "$output" ]; then
      rm -f "$output" || echo "エラー: 不完全な出力を削除できません: $output" >&2
    fi
  fi
}

# 実行分岐
if [ -f "$TARGET" ]; then
  case "$TARGET" in
    *.wmv|*.WMV)
      convert_file "$TARGET"
      ;;
    *)
      echo "エラー: 指定されたファイルは .wmv ではありません: $TARGET" >&2
      exit 1
      ;;
  esac

elif [ -d "$TARGET" ]; then
  TOTAL=$(find "$TARGET" -type f \( -iname "*.wmv" \) | wc -l)
  echo "変換対象ファイル数: ${TOTAL} 件"

  if [ "$TOTAL" -eq 0 ]; then
    echo "対象の .wmv ファイルが見つかりませんでした。"
  fi

  COUNT=0
  while IFS= read -r -d '' file; do
    COUNT=$((COUNT + 1))
    echo -e "\n[進捗: ${COUNT}/${TOTAL}]"
    convert_file "$file"
  done < <(find "$TARGET" -type f \( -iname "*.wmv" \) -print0)

else
  echo "エラー: 指定されたパスが存在しません: $TARGET" >&2
  exit 1
fi

echo "========================================"
echo "すべての処理が終了しました。"
echo "変換を試みたファイル数: $((SUCCESS + ${#FAILED_FILES[@]})) 件"
echo "成功: ${SUCCESS} 件 / 失敗: ${#FAILED_FILES[@]} 件 / スキップ: ${SKIPPED} 件"
if [ "${#FAILED_FILES[@]}" -gt 0 ]; then
  echo "失敗した動画ファイル:"
  printf '  %s\n' "${FAILED_FILES[@]}"
fi
