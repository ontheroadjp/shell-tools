# ⬇️ list_downloader <Badge type="info" text="Python" />

Batch download files from a list of URLs. Reads URLs from a file or stdin.

## Requirements

- Python 3

## Usage

```bash
list_downloader <urls_file> [-o output_dir]
```

## Examples

```bash
list_downloader urls.txt
list_downloader urls.txt -o ./downloads
extract_links https://example.com -e pdf -o urls.txt && list_downloader urls.txt
```

## Notes

- One URL per line in the input file.
- Skips lines starting with `#`.
- See `urls.txt.sample` for the expected format.
