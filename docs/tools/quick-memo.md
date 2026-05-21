# 📝 quick-memo

Quickly manage memos and TODOs from the terminal. Notes are stored in a Markdown file.

## Requirements

- `vim`
- `gsed` (GNU sed)
- `rg` (ripgrep)

```bash
brew install gnu-sed ripgrep
```

## Setup

Set the storage directory via environment variable:

```bash
export QUICK_MEMO_DATA_DIR="$HOME/.quick-memo"
```

Defaults to `$HOME/.quick-memo` if not set.

## Usage

```bash
quick-memo [subcommand]
```

| Subcommand | Description |
|---|---|
| `memo` (default) | Open memo file in vim (auto-inserts timestamped header) |
| `todo [items...]` | Add TODO items; show pending TODOs if no args |
| `mail <address>` | Email the memo file |

## Examples

```bash
quick-memo
quick-memo todo "Write proposal" "Prepare meeting slides"
quick-memo todo
quick-memo mail you@example.com
```

## Notes

- Memo is saved to `$QUICK_MEMO_DATA_DIR/quick_memo.md`.
- TODOs use `[ ]` checkbox format.
