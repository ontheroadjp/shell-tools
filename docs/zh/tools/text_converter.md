# 🔤 text_converter <Badge type="tip" text="Shell" />

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

```bash
echo "ＡＢＣＤ１２３４" | to_hankaku
# → ABCD1234

echo "ABCD1234" | to_zenkaku
# → ＡＢＣＤ１２３４

to_hankaku input.txt
```
