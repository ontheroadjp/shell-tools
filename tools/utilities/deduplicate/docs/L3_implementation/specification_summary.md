# Implementation Specification

## Entry Point and Exit Behavior

`deduplicate.py` is the sole entry point. `main()` parses arguments, resolves
the target path, rejects non-directories with exit status 2, finds duplicate
groups, processes them, and otherwise returns 0
(`deduplicate.py:163-208`).

## File Discovery

`iter_files()` traverses the target recursively with `os.walk()` while
disabling symlink following. Directory and filename lists are sorted for
deterministic traversal. It emits immutable `FileInfo` records containing path,
size, device, inode, and nanosecond modification time
(`deduplicate.py:26-32`, `deduplicate.py:45-66`).

Unreadable entries are reported to standard error and skipped
(`deduplicate.py:51-55`).

## Duplicate Detection

1. Files are grouped by byte size (`deduplicate.py:89-97`).
2. Groups with at least two files are grouped by SHA-256 digest
   (`deduplicate.py:99-105`).
3. Entries sharing device and inode are collapsed as hard-linked names
   (`deduplicate.py:106-112`).
4. Groups containing more than one unique inode are sorted and emitted
   (`deduplicate.py:111-114`).

Hashing reads 1 MiB chunks to bound per-read memory use
(`deduplicate.py:16`, `deduplicate.py:69-74`).

## Keeper Selection

`contains_japanese()` recognizes Hiragana, Katakana, CJK Extension A, CJK
Unified Ideographs, and half-width Katakana ranges
(`deduplicate.py:17-23`, `deduplicate.py:77-82`).

The keeper sort key places filenames containing those characters first, then
orders by full path (`deduplicate.py:85-86`). The first item is retained
(`deduplicate.py:135-142`).

## Deletion

Dry-run counts and reports candidates without unlinking them
(`deduplicate.py:140-146`). Live mode verifies both keeper and candidate
metadata are unchanged, then calls `Path.unlink()` for each candidate
(`deduplicate.py:117-128`, `deduplicate.py:148-158`).

Failures are reported and processing continues. The final output reports the
number of candidates or deletions and their total byte size
(`deduplicate.py:152-160`, `deduplicate.py:201-204`).

## Interfaces Not Present

No network API, database schema, persistent application state, or importable
public API contract is defined. Therefore `api.md` and `database.md` are not
generated.

## Unconfirmed

- Behavior under concurrent directory mutation beyond the recorded metadata
  checks is not covered by automated tests. A future test suite should use
  controlled filesystem fixtures to establish that behavior.
