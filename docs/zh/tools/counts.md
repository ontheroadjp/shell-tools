# counts

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
counts dirsize
counts fatf ~/Downloads
counts cimg
counts subdirsize ~/Documents
```
