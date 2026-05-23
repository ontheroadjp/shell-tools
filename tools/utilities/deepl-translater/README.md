# DeepL Clipboard Translater

Translates clipboard text using the DeepL API. The source language is automatically detected.

## Requirements

- Python 3
- DeepL API key (Free plan supported)

## Installation

1. Install dependencies:

    ```bash
    python3 -m pip install -r requirements.txt
    ```

2. Create a `.env` file in the project directory and add your DeepL API key:

    ```
    DEEPL_API_KEY=your_api_key
    ```

## Usage

Use the `-o` option to specify a target language:

| Option | Language |
|--------|----------|
| `EN`   | English (default) |
| `JA`   | Japanese |
| `ZH`   | Chinese |
| `KO`   | Korean |

### From clipboard

Copy text to your clipboard, then run the script:

```bash
python3 deepl-clipboard-translater.py
python3 deepl-clipboard-translater.py -o ja
```

### From stdin (pipe)

```bash
echo "こんにちは" | python3 deepl-clipboard-translater.py
cat file.txt | python3 deepl-clipboard-translater.py -o ja
```

### Copy result to clipboard

```bash
python3 deepl-clipboard-translater.py | pbcopy   # macOS
python3 deepl-clipboard-translater.py | xclip    # Linux
```
