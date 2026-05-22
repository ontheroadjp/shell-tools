# 📊 counts <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

ディレクトリやファイルをサイズ・種類で集計します。

## Usage

```bash
counts <subcommand> [path]
```

| Subcommand | Description |
|---|---|
| `dirsize` | カレントディレクトリの合計サイズ |
| `subdirsize [path]` | サブディレクトリのサイズ上位10件 |
| `fatf [path]` | サイズの大きいファイル上位10件 |
| `fatd [path]` | サイズの大きいディレクトリ上位10件 |
| `cfile [path]` | ファイル数をカウント |
| `cdir [path]` | ディレクトリ数をカウント |
| `cimg [path]` | 画像ファイル数をカウント (JPG/PNG/TIFF/CR2/NEF/ARW) |
| `cmovie [path]` | 動画ファイル数をカウント (MOV/AVI/MPG/MP4) |
| `cmusic [path]` | 音楽ファイル数をカウント (m4a/MP3/WAV) |

## Examples

```bash
# カレントディレクトリの合計サイズを表示
counts dirsize
```

```
/Users/user/project		142M
```

```bash
# ~/Downloads の大きいファイル上位10件を表示
counts fatf ~/Downloads
```

```
1.2G  /Users/user/Downloads/video.mp4
450M  /Users/user/Downloads/archive.zip
 98M  /Users/user/Downloads/dataset.tar.gz
```

```bash
# カレントディレクトリの画像ファイルをカウント
counts cimg .
```

```
./photo1.jpg
./photo2.png
./photo3.jpg
------------------
3 files.
```

```bash
# 指定ディレクトリのサブディレクトリサイズ上位10件を表示
counts subdirsize ~/Documents
```

```
 85M  /Users/user/Documents/Projects
 42M  /Users/user/Documents/Archive
 18M  /Users/user/Documents/Books
```
