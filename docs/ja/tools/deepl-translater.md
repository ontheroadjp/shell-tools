# 🌐 deepl-translater <Badge type="info" text="Python Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

DeepL API を使ってクリップボードのテキストまたは標準入力を翻訳します。翻訳元言語は自動検出されます。

## 必要環境

- Python 3
- DeepL API キー（無料プラン対応）

```bash
pip install -r requirements.txt
```

## セットアップ

ツールディレクトリに `.env` ファイルを作成し、DeepL API キーを設定します：

```bash
echo "DEEPL_API_KEY=your_api_key_here" > tools/utilities/deepl-translater/.env
```

## 使い方

```bash
deepl-translater [-o 翻訳先言語]
```

| オプション | 説明 |
|---|---|
| `-o EN` | 英語に翻訳（デフォルト） |
| `-o JA` | 日本語に翻訳 |
| `-o ZH` | 中国語に翻訳 |
| `-o KO` | 韓国語に翻訳 |

標準入力がない場合はクリップボードから読み込みます。

## 例

### クリップボードのテキストを英語に翻訳（デフォルト）

```bash
deepl-translater
```

**Output:**

```
Hello, world.
```

### クリップボードのテキストを日本語に翻訳

```bash
deepl-translater -o JA
```

**Output:**

```
こんにちは、世界。
```

### 標準入力から翻訳

```bash
echo "こんにちは" | deepl-translater
```

**Output:**

```
Hello
```

### ファイルの内容を翻訳

```bash
cat document.txt | deepl-translater -o ZH
```

**Output:**

```
你好，世界。
```

### 翻訳結果をクリップボードにコピー

```bash
deepl-translater | pbcopy    # macOS
deepl-translater | xclip     # Linux
```

## 備考

- ツールディレクトリに `DEEPL_API_KEY` を記載した `.env` ファイルが必要です。
- DeepL 無料 API エンドポイント（`api-free.deepl.com`）を使用します。
- 標準入力がパイプの場合は stdin から読み込み、それ以外はクリップボードから読み込みます。
