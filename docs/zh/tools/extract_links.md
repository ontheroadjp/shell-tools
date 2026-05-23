# 🔗 extract_links <Badge type="info" text="Python Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

爬取网页并提取所有与指定文件扩展名匹配的链接。

## 环境要求

- Python 3
- `beautifulsoup4` (`pip install beautifulsoup4`)

## 用法

```bash
extract_links <url> [-e ext ...] [-o output_file]
```

## 示例

### 提取页面中所有 PDF 链接

```bash
extract_links https://example.com -e pdf
```

**Output:**

```
https://example.com/doc/manual.pdf
https://example.com/doc/guide.pdf
https://example.com/doc/report.pdf
```

### 提取多种文件类型

```bash
extract_links https://example.com -e pdf jpg png
```

**Output:**

```
https://example.com/docs/manual.pdf
https://example.com/images/logo.png
https://example.com/images/banner.jpg
```

### 将提取的 URL 保存到文件

```bash
extract_links https://example.com -e pdf -o urls.txt
```

**Output:**

```
✅ 3 links saved to urls.txt
```

## 说明

- 省略 `-e` 时，默认扩展名为 `pdf`。
- 与 `list_downloader` 配合使用，可实现抓取→批量下载的两步工作流。
