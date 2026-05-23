# 📶 get-ssid <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span> <span class="tc-badge tc-badge-tmux">tmux</span>

以 tmux 状态栏格式输出当前 Wi-Fi SSID，macOS 下附带信号强度指示器。

## 环境要求

- macOS：`airport`（内置）
- Linux：`iwgetid` 或 `nmcli`

## 用法

```bash
get-ssid
```

用于 tmux `status-right` 或 `status-left` 配置中调用。

## 示例

### 已连接（macOS — 含信号强度条）

```bash
get-ssid
```

**Output:**

```
#[bold]|#[default] #[underscore]MyHomeWifi#[default] | ▁▂▄▆ #[fg=colour014]|#[default]
```

### 已连接（Linux）

```bash
get-ssid
```

**Output:**

```
#[bold]|#[default] #[underscore]MyHomeWifi#[default] #[fg=colour014]|#[default]
```

### 未连接

```bash
get-ssid
```

**Output:**

```
#[fg=red] ✘  
```

## 说明

- macOS：根据 RSSI 显示信号强度条（`▁▂▄▆█`）。
- 输出包含 tmux 颜色指令（`#[...]`），专为 tmux 状态栏设计。
