# 🔗 extract_links <Badge type="info" text="Python" />

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
# Extract all PDF links
extract_links https://example.com -e pdf

# Extract PDF and image links
extract_links https://example.com -e pdf jpg png

# Save to file
extract_links https://example.com -e pdf -o urls.txt
```

## Notes

- Default extension is `pdf` if `-e` is omitted.
- Works well with `list_downloader` for a two-step scrape-then-download workflow.
