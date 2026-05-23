# 🔗 extract_links <span class="tc-badge tc-badge-python">Python Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

Scrape a web page and extract all links matching specified file extensions.

## Requirements

- Python 3
- `beautifulsoup4` (`pip install beautifulsoup4`)

## Usage

```bash
extract_links <url> [-e ext ...] [-o output_file]
```

## Examples

### Extract all PDF links from a page

```bash
extract_links https://example.com -e pdf
```

**Output:**

```
https://example.com/doc/manual.pdf
https://example.com/doc/guide.pdf
https://example.com/doc/report.pdf
```

### Extract multiple file types

```bash
extract_links https://example.com -e pdf jpg png
```

**Output:**

```
https://example.com/docs/manual.pdf
https://example.com/images/logo.png
https://example.com/images/banner.jpg
```

### Save extracted URLs to a file

```bash
extract_links https://example.com -e pdf -o urls.txt
```

**Output:**

```
✅ 3 links saved to urls.txt
```

## Notes

- Default extension is `pdf` if `-e` is omitted.
- Works well with `list_downloader` for a two-step scrape-then-download workflow.
