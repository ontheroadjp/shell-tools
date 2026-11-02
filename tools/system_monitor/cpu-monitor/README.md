# cpu-monitor

A lightweight, terminal-based CPU monitoring tool for Linux, written in Bash.

Displays real-time CPU usage, frequency, temperature, Turbo Boost status, and estimated CPU package power consumption, along with basic CPU specifications.

Designed for the **Lenovo ThinkPad T480s (Intel Core i5-8250U)** running Ubuntu, with minimal runtime dependencies.

## Features

- **CPU usage** — Overall CPU utilization calculated from `/proc/stat`.
- **CPU frequency** — Average reported frequency across logical CPUs.
- **CPU temperature** — Package temperature read directly from Linux hardware monitoring interfaces.
- **CPU power** — Estimated CPU package power consumption using Intel RAPL energy counters.
- **Turbo Boost** — Shows whether Turbo Boost is enabled or disabled.
- **CPU specifications** — Model, physical cores, logical threads, base frequency, maximum Turbo frequency, and TDP.
- **Configurable refresh interval** — Defaults to 1 second.
- **Low overhead** — Uses Bash arithmetic and Linux virtual filesystems, avoiding repeated execution of heavyweight monitoring utilities.
- **No root required** for most metrics, subject to system permissions.

## Screenshot / Example Output

```text
CPU: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz

=== Specifications ===
Cores / Threads : 4 / 8
Base Frequency  : 1.60 GHz
Max Turbo       : 3.40 GHz
TDP             : 15 W

=== Current Status ===
CPU Usage       : 12.4%
CPU Frequency   : 3.25 GHz (avg)
Turbo Boost     : ON
CPU Temperature : 44.0°C
CPU Power       : 8.30 W
Update Interval : 1s
```

Values shown above are illustrative.

## Requirements

- Linux
- Bash 5.0 or later
- `lscpu` (util-linux)
- Standard Linux `/proc` and `/sys` interfaces
- Intel `coretemp` driver for CPU temperature monitoring
- Intel RAPL interface for CPU package power monitoring

Test target:

| Component | Configuration |
|---|---|
| Computer | Lenovo ThinkPad T480s |
| CPU | Intel Core i5-8250U |
| Operating System | Ubuntu Linux |
| Architecture | x86-64 |
| Physical cores | 4 |
| Logical CPUs | 8 |

The current implementation contains hardcoded specifications for the Intel Core i5-8250U. Other processors may work for runtime monitoring, but their displayed specifications will be incorrect until updated.

