# 💻 bench_command <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

Benchmark execution time of any shell command over multiple runs, reporting average, minimum, and maximum.

## Requirements

- `zsh`, `bc`

## Usage

```zsh
bench_command <command> [count=100]
```

## Examples

### Benchmark a command 100 times (default)

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

### Benchmark with custom iteration count

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
