# 🎬 movie-converter <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

`ffmpeg` を使った動画変換コマンド集です:

- `mp4_to_mp3` — MP4 ファイルを MP3 に変換します。ファイル単体・ディレクトリ一括・標準入力のいずれにも対応します。
- `mts_to_mp4` — カレントディレクトリの `.MTS` ファイルを H.265 MP4 に変換します（[mts_to_mp4](#mts-to-mp4) を参照）。

以下は特記のない限り `mp4_to_mp3` の説明です。

## Requirements

- `ffmpeg`

```bash
brew install ffmpeg
```

## Usage

```bash
mp4_to_mp3 <file_or_dir> [...]
```

標準入力からファイルパスを受け取ることもできます:

```bash
find . -name "*.mp4" | mp4_to_mp3
```

## Examples

### 単一の MP4 ファイルを MP3 に変換

```bash
mp4_to_mp3 video.mp4
```

**Output:**

```
ffmpeg version 6.0 ...
[conversion progress]
video.mp4
```

### ディレクトリ内の全 MP4 ファイルを変換

```bash
mp4_to_mp3 ./videos/
```

**Output:**

```
./videos/lecture1.mp4
./videos/lecture2.mp4
./videos/interview.mp4
```

### find との組み合わせで stdin から使用

```bash
find ~/Movies -name "*.mp4" | mp4_to_mp3
```

**Output:**

```
/Users/user/Movies/clip1.mp4
/Users/user/Movies/clip2.mp4
```

## Notes

- 出力ファイルは入力ファイルと同じディレクトリに、同じベース名で `.mp3` として保存されます。
- 既存の `.mp3` ファイルは上書きされます。

## mts_to_mp4 {#mts-to-mp4}

**カレントディレクトリ**の `*.MTS` ファイル（大文字小文字を区別しない）をすべて H.265 MP4 に変換し、`./mp4/` に保存します。インストール後はどのディレクトリからでも実行でき、動画ファイルのあるディレクトリで実行します。

### Usage

```bash
cd ~/Videos/camcorder
mts_to_mp4
```

ヘルプを表示:

```bash
mts_to_mp4 --help
```

**Output:**

```
Converting: 00001.MTS
...
OK: mp4/00001.mp4
SKIP: mp4/00002.mp4
Done.
```

### Notes

- `libx265` を含む `ffmpeg` が必要です。
- 映像: インターレース解除（`bwdif`）、1920x1080 にスケーリング、H.265 5 Mbps（Apple 系プレーヤー向けに `hvc1` タグ）。音声: AAC 192 kbps。
- 元ファイルの更新日時を録画日時として扱い、`creation_time` メタデータと出力ファイルの mtime に反映します。
- 出力済みのファイルはスキップします（mtime のみ再同期）。変換は一時ファイル `.part.mp4` に書き出してから置き換えるため、中断しても壊れたファイルは残りません。
- 失敗したファイルは標準エラーに `ERROR: <file>` を出力し、残りのファイルの変換は続行します。サブディレクトリは対象外です。
