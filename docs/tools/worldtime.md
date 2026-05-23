# 🌍 worldtime <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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

### Show current time in 6 major cities

```bash
worldtime
```

**Output:**

```
Sydney:         [ 8:00 AM] Friday, May 23, 2026
Tokyo:          [ 7:00 AM] Friday, May 23, 2026
Shanghai:       [ 6:00 AM] Friday, May 23, 2026
London:         [11:00 PM] Thursday, May 22, 2026
New York:       [ 6:00 PM] Thursday, May 22, 2026
Los Angeles:    [ 3:00 PM] Thursday, May 22, 2026
```

### Filter by city name

```bash
worldtime Tokyo
```

**Output:**

```
Tokyo:          [ 7:00 AM] Friday, May 23, 2026
```

### Show time for a specific timezone

```bash
worldtime tz Asia/Seoul
```

**Output:**

```
Asia/Seoul: Fri May 23 07:00:00 KST 2026
```
