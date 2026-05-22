# 🔗 extract_links <Badge type="info" text="Python" />

ウェブページをスクレイピングし、指定した拡張子に一致するリンクをすべて抽出します。

## 必要環境

- Python 3
- `beautifulsoup4` (`pip install beautifulsoup4`)

## 使い方

```bash
extract_links <url> [-e ext ...] [-o output_file]
```

## 例

```bash
# PDF リンクをすべて抽出
extract_links https://example.com -e pdf

# PDF と画像リンクを抽出
extract_links https://example.com -e pdf jpg png

# ファイルに保存
extract_links https://example.com -e pdf -o urls.txt
```

## 備考

- `-e` を省略した場合のデフォルト拡張子は `pdf` です。
- `list_downloader` と組み合わせることで、スクレイピング→一括ダウンロードの 2 ステップワークフローに活用できます。
