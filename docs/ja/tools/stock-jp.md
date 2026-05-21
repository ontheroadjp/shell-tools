# 💹 stock-jp

東証上場銘柄を `peco` でインタラクティブに検索し、選択した証券会社・情報サイトをブラウザで開きます。

## Requirements

- `peco`
- `nkf`

```bash
brew install peco nkf
```

## Setup

銘柄データ CSV (`stock.csv`) を `shell_scripts/stock-jp/data/` に配置する必要があります。初回または更新時は `--update` オプションで JPX から取得できます。

```bash
stock-jp --update
```

## Usage

```bash
stock-jp [options]
```

| Option | Description |
|---|---|
| `--update` | JPX から銘柄データをダウンロード |
| `-h, --help` | ヘルプを表示 |
| `-v, --version` | バージョンを表示 |

## Flow

1. `stock-jp` を実行すると peco が起動し、銘柄名・コードでインクリメンタル検索
2. 銘柄を選択すると、参照先サイトを peco で選択
3. 選択したサイトをブラウザで開く

**対応サイト:**

- Yahoo! Finance
- Google
- SBI証券
- Quick（株価 / 適時開示）
- 会社四季報
- 日経（株価 / 適時開示）

## Examples

```bash
# インタラクティブ検索
stock-jp

# 銘柄データを更新してから検索
stock-jp --update && stock-jp
```
