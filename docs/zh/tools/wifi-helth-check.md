# 📶 wifi-helth-check

诊断 WiFi 信号强度、连接速度和互联网连接状态，以彩色显示检测结果。

## 环境要求

- macOS（`airport` 命令、`bc`、`perl`）

## 用法

```bash
wifi-helth-check [子命令]
```

| 子命令 | 说明 |
|---|---|
| （无）或 `wificheck` | 运行全部诊断 |
| `inetinfo` | 仅诊断互联网连接 |
| `wifiinfo` | 仅显示 WiFi 连接信息 |
| `radioinfo` | 仅显示信号强度和速率信息 |

## 示例

```bash
wifi-helth-check
wifi-helth-check inetinfo
wifi-helth-check radioinfo
```

## 输出示例

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

## 颜色说明

| 颜色 | 含义 |
|---|---|
| 绿色 | 良好 |
| 黄色 | 注意 |
| 红色 | 异常 |
