# 📊 bench_function <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

Source a Zsh file and benchmark the execution time of a specified function over multiple runs.

## Requirements

- `zsh`, `bc`

## Usage

```zsh
bench_function <function-file> <function-name> [count=100] [args...]
```

## Examples

### Benchmark a Zsh function 10 times

```bash
bench_function my_func
```

**Output:**

```
📊 function: my_func
🔁 times: 100
⏱️ average: 0.000123s
⚡ Shortest: 0.000089s
🐢 longest: 0.000201s
```
