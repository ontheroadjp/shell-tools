# tools/multimedia/movie-converter/wmv_to_mp4_vaapi.sh

Converts a WMV file or recursively discovered WMV files in a directory to MP4 using ffmpeg with VAAPI H.264 video and AAC audio. It requires ffmpeg and the configured VAAPI render device (`tools/multimedia/movie-converter/wmv_to_mp4_vaapi.sh:5-26`, `:50-57`, `:69-99`).

Existing output files are skipped. Each failed conversion is recorded, any partial output is removed when possible, and processing continues. After processing, the script reports attempted, successful, failed, and skipped counts and lists failed input paths (`tools/multimedia/movie-converter/wmv_to_mp4_vaapi.sh:28-67`, `:101-108`). Attempted excludes skipped files. Cleanup errors are reported without interrupting the remaining conversions.

## 変更履歴（git log より自動生成）

- 3800d8e fix(#13): continue WMV conversion after errors
- dba54b9 feat(movie-converter): add wmv_to_mp4 and VAAPI variant
