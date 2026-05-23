# 📝 quick-memo <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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

### Open memo file in vim

```bash
quick-memo
```

**Output:**

```
[opens ~/.local/share/quick-memo/quick_memo.md in vim]
```

### Add a TODO item

```bash
quick-memo todo "Review pull request"
```

**Output:**

```
add todo: Review pull request
```

### Add multiple TODO items at once

```bash
quick-memo todo "Fix bug #42" "Write tests" "Update docs"
```

**Output:**

```
add todo: Fix bug #42
add todo: Write tests
add todo: Update docs
```

### Show all pending TODO items

```bash
quick-memo todo
```

**Output:**

```
[ ] Fix bug #42
[ ] Write tests
[ ] Update docs
```

## Notes

- Memo is saved to `~/.local/share/quick-memo/quick_memo.md` (or `$QUICK_MEMO_DATA_DIR` if set).
- TODOs use `[ ]` checkbox format.
