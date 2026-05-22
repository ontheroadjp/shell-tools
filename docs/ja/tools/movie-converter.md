# 🎬 movie-converter <Badge type="tip" text="Shell" />

MP4 ファイルを MP3 に変換します。ファイル単体・ディレクトリ一括・標準入力のいずれにも対応します。

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

```bash
# 単一ファイルを変換
mp4_to_mp3 video.mp4

# ディレクトリ内の全 MP4 を変換
mp4_to_mp3 ~/Movies/

# 複数ファイルを指定
mp4_to_mp3 a.mp4 b.mp4 c.mp4

# find と組み合わせて再帰変換
find ~/Downloads -name "*.mp4" | mp4_to_mp3
```

## Notes

- 出力ファイルは入力ファイルと同じディレクトリに、同じベース名で `.mp3` として保存されます。
- 既存の `.mp3` ファイルは上書きされます。
