#!/usr/bin/env python3
"""Find and remove files with identical contents."""

from __future__ import annotations

import argparse
import hashlib
import os
import sys
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


CHUNK_SIZE = 1024 * 1024
JAPANESE_RANGES = (
    ("\u3040", "\u309f"),  # Hiragana
    ("\u30a0", "\u30ff"),  # Katakana
    ("\u3400", "\u4dbf"),  # CJK Extension A
    ("\u4e00", "\u9fff"),  # CJK Unified Ideographs
    ("\uff66", "\uff9f"),  # Half-width Katakana
)


@dataclass(frozen=True)
class FileInfo:
    path: Path
    size: int
    device: int
    inode: int
    mtime_ns: int


def format_size(size: int) -> str:
    units = ("B", "KiB", "MiB", "GiB", "TiB")
    value = float(size)
    for unit in units:
        if value < 1024 or unit == units[-1]:
            return f"{value:.1f} {unit}"
        value /= 1024
    raise AssertionError("unreachable")


def iter_files(root: Path) -> Iterable[FileInfo]:
    for directory, dirnames, filenames in os.walk(root, followlinks=False):
        dirnames.sort()
        filenames.sort()
        for filename in filenames:
            path = Path(directory, filename)
            try:
                stat = path.stat(follow_symlinks=False)
            except OSError as error:
                print(f"警告: 読み取れません: {path}: {error}", file=sys.stderr)
                continue

            if path.is_symlink() or not path.is_file():
                continue

            if stat.st_size == 0:
                continue

            yield FileInfo(
                path=path,
                size=stat.st_size,
                device=stat.st_dev,
                inode=stat.st_ino,
                mtime_ns=stat.st_mtime_ns,
            )


def sha256(path: Path) -> bytes:
    digest = hashlib.sha256()
    with path.open("rb") as file:
        while chunk := file.read(CHUNK_SIZE):
            digest.update(chunk)
    return digest.digest()


def contains_japanese(filename: str) -> bool:
    return any(
        start <= character <= end
        for character in filename
        for start, end in JAPANESE_RANGES
    )


def rel(path: Path) -> Path:
    try:
        return path.relative_to(Path.cwd())
    except ValueError:
        return path


def keeper_sort_key(info: FileInfo) -> tuple[bool, str]:
    return (not contains_japanese(info.path.name), str(info.path))


def find_duplicate_groups(root: Path) -> list[list[FileInfo]]:
    by_size: dict[int, list[FileInfo]] = defaultdict(list)
    for info in iter_files(root):
        by_size[info.size].append(info)

    groups: list[list[FileInfo]] = []
    for same_size in by_size.values():
        if len(same_size) < 2:
            continue

        by_hash: dict[bytes, list[FileInfo]] = defaultdict(list)
        for info in same_size:
            try:
                by_hash[sha256(info.path)].append(info)
            except OSError as error:
                print(f"警告: ハッシュを計算できません: {info.path}: {error}", file=sys.stderr)

        for same_hash in by_hash.values():
            # Multiple names for one inode are hard links and consume no extra data.
            unique_inodes: dict[tuple[int, int], FileInfo] = {}
            for info in same_hash:
                unique_inodes.setdefault((info.device, info.inode), info)
            if len(unique_inodes) > 1:
                groups.append(sorted(unique_inodes.values(), key=keeper_sort_key))

    return sorted(groups, key=lambda group: str(group[0].path))


def unchanged(info: FileInfo) -> bool:
    try:
        stat = info.path.stat(follow_symlinks=False)
    except OSError:
        return False
    return (
        not info.path.is_symlink()
        and stat.st_size == info.size
        and stat.st_dev == info.device
        and stat.st_ino == info.inode
        and stat.st_mtime_ns == info.mtime_ns
    )


def process_groups_dry_run(groups: list[list[FileInfo]]) -> tuple[int, int]:
    removed = 0
    reclaimed = 0
    for number, group in enumerate(groups, start=1):
        keeper, *duplicates = group
        print(f"\nグループ {number} ({format_size(keeper.size)})")
        print(f"  残す: {rel(keeper.path)}")
        for duplicate in duplicates:
            print(f"  削除予定: {rel(duplicate.path)}")
            removed += 1
            reclaimed += duplicate.size
    return removed, reclaimed


def process_groups_interactive(groups: list[list[FileInfo]]) -> tuple[int, int]:
    removed = 0
    reclaimed = 0
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    for number, group in enumerate(groups, start=1):
        file_labels = list(alphabet[: len(group)])
        if number > 1:
            print("---")
        print(f"Group {number} ({format_size(group[0].size)})")
        for label, info in zip(file_labels, group):
            print(f"  {label}: {rel(info.path)}")

        choices = "/".join(file_labels)
        prompt = f"\n  Which file do you want to keep? [{choices}/s=skip/q=quit]: "

        while True:
            try:
                answer = input(prompt).strip().upper()
            except (EOFError, KeyboardInterrupt):
                print("\nQuitting.")
                return removed, reclaimed

            if answer == "Q":
                print("Quitting.")
                return removed, reclaimed
            elif answer == "S":
                print("  Skipped.")
                break
            elif answer in file_labels:
                keeper_idx = file_labels.index(answer)
                keeper = group[keeper_idx]
                targets = [info for i, info in enumerate(group) if i != keeper_idx]
                print(f"  Keep:   {rel(keeper.path)}")
                for target in targets:
                    if not unchanged(target):
                        print(f"  Warning: file changed since scan, skipping: {rel(target.path)}", file=sys.stderr)
                        continue
                    try:
                        target.path.unlink()
                        print(f"  Delete: {rel(target.path)}")
                        removed += 1
                        reclaimed += target.size
                    except OSError as error:
                        print(f"  Warning: cannot delete: {error}", file=sys.stderr)
                break
            else:
                print(f"  Please enter {choices}, s, or q.")

    return removed, reclaimed


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=(
            "内容が完全一致する重複ファイルを削除します。"
            "日本語を含むファイル名を優先して残します。"
        )
    )
    parser.add_argument(
        "directory",
        nargs="?",
        default=".",
        type=Path,
        help="検索対象ディレクトリ (既定値: カレントディレクトリ)",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="ファイルを削除せず、削除候補だけを表示する",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    root = args.directory.expanduser().resolve()
    if not root.is_dir():
        print(f"エラー: ディレクトリではありません: {root}", file=sys.stderr)
        return 2

    mode = "確認のみ" if args.dry_run else "削除実行"
    print(f"対象: {root}")
    print(f"モード: {mode}")

    groups = find_duplicate_groups(root)
    if not groups:
        print("重複ファイルは見つかりませんでした。")
        return 0

    if args.dry_run:
        count, size = process_groups_dry_run(groups)
        verb = "削除候補"
    else:
        count, size = process_groups_interactive(groups)
        verb = "削除済み"
    print(f"\n{verb}: {count} ファイル、{format_size(size)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
