# 🔤 text_converter <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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

### 全角を半角に変換

```bash
echo "ＡＢＣＤ　１２３４" | to_hankaku
```

**Output:**

```
ABCD 1234
```

### 半角を全角に変換

```bash
echo "ABCD 1234" | to_zenkaku
```

**Output:**

```
ＡＢＣＤ　１２３４
```

### ファイルを変換

```bash
to_hankaku input.txt
```

**Output:**

```
[converted content printed to stdout]
```
