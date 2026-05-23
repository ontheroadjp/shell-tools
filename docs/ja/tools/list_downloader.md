# ⬇️ list_downloader <span class="tc-badge tc-badge-python">Python Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

URL リストからファイルを一括ダウンロードします。ファイルまたは stdin から URL を読み込みます。

## 必要環境

- Python 3

## 使い方

```bash
list_downloader <urls_file> [-o output_dir]
```

## 例

### URL リストからファイルをダウンロード

```bash
list_downloader urls.txt
```

**Output:**

```
🧠 2 URLs loaded. Starting download using 4 threads...

Downloading ████████████████████ 100%

📋 Summary:
✅ manual.pdf
✅ guide.pdf

🎉 Done: 2/2 succeeded.
```

### 保存先ディレクトリを指定してダウンロード

```bash
list_downloader urls.txt -o ~/Downloads/docs
```

**Output:**

```
🧠 2 URLs loaded. Starting download using 4 threads...

Downloading ████████████████████ 100%

📋 Summary:
✅ manual.pdf
✅ guide.pdf

🎉 Done: 2/2 succeeded.
```

### 2ステップ: 抽出→ダウンロード

```bash
extract_links https://example.com -e pdf -o urls.txt && list_downloader urls.txt
```

**Output:**

```
✅ 3 links saved to urls.txt
🧠 3 URLs loaded. Starting download using 4 threads...

Downloading ████████████████████ 100%

📋 Summary:
✅ doc1.pdf
✅ doc2.pdf
✅ doc3.pdf

🎉 Done: 3/3 succeeded.
```

## 備考

- 入力ファイルは 1 行に 1 URL の形式です。
- `#` で始まる行はスキップされます。
- 期待される形式は `urls.txt.sample` を参照してください。
