# 📶 wifi-helth-check <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

WiFi の電波強度・接続速度・インターネット接続をまとめて診断します。値の良否をカラーで視覚的に表示します。

## Requirements

- macOS (airport コマンド、osascript を使用)
- `bc`, `perl` (標準インストール済み)

## Usage

```bash
wifi-helth-check [subcommand]
```

| Subcommand | Description |
|---|---|
| (なし) または `wificheck` | 全診断を実行 |
| `inetinfo` | インターネット接続診断のみ |
| `wifiinfo` | WiFi 接続情報のみ |
| `radioinfo` | 電波強度・速度情報のみ |

## Examples

### WiFi とインターネットの全診断を実行（デフォルト）

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

### インターネット接続情報のみ表示

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

### WiFi 電波強度情報のみ表示

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
| 緑 | 良好 |
| 黄 | 注意 |
| 赤 | 問題あり |
