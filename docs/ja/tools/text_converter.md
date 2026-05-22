# 🔤 text_converter <Badge type="tip" text="Shell" />

全角・半角文字を相互変換します。

## 必要環境

- `nkf`

```bash
brew install nkf
```

## 使い方

```bash
to_hankaku [file ...]
to_zenkaku [file ...]
```

## 例

```bash
echo "ＡＢＣＤ１２３４" | to_hankaku
# → ABCD1234

echo "ABCD1234" | to_zenkaku
# → ＡＢＣＤ１２３４

to_hankaku input.txt
```
