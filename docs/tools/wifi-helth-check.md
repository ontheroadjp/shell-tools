# 📶 wifi-helth-check <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# Full WiFi and internet diagnostics (default)
wifi-helth-check
```

```
Address: 192.168.1.42
Gateway: 192.168.1.1
Ping: 2.3 ms (100% packets transmitted)
DNS:   OK

SSID:    MyHomeWifi
BSSID:   aa:bb:cc:dd:ee:ff
CHANNEL: 6ch: 2.4GHz

RSSI:  -55 / -95  (S/N: 40)
Rate:  130 / 144
MCS:   7
```

```bash
# Show only internet info
wifi-helth-check inetinfo
```

```
Address: 192.168.1.42
Gateway: 192.168.1.1
Ping: 2.3 ms (100% packets transmitted)
DNS:   OK
```

```bash
# Show only WiFi signal info
wifi-helth-check radioinfo
```

```
RSSI:  -55 / -95  (S/N: 40)
Rate:  130 / 144
MCS:   7
```

## Color Indicators

| Color | Meaning |
|---|---|
| Green | Good |
| Yellow | Warning |
| Red | Problem |
