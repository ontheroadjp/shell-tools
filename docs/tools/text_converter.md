# 🔤 text_converter <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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
