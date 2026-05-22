# 🎬 movie-converter <Badge type="tip" text="Shell" />

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
mp4_to_mp3 video.mp4
mp4_to_mp3 ~/Movies/
mp4_to_mp3 a.mp4 b.mp4 c.mp4
find ~/Downloads -name "*.mp4" | mp4_to_mp3
```

## Notes

- Output files are saved in the same directory as the input, with `.mp3` extension.
- Existing `.mp3` files will be overwritten.
