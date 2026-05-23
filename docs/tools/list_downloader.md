# ⬇️ list_downloader <Badge type="info" text="Python Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

Batch download files from a list of URLs. Reads URLs from a file or stdin.

## Requirements

- Python 3

## Usage

```bash
list_downloader <urls_file> [-o output_dir]
```

## Examples

### Download files from a URL list

```bash
list_downloader urls.txt
```

**Output:**

```
Downloading: https://example.com/doc/manual.pdf
Downloading: https://example.com/doc/guide.pdf
Done. 2 files downloaded.
```

### Download to a specific directory

```bash
list_downloader urls.txt -o ~/Downloads/docs
```

**Output:**

```
Downloading: https://example.com/doc/manual.pdf → ~/Downloads/docs/manual.pdf
Downloading: https://example.com/doc/guide.pdf  → ~/Downloads/docs/guide.pdf
Done. 2 files downloaded.
```

### Two-step: extract then download

```bash
extract_links https://example.com -e pdf -o urls.txt && list_downloader urls.txt
```

**Output:**

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
