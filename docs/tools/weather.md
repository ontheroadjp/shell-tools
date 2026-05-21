# weather

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
weather
weather Tokyo
weather Osaka
```

## Output

```
Tokyo: ⛅️ +18°C 65% 0.0mm 🌘 25
```

Format: `city: icon temperature humidity precipitation moon-phase moon-age`

## Preset Cities

Sapporo / Sendai / Fukushima / Tokyo / Shizuoka / Niigata / Fukui / Kanazawa / Nagano / Nagoya / Osaka / Kyoto / Okayama / Hiroshima / Fukuoka / Kumamoto / Kagoshima / Okinawa

## Notes

- Requires a network connection.
