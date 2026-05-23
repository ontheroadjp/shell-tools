# 🔊 get-volume <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span> <span class="tc-badge tc-badge-tmux">tmux</span>

以 tmux 状态栏格式输出系统音量条。

## 环境要求

- macOS：`osascript`（内置）
- Linux：`pactl` 或 `amixer`

## 用法

```bash
get-volume
```

用于 tmux `status-right` 或 `status-left` 配置中调用。

## 示例

### 音量为 75% 时

```bash
get-volume
```

**Output:**

```
#[bold][■■■■■■■■■■■■        ]#[default]
```

### 静音时

```bash
get-volume
```

**Output:**

```
#[bold][   mute   ]#[default]
```

## 说明

- macOS：使用 `osascript` 读取音量设置。
- Linux：先尝试 `pactl`，失败则回退至 `amixer`。
- 输出包含 tmux 颜色指令（`#[...]`），专为 tmux 状态栏设计。
- 音量条宽度为 16 格。
