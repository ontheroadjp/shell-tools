# 📊 bench_function <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

Source a Zsh file and benchmark the execution time of a specified function over multiple runs.

## Requirements

- `zsh`, `bc`

## Usage

```zsh
bench_function <function-file> <function-name> [count=100] [args...]
```

## Examples

```bash
# Benchmark a Zsh function 10 times
bench_function my_func
```

```
Benchmark: my_func (10 runs)
  min:  0.012s
  max:  0.025s
  avg:  0.018s
```
