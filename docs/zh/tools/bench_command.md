# 💻 bench_command <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

多次执行任意 Shell 命令，统计平均、最短和最长执行时间。

## 依赖

- `zsh`, `bc`

## 用法

```zsh
bench_command <命令> [次数=100]
```

## 示例

### 对命令进行基准测试（默认 10 次）

```bash
bench_command ls
```

**Output:**

```
Benchmark: ls (10 runs)
  min:  0.003s
  max:  0.008s
  avg:  0.005s
```

### 自定义测试次数

```bash
bench_command -n 50 "echo hello"
```

**Output:**

```
Benchmark: echo hello (50 runs)
  min:  0.001s
  max:  0.003s
  avg:  0.002s
```
