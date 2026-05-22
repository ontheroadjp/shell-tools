# 📝 quick-memo <Badge type="tip" text="Shell" />

ターミナルからすばやくメモや TODO を管理します。メモは Markdown ファイルに保存されます。

## Requirements

- `vim`
- `gsed` (GNU sed)
- `rg` (ripgrep) — TODO 一覧表示に使用

```bash
brew install gnu-sed ripgrep
```

## Setup

データは XDG Base Directory 仕様に従い `~/.local/share/quick-memo/` に保存されます。保存先を変更する場合:

```bash
export QUICK_MEMO_DATA_DIR="/path/to/dir"  # 任意で上書き可能
```

## Usage

```bash
quick-memo [subcommand]
```

| Subcommand | Description |
|---|---|
| `memo` (省略可) | メモファイルを vim で開く（タイムスタンプ付きヘッダーを自動挿入） |
| `todo [items...]` | TODO を追加、引数なしで未完了 TODO を一覧表示 |
| `mail <address>` | メモをメールで送信 |

## Examples

```bash
# メモを開く（vim が起動）
quick-memo

# TODO を追加
quick-memo todo "企画書を書く" "MTG 資料を準備する"

# 未完了の TODO を一覧表示
quick-memo todo

# メモをメールで送信
quick-memo mail you@example.com
```

## Notes

- メモファイルは `~/.local/share/quick-memo/quick_memo.md`（`$QUICK_MEMO_DATA_DIR` が設定されている場合はそちら）に保存されます。
- TODO は `[ ]` 形式のチェックボックスで管理されます。
