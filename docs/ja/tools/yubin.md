# 📮 yubin

日本郵便の郵便番号データベースを `fzf-tmux` でインタラクティブに検索します。

## Requirements

- `curl`
- `unzip`
- `nkf`
- `fzf` (fzf-tmux)

```bash
brew install nkf fzf
```

## Setup

初回実行時に日本郵便のサイトから郵便番号 CSV を自動ダウンロードします。保存先は環境変数で変更できます:

```bash
export YUBIN_DATA_DIR="$HOME/.yubin-data"  # デフォルト
```

## Usage

```bash
yubin
```

起動すると `fzf-tmux` のインタラクティブ検索画面が開きます。郵便番号・都道府県名・市区町村名・町域名でインクリメンタル検索できます。

## Examples

```bash
# 検索画面を起動
yubin
```

起動後、キーボードで検索:
- `渋谷` → 渋谷区の郵便番号を検索
- `1500001` → 郵便番号で検索
- `北海道` → 都道府県で絞り込み

## Notes

- データは `$YUBIN_DATA_DIR/KEN_ALL.CSV` に保存されます。
- ファイルが存在する場合は再ダウンロードしません。データを更新する場合は手動で削除してください。
- tmux 環境での使用を前提としています（`fzf-tmux`）。
