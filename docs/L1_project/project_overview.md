# Project Overview

## What It Is

A curated collection of standalone shell scripts for everyday terminal use, distributed via symlinks and documented via a VitePress site (EN/JA/ZH).

## Tech Stack

| Layer | Technology | Version | Source |
|---|---|---|---|
| Scripts (primary) | Bash / Zsh | system | — |
| Scripts (secondary) | Python 3 | system | — |
| Character conversion | AWK | system | `tools/system_utilities/char-converter/` |
| Docs framework | VitePress | 1.6.4 | `package-lock.json:node_modules/vitepress` |
| Docs runtime | Node.js | 20 (CI), 24.16.0 (local) | `.github/workflows/deploy.yml:node-version`, `mise current` |
| Package manager | npm | — | `.github/workflows/deploy.yml:npm ci` |
| Node runtime mgr | mise | — | `mise current` output |
| Deployment | GitHub Pages | — | `.github/workflows/deploy.yml` |

## Tool Categories

| Category | Directory | Purpose |
|---|---|---|
| system | `tools/system/` | tmux status bar integrations, system info |
| system_utilities | `tools/system_utilities/` | file/text processing, benchmarking, network diagnostics |
| utilities | `tools/utilities/` | translation, deduplication |
| network | `tools/network/` | link extraction, batch download |
| mini_apps | `tools/mini_apps/` | self-contained apps (weather, calendar, stock, etc.) |
| multimedia | `tools/multimedia/` | ffmpeg wrappers |

## Active Tools (as of current HEAD)

Derived from `tools/` directory contents:

**system:** battery, colors, get-ssid, get-volume, ssid  
**system_utilities:** bench_command, bench_function, bench_net, bench_zsh, counts, converter, numstats, wifi-helth-check  
**utilities:** deduplicate, deepl-translater  
**network:** extract_links, list_downloader  
**mini_apps:** calc, dictionary, holiday, quick-memo, stock-jp, timer, today, wareki, weather, worldtime, yubin  
**multimedia:** mp4_to_mp3  

## Distribution Model

`install.sh` scans `tools/**/<depth3>/*.{sh,zsh,py}` and creates symlinks in `~/dotfiles/bin` (overridable via `$BIN_DIR`). The installed command name is the script filename without extension.
