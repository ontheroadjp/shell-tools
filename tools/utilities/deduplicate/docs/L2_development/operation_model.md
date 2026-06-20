# Operation Model

## Prerequisites

- A `python3` executable is required by the script shebang
  (`deduplicate.py:1`).
- No third-party installation step is evidenced because every import is from
  the Python standard library and no dependency manifest exists
  (`deduplicate.py:6-13`).

The repository does not declare a minimum Python version. Python 3.12.3 was used
to verify the commands during documentation initialization.

## Commands

Show the verified CLI:

```sh
python3 deduplicate.py --help
```

Preview duplicate removals without deleting files:

```sh
python3 deduplicate.py --dry-run <directory>
```

Delete duplicate files:

```sh
python3 deduplicate.py <directory>
```

If `<directory>` is omitted, the current directory is used
(`deduplicate.py:170-181`). Because the non-dry command calls `Path.unlink()`,
run the dry command first when operating on important data
(`deduplicate.py:140-158`).

Perform the verified read-only syntax check:

```sh
python3 -c "compile(open('deduplicate.py', encoding='utf-8').read(), 'deduplicate.py', 'exec')"
```

## Build and Test

There is no build step, CI definition, or automated test suite in the
repository. The syntax check and CLI help command above are the currently
verified development checks.

## Unconfirmed

- Release, packaging, and installation procedures are unconfirmed because no
  packaging metadata or release workflow exists. Add the relevant root
  manifest or `.github/workflows/` definition to establish them.
