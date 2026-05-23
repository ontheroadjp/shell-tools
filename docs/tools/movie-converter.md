# 🎬 movie-converter <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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

### Convert a single MP4 file to MP3

```bash
mp4_to_mp3 video.mp4
```

**Output:**

```
ffmpeg version 6.0 ...
[conversion progress]
video.mp4
```

### Convert all MP4 files in a directory

```bash
mp4_to_mp3 ./videos/
```

**Output:**

```
./videos/lecture1.mp4
./videos/lecture2.mp4
./videos/interview.mp4
```

### Use with find via stdin

```bash
find ~/Movies -name "*.mp4" | mp4_to_mp3
```

**Output:**

```
/Users/user/Movies/clip1.mp4
/Users/user/Movies/clip2.mp4
```

## Notes

- Output files are saved in the same directory as the input, with `.mp3` extension.
- Existing `.mp3` files will be overwritten.
