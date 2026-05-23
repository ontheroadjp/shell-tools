# 📮 yubin <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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

初回実行時に日本郵便のサイトから郵便番号 CSV を自動ダウンロードします。データは XDG Base Directory 仕様に従い `~/.local/share/yubin/` に保存されます。保存先を変更する場合:

```bash
export YUBIN_DATA_DIR="/path/to/dir"  # 任意で上書き可能
```

## Usage

```bash
yubin
```

起動すると `fzf-tmux` のインタラクティブ検索画面が開きます。郵便番号・都道府県名・市区町村名・町域名でインクリメンタル検索できます。

## Examples

### インタラクティブな郵便番号検索を起動

```bash
yubin
```

**Output:**

```
[fzf-tmux search interface opens]
  150-0001  東京都  渋谷区  神宮前
  150-0002  東京都  渋谷区  渋谷
  ...
```

起動後、キーボードで検索:
- `渋谷` → 渋谷区の郵便番号を検索
- `1500001` → 郵便番号で検索
- `北海道` → 都道府県で絞り込み

## Notes

- データは `~/.local/share/yubin/KEN_ALL.CSV`（`$YUBIN_DATA_DIR` が設定されている場合はそちら）に保存されます。
- ファイルが存在する場合は再ダウンロードしません。データを更新する場合は手動で削除してください。
- tmux 環境での使用を前提としています（`fzf-tmux`）。
