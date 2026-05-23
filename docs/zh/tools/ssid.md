# 📡 ssid <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

显示当前连接的 Wi-Fi SSID。

## 环境要求

- macOS：`airport`（内置）
- Linux：`iwgetid` 或 `nmcli`

## 用法

```bash
ssid
```

## 示例

### 显示当前 SSID

```bash
ssid
```

**Output:**

```
MyHomeWifi
```

### 未连接时

```bash
ssid
```

**Output:**

```
no_wifi
```

## 说明

- macOS：使用 `airport` 工具。
- Linux：先尝试 `iwgetid`，失败则回退至 `nmcli`。
- 未连接时输出 `no_wifi` 并以退出码 `1` 退出。
