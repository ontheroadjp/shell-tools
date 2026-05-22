# ⏱️ timer <Badge type="tip" text="Shell" />

倒计时器，时间到后发送 macOS 通知并播放提示音。

## 环境要求

- macOS（使用 `osascript` 和 `afplay`）

## 用法

```bash
timer <时间>
```

时间使用 `h`（小时）、`m`（分钟）、`s`（秒）组合指定。

## 示例

```bash
timer 30m
timer 1h30m
timer 90s
timer 2h15m30s
```

## 说明

- 在前台运行。后台运行请使用：`timer 30m &`
- 依次播放三种提示音：Glass → Submarine → Ping。
