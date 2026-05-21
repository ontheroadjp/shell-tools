# today

A daily summary showing today's date in Japanese era, weather, and world time.

## Requirements

- `curl` (used by weather)

## Usage

```bash
today
```

## Output

```
令和7年,2025 05月 21日 Tokyo: ⛅️ +18°C 65% 0.0mm 🌘 25
Sydney:         [ 8:00 AM] Wednesday, May 21, 2025
Tokyo:          [ 7:00 AM] Wednesday, May 21, 2025
Shanghai:       [ 6:00 AM] Wednesday, May 21, 2025
London:         [11:00 PM] Tuesday, May 20, 2025
New York:       [ 6:00 PM] Tuesday, May 20, 2025
Los Angeles:    [ 3:00 PM] Tuesday, May 20, 2025
enjyo! :-)
```

## Notes

- Internally calls `wareki`, `weather`, and `worldtime`.
- Requires a network connection for weather data.
