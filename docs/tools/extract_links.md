# 🔗 extract_links <Badge type="info" text="Python Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

Scrape a web page and extract all links matching specified file extensions.

## Requirements

- Python 3
- `beautifulsoup4` (`pip install beautifulsoup4`)

## Usage

```bash
extract_links <url> [-e ext ...] [-o output_file]
```

## Examples

```bash
# Extract all PDF links from a page
extract_links https://example.com -e pdf
```

```
https://example.com/doc/manual.pdf
https://example.com/doc/guide.pdf
https://example.com/doc/report.pdf
```

```bash
# Extract multiple file types
extract_links https://example.com -e pdf jpg png
```

```
https://example.com/docs/manual.pdf
https://example.com/images/logo.png
https://example.com/images/banner.jpg
```

```bash
# Save extracted URLs to a file
extract_links https://example.com -e pdf -o urls.txt
```

```
✅ 3 links saved to urls.txt
```

## Notes

- Default extension is `pdf` if `-e` is omitted.
- Works well with `list_downloader` for a two-step scrape-then-download workflow.
