# ☀️ today <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

显示今日日期（含日本年号）、天气和世界时间的每日摘要。

## 环境要求

- `curl`（weather 使用）

## 用法

```bash
today
```

## 示例

```bash
# 显示每日摘要
today
```

```
令和8年 05月 23日 ⛅️ +22°C 60%
Sydney:      [ 8:00 AM] Friday, May 23, 2026
Tokyo:       [ 7:00 AM] Friday, May 23, 2026
Shanghai:    [ 6:00 AM] Friday, May 23, 2026
London:      [11:00 PM] Thursday, May 22, 2026
New York:    [ 6:00 PM] Thursday, May 22, 2026
Los Angeles: [ 3:00 PM] Thursday, May 22, 2026
enjyo! :-)
```

## 说明

- 内部调用 `wareki`、`weather` 和 `worldtime`。
- 天气数据需要网络连接。
