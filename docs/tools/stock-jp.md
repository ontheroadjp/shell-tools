# 💹 stock-jp

Interactively search Tokyo Stock Exchange securities with `peco` and open them in your browser.

## Requirements

- `peco`
- `nkf`

```bash
brew install peco nkf
```

## Setup

Place the stock data CSV (`stock.csv`) in `shell_scripts/stock-jp/data/`. On first run or to update:

```bash
stock-jp --update
```

## Usage

```bash
stock-jp [options]
```

| Option | Description |
|---|---|
| `--update` | Download stock data from JPX |
| `-h, --help` | Show help |
| `-v, --version` | Show version |

## Flow

1. `peco` launches for incremental search by name or code
2. Select a security → choose a site via `peco`
3. Opens the selected site in your browser

**Supported sites:** Yahoo! Finance, Google, SBI Securities, Quick, 会社四季報, 日経

## Examples

```bash
stock-jp
stock-jp --update && stock-jp
```
