#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
This script translates text from the clipboard using the DeepL API,
supporting Japanese, English, Chinese, and Korean as target languages.
The source language is automatically detected.
"""

import os
import sys
import argparse

if sys.version_info[0] < 3:
    sys.stderr.write("This script requires Python 3.\n")
    sys.exit(1)

import pyperclip

# Suppress the NotOpenSSLWarning for environment-dependent SSL issues.
# This warning appears on macOS systems where the 'ssl' module is compiled with LibreSSL.
# See: https://github.com/urllib3/urllib3/issues/3020
import warnings
from urllib3.exceptions import NotOpenSSLWarning
warnings.filterwarnings("ignore", category=NotOpenSSLWarning)

import requests
from dotenv import load_dotenv

def main():
    """
    Main function to translate clipboard text.
    """
    parser = argparse.ArgumentParser(description="Translate text from the clipboard using DeepL.")
    supported_langs = ["JA", "EN", "ZH", "KO"]
    parser.add_argument("-o", "--target_lang", type=str.upper, default="EN", choices=supported_langs,
                        help=f"Target language. Supported: {', '.join(supported_langs)}. Defaults to EN.")
    args = parser.parse_args()

    script_dir = os.path.dirname(os.path.realpath(__file__))
    dotenv_path = os.path.join(script_dir, '.env')
    load_dotenv(dotenv_path=dotenv_path)

    api_key = os.getenv("DEEPL_API_KEY")
    if not api_key:
        sys.stderr.write("Error: DEEPL_API_KEY not found in .env file.\n")
        sys.exit(1)

    if not sys.stdin.isatty():
        input_text = sys.stdin.read()
    else:
        input_text = pyperclip.paste()

    if not input_text:
        sys.stderr.write("Error: No input text found.\n")
        sys.exit(1)

    url = "https://api-free.deepl.com/v2/translate"
    headers = {"Authorization": f"DeepL-Auth-Key {api_key}"}
    params = {
        "text": input_text,
        "target_lang": args.target_lang,
    }

    try:
        response = requests.post(url, headers=headers, data=params)
        response.raise_for_status()
        translated_text = response.json()["translations"][0]["text"]
        print(translated_text)
    except requests.exceptions.RequestException as e:
        sys.stderr.write(f"Error: API request failed: {e}\n")
        sys.exit(1)
    except (KeyError, IndexError):
        sys.stderr.write("Error: Could not parse API response.\n")
        sys.exit(1)

if __name__ == "__main__":
    main()
