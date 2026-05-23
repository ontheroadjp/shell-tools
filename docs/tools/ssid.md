# 📡 ssid <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

Display the current Wi-Fi SSID.

## Requirements

- macOS: `airport` (built-in)
- Linux: `iwgetid` or `nmcli`

## Usage

```bash
ssid
```

## Examples

### Show current SSID

```bash
ssid
```

**Output:**

```
MyHomeWifi
```

### Not connected

```bash
ssid
```

**Output:**

```
no_wifi
```

## Notes

- On macOS: uses the `airport` utility.
- On Linux: tries `iwgetid`, falls back to `nmcli`.
- Returns `no_wifi` and exits with code `1` if not connected.
