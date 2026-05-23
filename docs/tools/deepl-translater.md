# 🌐 deepl-translater <Badge type="info" text="Python Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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

### 2. Create the `.env` file

```bash
echo "DEEPL_API_KEY=your_api_key_here" > tools/utilities/deepl-translater/.env
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

- Requires a `.env` file with `DEEPL_API_KEY` in the tool directory.
- Uses the DeepL Free API endpoint (`api-free.deepl.com`).
- If stdin is a pipe, reads from stdin; otherwise reads from clipboard.
