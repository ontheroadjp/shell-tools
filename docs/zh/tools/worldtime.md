# 🌍 worldtime <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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

### 显示 6 个主要城市的当前时间

```bash
worldtime
```

**Output:**

```
Sydney:         [ 8:00 AM] Friday, May 23, 2026
Tokyo:          [ 7:00 AM] Friday, May 23, 2026
Shanghai:       [ 6:00 AM] Friday, May 23, 2026
London:         [11:00 PM] Thursday, May 22, 2026
New York:       [ 6:00 PM] Thursday, May 22, 2026
Los Angeles:    [ 3:00 PM] Thursday, May 22, 2026
```

### 按城市名过滤

```bash
worldtime Tokyo
```

**Output:**

```
Tokyo:          [ 7:00 AM] Friday, May 23, 2026
```

### 显示指定时区的时间

```bash
worldtime tz Asia/Seoul
```

**Output:**

```
Asia/Seoul: Fri May 23 07:00:00 KST 2026
```
