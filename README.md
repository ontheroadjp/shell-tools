# Shell Tools

A collection of standalone shell scripts for everyday terminal operations.

## Setup

Create symlinks to `~/dotfiles/bin`:

```bash
./install.sh
```

`~/dotfiles/bin` must be in your `$PATH`.

## Tools

### system

| Script | Description |
|---|---|
| `battery` | tmux status bar: battery level |
| `colors` | Display ANSI color codes and 256-color tables |
| `get-ssid` | tmux status bar: current Wi-Fi SSID |
| `get-volume` | tmux status bar: system volume |
| `ssid` | Display current Wi-Fi SSID |

### system_utilities

| Script | Description |
|---|---|
| `bench_command` | Benchmark execution time of any command |
| `bench_function` | Benchmark execution time of any Zsh function |
| `bench_net` | Measure network download/upload speed via speedtest.net |
| `bench_zsh` | Measure Zsh startup time |
| `counts` | Count/analyze files and directories by size or type |
| `fix_filename` | Rename files using pattern/replacement config files |
| `numstats` | Basic statistics for a list of numbers |
| `wifi-helth-check` | WiFi and network diagnostics |

### utilities

| Script | Description |
|---|---|
| `deepl-translater` | Translate clipboard text or stdin via DeepL API |
| `text_converter` | Convert between full-width and half-width characters |

### network

| Script | Description |
|---|---|
| `extract_links` | Extract file links from a web page by extension |
| `list_downloader` | Batch download files from a list of URLs |

### mini_apps

| Script | Description |
|---|---|
| `dictionary` | Look up words using macOS Dictionary (English ↔ Japanese) |
| `holiday` | List Japanese public holidays |
| `quick-memo` | Quick memo and TODO management |
| `stock-jp` | Look up Japanese stock prices |
| `timer` | Countdown timer with notification |
| `today` | Daily summary (date, weather, world time) |
| `wareki` | Convert between Western and Japanese era years |
| `weather` | Current weather via wttr.in |
| `worldtime` | Display current time in major cities |
| `yubin` | Japanese postal code search |

### multimedia

| Script | Description |
|---|---|
| `movie-converter` | Convert video files using ffmpeg |

## Usage

Each script shows usage when called without arguments.

```bash
timer 1h30m
weather Tokyo
wareki 2024
counts fatf .
fix_filename -c zenkaku_to_hankaku.conf ./files
deepl-translater -o JA
```

## Requirements

- macOS / Linux
- Common: `curl`, `fzf`
- Some tools require: `peco`, `nkf`, `gsed`, `rg`
- bench-suite: `zsh`, `bc`, `python`
- stock-jp: `python3`, `xlrd==1.2.0` (`pip3 install 'xlrd==1.2.0'`)
- deepl-translater: `python3`, `pip install -r requirements.txt`
- multimedia: `ffmpeg`

## Data Storage

Tools that store data follow the [XDG Base Directory](https://specifications.freedesktop.org/basedir-spec/latest/) spec. If the XDG environment variable is not set, the default path is used.

| Tool | XDG variable | Default path |
|---|---|---|
| `yubin` | `XDG_DATA_HOME` | `~/.local/share/shell-tools/yubin/` |
| `quick-memo` | `XDG_DATA_HOME` | `~/.local/share/shell-tools/quick-memo/` |
| `stock-jp` | `XDG_DATA_HOME` | `~/.local/share/shell-tools/stock-jp/` |
| `deepl-translater` | `XDG_CONFIG_HOME` | `~/.config/shell-tools/deepl-translater/credentials` |

Each data path can also be overridden via its tool-specific environment variable (`YUBIN_DATA_DIR`, `QUICK_MEMO_DATA_DIR`, `STOCK_SEARCH_DIR`).
