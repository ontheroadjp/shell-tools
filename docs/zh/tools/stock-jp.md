# stock-jp

通过 `peco` 交互式搜索东京证券交易所上市证券，并在浏览器中打开所选网站。

## 环境要求

- `peco`
- `nkf`

```bash
brew install peco nkf
```

## 配置

将股票数据 CSV（`stock.csv`）放置于 `shell_scripts/stock-jp/data/`。首次使用或需要更新时：

```bash
stock-jp --update
```

## 用法

```bash
stock-jp [选项]
```

| 选项 | 说明 |
|---|---|
| `--update` | 从 JPX 下载股票数据 |
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
