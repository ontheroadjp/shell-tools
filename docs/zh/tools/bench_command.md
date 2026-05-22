# 💻 bench_command <Badge type="tip" text="Shell" />

多次执行任意 Shell 命令，统计平均、最短和最长执行时间。

## 依赖

- `zsh`, `bc`

## 用法

```zsh
bench_command <命令> [次数=100]
```

## 示例

```zsh
bench_command "git status --porcelain" 50
bench_command "ls -l" 100
```

## 输出示例

```
💻 命令: git status --porcelain
🔁 次数: 50
⏱️ 平均: 0.012345s
⚡ 最短: 0.010123s
🐢 最长: 0.018456s
```
