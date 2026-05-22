# ⏱️ timer <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

A countdown timer that sends a macOS notification and plays sounds when time is up.

## Requirements

- macOS (uses `osascript` and `afplay`)

## Usage

```bash
timer <time>
```

Time is specified using `h` (hours), `m` (minutes), and `s` (seconds).

## Examples

```bash
# Set a 30-minute timer
timer 30m
```

```
After 1800 sec
[macOS notification / Linux notify-send after 30 minutes]
```

```bash
# Set a 1 hour 30 minute timer
timer 1h30m
```

```
After 5400 sec
```

```bash
# Set a 90-second timer
timer 90s
```

```
After 90 sec
```

```bash
# Run in background
timer 25m &
```

```
[1] 12345
After 1500 sec
```

## Notes

- Runs in the foreground. For background use: `timer 30m &`
- Plays three sounds: Glass → Submarine → Ping.
