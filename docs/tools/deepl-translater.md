# 🌐 deepl-translater <span class="tc-badge tc-badge-python">Python Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

Translate clipboard text or stdin using the DeepL API. Source language is auto-detected.

## Requirements

- Python 3
- DeepL API key (Free plan supported)

```bash
pip install -r requirements.txt
```

## Setup

### 1. Get a DeepL API key

1. Create a free account at [https://www.deepl.com/en/pro#developer](https://www.deepl.com/en/pro#developer)
2. Go to **Account** → **Authentication Key for DeepL API**
3. Copy the API key (ends with `:fx` for the Free plan)

### 2. Create the credentials file

Credentials are stored in `$XDG_CONFIG_HOME/shell-tools/deepl-translater/credentials`. If `XDG_CONFIG_HOME` is not set, `~/.config` is used.

```bash
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/shell-tools/deepl-translater"
echo "DEEPL_API_KEY=your_api_key_here" > "${XDG_CONFIG_HOME:-$HOME/.config}/shell-tools/deepl-translater/credentials"
```

## Usage

```bash
deepl-translater [-o TARGET_LANG]
```

| Option | Description |
|---|---|
| `-o EN` | Translate to English (default) |
| `-o JA` | Translate to Japanese |
| `-o ZH` | Translate to Chinese |
| `-o KO` | Translate to Korean |

Reads from clipboard if no stdin is provided.

## Examples

### Translate clipboard text to English (default)

```bash
deepl-translater
```

**Output:**

```
Hello, world.
```

### Translate clipboard text to Japanese

```bash
deepl-translater -o JA
```

**Output:**

```
こんにちは、世界。
```

### Translate from stdin

```bash
echo "こんにちは" | deepl-translater
```

**Output:**

```
Hello
```

### Pipe file content and translate

```bash
cat document.txt | deepl-translater -o ZH
```

**Output:**

```
你好，世界。
```

### Translate and copy result to clipboard

```bash
deepl-translater | pbcopy    # macOS
deepl-translater | xclip     # Linux
```

## Notes

- Credentials are read from `$XDG_CONFIG_HOME/shell-tools/deepl-translater/credentials` (defaults to `~/.config/shell-tools/deepl-translater/credentials`).
- Uses the DeepL Free API endpoint (`api-free.deepl.com`).
- If stdin is a pipe, reads from stdin; otherwise reads from clipboard.
