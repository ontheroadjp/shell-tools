# 🎬 movie-converter <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
