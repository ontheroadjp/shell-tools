# 🌤️ weather <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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

```bash
# Show weather for Tokyo
weather Tokyo
```

```
Tokyo: ⛅️ +22°C 60% 0.0mm 🌔 18
```

```bash
# Select city interactively with peco
weather
```

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
