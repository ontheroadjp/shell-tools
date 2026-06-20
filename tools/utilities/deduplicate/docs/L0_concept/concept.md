# Concept

## Purpose

This repository provides a command-line tool that finds files with identical
contents and removes redundant copies (`deduplicate.py:1-2`,
`deduplicate.py:89-114`, `deduplicate.py:131-160`).

The tool addresses duplicate-file storage while retaining one file from each
content-identical group. It prefers a filename containing Japanese characters
when selecting the retained file (`deduplicate.py:17-23`,
`deduplicate.py:77-86`, `deduplicate.py:135-142`).

## Intended User

The confirmed interface is an interactive command-line interface for a user
who supplies a directory, or accepts the current directory as the default
(`deduplicate.py:163-182`). No service, library API, or graphical interface is
implemented.

## Design Constraints

- Duplicate identity is based on equal size followed by SHA-256 content hashes.
  This avoids hashing files whose sizes already differ
  (`deduplicate.py:89-106`).
- Symbolic links and non-regular files are excluded, and directory symlinks are
  not followed. This limits deletion to regular files reached directly during
  traversal (`deduplicate.py:45-66`).
- Hard-linked names sharing one device and inode are collapsed before duplicate
  groups are emitted because they do not represent additional stored data
  (`deduplicate.py:106-112`).
- A dry-run mode exists because deletion is otherwise immediate and permanent
  (`deduplicate.py:140-158`, `deduplicate.py:177-181`).

## Unconfirmed

- The original product requirements and target operating systems are
  unconfirmed because the repository contains no requirements document or
  platform configuration. Add such evidence under `docs/` or a packaging
  manifest to establish these decisions.
