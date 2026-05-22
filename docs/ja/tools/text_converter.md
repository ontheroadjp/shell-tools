# 🔤 text_converter <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# 全角を半角に変換
echo "ＡＢＣＤ　１２３４" | to_hankaku
```

```
ABCD 1234
```

```bash
# 半角を全角に変換
echo "ABCD 1234" | to_zenkaku
```

```
ＡＢＣＤ　１２３４
```

```bash
# ファイルを変換
to_hankaku input.txt
```

```
[converted content printed to stdout]
```
