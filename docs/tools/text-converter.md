# 🔄 text-converter <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

Convert full-width/half-width characters, spaces, and custom word patterns — either in file contents (in place) or by renaming files.

## Usage

```bash
text-converter [OPTIONS] [file ...]
find . | text-converter [OPTIONS] --rename [dir ...]
```

## Options

| Option | Description |
|---|---|
| `-z`, `--zen` | Full-width → half-width (Zenkaku → Hankaku) |
| `-h`, `--han` | Half-width → full-width (Hankaku → Zenkaku) |
| `-s`, `--space` | Spaces (half-width and full-width) → underscores |
| `-w`, `--words` | Apply substitution rules from `specific_words.conf` |
| `--rename` | Transform **filenames** via `mv`; without this flag, transforms **file contents** |
| `-n`, `--dry-run` | Show what would be done without making any changes |

At least one conversion option is required. `-z` and `-h` are mutually exclusive.

## Modes

**Content mode** (default — no `--rename`):
- With file args: modifies files **in place** after confirmation
- Without file args (stdin): writes converted text to stdout (no confirmation)

**Rename mode** (`--rename`): renames files after confirmation. Accepts file args, directory (expanded recursively), or stdin paths (one per line). Uses `mv -n` — does not overwrite existing files.

Both modes show a preview and ask `Proceed? [Y/n]` before making changes (skipped for stdin→stdout). Use `--dry-run` to preview without being prompted.

## Examples

### Convert file contents

```bash
# stdin → stdout (no confirmation)
echo 'Ａｂｃ　１２３' | text-converter -z
# → Abc 123

# Modify file in place (shows confirmation prompt)
text-converter -z inputfile.txt
# Will modify in place:
#   inputfile.txt
# Proceed? [Y/n]

# Dry run: preview without modifying
text-converter -z --dry-run inputfile.txt
# [DRY RUN] Would modify in place:
#   inputfile.txt
```

### Rename files

```bash
# Rename a single file (shows confirmation prompt)
text-converter -z --rename 'Ａｂｃ.mp3'
# Will rename:
#   Ａｂｃ.mp3  →  Abc.mp3
# Proceed? [Y/n]

# Dry run: preview renames without executing
text-converter -z -s --dry-run --rename ./music/
# [DRY RUN] Would rename:
#   Ａ Ｂ Ｃ.mp3  →  A_B_C.mp3

# Rename all files in a directory (recursive)
text-converter -z -s --rename ./music/

# Rename files from find output
find . -name '*.mp3' | text-converter -z --rename
```

### Apply word substitution rules

```bash
text-converter -w --dry-run --rename ./music/
text-converter -w --rename ./music/
```

`specific_words.conf` contains `pattern,replacement` rules (one per line, sed BRE syntax). Comments start with `#`.
