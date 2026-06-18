# CLAUDE.md — Shell Tools

AI agent guidance for the `ontheroadjp/shell-tools` repository.

## Repository at a Glance

- **What**: Standalone shell scripts for everyday terminal use, installed via symlinks
- **Docs**: VitePress site (EN/JA/ZH) deployed to GitHub Pages on push to `main`
- **Profile**: `docs/.ai/repo.profile.json`
- **Structure doc**: `docs/L1_project/repository_structure.md`
- **Implementation spec**: `docs/L3_implementation/specification_summary.md`

## Key Rules

1. **Tool layout is enforced**: every script must be at `tools/<category>/<name>/<name>.{sh,zsh,py}` — `install.sh` only finds files at exactly depth 3.
2. **When adding/removing a tool**, four things must stay in sync: script file, docs pages (×3 locales), sidebar in `docs/.vitepress/config.mts` (×3 arrays), and `README.md` tool table.
3. **No shared library between tools** — each tool is self-contained.
4. **AWK files and `.conf` files are not installed** — they live alongside the main script but `install.sh` only picks up `.sh`/`.zsh`/`.py`.

## Custom Command Usage (AI Workflow)

- **`/work`**: entry point for all implementation tasks — routes to `/task` or `/patch` automatically
- **`/task`**: docs-changing implementation — issue → branch → impl → draft PR → `/docs-sync`
- **`/patch`**: lightweight fix without docs change — branch → commit; user merges to main
- **`/docs-sync`**: syncs docs after implementation; publishes draft PR. Requires `docs/.ai/repo.profile.json`. HARD STOPs if repo profile is missing → run `/init-docs` first
- **`/init-docs`**: full repo observation and doc rebuild. Run when `/docs-sync` can't explain the current structure

## Local Tooling Environment

Observed by `/init-docs` on 2026-06-19:

- `gh`: 2.94.0 (`/usr/bin/gh`)
- `gh auth`: logged in to github.com as `ontheroadjp` (keyring)
- `node`: v24.16.0 (via mise)
- `npm`: 11.13.0 (via mise)
- Node runtime manager: **mise** (`mise current` → `node 24.16.0`)

**Notes:**
- If `gh` operations fail with API/schema errors, run `gh --version` first. Upgrade if possible; otherwise fall back to `gh api` REST or GitHub Web UI.
- Before npm operations, run `node --version` and `npm --version` — mise lazy-loads Node, so these commands ensure the runtime is initialized in the current shell.
- Do not install or upgrade `gh`, Node.js, or npm automatically without explicit user confirmation.

## Docs Site

- Dev: `npm run docs:dev`
- Build: `npm run docs:build`
- Deploy: automatic on push to `main` via `.github/workflows/deploy.yml` (Node 20, `npm ci`)
- Sidebar config: `docs/.vitepress/config.mts` — three sidebar arrays: `toolsSidebarEn`, `toolsSidebarJa`, `toolsSidebarZh`
