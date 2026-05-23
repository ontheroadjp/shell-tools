# 💹 stock-jp <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

通过 `peco` 交互式搜索东京证券交易所上市证券，并在浏览器中打开所选网站。

## 环境要求

- `peco`、`nkf`
- `python3` + `xlrd`（用于 XLS 转换）

```bash
brew install peco nkf
pip3 install 'xlrd==1.2.0'
```

## 配置

首次运行时，将自动从 JPX 下载 XLS 数据并转换为 CSV。数据保存至 `$XDG_DATA_HOME/shell-tools/stock-jp/`。若未设置 `XDG_DATA_HOME`，则使用 `~/.local/share`。

强制更新数据：

```bash
stock-jp --update
```

## 用法

```bash
stock-jp [选项]
```

| 选项 | 说明 |
|---|---|
| `--update` | 从 JPX 下载 XLS 并转换为 CSV |
| `-h, --help` | 显示帮助 |
| `-v, --version` | 显示版本 |

## 操作流程

1. 运行 `stock-jp`，通过 peco 以证券名称或代码进行增量搜索
2. 选择证券后，通过 peco 选择查看网站
3. 在浏览器中打开所选网站

**支持的网站：** Yahoo! Finance、Google、SBI 证券、Quick、会社四季报、日经

## 示例

### 启动交互式股票搜索

```bash
stock-jp
```

**Output:**

```
[displays fzf search interface]
Stock JP > _
  9984  ソフトバンクグループ  情報・通信業
  7203  トヨタ自動車          輸送用機器
  6758  ソニーグループ        電気機器
  ...
```

选择股票后，选择要打开的网站：

```
Yahoo! Finance
Google
SBI証券
Quick（株価）
...
```

### 下载/更新股票数据

```bash
stock-jp --update
```

**Output:**

```
  % Total    % Received % Xferd ...
updated!
```
