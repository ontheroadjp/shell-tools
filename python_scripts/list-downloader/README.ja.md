# URLダウンローダー

URLのリストからファイルをダウンロードしたり、与えられたウェブページからダウンロード可能なリンク(PDFやJPGなど)を自動的に抽出するための、シンプルなPythonスクリプトのセットです。

## 特徴

- **extract_links.py**：指定されたウェブページからファイルへのリンク(例えばPDF, JPG, PNG, ZIP)を抽出します。
- **list_downloader.py**：URLのリストから並列にファイルをダウンロードします(プログレスバーをサポート)。
- シンプルな2段階のパイプラインで動作します。

## 要件

- Python 3.8+
- で依存関係をインストールする：

をインストールします。

```bash
pip install -r requirements.txt
```

### requirements.txt

```txt
txtbeautifulsoup4>=4.12.0
tqdm>=4.66.0
```

## 使い方

### 1. ウェブページからURLを抽出する

`extract_links.py` を使って、ウェブページから特定の拡張子のダウンロード可能なファイルリンクを全て収集します。

```bash
python extract_links.py <URL> -e <EXTENSIONS> -o urls.txt
```

#### 例

ウェブページから全てのPDFとJPGリンクを抽出し、`urls.txt`に保存する：

```
python extract_links.py https://example.com -e pdf jpg -o urls.txt
```

### 2. ファイルのダウンロード

次に `list_downloader.py` を使って `urls.txt` にリストされている全ての URL をダウンロードします。

```bash
python list_downloader.py urls.txt -o downloads/
```

#### 例

```bash
python list_downloader.py urls.txt -o my_downloads/
```

## どのように動作するか

1.**extract_links.py**

- 指定されたウェブページを取得します。
- すべての `<a href>` と `<img src>` タグを解析します。
- ファイル拡張子でリンクをフィルタリングし、テキストファイルに保存します。

2.**list_downloader.py**

- テキストファイルからURLのリストを読み込みます。
- 進捗表示と同時に各ファイルをダウンロードします。
- 指定された出力ディレクトリに保存します。

## ワークフロー例

```bash
# ステップ1: PDFリンクの抽出
python extract_links.py https://example.com -e pdf -o urls.txt

# ステップ 2: ファイルをダウンロードする
python list_downloader.py urls.txt -o downloads/ # ステップ2: ファイルのダウンロード
```

結果

```bash
ダウンロード
ファイル1.pdf
ファイル2.pdf
ファイル3.pdf
```

## 投稿

寄稿を歓迎します！
バグを見つけたり、改善の提案があれば、遠慮なく issue をオープンするか、pull request を提出してください。

## ライセンス

このプロジェクトのライセンスはMITライセンスです。
詳細は[MIT License](https://choosealicense.com/licenses/mit/)を参照してください。

