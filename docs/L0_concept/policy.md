# Policy

## Tool Structure Policy

Every tool must live at exactly `tools/<category>/<tool-name>/<script>.<ext>`. This is not a convention — it is enforced by `install.sh:9` (`find -mindepth 3 -maxdepth 3`). Scripts at any other depth are silently ignored by the installer.

Supporting files (`.conf`, `.awk`, `.fnc`, data files) may live alongside the main script in the same directory and are not picked up by the installer.

## Naming Policy

- Directories: `kebab-case` (e.g., `char-converter`, `quick-memo`)
- Scripts: match the directory name, e.g., `char-converter/converter.sh`
- The installed command name is derived from the script filename minus extension (`install.sh:_tool_name`)

## Scripting Language Policy

- Primary: Bash (`#!/bin/bash`) or Zsh (`#!/bin/zsh`)
- Secondary: Python 3 for tools requiring data parsing or HTTP
- AWK for character encoding engines (see `char-converter/`)
- No compiled languages, no Node.js runtime tools

## Documentation Policy

- Every tool should have a page under `docs/tools/`, `docs/ja/tools/`, and `docs/zh/tools/`
- VitePress sidebar (`docs/.vitepress/config.mts`) must be updated when tools are added or removed
- `README.md` tool table must stay in sync with the actual tool set

## Security Policy

- No credentials committed to the repo (enforced by pre-commit hook checking staged files)
- Tools that require credentials store them under `$XDG_CONFIG_HOME` (see `deepl-translater`)
- `.gitignore` excludes `.claude/` (project-level AI session state)

## Compatibility Policy

- Target: macOS and Linux
- Avoid GNU-only flags where POSIX alternatives exist
- When GNU tools are required (`gsed`, `gawk`), note it in the tool's README
