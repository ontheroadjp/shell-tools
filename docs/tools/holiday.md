# 🎌 holiday <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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

### List all Japanese public holidays this year

```bash
holiday
```

**Output:**

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

### Filter by keyword

```bash
holiday 正月
```

**Output:**

```
20260101 元日
```

### Show holidays in a specific month

```bash
holiday 2026-05
```

**Output:**

```
20260503 憲法記念日
20260504 みどりの日
20260505 こどもの日
```

## Notes

- Requires a network connection.
- Data is sourced from Google Calendar's Japanese Holiday calendar (ICS format).
