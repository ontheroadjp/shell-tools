# Setup

## Requirements

- macOS or Linux
- Bash 4.0+
- Common tools: `curl`, `fzf`
- Some tools additionally require: `peco`, `nkf`, `ffmpeg`, `rg`

Install dependencies (macOS via Homebrew):

```bash
brew install fzf peco nkf ffmpeg ripgrep
```

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/ontheroadjp/shell-tools.git ~/shell-tools
cd ~/shell-tools
```

### 2. Install symlinks

```bash
# Install all tools
./install.sh

# Install specific tools only
./install.sh timer weather yubin

# Show available tools
./install.sh list

# Uninstall all tools
./install.sh uninstall

# Uninstall specific tools
./install.sh uninstall timer weather
```

Symlinks are created in `~/dotfiles/bin` by default. Override with `BIN_DIR`:

```bash
BIN_DIR=~/.local/bin ./install.sh
```

### 3. Add to PATH

Add to `~/.zshrc` or `~/.bashrc`:

```bash
export PATH="$HOME/dotfiles/bin:$PATH"
```

Then reload:

```bash
source ~/.zshrc
```

## Verify

```bash
./install.sh list
```
