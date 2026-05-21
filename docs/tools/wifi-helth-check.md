# 📶 wifi-helth-check

Diagnose WiFi signal strength, connection speed, and internet connectivity with color-coded output.

## Requirements

- macOS (`airport` command, `bc`, `perl`)

## Usage

```bash
wifi-helth-check [subcommand]
```

| Subcommand | Description |
|---|---|
| (none) or `wificheck` | Run all diagnostics |
| `inetinfo` | Internet connectivity only |
| `wifiinfo` | WiFi connection info only |
| `radioinfo` | Signal strength and speed only |

## Examples

```bash
wifi-helth-check
wifi-helth-check inetinfo
wifi-helth-check radioinfo
```

## Output

```
Address: 192.168.1.10
Gateway: 192.168.1.1
Ping:    1.2 ms (100% packets transmitted)
DNS:     OK

SSID:    MyNetwork
BSSID:   aa:bb:cc:dd:ee:ff
CHANNEL: 6ch: 2.4GHz

RSSI:    -55 / -95  (S/N: 40)
Rate:    130 / 300
MCS:     15
```

## Color Indicators

| Color | Meaning |
|---|---|
| Green | Good |
| Yellow | Warning |
| Red | Problem |
