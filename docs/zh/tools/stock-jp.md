# 💹 stock-jp

通过 `peco` 交互式搜索东京证券交易所上市证券，并在浏览器中打开所选网站。

## 环境要求

- `peco`、`nkf`
- `python3` + `xlrd`（用于 XLS 转换）

```bash
brew install peco nkf
pip3 install 'xlrd==1.2.0'
```

## 配置

首次运行时，将自动从 JPX 下载 XLS 数据并转换为 CSV。数据默认保存至 `~/.local/share/stock-jp/`（遵循 XDG Base Directory 规范）。

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

```bash
stock-jp
stock-jp --update && stock-jp
```
