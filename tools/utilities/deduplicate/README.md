# deduplicate

`deduplicate` is a Python command-line utility that finds files with identical
contents and removes redundant copies. It prefers a Japanese filename when
choosing the copy to retain (`deduplicate.py:77-86`).

## Features

- Recursive regular-file scanning without following symbolic links
- Size grouping followed by SHA-256 content comparison
- Hard-link exclusion
- Japanese-filename keeper preference
- Non-destructive `--dry-run` preview
- Metadata revalidation immediately before deletion

## Installation

The repository has no third-party dependencies or packaging step. Use a
`python3` interpreter from the repository root:

```sh
python3 deduplicate.py --help
```

## Usage

Preview changes first:

```sh
python3 deduplicate.py --dry-run /path/to/directory
```

Delete detected duplicate copies:

```sh
python3 deduplicate.py /path/to/directory
```

When the directory is omitted, the current directory is scanned
(`deduplicate.py:170-175`). Live mode permanently deletes files with
`Path.unlink()` (`deduplicate.py:148-158`).

## Design Principles

- Compare content, not names: candidates must share size and SHA-256 digest
  (`deduplicate.py:89-106`).
- Preview destructive work: `--dry-run` reports without deleting
  (`deduplicate.py:140-146`).
- Revalidate before deletion: changed files are skipped
  (`deduplicate.py:117-128`, `deduplicate.py:148-150`).
- Avoid unnecessary memory use: hashing reads files in 1 MiB chunks
  (`deduplicate.py:16`, `deduplicate.py:69-74`).

See `docs/L0_concept/` for design policy and
`docs/L3_implementation/specification_summary.md` for implementation details.
