# ⬇️ list_downloader <Badge type="info" text="Python Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

Batch download files from a list of URLs. Reads URLs from a file or stdin.

## Requirements

- Python 3

## Usage

```bash
list_downloader <urls_file> [-o output_dir]
```

## Examples

```bash
# Download files from a URL list
list_downloader urls.txt
```

```
Downloading: https://example.com/doc/manual.pdf
Downloading: https://example.com/doc/guide.pdf
Done. 2 files downloaded.
```

```bash
# Download to a specific directory
list_downloader urls.txt -o ~/Downloads/docs
```

```
Downloading: https://example.com/doc/manual.pdf → ~/Downloads/docs/manual.pdf
Downloading: https://example.com/doc/guide.pdf  → ~/Downloads/docs/guide.pdf
Done. 2 files downloaded.
```

```bash
# Two-step: extract then download
extract_links https://example.com -e pdf -o urls.txt && list_downloader urls.txt
```

```
✅ 3 links saved to urls.txt
Downloading: https://example.com/doc1.pdf
Downloading: https://example.com/doc2.pdf
Downloading: https://example.com/doc3.pdf
Done. 3 files downloaded.
```

## Notes

- One URL per line in the input file.
- Skips lines starting with `#`.
- See `urls.txt.sample` for the expected format.
