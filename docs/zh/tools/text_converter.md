# 🔤 text_converter <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

在全角（全角）和半角（半角）字符之间相互转换。

## 环境要求

- `nkf`

```bash
brew install nkf
```

## 用法

```bash
to_hankaku [file ...]
to_zenkaku [file ...]
```

## 示例

### 将全角字符转为半角

```bash
echo "ＡＢＣＤ　１２３４" | to_hankaku
```

**Output:**

```
ABCD 1234
```

### 将半角字符转为全角

```bash
echo "ABCD 1234" | to_zenkaku
```

**Output:**

```
ＡＢＣＤ　１２３４
```

### 转换文件内容

```bash
to_hankaku input.txt
```

**Output:**

```
[converted content printed to stdout]
```
