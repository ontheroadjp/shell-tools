# Project Overview

## Purpose

`deduplicate` is a Python command-line utility that detects
content-identical regular files below a directory and optionally removes all
but one file in each group (`deduplicate.py:45-74`,
`deduplicate.py:89-114`, `deduplicate.py:185-204`).

## Technology Stack

- Language: Python, selected by the executable shebang and Python source
  implementation (`deduplicate.py:1-13`).
- Runtime dependencies: Python standard library only, based on the complete
  import list (`deduplicate.py:6-13`).
- Package manager: unconfirmed; no package or dependency manifest exists in the
  repository.
- CI/CD: not present; no `.github/workflows/` directory exists.

The local analysis environment executed the CLI with Python 3.12.3, but this is
an observation of the current environment rather than a declared project
requirement.

## Implemented Features

- Recursively enumerate regular files without following symbolic links
  (`deduplicate.py:45-66`).
- Reduce hash work by grouping candidates by byte size
  (`deduplicate.py:89-98`).
- Hash candidates with SHA-256 in 1 MiB chunks
  (`deduplicate.py:16`, `deduplicate.py:69-74`,
  `deduplicate.py:99-105`).
- Exclude multiple names for one hard-linked inode from duplicate storage
  groups (`deduplicate.py:106-112`).
- Prefer Japanese filenames, then lexical path order, when choosing the file to
  retain (`deduplicate.py:17-23`, `deduplicate.py:77-86`).
- Preview deletion with `--dry-run` (`deduplicate.py:140-146`,
  `deduplicate.py:177-181`).
- Revalidate files before deletion and skip changed files
  (`deduplicate.py:117-128`, `deduplicate.py:148-156`).

## Unconfirmed

- Supported operating systems and minimum Python version are not declared.
  A packaging file, runtime-version file, or CI matrix would be needed to
  confirm them.
