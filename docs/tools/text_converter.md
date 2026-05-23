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

### Convert full-width to half-width

```bash
echo "ＡＢＣＤ　１２３４" | to_hankaku
```

**Output:**

```
ABCD 1234
```

### Convert half-width to full-width

```bash
echo "ABCD 1234" | to_zenkaku
```

**Output:**

```
ＡＢＣＤ　１２３４
```

### Convert a file

```bash
to_hankaku input.txt
```

**Output:**

```
[converted content printed to stdout]
```
