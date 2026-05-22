# bench-suite

A collection of benchmarking tools for shell scripts and network speed.

## Files

| File | Description |
|---|---|
| `bench_command.zsh` | Measure execution time of any command |
| `bench_function.zsh` | Measure execution time of any Zsh function |
| `bench_zsh.sh` | Measure Zsh startup time |
| `bench_net.py` | Measure network speed via speedtest.net |

---

## bench_command.zsh

Runs any command a specified number of times and reports average, minimum, and maximum execution time.

### Usage

```zsh
./bench_command.zsh <command> [count=100]
```

### Examples

```zsh
./bench_command.zsh "git status --porcelain" 50
./bench_command.zsh "ls -l" 100
```

### Output

```
💻 コマンド: git status --porcelain
🔁 回数: 50
⏱️ 平均: 0.012345s
⚡ 最短: 0.010123s
🐢 最長: 0.018456s
```

---

## bench_function.zsh

Sources a Zsh file, loads a specified function, and measures its execution time.

### Usage

```zsh
./bench_function.zsh <function-file> <function-name> [count=100] [args...]
```

### Examples

```zsh
./bench_function.zsh ~/.zshrc __git_ps1_update_fast 100
./bench_function.zsh ./myfunc.zsh myfunc 50 arg1 arg2
```

### Output

```
📊 function: myfunc
🔁 times: 50
⏱️ average: 0.002345s
⚡ Shortest: 0.001900s
🐢 longest: 0.005100s
```

---

## bench_zsh.sh

Measures `zsh -l` startup time over multiple runs and reports average, minimum, and maximum.

### Usage

```bash
./bench_zsh.sh
```

The number of runs can be changed by editing `N=10` in the script.

### Output

```
Run 1: 0.312s
Run 2: 0.298s
...
----------------------------
Average start time: 0.305s (10backs)
Minimum: 0.290s
Maximum: 0.330s
```

---

## bench_net.py

Measures network download/upload speed using speedtest.net (based on speedtest-cli).

### Usage

```bash
./bench_net.py
```

### Requirements

- Python 2 or 3

---

## Dependencies

| Command | Used by |
|---|---|
| `zsh` | bench_command.zsh, bench_function.zsh |
| `bc` | Floating-point arithmetic in zsh scripts |
| `bash` | bench_zsh.sh |
| `python` | bench_net.py |
