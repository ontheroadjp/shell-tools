# 📜 wareki <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# Show Japanese era for the current year
wareki
```

```
令和8年,2026
```

```bash
# Convert a specific Western year
wareki 2019
```

```
平成31年,2019
令和元年,2019
```

```bash
# Search by era name
wareki 昭和
```

```
昭和元年,1926
昭和2年,1927
...
昭和64年,1989
```

```bash
# Search by partial year
wareki 1989
```

```
昭和64年,1989
平成元年,1989
```
