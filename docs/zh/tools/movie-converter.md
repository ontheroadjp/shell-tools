# 🎬 movie-converter <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# 将单个 MP4 文件转换为 MP3
mp4_to_mp3 video.mp4
```

```
ffmpeg version 6.0 ...
[conversion progress]
video.mp4
```

```bash
# 转换目录中的所有 MP4 文件
mp4_to_mp3 ./videos/
```

```
./videos/lecture1.mp4
./videos/lecture2.mp4
./videos/interview.mp4
```

```bash
# 通过 stdin 与 find 配合使用
find ~/Movies -name "*.mp4" | mp4_to_mp3
```

```
/Users/user/Movies/clip1.mp4
/Users/user/Movies/clip2.mp4
```

## 说明

- 输出文件保存在与输入文件相同的目录，扩展名改为 `.mp3`。
- 已存在的 `.mp3` 文件将被覆盖。
