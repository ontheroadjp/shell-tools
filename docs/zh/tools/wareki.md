# 📜 wareki <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

西历与日本年号互相换算，支持明治元年（1868年）至令和10年（2028年）。

## 用法

```bash
wareki [年份]
```

| 参数 | 说明 |
|---|---|
| （无）| 显示当前年份对应的日本年号 |
| `年份` | 按西历年份或年号名称搜索 |

## 示例

### 显示当前年份对应的日本年号

```bash
wareki
```

**Output:**

```
令和8年,2026
```

### 转换指定西历年份

```bash
wareki 2019
```

**Output:**

```
平成31年,2019
令和元年,2019
```

### 按年号名称搜索

```bash
wareki 昭和
```

**Output:**

```
昭和元年,1926
昭和2年,1927
...
昭和64年,1989
```

### 按部分年份搜索

```bash
wareki 1989
```

**Output:**

```
昭和64年,1989
平成元年,1989
```
