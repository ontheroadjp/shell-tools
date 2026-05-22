# 📈 numstats <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# Compute stats for numbers passed as arguments
numstats 10 20 30 40 50
```

```
min=10, max=50, avg=30.000000, count=5
```

```bash
# Pipe numbers from stdin
echo -e "3.5\n7.2\n1.8\n9.4" | numstats
```

```
min=1.8, max=9.4, avg=5.475000, count=4
```

```bash
# Show only minimum and maximum
numstats -m -M 5 10 15 20 25
```

```
min=5, max=25
```

```bash
# Quiet mode (values only, no labels)
numstats -q -m -M 10 20 30
```

```
10
30
```
