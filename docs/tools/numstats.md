# 📈 numstats <Badge type="tip" text="Shell" />

Computes basic statistics (min, max, avg, count) for a list of numbers. Accepts numbers as arguments or via stdin.

## Usage

```bash
numstats [options] [numbers...]
```

| Option | Description |
|---|---|
| `-m` | Print minimum value |
| `-M` | Print maximum value |
| `-a` | Print average value |
| `-c` | Print count |
| `-q` | Quiet mode: print values only, no labels |

If no options are specified, all statistics are shown.

## Examples

```bash
numstats 10 20 30 40 50
# → min=10, max=50, avg=30.000000, count=5

numstats -Ma 10 20 30

echo -e "5\n10\n15" | numstats

cat scores.txt | numstats -a

numstats -mq 10 20 30
# → 10
```
