# Operation Model

## Installing Tools

```bash
# Install all tools (creates symlinks in ~/dotfiles/bin)
./install.sh

# Install a specific tool by name
./install.sh converter

# List available tools
./install.sh list

# Uninstall all symlinks
./install.sh uninstall
./install.sh uninstall converter
```

`BIN_DIR` defaults to `~/dotfiles/bin` and can be overridden:

```bash
BIN_DIR=~/.local/bin ./install.sh
```

Source: `install.sh:4` (`BIN_DIR="${BIN_DIR:-${HOME}/dotfiles/bin}"`).

## Running the Docs Site Locally

Prerequisites: Node.js (v20+ recommended, v24.16.0 observed locally via mise), npm.

```bash
npm install          # Install VitePress (first time only)
npm run docs:dev     # Start dev server at http://localhost:5173/shell-tools/
npm run docs:build   # Build to docs/.vitepress/dist/
npm run docs:preview # Preview built output
```

Source: `package.json:scripts`.

## Adding a New Tool

1. Create `tools/<category>/<tool-name>/<tool-name>.sh` (executable)
2. Add a docs page at `docs/tools/<tool-name>.md`, `docs/ja/tools/<tool-name>.md`, `docs/zh/tools/<tool-name>.md`
3. Add the tool to the sidebar in `docs/.vitepress/config.mts` (three sidebar arrays: EN/JA/ZH)
4. Add the tool to the tool table in `README.md`
5. Run `./install.sh <tool-name>` to create the symlink

## Removing a Tool

1. Remove the tool directory `tools/<category>/<tool-name>/`
2. Remove the docs pages from `docs/tools/`, `docs/ja/tools/`, `docs/zh/tools/`
3. Remove from sidebar in `docs/.vitepress/config.mts`
4. Remove from `README.md` tool table
5. Run `./install.sh uninstall <tool-name>` if previously installed

## CI/CD

Docs are automatically built and deployed to GitHub Pages on every push to `main`. Source: `.github/workflows/deploy.yml`.

Build steps (CI):
1. Checkout (`actions/checkout@v4`)
2. Setup Node 20 with npm cache (`actions/setup-node@v4`)
3. `npm ci`
4. `npm run docs:build`
5. Restructure HTML for clean URLs (custom `find` + `mv` step)
6. Upload and deploy artifact to GitHub Pages
