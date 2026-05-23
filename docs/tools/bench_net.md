# 🌐 bench_net <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

Measure network download and upload speed using speedtest.net.

## Requirements

- Python 2 or 3

## Usage

```bash
bench_net
```

## Examples

### Measure network speed via speedtest.net

```bash
bench_net
```

**Output:**

```
Ping: 12.34 ms
Download: 487.32 Mbit/s
Upload: 198.54 Mbit/s
```

## Notes

- Uses the speedtest-cli protocol internally.
- Results vary based on server load and network conditions.
