# 🔋 battery <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span> <span class="tc-badge tc-badge-tmux">tmux</span>

Display battery level and remaining time. Supports plain, ANSI color, and tmux color output.

## Usage

```bash
battery [-p] [-t] [-c [tmux]]
```

| Option | Description |
|---|---|
| (none) or `-p` | Show battery percentage |
| `-t` | Show remaining time |
| `-c` | Colorize output (ANSI) |
| `-c tmux` | Colorize output for tmux status bar |

## Examples

### Show battery percentage

```bash
battery
```

**Output:**

```
87%
```

### Show percentage and remaining time

```bash
battery -pt
```

**Output:**

```
87% 3:42
```

### Tmux status bar with color

```bash
battery -c tmux
```

**Output:**

```
#[fg=blue]87%#[default]
```

## Notes

- On macOS: uses `pmset` or `ioreg`.
- On Linux: reads from `/sys/class/power_supply/BAT0` (or `BAT1`).
- Designed for use in a tmux status bar.
