# 💹 stock-jp

東証上場銘柄を `peco` でインタラクティブに検索し、選択した証券会社・情報サイトをブラウザで開きます。

## Requirements

- `peco`、`nkf`
- `python3` + `xlrd`（XLS 変換用）

```bash
brew install peco nkf
pip3 install 'xlrd==1.2.0'
```

## Setup

初回実行時に JPX から XLS を自動ダウンロードし、CSV に変換します。データは XDG Base Directory 仕様に従い `~/.local/share/stock-jp/` に保存されます。

強制更新する場合:

```bash
stock-jp --update
```

## Usage

```bash
stock-jp [options]
```

| Option | Description |
|---|---|
| `--update` | JPX から XLS をダウンロードして CSV に変換 |
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
