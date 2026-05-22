# ⬇️ list_downloader <Badge type="info" text="Python Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

从 URL 列表批量下载文件，从文件或 stdin 读取 URL。

## 环境要求

- Python 3

## 用法

```bash
list_downloader <urls_file> [-o output_dir]
```

## 示例

```bash
# 从 URL 列表下载文件
list_downloader urls.txt
```

```
Downloading: https://example.com/doc/manual.pdf
Downloading: https://example.com/doc/guide.pdf
Done. 2 files downloaded.
```

```bash
# 下载到指定目录
list_downloader urls.txt -o ~/Downloads/docs
```

```
Downloading: https://example.com/doc/manual.pdf → ~/Downloads/docs/manual.pdf
Downloading: https://example.com/doc/guide.pdf  → ~/Downloads/docs/guide.pdf
Done. 2 files downloaded.
```

```bash
# 两步操作：提取后下载
extract_links https://example.com -e pdf -o urls.txt && list_downloader urls.txt
```

```
✅ 3 links saved to urls.txt
Downloading: https://example.com/doc1.pdf
Downloading: https://example.com/doc2.pdf
Downloading: https://example.com/doc3.pdf
Done. 3 files downloaded.
```

## 说明

- 输入文件每行一个 URL。
- 跳过以 `#` 开头的行。
- 参见 `urls.txt.sample` 了解预期格式。
