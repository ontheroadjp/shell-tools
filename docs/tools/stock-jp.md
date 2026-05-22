# 💹 stock-jp <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

Interactively search Tokyo Stock Exchange securities with `peco` and open them in your browser.

## Requirements

- `peco`, `nkf`
- `python3` + `xlrd` (for XLS conversion)

```bash
brew install peco nkf
pip3 install 'xlrd==1.2.0'
```

## Setup

On first run, stock data is automatically downloaded from JPX and converted from XLS to CSV. Data is stored in `~/.local/share/stock-jp/` by default (XDG Base Directory).

To force update:

```bash
stock-jp --update
```

## Usage

```bash
stock-jp [options]
```

| Option | Description |
|---|---|
| `--update` | Download XLS from JPX and convert to CSV |
| `-h, --help` | Show help |
| `-v, --version` | Show version |

## Flow

1. `peco` launches for incremental search by name or code
2. Select a security → choose a site via `peco`
3. Opens the selected site in your browser

**Supported sites:** Yahoo! Finance, Google, SBI Securities, Quick, 会社四季報, 日経

## Examples

```bash
# Launch interactive stock search
stock-jp
```

```
[displays fzf search interface]
Stock JP > _
  9984  ソフトバンクグループ  情報・通信業
  7203  トヨタ自動車          輸送用機器
  6758  ソニーグループ        電気機器
  ...
```

After selecting a stock, choose a site to open:

```
Yahoo! Finance
Google
SBI証券
Quick（株価）
...
```

```bash
# Download/update stock data
stock-jp --update
```

```
  % Total    % Received % Xferd ...
updated!
```
