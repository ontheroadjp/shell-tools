# Design Policy

## Technology Policy

The implementation is one executable Python script and imports only Python
standard-library modules (`deduplicate.py:1-13`). No dependency manifest or
lock file exists, so no package manager or third-party runtime dependency is
established.

Why: the current implementation can run without a repository-local dependency
installation step. Changes should preserve that property unless a dependency
manifest and rationale are added.

## Data Safety Policy

- New behavior must preserve `--dry-run` as a non-deleting preview
  (`deduplicate.py:140-146`, `deduplicate.py:177-181`).
- Before deletion, both the retained file and deletion candidate must still
  match the size, device, inode, and modification time observed during scanning
  (`deduplicate.py:117-128`, `deduplicate.py:148-156`).
- Symbolic links must not be treated as deletion candidates
  (`deduplicate.py:45-58`, `deduplicate.py:117-124`).
- Read, hash, and deletion failures must be reported and skipped rather than
  aborting the complete scan (`deduplicate.py:51-55`, `deduplicate.py:100-105`,
  `deduplicate.py:152-156`).

Why: the command performs destructive filesystem operations, so preview,
revalidation, and isolated error handling are the confirmed safeguards.

## Performance Policy

Files are grouped by size before hashing, and file contents are hashed in 1 MiB
chunks (`deduplicate.py:16`, `deduplicate.py:69-74`,
`deduplicate.py:89-106`). Changes should avoid loading complete file contents
into memory unless repository evidence establishes a different requirement.

## Prohibited Assumptions

- Do not claim support for a specific minimum Python version; no runtime version
  declaration exists.
- Do not claim CI, automated tests, packaging, API, or database support until
  corresponding files are added.
- Do not treat equal filenames or timestamps as proof of duplicate content; the
  implementation defines equality by SHA-256 after size grouping
  (`deduplicate.py:89-106`).
