# ⬇️ list_downloader <Badge type="info" text="Python" />

URL リストからファイルを一括ダウンロードします。ファイルまたは stdin から URL を読み込みます。

## 必要環境

- Python 3

## 使い方

```bash
list_downloader <urls_file> [-o output_dir]
```

## 例

```bash
list_downloader urls.txt
list_downloader urls.txt -o ./downloads
extract_links https://example.com -e pdf -o urls.txt && list_downloader urls.txt
```

## 備考

- 入力ファイルは 1 行に 1 URL の形式です。
- `#` で始まる行はスキップされます。
- 期待される形式は `urls.txt.sample` を参照してください。
