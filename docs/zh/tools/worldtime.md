# 🌍 worldtime

显示悉尼、东京、上海、伦敦、纽约、洛杉矶的当前时间，也可通过 `peco` 交互选择时区。

## 环境要求

- `peco`（`tz` 子命令需要）

## 用法

```bash
worldtime [关键词]
worldtime tz [时区]
```

| 用法 | 说明 |
|---|---|
| `worldtime` | 显示 6 个城市的当前时间 |
| `worldtime <关键词>` | 按关键词过滤显示 |
| `worldtime tz` | 通过 peco 交互选择时区 |
| `worldtime tz <时区>` | 显示指定时区的时间 |

## 示例

```bash
worldtime
worldtime Tokyo
worldtime tz
worldtime tz Asia/Seoul
```

## 输出示例

```
Sydney:         [ 8:00 AM] Wednesday, May 21, 2025
Tokyo:          [ 7:00 AM] Wednesday, May 21, 2025
Shanghai:       [ 6:00 AM] Wednesday, May 21, 2025
London:         [11:00 PM] Tuesday, May 20, 2025
New York:       [ 6:00 PM] Tuesday, May 20, 2025
Los Angeles:    [ 3:00 PM] Tuesday, May 20, 2025
```
