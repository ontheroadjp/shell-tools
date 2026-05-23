# 🌤️ weather <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

Fetch current weather using the [wttr.in](https://wttr.in) API.

## Requirements

- `curl`
- `peco` (for interactive city selection)

## Usage

```bash
weather [city]
```

| Argument | Description |
|---|---|
| (none) | Select a city interactively with `peco` |
| `city` | Show weather for the specified city |

## Examples

### Show weather for Tokyo

```bash
weather Tokyo
```

**Output:**

```
Tokyo: ⛅️ +22°C 60% 0.0mm 🌔 18
```

### Select city interactively with peco

```bash
weather
```

**Output:**

```
[peco city selection interface]
> Sapporo
  Sendai
  Tokyo
  Osaka
  ...
```

The output format is:

```
city: icon temperature humidity precipitation moon-phase moon-age
```

## Preset Cities

Sapporo / Sendai / Fukushima / Tokyo / Shizuoka / Niigata / Fukui / Kanazawa / Nagano / Nagoya / Osaka / Kyoto / Okayama / Hiroshima / Fukuoka / Kumamoto / Kagoshima / Okinawa

## Notes

- Requires a network connection.
