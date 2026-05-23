# ⬇️ list_downloader <span class="tc-badge tc-badge-python">Python Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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
🧠 2 URLs loaded. Starting download using 4 threads...

Downloading ████████████████████ 100%

📋 Summary:
✅ manual.pdf
✅ guide.pdf

🎉 Done: 2/2 succeeded.
```

### Download to a specific directory

```bash
list_downloader urls.txt -o ~/Downloads/docs
```

**Output:**

```
🧠 2 URLs loaded. Starting download using 4 threads...

Downloading ████████████████████ 100%

📋 Summary:
✅ manual.pdf
✅ guide.pdf

🎉 Done: 2/2 succeeded.
```

### Two-step: extract then download

```bash
extract_links https://example.com -e pdf -o urls.txt && list_downloader urls.txt
```

**Output:**

```
✅ 3 links saved to urls.txt
🧠 3 URLs loaded. Starting download using 4 threads...

Downloading ████████████████████ 100%

📋 Summary:
✅ doc1.pdf
✅ doc2.pdf
✅ doc3.pdf

🎉 Done: 3/3 succeeded.
```

## Notes

- One URL per line in the input file.
- Skips lines starting with `#`.
- See `urls.txt.sample` for the expected format.
