# 📶 get-ssid <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span> <span class="tc-badge tc-badge-tmux">tmux</span>

Output the current Wi-Fi SSID formatted for a tmux status bar, with signal strength indicator on macOS.

## Requirements

- macOS: `airport` (built-in)
- Linux: `iwgetid` or `nmcli`

## Usage

```bash
get-ssid
```

Designed to be called from a tmux `status-right` or `status-left` config.

## Examples

### Connected (macOS — with signal bar)

```bash
get-ssid
```

**Output:**

```
#[bold]|#[default] #[underscore]MyHomeWifi#[default] | ▁▂▄▆ #[fg=colour014]|#[default]
```

### Connected (Linux)

```bash
get-ssid
```

**Output:**

```
#[bold]|#[default] #[underscore]MyHomeWifi#[default] #[fg=colour014]|#[default]
```

### Not connected

```bash
get-ssid
```

**Output:**

```
#[fg=red] ✘  
```

## Notes

- On macOS: includes a signal strength bar (`▁▂▄▆█`) based on RSSI.
- Output contains tmux color directives (`#[...]`) — intended for tmux status bar use.
