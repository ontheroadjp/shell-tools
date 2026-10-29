# ✏️ rename <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

全角・半角変換、スペース変換、カスタム単語パターンの置換で、ファイル名・ディレクトリ名をリネームします。

## Usage

```bash
rename [OPTIONS] [file_or_dir ...]
find . | rename [OPTIONS]
```

## オプション

| オプション | 説明 |
|---|---|
| `--han` | 半角 → 全角（デフォルトの全角 → 半角の代わりに適用） |
| `--no-zen` | 全角 → 半角を行わない |
| `--no-space` | スペース → アンダースコアを行わない |
| `--no-words` | `specific_words.conf` のルールを適用しない |
| `-r`, `--recursive` | サブディレクトリ内のファイル・ディレクトリもすべてリネーム（デフォルトは指定ディレクトリ直下のファイル・ディレクトリのみ） |
| `--dry-run` | 変更を行わず、実行内容のみ表示 |

デフォルトでは、全角 → 半角、スペース → アンダースコア、`specific_words.conf` のルールがすべて適用されます。

## 動作

ファイル、ディレクトリ、または stdin のパス一覧（1行1パス）を受け付けます。ディレクトリは**直下**のみ展開されます（`-r` でサブディレクトリ内もすべて対象）。深い階層から順にリネームします。変換されるのはベース名のみで、親パスは変換しません。プレビューを表示して `Proceed? [Y/n]` を確認し、`mv -n` を使用するため既存ファイルは上書きされません。`--dry-run` で確認なしにプレビューのみ表示できます。

## 使用例

```bash
# 単一ファイルをリネーム
rename 'Ａｂｃ.mp3'
# Will rename:
#   Ａｂｃ.mp3  →  Abc.mp3
# Proceed? [Y/n]

# ドライラン：実行せずプレビュー
rename --dry-run ./music/
# [DRY RUN] Would rename:
#   Ａ Ｂ Ｃ.mp3  →  A_B_C.mp3

# ディレクトリ直下をリネーム
rename ./music/

# 再帰的にリネーム
rename -r ./music/

# find の出力からリネーム
find . -name '*.mp3' | rename

# 単語置換ルールを適用
rename --dry-run --no-zen --no-space ./music/
```

`specific_words.conf` には `pattern,replacement` 形式（1行1ルール、sed BRE 構文）で記述します。`#` で始まる行はコメントです。
