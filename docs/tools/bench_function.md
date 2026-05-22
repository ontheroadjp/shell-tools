# 📊 bench_function

Source a Zsh file and benchmark the execution time of a specified function over multiple runs.

## Requirements

- `zsh`, `bc`

## Usage

```zsh
bench_function <function-file> <function-name> [count=100] [args...]
```

## Examples

```zsh
bench_function ~/.zshrc __git_ps1_update_fast 100
bench_function ./myfunc.zsh myfunc 50 arg1 arg2
```

## Output

```
📊 function: myfunc
🔁 times: 50
⏱️ average: 0.002345s
⚡ Shortest: 0.001900s
🐢 longest: 0.005100s
```
