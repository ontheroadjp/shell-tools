# Setup

## Requirements

- macOS
- Bash 4.0+
- Common dependencies: `curl`, `fzf`
- Some tools additionally require: `peco`, `nkf`, `w3m`, `gsed`, `ffmpeg`, `rg`

Homebrew でまとめてインストールする場合:

```bash
brew install fzf peco nkf w3m gnu-sed ffmpeg ripgrep
```

## Installation

### 1. リポジトリをクローン

```bash
git clone https://github.com/ontheroadjp/shell-tools.git ~/shell-tools
```

### 2. `~/dotfiles/bin` にシンボリックリンクを作成

```bash
cd ~/shell-tools
./install.sh
```

`~/dotfiles/bin` 以下に各スクリプトへのシンボリックリンクが作成されます。

```
~/dotfiles/bin/
  colors -> ~/shell-tools/shell_scripts/colors/colors.sh
  counts -> ~/shell-tools/shell_scripts/counts/counts.sh
  ...
```

### 3. PATH に追加

`~/.zshrc` または `~/.bashrc` に追記:

```bash
export PATH="$HOME/dotfiles/bin:$PATH"
```

設定を反映:

```bash
source ~/.zshrc
```

## Verify

```bash
timer 10s
```

10秒後に macOS 通知が表示されれば完了です。
