# 📝 quick-memo <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

ターミナルからすばやくメモや TODO を管理します。メモは Markdown ファイルに保存されます。

## Requirements

- `vim`
- `gsed` (GNU sed)
- `rg` (ripgrep) — TODO 一覧表示に使用

```bash
brew install gnu-sed ripgrep
```

## Setup

データは `$XDG_DATA_HOME/shell-tools/quick-memo/` に保存されます。`XDG_DATA_HOME` が未設定の場合は `~/.local/share` が使用されます。保存先を上書きする場合:

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

### メモファイルを vim で開く

```bash
quick-memo
```

**Output:**

```
[opens ~/.local/share/shell-tools/quick-memo/quick_memo.md in vim]
```

### TODO を追加

```bash
quick-memo todo "Review pull request"
```

**Output:**

```
add todo: Review pull request
```

### 複数の TODO を一度に追加

```bash
quick-memo todo "Fix bug #42" "Write tests" "Update docs"
```

**Output:**

```
add todo: Fix bug #42
add todo: Write tests
add todo: Update docs
```

### 未完了の TODO を一覧表示

```bash
quick-memo todo
```

**Output:**

```
[ ] Fix bug #42
[ ] Write tests
[ ] Update docs
```

## Notes

- メモファイルは `$XDG_DATA_HOME/shell-tools/quick-memo/quick_memo.md` に保存されます（未設定時は `~/.local/share/shell-tools/quick-memo/quick_memo.md`、`$QUICK_MEMO_DATA_DIR` が設定されている場合はそちら）。
- TODO は `[ ]` 形式のチェックボックスで管理されます。
