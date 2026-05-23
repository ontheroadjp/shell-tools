# 💹 stock-jp <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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

### インタラクティブな銘柄検索を起動

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

銘柄を選択すると、参照先サイトを選ぶ画面が表示されます:

```
Yahoo! Finance
Google
SBI証券
Quick（株価）
...
```

### 銘柄データをダウンロード・更新

```bash
stock-jp --update
```

**Output:**

```
  % Total    % Received % Xferd ...
updated!
```
