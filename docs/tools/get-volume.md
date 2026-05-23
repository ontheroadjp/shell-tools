# 🔊 get-volume <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span> <span class="tc-badge tc-badge-tmux">tmux</span>

Output the system volume as a tmux-formatted bar for use in a status bar.

## Requirements

- macOS: `osascript` (built-in)
- Linux: `pactl` or `amixer`

## Usage

```bash
get-volume
```

Designed to be called from a tmux `status-right` or `status-left` config.

## Examples

### Volume at 75%

```bash
get-volume
```

**Output:**

```
#[bold][■■■■■■■■■■■■        ]#[default]
```

### Muted

```bash
get-volume
```

**Output:**

```
#[bold][   mute   ]#[default]
```

## Notes

- On macOS: uses `osascript` to read volume settings.
- On Linux: tries `pactl`, falls back to `amixer`.
- Output contains tmux color directives (`#[...]`) — intended for tmux status bar use.
- The bar is 16 cells wide.
