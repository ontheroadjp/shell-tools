# 🔧 fix_filename <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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

### Convert full-width characters to half-width in filenames

```bash
fix_filename -c zenkaku_to_hankaku.conf ./files/
```

**Output:**

```
./files/ABC_test.txt
./files/report_2025.pdf
```

### Replace spaces with underscores

```bash
fix_filename -c space_to_underbar.conf "my document.txt"
```

**Output:**

```
my_document.txt
```

### Apply multiple rules at once

```bash
fix_filename -c zenkaku_to_hankaku.conf -c space_to_underbar.conf ./docs/
```

**Output:**

```
./docs/ABC_report_2025.txt
./docs/project_notes.md
```

### Use with find via stdin

```bash
find . -name "*.txt" | fix_filename -c zenkaku_to_hankaku.conf
```

**Output:**

```
./ABC_test.txt
./report_2025.txt
```
