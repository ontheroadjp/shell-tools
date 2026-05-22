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
| `extract_links` | Extract file links from a web page by extension |
| `list_downloader` | Batch download files from a list of URLs |
| `to_hankaku` | Convert full-width characters to half-width |
| `to_zenkaku` | Convert half-width characters to full-width |

### mini_apps

| Script | Description |
|---|---|
| `dictionary` | Look up words using macOS Dictionary (English ↔ Japanese) |
| `holiday` | List Japanese public holidays |
| `quick-memo` | Quick memo and TODO management |
| `stock-jp` | Look up Japanese stock prices |
| `timer` | Countdown timer with macOS notification |
| `today` | Daily summary (date, weather, world time) |
| `wareki` | Convert between Western and Japanese era years |
| `weather` | Current weather via wttr.in |
| `worldtime` | Display current time in major cities |
| `yubin` | Japanese postal code search |

### multimedia

| Script | Description |
|---|---|
| `mp4_to_mp3` | Convert MP4 to MP3 using ffmpeg |

## Usage

Each script shows usage when called without arguments.

```bash
timer 1h30m
weather Tokyo
wareki 2024
counts fatf .
fix_filename -c zenkaku_to_hankaku.conf ./files
```

## Requirements

- macOS
- Common: `curl`, `fzf`
- Some tools require: `peco`, `nkf`, `gsed`, `rg`
- bench-suite: `zsh`, `bc`, `python`
- stock-jp: `python3`, `xlrd==1.2.0` (`pip3 install 'xlrd==1.2.0'`)
- multimedia: `ffmpeg`

## Data Storage

Tools that download or generate data follow the [XDG Base Directory](https://specifications.freedesktop.org/basedir-spec/latest/) spec:

| Tool | Default data path |
|---|---|
| `yubin` | `~/.local/share/yubin/` |
| `quick-memo` | `~/.local/share/quick-memo/` |
| `stock-jp` | `~/.local/share/stock-jp/` |

Each can be overridden via its corresponding environment variable (`YUBIN_DATA_DIR`, `QUICK_MEMO_DATA_DIR`, `STOCK_SEARCH_DIR`).
