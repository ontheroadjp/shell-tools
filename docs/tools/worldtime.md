# 🌍 worldtime <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# Show current time in 6 major cities
worldtime
```

```
Sydney:         [ 8:00 AM] Friday, May 23, 2026
Tokyo:          [ 7:00 AM] Friday, May 23, 2026
Shanghai:       [ 6:00 AM] Friday, May 23, 2026
London:         [11:00 PM] Thursday, May 22, 2026
New York:       [ 6:00 PM] Thursday, May 22, 2026
Los Angeles:    [ 3:00 PM] Thursday, May 22, 2026
```

```bash
# Filter by city name
worldtime Tokyo
```

```
Tokyo:          [ 7:00 AM] Friday, May 23, 2026
```

```bash
# Show time for a specific timezone
worldtime tz Asia/Seoul
```

```
Asia/Seoul: Fri May 23 07:00:00 KST 2026
```
