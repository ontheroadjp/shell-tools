# 📜 wareki <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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

### Show Japanese era for the current year

```bash
wareki
```

**Output:**

```
令和8年,2026
```

### Convert a specific Western year

```bash
wareki 2019
```

**Output:**

```
平成31年,2019
令和元年,2019
```

### Search by era name

```bash
wareki 昭和
```

**Output:**

```
昭和元年,1926
昭和2年,1927
...
昭和64年,1989
```

### Search by partial year

```bash
wareki 1989
```

**Output:**

```
昭和64年,1989
平成元年,1989
```
