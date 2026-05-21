# wareki

Converts between Western years and Japanese era years (Meiji 1868 – Reiwa 2028).

## Usage

```bash
wareki [year]
```

| Argument | Description |
|---|---|
| (none) | Show the Japanese era for the current year |
| `year` | Search by Western year or era name |

## Examples

```bash
wareki
# → 令和7年,2025

wareki 2025
# → 令和7年,2025

wareki 1989
# → 昭和64年,1989
# → 平成元年,1989

wareki 昭和
```
