# ☀️ today

显示今日日期（含日本年号）、天气和世界时间的每日摘要。

## 环境要求

- `curl`（weather 使用）

## 用法

```bash
today
```

## 输出示例

```
令和7年,2025 05月 21日 Tokyo: ⛅️ +18°C 65% 0.0mm 🌘 25
Sydney:         [ 8:00 AM] Wednesday, May 21, 2025
Tokyo:          [ 7:00 AM] Wednesday, May 21, 2025
Shanghai:       [ 6:00 AM] Wednesday, May 21, 2025
London:         [11:00 PM] Tuesday, May 20, 2025
New York:       [ 6:00 PM] Tuesday, May 20, 2025
Los Angeles:    [ 3:00 PM] Tuesday, May 20, 2025
enjyo! :-)
```

## 说明

- 内部调用 `wareki`、`weather` 和 `worldtime`。
- 天气数据需要网络连接。
