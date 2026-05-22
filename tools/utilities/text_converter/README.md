# text_converter

Converts full-width (全角) and half-width (半角) characters in text content.
Both scripts follow the Unix filter pattern — they read from a file or stdin and write to stdout.

## to_hankaku.sh

Converts full-width characters to half-width.

```sh
to_hankaku.sh [+<n>h] [<field> ...] [<file>]
to_hankaku.sh -d <string>
```

| Option | Description |
|--------|-------------|
| `+<n>h` | Skip first `n` header lines (pass through unchanged) |
| `<field>` | Field number(s) to convert (e.g. `1`, `2/4`, `NF`) |
| `-d <string>` | Convert a string directly (no file input) |

Examples:

```sh
# Convert all fields
to_hankaku.sh data.txt

# Convert only field 2
to_hankaku.sh 2 data.txt

# Skip 1 header line, convert fields 1 through 3
to_hankaku.sh +1h 1/3 data.txt

# Direct string conversion
to_hankaku.sh -d "ＡＢＣ　１２３"
# => ABC 123

# Pipeline
cat data.txt | to_hankaku.sh
```

## to_zenkaku.sh

Converts half-width characters to full-width.

```sh
to_zenkaku.sh [+<n>h] [-k] [<field> ...] [<file>]
to_zenkaku.sh -d [-k] <string>
```

| Option | Description |
|--------|-------------|
| `+<n>h` | Skip first `n` header lines (pass through unchanged) |
| `-k` | Convert katakana only (leave ASCII characters unchanged) |
| `<field>` | Field number(s) to convert (e.g. `1`, `2/4`, `NF`) |
| `-d <string>` | Convert a string directly (no file input) |

Examples:

```sh
# Convert all fields
to_zenkaku.sh data.txt

# Convert katakana only
to_zenkaku.sh -k data.txt

# Direct string conversion
to_zenkaku.sh -d "ABC 123"
# => ＡＢＣ　１２３
```
