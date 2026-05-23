# ⏱️ timer <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

A countdown timer that sends a macOS notification and plays sounds when time is up.

## Requirements

- macOS (uses `osascript` and `afplay`)

## Usage

```bash
timer <time>
```

Time is specified using `h` (hours), `m` (minutes), and `s` (seconds).

## Examples

### Set a 30-minute timer

```bash
timer 30m
```

**Output:**

```
After 1800 sec
[macOS notification / Linux notify-send after 30 minutes]
```

### Set a 1 hour 30 minute timer

```bash
timer 1h30m
```

**Output:**

```
After 5400 sec
```

### Set a 90-second timer

```bash
timer 90s
```

**Output:**

```
After 90 sec
```

### Run in background

```bash
timer 25m &
```

**Output:**

```
[1] 12345
After 1500 sec
```

## Notes

- Runs in the foreground. For background use: `timer 30m &`
- Plays three sounds: Glass → Submarine → Ping.
