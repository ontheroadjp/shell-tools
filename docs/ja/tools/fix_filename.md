# 🔧 fix_filename <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

設定ファイルに定義されたパターン/置換ルールを適用してファイルをリネームします。一括リネーム、ディレクトリの再帰処理、stdin パイプをサポートします。

## 必要環境

- macOS / Linux
- `sed`, `find`

## 使い方

```bash
fix_filename -c <conf_file> <file|dir> ...
```

`-c` で 1 つ以上の設定ファイルを指定する必要があります。各設定ファイルは `pattern,replacement` のペアを 1 行ずつ記述します。`#` で始まる行はコメントです。

## 設定ファイルの形式

```
# コメント
pattern,replacement
old_word,new_word
```

付属の設定ファイル:
- `zenkaku_to_hankaku.conf` — 全角から半角へ
- `space_to_underbar.conf` — スペースをアンダースコアに
- `specific_words.conf` — カスタム単語の置換

## 例

### ファイル名の全角文字を半角に変換

```bash
fix_filename -c zenkaku_to_hankaku.conf ./files/
```

**Output:**

```
./files/ABC_test.txt
./files/report_2025.pdf
```

### スペースをアンダースコアに変換

```bash
fix_filename -c space_to_underbar.conf "my document.txt"
```

**Output:**

```
my_document.txt
```

### 複数のルールを同時に適用

```bash
fix_filename -c zenkaku_to_hankaku.conf -c space_to_underbar.conf ./docs/
```

**Output:**

```
./docs/ABC_report_2025.txt
./docs/project_notes.md
```

### find との組み合わせで stdin から使用

```bash
find . -name "*.txt" | fix_filename -c zenkaku_to_hankaku.conf
```

**Output:**

```
./ABC_test.txt
./report_2025.txt
```
