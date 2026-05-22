import argparse
import os
from pathlib import Path
import urllib.request
import urllib.error
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from tqdm import tqdm

SELF = Path(__file__).name


def _init():
    parser = argparse.ArgumentParser(
        prog=SELF,
        description='This script downloads multiple files (in parallel) from a URL list with progress bars.',
    )
    parser.add_argument(
        'file',
        type=Path,
        help='Path to a text file containing a list of URLs (one per line).'
    )
    parser.add_argument(
        '-o', '--output',
        type=Path,
        default=Path('downloads'),
        help='Destination folder for downloaded files.'
    )
    parser.add_argument(
        '-n', '--num-workers',
        type=int,
        default=4,
        help='Number of parallel download threads (default: 4).'
    )
    args = parser.parse_args()

    if not args.file.exists():
        print(f"[ERROR] File not found: {args.file}")
        sys.exit(1)

    return args


def download_file(url, dist):
    """Download one file from URL, return (url, success, message)."""
    outname = os.path.basename(url)
    if not outname:
        return url, False, "Invalid filename in URL"

    out_path = dist / outname
    try:
        with urllib.request.urlopen(url) as web_file, open(out_path, 'wb') as local_file:
            local_file.write(web_file.read())
        return url, True, outname
    except urllib.error.HTTPError as e:
        return url, False, f"HTTP {e.code}"
    except urllib.error.URLError as e:
        return url, False, f"URL Error: {e.reason}"
    except Exception as e:
        return url, False, f"Error: {e}"


def main(ini):
    os.makedirs(ini.output, exist_ok=True)

    # Load URLs
    with open(ini.file, 'r', encoding='utf-8') as f:
        urls = [u.strip() for u in f.readlines() if u.strip()]

    if not urls:
        print("No URLs found in file.")
        return

    print(f"🧠 {len(urls)} URLs loaded. Starting download using {ini.num_workers} threads...\n")

    results = []
    # tqdm progress bar
    with ThreadPoolExecutor(max_workers=ini.num_workers) as executor:
        futures = {executor.submit(download_file, url, ini.output): url for url in urls}
        for future in tqdm(as_completed(futures), total=len(futures), desc="Downloading", ncols=80):
            url, success, msg = future.result()
            results.append((url, success, msg))

    # Print summary
    print("\n📋 Summary:")
    success_count = 0
    for url, success, msg in results:
        if success:
            print(f"✅ {msg}")
            success_count += 1
        else:
            print(f"❌ {url} → {msg}")

    print(f"\n🎉 Done: {success_count}/{len(results)} succeeded.")


if __name__ == "__main__":
    main(_init())
