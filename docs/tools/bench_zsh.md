# 🚀 bench_zsh <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

Measure `zsh -l` login shell startup time over multiple runs and report average, minimum, and maximum.

## Requirements

- `bash`, `zsh`

## Usage

```bash
bench_zsh
```

Edit `N=10` inside the script to change the number of runs.

## Examples

```bash
# Measure Zsh startup time (10 runs)
bench_zsh
```

```
Zsh startup time (10 runs):
  min:  0.124s
  max:  0.201s
  avg:  0.158s
```
