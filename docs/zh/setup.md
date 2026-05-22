# 安装

## 环境要求

- macOS 或 Linux
- Bash 4.0+
- 常用工具：`curl`、`fzf`
- 部分工具还需要：`peco`、`nkf`、`ffmpeg`、`rg`

通过 Homebrew 安装依赖（macOS）：

```bash
brew install fzf peco nkf ffmpeg ripgrep
```

## 安装步骤

### 1. 克隆仓库

```bash
git clone https://github.com/ontheroadjp/shell-tools.git ~/shell-tools
cd ~/shell-tools
```

### 2. 安装符号链接

```bash
# 安装所有工具
./install.sh

# 仅安装指定工具
./install.sh timer weather yubin

# 查看可用工具列表
./install.sh list

# 卸载所有工具
./install.sh uninstall

# 卸载指定工具
./install.sh uninstall timer weather
```

符号链接默认创建在 `~/dotfiles/bin`。可通过 `BIN_DIR` 覆盖：

```bash
BIN_DIR=~/.local/bin ./install.sh
```

### 3. 添加到 PATH

在 `~/.zshrc` 或 `~/.bashrc` 中添加：

```bash
export PATH="$HOME/dotfiles/bin:$PATH"
```

重新加载配置：

```bash
source ~/.zshrc
```

## 验证

```bash
./install.sh list
```
