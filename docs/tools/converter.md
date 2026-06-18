# 🔄 converter <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

Convert full-width/half-width characters, spaces, and custom word patterns — either in file contents or by renaming files.

## Usage

```bash
converter [OPTIONS] [file|dir ...]
find . | converter [OPTIONS] --rename
```

## Options

| Option | Description |
|---|---|
| `-z`, `--zen` | Full-width → half-width (Zenkaku → Hankaku) |
| `-h`, `--han` | Half-width → full-width (Hankaku → Zenkaku) |
| `-s`, `--space` | Spaces (half-width and full-width) → underscores |
| `-w`, `--words` | Apply substitution rules from `specific_words.conf` |
| `--rename` | Transform **filenames** via `mv`; without this flag, transforms **file contents** |

At least one conversion option is required. `-z` and `-h` are mutually exclusive.

## Modes

**Content mode** (default — no `--rename`): reads from file args or stdin, writes converted text to stdout.

**Rename mode** (`--rename`): renames files. Accepts file args, directory (expanded recursively), or stdin paths (one per line). Uses `mv -n` — does not overwrite existing files.

## Examples

### Convert file contents

```bash
# Full-width → half-width
echo 'Ａｂｃ　１２３' | converter -z
# → Abc 123

# Half-width → full-width
echo 'Abc 123' | converter -h
# → Ａｂｃ　１２３

# Combine: full-width → half-width and spaces → underscores
echo 'Ａｂｃ　１２３' | converter -z -s
# → Abc_123

# Convert file contents in place (via temporary file)
converter -z inputfile.txt > output.txt
```

### Rename files

```bash
# Rename a single file
converter -z --rename 'Ａｂｃ.mp3'
# → Abc.mp3

# Rename all files in a directory (recursive)
converter -z -s --rename ./music/

# Rename files from find output
find . -name '*.mp3' | converter -z --rename

# Combined: full-width → half-width + spaces → underscores
converter -z -s --rename 'Ａ Ｂ Ｃ.mp3'
# → A_B_C.mp3
```

### Apply word substitution rules

```bash
# Apply rules from specific_words.conf
converter -w --rename ./music/
```

`specific_words.conf` contains `pattern,replacement` rules (one per line, sed BRE syntax). Comments start with `#`.
