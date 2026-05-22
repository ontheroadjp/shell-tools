# 💻 bench_command <Badge type="tip" text="Shell" />

Benchmark execution time of any shell command over multiple runs, reporting average, minimum, and maximum.

## Requirements

- `zsh`, `bc`

## Usage

```zsh
bench_command <command> [count=100]
```

## Examples

```zsh
bench_command "git status --porcelain" 50
bench_command "ls -l" 100
```

## Output

```
💻 Command: git status --porcelain
🔁 Count: 50
⏱️ Average: 0.012345s
⚡ Minimum: 0.010123s
🐢 Maximum: 0.018456s
```
