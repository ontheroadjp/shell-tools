# Safe MP4 to MP3 Converter

`safe_mp4_to_mp3.sh` is a Bash script for safely converting MP4 video files to MP3 audio files.  
It supports individual files, directories (recursively), and standard input, and correctly handles file names with spaces or special characters.

---

## Features

- Convert **MP4** files to **MP3** using `ffmpeg`.
- Works with **single files** or **entire directories** recursively.
- **Handles spaces and special characters** in file names.
- Supports **standard input**, enabling use in pipelines.
- Overwrites existing MP3 files safely with `-y` flag.

---

## Requirements

- Bash 4+
- `ffmpeg` installed and accessible in PATH

---

## Usage

```bash
./safe_mp4_to_mp3.sh [FILES_OR_DIRECTORIES...]
```

### Examples

#### 1. Convert specific MP4 files

```bash
./safe_mp4_to_mp3.sh "video1.mp4" "my video.mp4"
```

#### 2. Convert all MP4 files in a directory (recursively)

```bash
./safe_mp4_to_mp3.sh "/path/to/videos"
```

#### 3. Convert files from standard input

```bash
cat filelist.txt | ./safe_mp4_to_mp3.sh
```

---

## How It Works

1. Reads input from command-line arguments or standard input.  
2. For directories, recursively finds all files and selects those ending with `.mp4`.  
3. Converts each MP4 file to MP3 using `ffmpeg -y -i input.mp4 output.mp3`.  
4. Outputs the original file name after conversion.  

---

## Notes

- File names with spaces or special characters are handled safely.  
- Existing MP3 files will be overwritten without confirmation due to the `-y` flag in `ffmpeg`.  
- If an input file does not exist, a warning is printed to `stderr`.

---

## License

This project is licensed under the MIT License.  
See the [MIT License](https://choosealicense.com/licenses/mit/) for details.
