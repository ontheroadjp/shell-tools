# 📶 wifi-helth-check <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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

### 完整的 WiFi 和互联网诊断（默认）

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

### 仅显示互联网信息

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

### 仅显示 WiFi 信号信息

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

## 颜色说明

| 颜色 | 含义 |
|---|---|
| 绿色 | 良好 |
| 黄色 | 注意 |
| 红色 | 异常 |
