# 安装

## 环境要求

- macOS
- Bash 4.0+
- 常用依赖：`curl`、`fzf`
- 部分工具还需要：`peco`、`nkf`、`w3m`、`gsed`、`ffmpeg`、`rg`

通过 Homebrew 一次性安装所有依赖：

```bash
brew install fzf peco nkf w3m gnu-sed ffmpeg ripgrep
```

## 安装步骤

### 1. 克隆仓库

```bash
git clone https://github.com/ontheroadjp/shell-tools.git ~/shell-tools
```

### 2. 在 `~/dotfiles/bin` 中创建符号链接

```bash
cd ~/shell-tools
./install.sh
```

将在 `~/dotfiles/bin` 下为每个脚本创建符号链接：

```
~/dotfiles/bin/
  colors -> ~/shell-tools/shell_scripts/colors/colors.sh
  counts -> ~/shell-tools/shell_scripts/counts/counts.sh
  ...
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
timer 10s
```

10 秒后收到 macOS 通知即表示安装成功。
