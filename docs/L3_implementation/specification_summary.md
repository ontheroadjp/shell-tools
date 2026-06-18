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
AWK engine files — used with `awk -f <file>`. Not installed. Pattern used in `char-converter/`.

### `.conf` files
Plain-text rule files for sed-based substitution. Format: `pattern,replacement` per line; `#` for comments. Used in `char-converter/specific_words.conf`.

## Character Conversion (`char-converter`)

**Location**: `tools/system_utilities/char-converter/`

**Command**: `converter`

**Options**:
| Option | Action |
|---|---|
| `-z` / `--zen` | Full-width → half-width (AWK engine: `_zen2han.awk`) |
| `-h` / `--han` | Half-width → full-width (AWK engine: `_han2zen.awk`) |
| `-s` / `--space` | Spaces (half/full-width) → underscores (`sed`) |
| `-w` / `--words` | Apply `specific_words.conf` substitutions (`sed`) |
| `--rename` | Apply to filenames via `mv`; default: transform file contents to stdout |

**Modes**:
- Without `--rename`: reads stdin or file args, writes converted text to stdout
- With `--rename`: renames files; accepts file args, directory (recursive), or stdin paths (one per line)

**AWK engines** (`_zen2han.awk`, `_han2zen.awk`): byte-level UTF-8 scanning; not installed as commands; loaded via `awk -f "$SCRIPT_DIR/_zen2han.awk"`.

**`-z` and `-h` are mutually exclusive** (`converter.sh`).

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
