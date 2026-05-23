# stock-jp

Search Japanese stocks by name or code and open the result in a browser.

## Requirements

- `bash`, `curl`, `peco`, `nkf`, `column`, `sed`
- `python3`, `xlrd==1.2.0` — for XLS→CSV conversion on first run

```bash
pip3 install 'xlrd==1.2.0'
```

## Data Storage

Stock data is downloaded automatically on first run from JPX and converted from XLS to CSV. Data is stored in `$XDG_DATA_HOME/shell-tools/stock-jp/`. If `XDG_DATA_HOME` is not set, `~/.local/share` is used.

The path can be overridden:

```bash
export STOCK_SEARCH_DIR="/path/to/dir"
```

## Usage

```bash
stock-jp [OPTIONS]
```

| Option | Description |
|---|---|
| (none) | Interactive stock search |
| `--update` | Re-download and refresh stock data |
| `-v`, `--version` | Show version |
| `-h`, `--help` | Show help |

## Example

```bash
# Launch interactive search
stock-jp
```

```bash
# Refresh stock data
stock-jp --update
```
