# 📊 counts <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

按大小或类型统计并分析文件和目录。

## 用法

```bash
counts <子命令> [路径]
```

| 子命令 | 说明 |
|---|---|
| `dirsize` | 当前目录的总大小 |
| `subdirsize [路径]` | 子目录大小前 10 名 |
| `fatf [路径]` | 最大文件前 10 名 |
| `fatd [路径]` | 最大目录前 10 名 |
| `cfile [路径]` | 统计文件数量 |
| `cdir [路径]` | 统计目录数量 |
| `cimg [路径]` | 统计图片文件数量（JPG/PNG/TIFF/CR2/NEF/ARW）|
| `cmovie [路径]` | 统计视频文件数量（MOV/AVI/MPG/MP4）|
| `cmusic [路径]` | 统计音乐文件数量（m4a/MP3/WAV）|

## 示例

```bash
# 显示当前目录的总大小
counts dirsize
```

```
/Users/user/project		142M
```

```bash
# 显示目录中最大的 10 个文件
counts fatf ~/Downloads
```

```
1.2G  /Users/user/Downloads/video.mp4
450M  /Users/user/Downloads/archive.zip
 98M  /Users/user/Downloads/dataset.tar.gz
```

```bash
# 统计当前目录中的图片文件
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
# 显示子目录大小前 10 名
counts subdirsize ~/Documents
```

```
 85M  /Users/user/Documents/Projects
 42M  /Users/user/Documents/Archive
 18M  /Users/user/Documents/Books
```
