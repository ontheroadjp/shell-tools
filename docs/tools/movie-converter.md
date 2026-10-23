# 🎬 movie-converter <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

Video conversion commands using `ffmpeg`:

- `mp4_to_mp3` — converts MP4 files to MP3. Supports single files, directories, and stdin.
- `mts_to_mp4` — converts `.MTS` files in the current directory to H.265 MP4 (see [mts_to_mp4](#mts-to-mp4)).

The sections below describe `mp4_to_mp3` unless noted.

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

## mts_to_mp4 {#mts-to-mp4}

Converts all `*.MTS` files (case-insensitive) in the **current directory** to H.265 MP4 files under `./mp4/`. Run it in the directory that contains the clips — it works from anywhere once installed.

### Usage

```bash
cd ~/Videos/camcorder
mts_to_mp4
```

Show help:

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

- Requires `ffmpeg` built with `libx265`.
- Video: deinterlaced (`bwdif`), scaled to 1920x1080, H.265 5 Mbps (`hvc1` tag for Apple players). Audio: AAC 192 kbps.
- The source file's modification time is kept as the recording time: embedded as `creation_time` metadata and applied to the output file's mtime.
- Existing output files are skipped (only their mtime is re-synced). Conversion writes to a `.part.mp4` temp file first, so interrupted runs leave no broken output.
- A failed file prints `ERROR: <file>` to stderr and the remaining files are still processed. Subdirectories are not processed.
