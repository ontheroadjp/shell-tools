# 🎬 movie-converter <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

Converts MP4 files to MP3. Supports single files, directories, and stdin.

## Requirements

- `ffmpeg`

```bash
brew install ffmpeg
```

## Usage

```bash
mp4_to_mp3 <file_or_dir> [...]
```

You can also pipe file paths via stdin:

```bash
find . -name "*.mp4" | mp4_to_mp3
```

## Examples

```bash
# Convert a single MP4 file to MP3
mp4_to_mp3 video.mp4
```

```
ffmpeg version 6.0 ...
[conversion progress]
video.mp4
```

```bash
# Convert all MP4 files in a directory
mp4_to_mp3 ./videos/
```

```
./videos/lecture1.mp4
./videos/lecture2.mp4
./videos/interview.mp4
```

```bash
# Use with find via stdin
find ~/Movies -name "*.mp4" | mp4_to_mp3
```

```
/Users/user/Movies/clip1.mp4
/Users/user/Movies/clip2.mp4
```

## Notes

- Output files are saved in the same directory as the input, with `.mp3` extension.
- Existing `.mp3` files will be overwritten.
