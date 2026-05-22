# fix_filename

Renames files by applying substitution rules defined in conf files.

## Usage

```sh
fix_filename.sh -c <conf_file> [-c <conf_file> ...] <file|dir> ...
```

- Accepts files, directories, or stdin (one path per line)
- When given a directory, processes all files recursively
- Multiple `-c` options can be specified; rules are applied in order
- Removes empty directories after moving files

## Conf File Format

One rule per line, comma-separated:

```
pattern,replacement
```

- `pattern` — sed BRE syntax
- `replacement` — empty means delete the matched characters
- Lines starting with `#` are comments

Special characters in replacement:

| Character | Write as |
|-----------|----------|
| `&` | `\&` |
| `\` | `\\` |

## Conf Files

### `space_to_underbar.conf`

Replaces spaces (half-width and full-width) with underscores.

```sh
fix_filename.sh -c space_to_underbar.conf <file|dir> ...
```

### `zenkaku_to_hankaku.conf`

Converts full-width characters in filenames to half-width equivalents.
Covers uppercase/lowercase letters, digits, symbols, and katakana.

```sh
fix_filename.sh -c zenkaku_to_hankaku.conf <file|dir> ...
```

### `specific_words.conf`

Applies a set of predefined substitutions for music file naming conventions
(brackets, quotes, trailing tags, etc.).

```sh
fix_filename.sh -c specific_words.conf <file|dir> ...
```

## Examples

```sh
# Single conf
fix_filename.sh -c space_to_underbar.conf "My File.mp3"

# Multiple confs at once
fix_filename.sh -c space_to_underbar.conf -c zenkaku_to_hankaku.conf "Ｈｅｌｌｏ World.mp3"
# => Hello_World.mp3

# From find
find . -name "*.mp3" | fix_filename.sh -c specific_words.conf
```
