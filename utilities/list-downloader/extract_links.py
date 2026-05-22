#!/usr/bin/env python3
import argparse
import os
import re
import sys
import urllib.parse
import urllib.request
from bs4 import BeautifulSoup


def extract_links(url, exts):
    """指定したURLから指定拡張子のリンクを抽出"""
    try:
        with urllib.request.urlopen(url) as response:
            html = response.read().decode("utf-8", errors="ignore")
    except Exception as e:
        print(f"Error fetching {url}: {e}", file=sys.stderr)
        return []

    soup = BeautifulSoup(html, "html.parser")

    # 拡張子を正規表現化 (例: pdf|jpg|png)
    ext_pattern = r"\.(" + "|".join(re.escape(ext.lower()) for ext in exts) + r")$"
    regex = re.compile(ext_pattern, re.IGNORECASE)

    links = set()
    for tag in soup.find_all(["a", "img", "source"]):
        href = tag.get("href") or tag.get("src")
        if not href:
            continue
        full_url = urllib.parse.urljoin(url, href)
        if regex.search(full_url):
            links.add(full_url)

    return sorted(links)


def main():
    parser = argparse.ArgumentParser(
        description="Extract links with specific file extensions from a web page."
    )
    parser.add_argument("url", help="Target URL to scrape.")
    parser.add_argument(
        "-e",
        "--ext",
        nargs="+",
        default=["pdf"],
        help="File extensions to extract (e.g., pdf jpg png).",
    )
    parser.add_argument(
        "-o",
        "--output",
        help="Output file path to save the URLs (optional).",
    )
    args = parser.parse_args()

    links = extract_links(args.url, args.ext)

    if not links:
        print("No matching links found.")
        return

    if args.output:
        os.makedirs(os.path.dirname(args.output) or ".", exist_ok=True)
        with open(args.output, "w") as f:
            f.write("\n".join(links))
        print(f"✅ {len(links)} links saved to {args.output}")
    else:
        print("\n".join(links))


if __name__ == "__main__":
    main()
