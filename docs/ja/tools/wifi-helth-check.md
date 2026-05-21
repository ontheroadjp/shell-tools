# wifi-helth-check

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
# 全診断を実行
wifi-helth-check

# インターネット接続だけ確認
wifi-helth-check inetinfo

# 電波強度だけ確認
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
| 緑 | 良好 |
| 黄 | 注意 |
| 赤 | 問題あり |
