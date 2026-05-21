# URL Downloader

A set of simple Python scripts for downloading files from a list of URLs or for automatically extracting downloadable links (such as PDF, JPG, etc.) from a given webpage.

## Features

- **extract_links.py**: Extracts links to files (e.g., PDF, JPG, PNG, ZIP) from a specified webpage.  
- **list_downloader.py**: Downloads files in parallel from a list of URLs (supports progress bar).  
- Works together in a simple two-step pipeline.

## Requirements

- Python 3.8+
- Install dependencies with:

‵‵‵bash
pip install -r requirements.txt
‵‵‵

### requirements.txt

‵‵‵
beautifulsoup4>=4.12.0
tqdm>=4.66.0
‵‵‵

## Usage

### 1️⃣ Extract URLs from a Web Page

Use `extract_links.py` to collect all downloadable file links of specific extensions from a webpage.

‵‵‵bash
python extract_links.py <URL> -e <EXTENSIONS> -o urls.txt
‵‵‵

#### Example
Extract all PDF and JPG links from a webpage and save them into `urls.txt`:
‵‵‵bash
python extract_links.py https://example.com -e pdf jpg -o urls.txt
‵‵‵

### 2️⃣ Download the Files

Then use `list_downloader.py` to download all URLs listed in `urls.txt`.

‵‵‵bash
python list_downloader.py urls.txt -o downloads/
‵‵‵

#### Example
‵‵‵bash
python list_downloader.py urls.txt -o my_downloads/
‵‵‵

---

## How It Works

1. **extract_links.py**
   - Fetches the specified webpage.
   - Parses all `<a href>` and `<img src>` tags.
   - Filters links by file extensions and saves them to a text file.

2. **list_downloader.py**
   - Reads the list of URLs from a text file.
   - Downloads each file concurrently with progress display.
   - Saves them into the specified output directory.

---

## Example Workflow

‵‵‵bash
# Step 1: Extract PDF links
python extract_links.py https://example.com -e pdf -o urls.txt

# Step 2: Download the files
python list_downloader.py urls.txt -o downloads/
‵‵‵

Result:
‵‵‵
downloads/
├── file1.pdf
├── file2.pdf
└── file3.pdf
‵‵‵

---

## Contribution

Contributions are welcome!  
If you find any bugs or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License.  
See the [MIT License](https://choosealicense.com/licenses/mit/) for details.
