# 🎨 colors <Badge type="tip" text="Shell" />

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

```bash
colors
colors 256
colors 256hex
colors 256hexbg
```

## 说明

- 在自定义 Shell 提示符或脚本时，用于查询颜色代码编号非常方便。
