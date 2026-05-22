# 🔗 extract_links <Badge type="info" text="Python Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# ページから PDF リンクをすべて抽出
extract_links https://example.com -e pdf
```

```
https://example.com/doc/manual.pdf
https://example.com/doc/guide.pdf
https://example.com/doc/report.pdf
```

```bash
# 複数のファイル形式を抽出
extract_links https://example.com -e pdf jpg png
```

```
https://example.com/docs/manual.pdf
https://example.com/images/logo.png
https://example.com/images/banner.jpg
```

```bash
# 抽出した URL をファイルに保存
extract_links https://example.com -e pdf -o urls.txt
```

```
✅ 3 links saved to urls.txt
```

## 備考

- `-e` を省略した場合のデフォルト拡張子は `pdf` です。
- `list_downloader` と組み合わせることで、スクレイピング→一括ダウンロードの 2 ステップワークフローに活用できます。
