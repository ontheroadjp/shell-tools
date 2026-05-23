# 💻 bench_command <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

Benchmark execution time of any shell command over multiple runs, reporting average, minimum, and maximum.

## Requirements

- `zsh`, `bc`

## Usage

```zsh
bench_command <command> [count=100]
```

## Examples

### Benchmark a command 10 times (default)

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

### Benchmark with custom iterations

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
