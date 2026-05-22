# 🔧 fix_filename <Badge type="tip" text="Shell" />

Rename files by applying pattern/replacement rules defined in config files. Supports batch renaming, directory recursion, and stdin piping.

## Requirements

- macOS / Linux
- `sed`, `find`

## Usage

```bash
fix_filename -c <conf_file> <file|dir> ...
```

One or more config files must be provided via `-c`. Each config file contains `pattern,replacement` pairs (one per line). Comments start with `#`.

## Config File Format

```
# comment
pattern,replacement
old_word,new_word
```

Bundled config files:
- `zenkaku_to_hankaku.conf` — full-width to half-width
- `space_to_underbar.conf` — spaces to underscores
- `specific_words.conf` — custom word replacements

## Examples

```bash
fix_filename -c zenkaku_to_hankaku.conf ./files
fix_filename -c space_to_underbar.conf -c specific_words.conf ./docs
find . -name "*.md" | fix_filename -c zenkaku_to_hankaku.conf
```
