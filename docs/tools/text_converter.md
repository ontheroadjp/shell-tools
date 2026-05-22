# 🔤 text_converter <Badge type="tip" text="Shell" />

Convert text between full-width (全角) and half-width (半角) characters.

## Requirements

- `nkf`

```bash
brew install nkf
```

## Usage

```bash
to_hankaku [file ...]
to_zenkaku [file ...]
```

## Examples

```bash
echo "ＡＢＣＤ１２３４" | to_hankaku
# → ABCD1234

echo "ABCD1234" | to_zenkaku
# → ＡＢＣＤ１２３４

to_hankaku input.txt
```
