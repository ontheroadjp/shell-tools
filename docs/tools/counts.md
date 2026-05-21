# 📊 counts

Count and analyze files and directories by size or type.

## Usage

```bash
counts <subcommand> [path]
```

| Subcommand | Description |
|---|---|
| `dirsize` | Total size of the current directory |
| `subdirsize [path]` | Top 10 subdirectory sizes |
| `fatf [path]` | Top 10 largest files |
| `fatd [path]` | Top 10 largest directories |
| `cfile [path]` | Count files |
| `cdir [path]` | Count directories |
| `cimg [path]` | Count image files (JPG/PNG/TIFF/CR2/NEF/ARW) |
| `cmovie [path]` | Count video files (MOV/AVI/MPG/MP4) |
| `cmusic [path]` | Count music files (m4a/MP3/WAV) |

## Examples

```bash
counts dirsize
counts fatf ~/Downloads
counts cimg
counts subdirsize ~/Documents
```
