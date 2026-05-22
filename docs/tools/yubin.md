# 📮 yubin

Interactively search Japanese postal codes using `fzf-tmux` with data from Japan Post.

## Requirements

- `curl`, `unzip`, `nkf`, `fzf`

```bash
brew install nkf fzf
```

## Setup

On first run, the postal code CSV is automatically downloaded from Japan Post. Data is stored in `~/.local/share/yubin/` by default (XDG Base Directory). The location can be overridden:

```bash
export YUBIN_DATA_DIR="/path/to/dir"  # optional override
```

## Usage

```bash
yubin
```

Opens an interactive `fzf-tmux` search. You can search by postal code, prefecture, city, or town name.

## Examples

```bash
yubin
```

After launching, type to search:
- `渋谷` → Find postal codes in Shibuya
- `1500001` → Search by postal code
- `北海道` → Filter by Hokkaido

## Notes

- Data is saved to `~/.local/share/yubin/KEN_ALL.CSV` (or `$YUBIN_DATA_DIR` if set).
- If the file exists, it will not be re-downloaded. Delete it manually to refresh.
- Designed for use in a tmux environment (`fzf-tmux`).
