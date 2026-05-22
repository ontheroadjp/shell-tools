# 🎬 movie-converter <Badge type="tip" text="Shell" />

将 MP4 文件转换为 MP3，支持单个文件、目录批量转换和标准输入。

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

```bash
mp4_to_mp3 video.mp4
mp4_to_mp3 ~/Movies/
mp4_to_mp3 a.mp4 b.mp4 c.mp4
find ~/Downloads -name "*.mp4" | mp4_to_mp3
```

## 说明

- 输出文件保存在与输入文件相同的目录，扩展名改为 `.mp3`。
- 已存在的 `.mp3` 文件将被覆盖。
