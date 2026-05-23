# wifi-helth-check

WiFi diagnostics: signal strength, connection speed, and internet connectivity with color-coded output.

## Requirements

- macOS: `airport`, `bc`, `perl`, `dig`
- Linux: `iw`, `ip`, `dig`

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

## Example

```bash
wifi-helth-check
```

```
Address: 192.168.1.xxx
Gateway: 192.168.1.1
Ping: 2 ms (100% packets transmitted)
DNS:   OK

SSID:    MyHomeWifi
BSSID:   xx:xx:xx:xx:xx:xx
CHANNEL: 6ch: 2.4GHz

RSSI:  -55
Noise: -95
S/N:   40
Rate:  130
MCS:   7
```

## Color Indicators

| Color | Meaning |
|---|---|
| Green | Good |
| Yellow | Warning |
| Red | Problem |
