# セットアップ

## 必要環境

- macOS または Linux
- Bash 4.0+
- 共通ツール: `curl`、`fzf`
- 一部のツールにはさらに必要: `peco`、`nkf`、`ffmpeg`、`rg`

依存パッケージのインストール（macOS / Homebrew）:

```bash
brew install fzf peco nkf ffmpeg ripgrep
```

## インストール手順

### 1. リポジトリをクローン

```bash
git clone https://github.com/ontheroadjp/shell-tools.git ~/shell-tools
cd ~/shell-tools
```

### 2. シンボリックリンクを作成

```bash
# 全ツールをインストール
./install.sh

# 特定のツールのみインストール
./install.sh timer weather yubin

# 利用可能なツールを確認
./install.sh list

# 全ツールをアンインストール
./install.sh uninstall

# 特定のツールをアンインストール
./install.sh uninstall timer weather
```

シンボリックリンクはデフォルトで `~/dotfiles/bin` に作成されます。`BIN_DIR` で変更可能です:

```bash
BIN_DIR=~/.local/bin ./install.sh
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

## 確認

```bash
./install.sh list
```
