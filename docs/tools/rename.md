# ✏️ rename <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

Rename files and directories by converting full-width/half-width characters, spaces, and custom word patterns.

## Usage

```bash
rename [OPTIONS] [file_or_dir ...]
find . | rename [OPTIONS]
```

## Options

| Option | Description |
|---|---|
| `--han` | Half-width → full-width (replaces the default full → half-width) |
| `--no-zen` | Skip full-width → half-width |
| `--no-space` | Skip spaces → underscores |
| `--no-words` | Skip `specific_words.conf` rules |
| `-r`, `--recursive` | Also rename files and directories in all subdirectories (default: files and directories directly under the given directory) |
| `--dry-run` | Show what would be done without making any changes |

By default, full-width → half-width, spaces → underscores, and `specific_words.conf` rules are all applied.

## Behavior

Accepts files, directories, or stdin paths (one per line). A directory expands to its **direct children** (add `-r` to include everything in subdirectories as well). Deepest entries are renamed first. Only the base name is converted, not the parent path. Shows a preview and asks `Proceed? [Y/n]`; uses `mv -n`, so existing files are never overwritten. Use `--dry-run` to preview without being prompted.

## Examples

```bash
# Rename a single file
rename 'Ａｂｃ.mp3'
# Will rename:
#   Ａｂｃ.mp3  →  Abc.mp3
# Proceed? [Y/n]

# Dry run: preview renames without executing
rename --dry-run ./music/
# [DRY RUN] Would rename:
#   Ａ Ｂ Ｃ.mp3  →  A_B_C.mp3

# Rename entries directly under a directory
rename ./music/

# Rename recursively
rename -r ./music/

# Rename files from find output
find . -name '*.mp3' | rename

# Apply word substitution rules
rename --dry-run --no-zen --no-space ./music/
```

`specific_words.conf` contains `pattern,replacement` rules (one per line, sed BRE syntax). Comments start with `#`.
