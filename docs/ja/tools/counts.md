# counts

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
# カレントディレクトリのサイズ
counts dirsize

# ~/Downloads の大きいファイル上位10件
counts fatf ~/Downloads

# カレントディレクトリの画像ファイル数
counts cimg

# 指定ディレクトリのサブディレクトリサイズ
counts subdirsize ~/Documents
```
