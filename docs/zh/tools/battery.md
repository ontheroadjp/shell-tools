# 🔋 battery <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span> <span class="tc-badge tc-badge-tmux">tmux</span>

显示电池电量和剩余时间，支持普通、ANSI 颜色及 tmux 颜色输出。

## 用法

```bash
battery [-p] [-t] [-c [tmux]]
```

| 选项 | 说明 |
|---|---|
| (无) 或 `-p` | 显示电池百分比 |
| `-t` | 显示剩余时间 |
| `-c` | ANSI 颜色输出 |
| `-c tmux` | tmux 状态栏颜色输出 |

## 示例

### 显示电池电量

```bash
battery
```

**Output:**

```
87%
```

### 显示电量和剩余时间

```bash
battery -pt
```

**Output:**

```
87% 3:42
```

### tmux 状态栏颜色输出

```bash
battery -c tmux
```

**Output:**

```
#[fg=blue]87%#[default]
```

## 说明

- macOS：使用 `pmset` 或 `ioreg`。
- Linux：从 `/sys/class/power_supply/BAT0`（或 `BAT1`）读取。
- 适用于 tmux 状态栏。
