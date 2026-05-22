# ⏱️ timer <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# 设置 30 分钟定时器
timer 30m
```

```
After 1800 sec
[macOS notification / Linux notify-send after 30 minutes]
```

```bash
# 设置 1 小时 30 分钟定时器
timer 1h30m
```

```
After 5400 sec
```

```bash
# 设置 90 秒定时器
timer 90s
```

```
After 90 sec
```

```bash
# 在后台运行
timer 25m &
```

```
[1] 12345
After 1500 sec
```

## 说明

- 在前台运行。后台运行请使用：`timer 30m &`
- 依次播放三种提示音：Glass → Submarine → Ping。
