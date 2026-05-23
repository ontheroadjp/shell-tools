# 🌐 bench_net <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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
