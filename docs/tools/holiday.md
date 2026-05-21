# holiday

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
holiday
holiday 2025
holiday 天皇
```

## Output

```
20250101 元日
20250113 成人の日
20250211 建国記念の日
...
```

## Notes

- Requires a network connection.
- Data is sourced from Google Calendar's Japanese Holiday calendar (ICS format).
