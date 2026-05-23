# 🔗 extract_links <span class="tc-badge tc-badge-python">Python Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

ウェブページをスクレイピングし、指定した拡張子に一致するリンクをすべて抽出します。

## 必要環境

- Python 3
- `beautifulsoup4` (`pip install beautifulsoup4`)

## 使い方

```bash
extract_links <url> [-e ext ...] [-o output_file]
```

## 例

### ページから PDF リンクをすべて抽出

```bash
extract_links https://example.com -e pdf
```

**Output:**

```
https://example.com/doc/manual.pdf
https://example.com/doc/guide.pdf
https://example.com/doc/report.pdf
```

### 複数のファイル形式を抽出

```bash
extract_links https://example.com -e pdf jpg png
```

**Output:**

```
https://example.com/docs/manual.pdf
https://example.com/images/logo.png
https://example.com/images/banner.jpg
```

### 抽出した URL をファイルに保存

```bash
extract_links https://example.com -e pdf -o urls.txt
```

**Output:**

```
✅ 3 links saved to urls.txt
```

## 備考

- `-e` を省略した場合のデフォルト拡張子は `pdf` です。
- `list_downloader` と組み合わせることで、スクレイピング→一括ダウンロードの 2 ステップワークフローに活用できます。
