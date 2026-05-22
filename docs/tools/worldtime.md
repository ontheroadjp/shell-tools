# 🌍 worldtime <Badge type="tip" text="Shell" />

Display the current time in Sydney, Tokyo, Shanghai, London, New York, and Los Angeles. Supports interactive timezone selection via `peco`.

## Requirements

- `peco` (for `tz` subcommand)

## Usage

```bash
worldtime [keyword]
worldtime tz [timezone]
```

| Usage | Description |
|---|---|
| `worldtime` | Show time in 6 cities |
| `worldtime <keyword>` | Filter output by keyword |
| `worldtime tz` | Select timezone interactively with `peco` |
| `worldtime tz <timezone>` | Show time for a specific timezone |

## Examples

```bash
worldtime
worldtime Tokyo
worldtime tz
worldtime tz Asia/Seoul
```

## Output

```
Sydney:         [ 8:00 AM] Wednesday, May 21, 2025
Tokyo:          [ 7:00 AM] Wednesday, May 21, 2025
Shanghai:       [ 6:00 AM] Wednesday, May 21, 2025
London:         [11:00 PM] Tuesday, May 20, 2025
New York:       [ 6:00 PM] Tuesday, May 20, 2025
Los Angeles:    [ 3:00 PM] Tuesday, May 20, 2025
```