## Installation

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/cpu-monitor.git
cd cpu-monitor
```

Make the script executable:

```bash
chmod +x cpu-monitor
```

Optionally, install it somewhere in your `PATH`:

```bash
sudo install -m 755 cpu-monitor /usr/local/bin/cpu-monitor
```

No additional Python packages or third-party libraries are required.

## Usage

Run with the default 1-second refresh interval:

```bash
cpu-monitor
```

Specify a custom interval in seconds:

```bash
cpu-monitor 2
```

Examples:

| Command | Refresh interval |
|---|---|
| `cpu-monitor` | 1 second |
| `cpu-monitor 0.5` | 500 milliseconds |
| `cpu-monitor 2` | 2 seconds |
| `cpu-monitor 5` | 5 seconds |

Supported interval range: **0.1 to 3600 seconds**.

Press `Ctrl+C` to exit.

The interval controls the delay between monitoring iterations. Actual measurement intervals also include processing overhead.

## How It Works

### CPU Usage

Reads aggregate CPU counters from:

```text
/proc/stat
```

CPU usage is calculated from the differences between consecutive readings:

```text
CPU Usage (%) = 100 × (ΔTotal − ΔIdle) / ΔTotal
```

This avoids repeatedly invoking `top` or other monitoring programs.

### CPU Frequency

Reads reported frequencies from:

```text
/proc/cpuinfo
```

The displayed value is the arithmetic mean of the reported frequencies across logical CPUs.

**Note:** This is not necessarily the effective CPU frequency. Idle states, frequency scaling, and processor reporting behavior can affect the result.

### CPU Temperature

Reads the CPU package temperature directly from the Linux hardware monitoring subsystem:

```text
/sys/class/hwmon/
```

The script searches for the `coretemp` device and its `Package id 0` temperature sensor.

Temperature values are reported by the kernel in millidegrees Celsius and converted to degrees Celsius.

This eliminates the need to execute `sensors` on every refresh.

### Turbo Boost

Checks one of the following kernel interfaces:

```text
/sys/devices/system/cpu/intel_pstate/no_turbo
/sys/devices/system/cpu/cpufreq/boost
```

The displayed ON/OFF value represents whether Turbo Boost is permitted by the relevant driver setting.

It does **not** indicate whether the processor is actively boosting at that moment.

### CPU Power Consumption

Uses Intel Running Average Power Limit (RAPL) energy counters:

```text
/sys/class/powercap/intel-rapl:*/
```

Power is calculated from the change in accumulated energy over the elapsed measurement interval:

```text
Power (W) = ΔEnergy (J) / ΔTime (s)
```

The result represents average CPU package power over the measurement interval.

It is not the total power consumption of the laptop.

RAPL energy readings are processor-reported measurements or estimates, not external power-meter measurements.

### CPU Specifications

The CPU model and core/thread counts are obtained using `lscpu` at startup.

The following specifications are currently hardcoded for the Intel Core i5-8250U:

| Specification | Value |
|---|---|
| Base frequency | 1.60 GHz |
| Maximum Turbo frequency | 3.40 GHz |
| TDP | 15 W |

TDP (Thermal Design Power) is a thermal design specification, **not a maximum electrical power limit**.

Actual CPU package power can exceed the nominal TDP, particularly during short Turbo Boost periods.

## Performance

The monitor is designed to minimize overhead:

- CPU utilization is calculated using Bash integer arithmetic.
- Temperature and energy counters are read directly from sysfs.
- CPU model and hardware specifications are retrieved only once at startup.
- No background service or daemon is required.
- No persistent data is written to disk.
- Most runtime measurements do not require external monitoring utilities.

The script still parses `/proc/cpuinfo` and refreshes the terminal on every iteration.

Actual resource usage depends on the system and configured refresh interval. No formal performance benchmarks are currently provided.

## Troubleshooting

### CPU Power Shows `N/A`

Check whether Intel RAPL is available:

```bash
ls /sys/class/powercap/
```

Look for entries such as:

```text
intel-rapl:0
```

Check energy counter permissions:

```bash
ls -l /sys/class/powercap/intel-rapl:0/energy_uj
```

Some Linux distributions restrict access to RAPL energy counters.

For diagnostic purposes, try running the monitor with elevated privileges:

```bash
sudo cpu-monitor
```

Avoid changing system-wide device permissions unnecessarily.

### CPU Temperature Shows `N/A`

Check whether the `coretemp` driver is loaded:

```bash
lsmod | grep coretemp
```

You can attempt to load it:

```bash
sudo modprobe coretemp
```

Inspect available sensors:

```bash
ls /sys/class/hwmon/
```

The script expects a sensor labeled `Package id 0` under a `coretemp` device.

### Turbo Boost Shows `Unknown`

The expected CPU frequency scaling interfaces may be unavailable.

Check:

```bash
ls /sys/devices/system/cpu/intel_pstate/
ls /sys/devices/system/cpu/cpufreq/
```

Turbo Boost controls vary by processor, kernel version, and CPU frequency scaling driver.

## Limitations

- Currently tailored to the Intel Core i5-8250U.
- Base frequency, maximum Turbo frequency, and TDP are hardcoded.
- CPU frequency is a simple average of reported logical CPU frequencies.
- CPU temperature monitoring depends on the Intel `coretemp` driver.
- CPU power monitoring requires accessible Intel RAPL counters.
- RAPL power readings are averages over the sampling interval, not instantaneous measurements.
- Energy counter wraparound is handled for a single wrap; very long sampling intervals may cause inaccurate results if multiple wraps occur.
- No logging, historical graphs, or alerting functionality is currently included.
- Terminal output is refreshed in place and is intended for interactive use.

## Potential Improvements

- Automatic CPU specification detection
- Support for additional Intel and AMD processors
- Minimum, maximum, and average power tracking
- Thermal
