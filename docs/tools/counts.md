# 📊 counts <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# Show total size of current directory
counts dirsize
```

```
/Users/user/project		142M
```

```bash
# Show top 10 largest files in a directory
counts fatf ~/Downloads
```

```
1.2G  /Users/user/Downloads/video.mp4
450M  /Users/user/Downloads/archive.zip
 98M  /Users/user/Downloads/dataset.tar.gz
```

```bash
# Count image files in current directory
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
# Show top 10 subdirectory sizes
counts subdirsize ~/Documents
```

```
 85M  /Users/user/Documents/Projects
 42M  /Users/user/Documents/Archive
 18M  /Users/user/Documents/Books
```
