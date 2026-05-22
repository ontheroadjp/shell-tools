# 🎌 holiday <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

Fetches Japanese public holidays from Google Calendar's ICS feed and displays them in date order.

## Requirements

- `curl`

## Usage

```bash
holiday [keyword]
```

| Argument | Description |
|---|---|
| (none) | Show all holidays sorted by date |
| `keyword` | Filter holidays by keyword |

## Examples

```bash
# List all Japanese public holidays this year
holiday
```

```
20260101 元日
20260112 成人の日
20260211 建国記念の日
20260223 天皇誕生日
20260320 春分の日
20260429 昭和の日
20260503 憲法記念日
20260504 みどりの日
20260505 こどもの日
20260720 海の日
20260811 山の日
20260921 敬老の日
20260923 秋分の日
20261012 スポーツの日
20261103 文化の日
20261123 勤労感謝の日
```

```bash
# Filter by keyword
holiday 正月
```

```
20260101 元日
```

```bash
# Show holidays in a specific month
holiday 2026-05
```

```
20260503 憲法記念日
20260504 みどりの日
20260505 こどもの日
```

## Notes

- Requires a network connection.
- Data is sourced from Google Calendar's Japanese Holiday calendar (ICS format).
