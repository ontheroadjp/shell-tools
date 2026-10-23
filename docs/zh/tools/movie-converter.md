# 🎬 movie-converter <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

基于 `ffmpeg` 的视频转换命令：

- `mp4_to_mp3` — 将 MP4 文件转换为 MP3，支持单个文件、目录批量转换和标准输入。
- `mts_to_mp4` — 将当前目录中的 `.MTS` 文件转换为 H.265 MP4（参见 [mts_to_mp4](#mts-to-mp4)）。

除非另有说明，以下内容均针对 `mp4_to_mp3`。

## 环境要求

- `ffmpeg`

```bash
brew install ffmpeg
```

## 用法

```bash
mp4_to_mp3 <文件或目录> [...]
```

也可以通过标准输入传入文件路径：

```bash
find . -name "*.mp4" | mp4_to_mp3
```

## 示例

### 将单个 MP4 文件转换为 MP3

```bash
mp4_to_mp3 video.mp4
```

**Output:**

```
ffmpeg version 6.0 ...
[conversion progress]
video.mp4
```

### 转换目录中的所有 MP4 文件

```bash
mp4_to_mp3 ./videos/
```

**Output:**

```
./videos/lecture1.mp4
./videos/lecture2.mp4
./videos/interview.mp4
```

### 通过 stdin 与 find 配合使用

```bash
find ~/Movies -name "*.mp4" | mp4_to_mp3
```

**Output:**

```
/Users/user/Movies/clip1.mp4
/Users/user/Movies/clip2.mp4
```

## 说明

- 输出文件保存在与输入文件相同的目录，扩展名改为 `.mp3`。
- 已存在的 `.mp3` 文件将被覆盖。

## mts_to_mp4 {#mts-to-mp4}

将**当前目录**中所有 `*.MTS` 文件（不区分大小写）转换为 H.265 MP4，保存到 `./mp4/`。安装后可在任意目录运行，请在存放视频文件的目录中执行。

### 用法

```bash
cd ~/Videos/camcorder
mts_to_mp4
```

显示帮助：

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

### 说明

- 需要支持 `libx265` 的 `ffmpeg`。
- 视频：去隔行（`bwdif`），缩放至 1920x1080，H.265 5 Mbps（带 `hvc1` 标签以兼容 Apple 播放器）。音频：AAC 192 kbps。
- 将源文件的修改时间视为录制时间，写入 `creation_time` 元数据并同步到输出文件的 mtime。
- 已存在的输出文件会被跳过（仅重新同步 mtime）。转换先写入临时文件 `.part.mp4` 再替换，中断时不会留下损坏的文件。
- 转换失败的文件会向标准错误输出 `ERROR: <file>`，其余文件继续处理。不处理子目录。
