# deepl-translater

Translate clipboard text or stdin using the DeepL API. Source language is auto-detected.

## Requirements

- Python 3
- DeepL API key (Free plan supported)

```bash
pip install -r requirements.txt
```

## Setup

### 1. Get a DeepL API key

1. Create a free account at https://www.deepl.com/en/pro#developer
2. Go to **Account** → **Authentication Key for DeepL API**
3. Copy the API key (ends with `:fx` for the Free plan)

### 2. Create the credentials file

Credentials are stored in `$XDG_CONFIG_HOME/shell-tools/deepl-translater/credentials`. If `XDG_CONFIG_HOME` is not set, `~/.config` is used.

```bash
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/shell-tools/deepl-translater"
echo "DEEPL_API_KEY=your_api_key_here" > "${XDG_CONFIG_HOME:-$HOME/.config}/shell-tools/deepl-translater/credentials"
```

See `credentials.example` for the expected format.

## Usage

```bash
deepl-translater [-o TARGET_LANG]
```

| Option | Language |
|---|---|
| `-o EN` | English (default) |
| `-o JA` | Japanese |
| `-o ZH` | Chinese |
| `-o KO` | Korean |

Reads from clipboard if no stdin is provided.

## Examples

```bash
# Translate clipboard text to English (default)
deepl-translater

# Translate clipboard text to Japanese
deepl-translater -o JA

# Translate from stdin
echo "こんにちは" | deepl-translater

# Translate and copy result to clipboard
deepl-translater | pbcopy    # macOS
deepl-translater | xclip     # Linux
```
