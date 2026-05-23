# ⬇️ list_downloader <span class="tc-badge tc-badge-python">Python Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

从 URL 列表批量下载文件，从文件或 stdin 读取 URL。

## 环境要求

- Python 3

## 用法

```bash
list_downloader <urls_file> [-o output_dir]
```

## 示例

### 从 URL 列表下载文件

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

### 下载到指定目录

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

### 两步操作：提取后下载

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

## 说明

- 输入文件每行一个 URL。
- 跳过以 `#` 开头的行。
- 参见 `urls.txt.sample` 了解预期格式。
