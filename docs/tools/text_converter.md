# 🔤 text_converter <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# Convert full-width to half-width
echo "ＡＢＣＤ　１２３４" | to_hankaku
```

```
ABCD 1234
```

```bash
# Convert half-width to full-width
echo "ABCD 1234" | to_zenkaku
```

```
ＡＢＣＤ　１２３４
```

```bash
# Convert a file
to_hankaku input.txt
```

```
[converted content printed to stdout]
```
