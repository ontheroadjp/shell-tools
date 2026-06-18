# 🔄 converter <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

全角・半角変換、スペース変換、カスタム単語パターンの置換を行います。ファイルの中身の変換とファイル名のリネームの両方に対応しています。

## Usage

```bash
converter [OPTIONS] [file|dir ...]
find . | converter [OPTIONS] --rename
```

## オプション

| オプション | 説明 |
|---|---|
| `-z`, `--zen` | 全角 → 半角（Zenkaku → Hankaku） |
| `-h`, `--han` | 半角 → 全角（Hankaku → Zenkaku） |
| `-s`, `--space` | スペース（半角・全角）→ アンダースコア |
| `-w`, `--words` | `specific_words.conf` の置換ルールを適用 |
| `--rename` | **ファイル名**を変換してリネーム（`mv`）。指定しない場合は**ファイルの中身**を変換 |

変換オプションは最低1つ必要です。`-z` と `-h` は同時に使用できません。

## モード

**コンテンツモード**（デフォルト — `--rename` なし）: ファイル引数または stdin から読み込み、変換結果を stdout に出力します。

**リネームモード**（`--rename`）: ファイルをリネームします。ファイル・ディレクトリ（再帰的に展開）・stdin のパス一覧（1行1パス）を受け付けます。`mv -n` を使用するため、既存ファイルを上書きしません。

## Examples

### ファイルの中身を変換

```bash
# 全角 → 半角
echo 'Ａｂｃ　１２３' | converter -z
# → Abc 123

# 半角 → 全角
echo 'Abc 123' | converter -h
# → Ａｂｃ　１２３

# 組み合わせ: 全角 → 半角 + スペース → アンダースコア
echo 'Ａｂｃ　１２３' | converter -z -s
# → Abc_123

# ファイルの中身を変換
converter -z inputfile.txt > output.txt
```

### ファイル名をリネーム

```bash
# 1ファイルをリネーム
converter -z --rename 'Ａｂｃ.mp3'
# → Abc.mp3

# ディレクトリ内のファイルをすべてリネーム（再帰）
converter -z -s --rename ./music/

# find の出力をパイプで渡してリネーム
find . -name '*.mp3' | converter -z --rename

# 組み合わせ: 全角 → 半角 + スペース → アンダースコア
converter -z -s --rename 'Ａ Ｂ Ｃ.mp3'
# → A_B_C.mp3
```

### 単語置換ルールを適用

```bash
# specific_words.conf のルールを適用
converter -w --rename ./music/
```

`specific_words.conf` には `pattern,replacement` 形式のルールを1行1件で記述します（sed BRE 構文、`#` でコメント）。
