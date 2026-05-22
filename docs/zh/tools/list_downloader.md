# ⬇️ list_downloader <Badge type="info" text="Python" />

从 URL 列表批量下载文件，从文件或 stdin 读取 URL。

## 环境要求

- Python 3

## 用法

```bash
list_downloader <urls_file> [-o output_dir]
```

## 示例

```bash
list_downloader urls.txt
list_downloader urls.txt -o ./downloads
extract_links https://example.com -e pdf -o urls.txt && list_downloader urls.txt
```

## 说明

- 输入文件每行一个 URL。
- 跳过以 `#` 开头的行。
- 参见 `urls.txt.sample` 了解预期格式。
