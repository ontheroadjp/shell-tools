# NumStats

`numstats.sh` is a versatile Bash script for calculating basic statistics from a list of numbers.  
It supports minimum, maximum, average, and count, and works with both integers and floating-point numbers. Numbers can be passed as arguments or through standard input.

## Features

- Compute **minimum**, **maximum**, **average**, and **count**.
- Supports **integer and floating-point numbers**.
- Accepts numbers via **command-line arguments** or **standard input**.
- **Flexible output**: choose which statistics to display using options.
- **Quiet mode**: print values without labels.
- Unix-friendly: can be used in **pipelines**.

## Requirements

- Bash 4+
- `bc` (for floating-point calculations)

## Usage

```bash
./numstats.sh [OPTIONS] [numbers...]
```

### Options

| Option | Description |
|--------|-------------|
| `-m`   | Print minimum value |
| `-M`   | Print maximum value |
| `-a`   | Print average value |
| `-c`   | Print count |
| `-q`   | Quiet mode: print only numbers, no labels |
| none   | If no options are specified, all statistics are printed |

### Examples

#### 1. Numbers as arguments, all statistics

```bash
./numstats.sh 10 5 3.5 7
# Output:
# min=3.5, max=10, avg=6.375000, count=4
```

#### 2. Numbers as arguments, specific statistics

```bash
./numstats.sh -m -a 10 5 3.5 7
# Output:
# min=3.5
# avg=6.375000
```

#### 3. Quiet mode (values only, no labels)

```bash
./numstats.sh -q 10 5 3.5 7
# Output:
# 3.5
# 10
# 6.375000
# 4
```

#### 4. Quiet mode with specific statistics

```bash
./numstats.sh -m -a -q 10 5 3.5 7
# Output:
# 3.5
# 6.375000
```

#### 5. Numbers from standard input

```bash
cat numbers.txt | ./numstats.sh -M -c
# Output:
# max=10
# count=4
```

## How It Works

1. **Read numbers** from arguments or standard input.
2. **Compute statistics** using `bc` for floating-point calculations.
3. **Output** the requested statistics based on options, with optional quiet mode.

## Contribution

Contributions are welcome! If you find any bugs or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License.  
See the [MIT License](https://choosealicense.com/licenses/mit/) for details.
