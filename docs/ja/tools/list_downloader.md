# ⬇️ list_downloader <Badge type="info" text="Python Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

URL リストからファイルを一括ダウンロードします。ファイルまたは stdin から URL を読み込みます。

## 必要環境

- Python 3

## 使い方

```bash
list_downloader <urls_file> [-o output_dir]
```

## 例

```bash
# URL リストからファイルをダウンロード
list_downloader urls.txt
```

```
Downloading: https://example.com/doc/manual.pdf
Downloading: https://example.com/doc/guide.pdf
Done. 2 files downloaded.
```

```bash
# 保存先ディレクトリを指定してダウンロード
list_downloader urls.txt -o ~/Downloads/docs
```

```
Downloading: https://example.com/doc/manual.pdf → ~/Downloads/docs/manual.pdf
Downloading: https://example.com/doc/guide.pdf  → ~/Downloads/docs/guide.pdf
Done. 2 files downloaded.
```

```bash
# 2ステップ: 抽出→ダウンロード
extract_links https://example.com -e pdf -o urls.txt && list_downloader urls.txt
```

```
✅ 3 links saved to urls.txt
Downloading: https://example.com/doc1.pdf
Downloading: https://example.com/doc2.pdf
Downloading: https://example.com/doc3.pdf
Done. 3 files downloaded.
```

## 備考

- 入力ファイルは 1 行に 1 URL の形式です。
- `#` で始まる行はスキップされます。
- 期待される形式は `urls.txt.sample` を参照してください。
