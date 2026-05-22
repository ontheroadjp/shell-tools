# 📶 wifi-helth-check <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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

```bash
# WiFi とインターネットの全診断を実行（デフォルト）
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
# インターネット接続情報のみ表示
wifi-helth-check inetinfo
```

```
Address: 192.168.1.42
Gateway: 192.168.1.1
Ping: 2.3 ms (100% packets transmitted)
DNS:   OK
```

```bash
# WiFi 電波強度情報のみ表示
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
| 緑 | 良好 |
| 黄 | 注意 |
| 赤 | 問題あり |
