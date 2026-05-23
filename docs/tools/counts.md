# 📊 counts <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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

### Show total size of current directory

```bash
counts dirsize
```

**Output:**

```
/Users/user/project		142M
```

### Show top 10 largest files in a directory

```bash
counts fatf ~/Downloads
```

**Output:**

```
1.2G  /Users/user/Downloads/video.mp4
450M  /Users/user/Downloads/archive.zip
 98M  /Users/user/Downloads/dataset.tar.gz
```

### Count image files in current directory

```bash
counts cimg .
```

**Output:**

```
./photo1.jpg
./photo2.png
./photo3.jpg
------------------
3 files.
```

### Show top 10 subdirectory sizes

```bash
counts subdirsize ~/Documents
```

**Output:**

```
 85M  /Users/user/Documents/Projects
 42M  /Users/user/Documents/Archive
 18M  /Users/user/Documents/Books
```
