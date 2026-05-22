# 🚀 bench_zsh <Badge type="tip" text="Shell" />

Measure `zsh -l` login shell startup time over multiple runs and report average, minimum, and maximum.

## Requirements

- `bash`, `zsh`

## Usage

```bash
bench_zsh
```

Edit `N=10` inside the script to change the number of runs.

## Output

```
Run 1: 0.312s
Run 2: 0.298s
...
----------------------------
Average start time: 0.305s (10 runs)
Minimum: 0.290s
Maximum: 0.330s
```
