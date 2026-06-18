# 🔄 text-converter <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

全角・半角変換、スペース変換、カスタム単語パターンの置換を行います。ファイルの中身を上書き変換、またはファイル名をリネームする両モードに対応しています。

## Usage

```bash
text-converter [OPTIONS] [file ...]
find . | text-converter [OPTIONS] --rename [dir ...]
```

## オプション

| オプション | 説明 |
|---|---|
| `-z`, `--zen` | 全角 → 半角（Zenkaku → Hankaku） |
| `-h`, `--han` | 半角 → 全角（Hankaku → Zenkaku） |
| `-s`, `--space` | スペース（半角・全角）→ アンダースコア |
| `-w`, `--words` | `specific_words.conf` の置換ルールを適用 |
| `--rename` | **ファイル名**を変換してリネーム（`mv`）。指定しない場合は**ファイルの中身**を変換 |
| `-n`, `--dry-run` | 変更せずに実行予定の内容だけ表示 |

変換オプションは最低1つ必要です。`-z` と `-h` は同時使用できません。

## モード

**コンテンツモード**（デフォルト — `--rename` なし）：
- ファイル引数あり: 確認後に**上書き変換**
- ファイル引数なし（stdin）: 変換結果を stdout に出力（確認なし）

**リネームモード**（`--rename`）：確認後にファイルをリネーム。ファイル・ディレクトリ（再帰的に展開）・stdin のパス一覧（1行1パス）を受け付けます。`mv -n` を使用するため、既存ファイルを上書きしません。

変更前に対象の一覧を表示し `Proceed? [Y/n]` を確認します（stdin→stdout の場合は確認なし）。`--dry-run` を使うとプロンプトなしでプレビューのみ表示します。

## Examples

### ファイルの中身を変換

```bash
# stdin → stdout（確認なし）
echo 'Ａｂｃ　１２３' | text-converter -z
# → Abc 123

# ファイルを上書き変換（確認プロンプトあり）
text-converter -z inputfile.txt
# Will modify in place:
#   inputfile.txt
# Proceed? [Y/n]

# ドライラン: 変換せずにプレビュー
text-converter -z --dry-run inputfile.txt
# [DRY RUN] Would modify in place:
#   inputfile.txt
```

### ファイル名をリネーム

```bash
# 1ファイルをリネーム（確認プロンプトあり）
text-converter -z --rename 'Ａｂｃ.mp3'
# Will rename:
#   Ａｂｃ.mp3  →  Abc.mp3
# Proceed? [Y/n]

# ドライラン: リネームせずにプレビュー
text-converter -z -s --dry-run --rename ./music/
# [DRY RUN] Would rename:
#   Ａ Ｂ Ｃ.mp3  →  A_B_C.mp3

# ディレクトリ内すべてをリネーム（再帰）
text-converter -z -s --rename ./music/

# find と組み合わせ
find . -name '*.mp3' | text-converter -z --rename
```

### 単語置換ルールを適用

```bash
text-converter -w --dry-run --rename ./music/
text-converter -w --rename ./music/
```

`specific_words.conf` には `pattern,replacement` 形式のルールを1行1件で記述します（sed BRE 構文、`#` でコメント）。
