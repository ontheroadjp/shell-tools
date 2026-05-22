# 📮 yubin <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

使用 `fzf-tmux` 交互式搜索日本邮政编码数据库。

## 环境要求

- `curl`、`unzip`、`nkf`、`fzf`

```bash
brew install nkf fzf
```

## 配置

首次运行时，将自动从日本邮政官网下载邮政编码 CSV。数据默认保存至 `~/.local/share/yubin/`（遵循 XDG Base Directory 规范）。如需自定义路径：

```bash
export YUBIN_DATA_DIR="/path/to/dir"  # 可选覆盖
```

## 用法

```bash
yubin
```

启动后将显示 `fzf-tmux` 交互搜索界面，支持按邮政编码、都道府県名、市区町村名或町域名进行搜索。

## 示例

```bash
# 启动交互式邮政编码搜索
yubin
```

```
[fzf-tmux search interface opens]
  150-0001  東京都  渋谷区  神宮前
  150-0002  東京都  渋谷区  渋谷
  ...
```

启动后输入关键词搜索：
- `渋谷` → 搜索渋谷区的邮政编码
- `1500001` → 按邮政编码搜索
- `北海道` → 按北海道筛选

## 说明

- 数据保存至 `~/.local/share/yubin/KEN_ALL.CSV`（若设置了 `$YUBIN_DATA_DIR` 则使用该路径）。
- 文件已存在时不会重新下载。如需更新数据，请手动删除该文件。
- 设计用于 tmux 环境（`fzf-tmux`）。
