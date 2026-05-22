# Shell Tools

A collection of standalone shell scripts for everyday terminal operations.

## Setup

Create symlinks to `~/dotfiles/bin`:

```bash
./install.sh
```

`~/dotfiles/bin` must be in your `$PATH`.

## Tools

| Script | Description |
|---|---|
| `bench_command` | Benchmark execution time of any command |
| `bench_function` | Benchmark execution time of any Zsh function |
| `bench_net` | Measure network download/upload speed via speedtest.net |
| `bench_zsh` | Measure Zsh startup time |
| `colors` | Display ANSI color codes and 256-color tables |
| `counts` | Count/analyze files and directories by size or type |
| `dictionary` | Look up English words via weblio |
| `holiday` | List Japanese public holidays |
| `movie-converter` | Convert MP4 to MP3 |
| `numstats` | Basic statistics for a list of numbers |
| `quick-memo` | Quick memo and TODO management |
| `stock-jp` | Look up Japanese stock prices |
| `timer` | Countdown timer with macOS notification |
| `today` | Daily summary (date, weather, world time) |
| `wareki` | Convert between Western and Japanese era years |
| `weather` | Current weather via wttr.in |
| `wifi-helth-check` | WiFi and network diagnostics |
| `worldtime` | Display current time in major cities |
| `yubin` | Japanese postal code search |

## Usage

Each script shows usage when called without arguments.

```bash
timer 1h30m
weather Tokyo
wareki 2024
counts fatf .
```

## Requirements

- macOS
- Common: `curl`, `fzf`
- Some tools require: `peco`, `nkf`, `w3m`, `gsed`, `rg`
- bench-suite: `zsh`, `bc`, `python`
- stock-jp: `python3`, `xlrd==1.2.0` (`pip3 install 'xlrd==1.2.0'`)

## Data Storage

Tools that download or generate data follow the [XDG Base Directory](https://specifications.freedesktop.org/basedir-spec/latest/) spec:

| Tool | Default data path |
|---|---|
| `yubin` | `~/.local/share/yubin/` |
| `quick-memo` | `~/.local/share/quick-memo/` |
| `stock-jp` | `~/.local/share/stock-jp/` |

Each can be overridden via its corresponding environment variable (`YUBIN_DATA_DIR`, `QUICK_MEMO_DATA_DIR`, `STOCK_SEARCH_DIR`).
