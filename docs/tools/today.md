# ☀️ today <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

A daily summary showing today's date in Japanese era, weather, and world time.

## Requirements

- `curl` (used by weather)

## Usage

```bash
today
```

## Examples

```bash
# Show daily summary
today
```

```
令和8年 05月 23日 ⛅️ +22°C 60%
Sydney:      [ 8:00 AM] Friday, May 23, 2026
Tokyo:       [ 7:00 AM] Friday, May 23, 2026
Shanghai:    [ 6:00 AM] Friday, May 23, 2026
London:      [11:00 PM] Thursday, May 22, 2026
New York:    [ 6:00 PM] Thursday, May 22, 2026
Los Angeles: [ 3:00 PM] Thursday, May 22, 2026
enjyo! :-)
```

## Notes

- Internally calls `wareki`, `weather`, and `worldtime`.
- Requires a network connection for weather data.
