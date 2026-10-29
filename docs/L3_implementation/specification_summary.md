# Specification Summary

## Install System (`install.sh`)

**Script discovery** (`install.sh:9`):
```bash
find "${REPO_ROOT}/tools" -mindepth 3 -maxdepth 3 -type f \
    \( -name "*.sh" -o -name "*.zsh" -o -name "*.py" \)
```

**Installed command name** = basename of script minus extension (`install.sh:_tool_name`).

**Symlink target**: `${BIN_DIR}/${name}` → absolute script path.

**Conflict handling** (`install.sh:_link_one`):
- Already linked to same target → skip
- Linked to different target → re-link (update)
- Exists as non-symlink → error
- Not present → create

## Tool Conventions

### Script header
Each tool starts with `#!/bin/bash` (or `#!/bin/zsh`, `#!/usr/bin/env python3`) and shows usage when called without required arguments.

### `.fnc` files
Zsh function libraries — sourced by the main `.sh` but not installed as standalone commands. Pattern: `tools/<name>/<name>.fnc` loaded in `<name>.sh`.

### `.awk` files
AWK engine files — used with `awk -f <file>`. Not installed. Pattern used in `rename/`.

### `.conf` files
Plain-text rule files for sed-based substitution. Format: `pattern,replacement` per line; `#` for comments. Used in `rename/specific_words.conf`.

## File Renaming (`rename`)

**Location**: `tools/system_utilities/rename/`

**Command**: `rename`

**Default conversions (all on)**: full-width → half-width (AWK engine: `_zen2han.awk`), spaces → underscores (`sed`), `specific_words.conf` substitutions (`sed`).

**Options**:
| Option | Action |
|---|---|
| `--han` | Half-width → full-width instead of the default full → half (AWK engine: `_han2zen.awk`) |
| `--no-zen` | Skip full-width → half-width |
| `--no-space` | Skip spaces → underscores |
| `--no-words` | Skip `specific_words.conf` substitutions |
| `-r` / `--recursive` | Include all subdirectories (default: only entries directly under the given directory) |
| `--dry-run` | Print the planned renames and exit without changing anything |

**Behavior**:
- Accepts file or directory args (relative to the current directory), or stdin paths (one per line)
- A directory expands to its entries (files and directories); only the base name is converted, never the parent path
- Renames deepest entries first; shows a preview, asks `Proceed? [Y/n]`, and uses `mv -n` (existing files are not overwritten)

**AWK engines** (`_zen2han.awk`, `_han2zen.awk`): byte-level UTF-8 scanning; not installed as commands; loaded via `awk -f "$SCRIPT_DIR/_zen2han.awk"`.

## Data Storage (XDG)

Tools that persist state use XDG Base Directory spec:

| Tool | Variable | Default |
|---|---|---|
| yubin | `XDG_DATA_HOME` / `YUBIN_DATA_DIR` | `~/.local/share/shell-tools/yubin/` |
| quick-memo | `XDG_DATA_HOME` / `QUICK_MEMO_DATA_DIR` | `~/.local/share/shell-tools/quick-memo/` |
| stock-jp | `XDG_DATA_HOME` / `STOCK_SEARCH_DIR` | `~/.local/share/shell-tools/stock-jp/` |
| deepl-translater | `XDG_CONFIG_HOME` | `~/.config/shell-tools/deepl-translater/credentials` |

Source: `README.md:Data Storage`.

## VitePress Documentation Site

**Config**: `docs/.vitepress/config.mts`

**Locales**: EN (root), JA (`/ja/`), ZH (`/zh/`)

**Sidebar arrays**: `toolsSidebarEn`, `toolsSidebarJa`, `toolsSidebarZh` — all three must be updated when tools change.

**Base path**: `/shell-tools/` (`config.mts:base`)

**Build output**: `docs/.vitepress/dist/` (gitignored)

## Unchecked / Unverified

- `calc.py`: uses Python 3 — version requirement unverified
- `bench_net.py`: requires `speedtest-cli` — not confirmed in any requirements file
- `deduplicate.py`: has its own `docs/` subdirectory and `CLAUDE.md` — separate sub-tool scope
