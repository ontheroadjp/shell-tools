#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import argparse
import os
from pathlib import Path
import glob
import unicodedata

SELF = os.path.basename(__file__)
EXEC_ROOT = os.path.dirname(os.path.abspath(__file__))


def _init():
    parser = argparse.ArgumentParser(
        prog=SELF,
        usage=f"python {SELF} <dir> [extension] [options]",
        description="Normalize filenames safely (preview by default)",
        epilog="Use --apply to actually rename files.",
        add_help=True
    )
    parser.add_argument(
        "directory",
        type=Path,
        default=".",
        help="Target directory"
    )
    parser.add_argument(
        "extension",
        type=str,
        nargs="?",
        default="md",
        help="Target file extension (default: md)"
    )
    parser.add_argument(
        "-r", "--recursive",
        action="store_true",
        help="Include subdirectories"
    )
    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Show detailed operations"
    )
    parser.add_argument(
        "--apply",
        action="store_true",
        help="Actually rename files (otherwise just preview)"
    )
    return parser.parse_args()


def _get_files(dir, ext="md"):
    """Search all dirs and files"""
    result = []
    for root, dirs, files in os.walk(top=dir):
        for file in files:
            if not file.lower().endswith(f".{ext}"):
                continue
            result.append(os.path.join(root, file))
        # 非再帰モードなら1階層だけ
        if not args.recursive:
            break
    return result


def _normalize_name(filepath):
    """Generate normalized filename"""
    dir_path = os.path.dirname(filepath)
    old = os.path.basename(filepath)
    new = unicodedata.normalize("NFKC", old).replace(" ", "_")
    return old, new, os.path.join(dir_path, new)


def main(args):
    files = _get_files(args.directory, args.extension)
    if not files:
        print("No matching files.")
        return

    print("🔍 Previewing filename normalization:")
    print("-" * 60)

    changed = 0
    for file in files:
        old, new, new_path = _normalize_name(file)
        if old != new:
            changed += 1
            print(f"→ {old}  ⟶  {new}")
            if args.apply:
                os.rename(file, new_path)
                if args.verbose:
                    print(f"   ✅ Renamed: {file} → {new_path}")
        elif args.verbose:
            print(f"   (No change): {old}")

    print("-" * 60)
    print(f"Matched files: {len(files)}")
    print(f"Files needing rename: {changed}")
    if not args.apply:
        print("\n💡 This was a PREVIEW. Use --apply to actually rename files.")
    else:
        print("\n✅ Renaming completed.")


if __name__ == "__main__":
    args = _init()
    main(args)
