# tools/multimedia/movie-converter/mts_to_mp4.sh

## Purpose

Batch-converts AVCHD camcorder clips (`*.MTS`) in the current working directory to H.265 MP4 files under `./mp4/`, preserving the recording time. Installed by `install.sh` as the `mts_to_mp4` command (tool name = script basename, not the `movie-converter` directory name), so it can be run from any directory and always operates on that directory.

## Behavior

- `-h` / `--help` prints usage and exits (`mts_to_mp4.sh:9-22`). Any other argument is ignored; the script takes no inputs besides the current directory.
- `shopt -s nullglob nocaseglob` makes `*.MTS` match `.mts` as well and yields no iterations when no file matches (`mts_to_mp4.sh:24`, `:28`).
- Output path is `mp4/<basename>.mp4` (`mts_to_mp4.sh:29`). If it already exists, the file is skipped and only its mtime is re-synced to the source (`mts_to_mp4.sh:32-36`).
- Conversion writes to `mp4/<basename>.part.mp4` and renames on success, so an interrupted run never leaves a half-written file at the final path (`mts_to_mp4.sh:30`, `:40`, `:54`, `:59`).
- ffmpeg settings (`mts_to_mp4.sh:45-52`):
  - `bwdif=mode=send_field` deinterlaces (AVCHD is typically 1080i) and doubles the frame rate
  - `scale=1920:1080,setsar=1` normalizes anamorphic 1440x1080 sources to square pixels
  - `libx265` 5 Mbps with `-tag:v hvc1` for QuickTime/Apple playback compatibility
  - AAC 192 kbps audio, `+faststart` for streaming-friendly layout
  - `-nostdin` prevents ffmpeg from consuming terminal input inside the loop
- Recording time: the source mtime is embedded as `creation_time` metadata in UTC (`mts_to_mp4.sh:43`, `:50`) and applied to the output mtime via `touch -r` (`mts_to_mp4.sh:55`).

## Design decisions

- `set -e` is omitted on purpose (`mts_to_mp4.sh:4-7`): one failed ffmpeg run must not abort the batch. Failures print `ERROR: <file>` to stderr and remove the temp file (`mts_to_mp4.sh:57-60`).
- The source mtime is treated as the recording time because camcorders write MTS files at capture time and copying with timestamp preservation keeps it.

## Integration points

- Installed via `install.sh` (`_find_scripts` depth-3 discovery) into `BIN_DIR`.
- External dependency: `ffmpeg` with `libx265` and the `bwdif` filter; GNU/BSD `date -r <file>` and `touch -r`.

## Notes / limitations

- Not recursive; only the current directory is processed.
- Exit status is 0 even when some files fail; check stderr for `ERROR:` lines.
- Output resolution is fixed to 1920x1080 regardless of the source.

## 変更履歴（git log より自動生成）

- 4ebb2ec feat(#8): add mts_to_mp4 tool to movie-converter
