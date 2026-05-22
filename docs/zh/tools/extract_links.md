# 🔗 extract_links <Badge type="info" text="Python" />

爬取网页并提取所有与指定文件扩展名匹配的链接。

## 环境要求

- Python 3
- `beautifulsoup4` (`pip install beautifulsoup4`)

## 用法

```bash
extract_links <url> [-e ext ...] [-o output_file]
```

## 示例

```bash
# 提取所有 PDF 链接
extract_links https://example.com -e pdf

# 提取 PDF 和图片链接
extract_links https://example.com -e pdf jpg png

# 保存到文件
extract_links https://example.com -e pdf -o urls.txt
```

## 说明

- 省略 `-e` 时，默认扩展名为 `pdf`。
- 与 `list_downloader` 配合使用，可实现抓取→批量下载的两步工作流。
