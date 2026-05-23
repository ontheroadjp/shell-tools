# 🎨 colors <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

在终端中显示 ANSI 颜色代码和 xterm 256 色表。

## 用法

```bash
colors [子命令]
```

| 子命令 | 说明 |
|---|---|
| `colors`（默认）| 显示 ANSI 基本颜色代码参考 |
| `256` | 显示带索引编号的 256 色 |
| `256hex` | 显示带 HEX 色值的 256 色（前景色）|
| `256hexbg` | 显示带 HEX 色值的 256 色（背景色）|

## 示例

### 显示所有 ANSI 基本颜色

```bash
colors
```

**Output:**

```
[displays colored terminal output with ANSI color codes and names]
```

### 显示 256 色表

```bash
colors 256
```

**Output:**

```
[displays 256-color table with color indices]
```

## 说明

- 在自定义 Shell 提示符或脚本时，用于查询颜色代码编号非常方便。
