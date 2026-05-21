# Setup

## Requirements

- macOS
- Bash 4.0+
- Common: `curl`, `fzf`
- Some tools additionally require: `peco`, `nkf`, `w3m`, `gsed`, `ffmpeg`, `rg`

Install all dependencies via Homebrew:

```bash
brew install fzf peco nkf w3m gnu-sed ffmpeg ripgrep
```

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/ontheroadjp/shell-tools.git ~/shell-tools
```

### 2. Create symlinks in `~/dotfiles/bin`

```bash
cd ~/shell-tools
./install.sh
```

This creates symlinks for each script under `~/dotfiles/bin`:

```
~/dotfiles/bin/
  colors -> ~/shell-tools/shell_scripts/colors/colors.sh
  counts -> ~/shell-tools/shell_scripts/counts/counts.sh
  ...
```

### 3. Add to PATH

Add to `~/.zshrc` or `~/.bashrc`:

```bash
export PATH="$HOME/dotfiles/bin:$PATH"
```

Reload:

```bash
source ~/.zshrc
```

## Verify

```bash
timer 10s
```

You should receive a macOS notification after 10 seconds.
