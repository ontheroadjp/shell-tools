# ⏱️ timer

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
timer 30m
timer 1h30m
timer 90s
timer 2h15m30s
```

## Notes

- Runs in the foreground. For background use: `timer 30m &`
- Plays three sounds: Glass → Submarine → Ping.
