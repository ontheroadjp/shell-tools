# 💻 bench_command <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

多次执行任意 Shell 命令，统计平均、最短和最长执行时间。

## 依赖

- `zsh`, `bc`

## 用法

```zsh
bench_command <命令> [次数=100]
```

## 示例

### 对命令进行基准测试（默认 100 次）

```bash
bench_command ls
```

**Output:**

```
💻 コマンド: ls
🔁 回数: 100
⏱️ 平均: 0.000005s
⚡ 最短: 0.000003s
🐢 最長: 0.000008s
```

### 自定义测试次数

```bash
bench_command "echo hello" 50
```

**Output:**

```
💻 コマンド: echo hello
🔁 回数: 50
⏱️ 平均: 0.000002s
⚡ 最短: 0.000001s
🐢 最長: 0.000004s
```
