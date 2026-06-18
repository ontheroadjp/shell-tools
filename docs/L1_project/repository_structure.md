# Repository Structure

```
shell-tools/
├── install.sh                  # Symlink manager (install/uninstall/list)
├── package.json                # VitePress docs dependencies only
├── package-lock.json           # npm lockfile (vitepress 1.6.4)
├── README.md                   # Project overview and tool table
├── .github/
│   └── workflows/
│       └── deploy.yml          # Build & deploy docs to GitHub Pages on push to main
├── docs/                       # VitePress documentation site
│   ├── .vitepress/
│   │   └── config.mts          # Sidebar nav for EN/JA/ZH locales — must be updated when tools change
│   ├── .ai/
│   │   └── repo.profile.json   # AI agent configuration (this repo's profile)
│   ├── L0_concept/             # WHY: product concept and policies
│   ├── L1_project/             # WHAT: project overview and structure
│   ├── L2_development/         # HOW: dev operations and consistency checks
│   ├── L3_implementation/      # DETAIL: implementation specification summary
│   ├── tools/                  # English tool docs (one .md per tool)
│   ├── ja/tools/               # Japanese tool docs
│   └── zh/tools/               # Chinese tool docs
└── tools/                      # All scripts live here
    ├── system/                 # tmux status bar / system info scripts
    ├── system_utilities/       # File, text, and system utility scripts
    ├── utilities/              # General-purpose utilities
    ├── network/                # Network tools
    ├── mini_apps/              # Self-contained application scripts
    └── multimedia/             # Media conversion scripts
```

## Tool Directory Layout

Every tool follows this exact pattern (enforced by `install.sh:9`):

```
tools/<category>/<tool-name>/
├── <tool-name>.sh      # Main script — becomes the installed command
├── *.fnc               # Optional: shell function library (not installed)
├── *.awk               # Optional: AWK engine files (not installed)
├── *.conf              # Optional: configuration files (not installed)
└── README.md           # Optional: tool-specific documentation
```

The installer (`install.sh:_find_scripts`) picks up `*.sh`, `*.zsh`, and `*.py` files at exactly depth 3. Supporting files at the same depth are not installed.

## Key Files

| File | Purpose |
|---|---|
| `install.sh` | Symlink manager; all tool lifecycle (install/uninstall/list) |
| `docs/.vitepress/config.mts` | VitePress sidebar — must be updated when tools are added/removed/renamed |
| `docs/.ai/repo.profile.json` | AI agent configuration: commands, doc roots, deploy info |
| `.github/workflows/deploy.yml` | CI: Node 20, `npm ci`, `npm run docs:build`, deploy to GitHub Pages |

## Inconsistencies to Resolve

- `docs/.vitepress/config.mts` sidebar still references `fix_filename` and `text_converter` (removed); `converter` not yet added — tracked in PR #2
- `README.md` tool table still lists `fix_filename` / `text_converter` — tracked in PR #2
