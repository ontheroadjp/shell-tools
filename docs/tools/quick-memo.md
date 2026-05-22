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

Data is stored in `~/.local/share/quick-memo/` by default (XDG Base Directory). The location can be overridden:

```bash
export QUICK_MEMO_DATA_DIR="/path/to/dir"  # optional override
```

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

- Memo is saved to `~/.local/share/quick-memo/quick_memo.md` (or `$QUICK_MEMO_DATA_DIR` if set).
- TODOs use `[ ]` checkbox format.
