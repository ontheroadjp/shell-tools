# 📶 wifi-helth-check <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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

### Full WiFi and internet diagnostics (default)

```bash
wifi-helth-check
```

**Output:**

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

### Show only internet info

```bash
wifi-helth-check inetinfo
```

**Output:**

```
Address: 192.168.1.42
Gateway: 192.168.1.1
Ping: 2.3 ms (100% packets transmitted)
DNS:   OK
```

### Show only WiFi signal info

```bash
wifi-helth-check radioinfo
```

**Output:**

```
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
