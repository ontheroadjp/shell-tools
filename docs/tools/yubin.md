# 📮 yubin <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

Interactively search Japanese postal codes using `fzf-tmux` with data from Japan Post.

## Requirements

- `curl`, `unzip`, `nkf`, `fzf`

```bash
brew install nkf fzf
```

## Setup

On first run, the postal code CSV is automatically downloaded from Japan Post. Data is stored in `$XDG_DATA_HOME/shell-tools/yubin/`. If `XDG_DATA_HOME` is not set, `~/.local/share` is used. The location can be overridden entirely:

```bash
export YUBIN_DATA_DIR="/path/to/dir"  # optional override
```

## Usage

```bash
yubin
```

Opens an interactive `fzf-tmux` search. You can search by postal code, prefecture, city, or town name.

## Examples

### Launch interactive postal code search

```bash
yubin
```

**Output:**

```
[fzf-tmux search interface opens]
  150-0001  東京都  渋谷区  神宮前
  150-0002  東京都  渋谷区  渋谷
  ...
```

Type to filter:
- `渋谷` → filter by Shibuya area
- `1500001` → search by postal code directly
- `北海道` → filter by Hokkaido

## Notes

- Data is saved to `$XDG_DATA_HOME/shell-tools/yubin/KEN_ALL.CSV` (defaults to `~/.local/share/shell-tools/yubin/KEN_ALL.CSV`, or `$YUBIN_DATA_DIR` if set).
- If the file exists, it will not be re-downloaded. Delete it manually to refresh.
- Designed for use in a tmux environment (`fzf-tmux`).
