# 🚀 bench_zsh <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

Measure `zsh -l` login shell startup time over multiple runs and report average, minimum, and maximum.

## Requirements

- `bash`, `zsh`

## Usage

```bash
bench_zsh
```

Edit `N=10` inside the script to change the number of runs.

## Examples

### Measure Zsh startup time (10 runs)

```bash
bench_zsh
```

**Output:**

```
Run 1: 0.037s
Run 2: 0.019s
Run 3: 0.019s
Run 4: 0.020s
Run 5: 0.017s
Run 6: 0.020s
Run 7: 0.018s
Run 8: 0.019s
Run 9: 0.016s
Run 10: 0.020s
----------------------------
Average start time: 0.020s (10backs)
Minimum: 0.016s
Maximum: 0.037s
```
