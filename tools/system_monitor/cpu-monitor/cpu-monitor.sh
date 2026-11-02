#!/usr/bin/env bash

set -euo pipefail
export LC_ALL=C

# ============================================================
# Configuration
# ============================================================

INTERVAL="${1:-1}"

usage() {
    echo "Usage: $(basename "$0") [interval_seconds]" >&2
    echo "Example: $(basename "$0") 0.5" >&2
    exit 1
}

if (( $# > 1 )) ||
   [[ ! "$INTERVAL" =~ ^([0-9]+([.][0-9]*)?|[.][0-9]+)$ ]] ||
   ! awk -v n="$INTERVAL" 'BEGIN {exit !(n >= 0.1 && n <= 3600)}'; then
    usage
fi

# ============================================================
# CPU Specifications
# ============================================================

CPU_MODEL=$(lscpu | sed -n \
    's/^[[:space:]]*Model name:[[:space:]]*//p' | head -1)

CPU_CORES=$(lscpu -p=CORE,SOCKET |
    grep -v '^#' | sort -u | wc -l)

CPU_THREADS=$(lscpu -p=CPU | grep -vc '^#')

# Intel Core i5-8250U specifications (fixed values)
CPU_BASE="1.60"
CPU_TURBO_MAX="3.40"
CPU_TDP="15"

# ============================================================
# Turbo Boost
# ============================================================

TURBO_PATH=""
TURBO_INVERT=0

if [[ -r /sys/devices/system/cpu/intel_pstate/no_turbo ]]; then
    TURBO_PATH="/sys/devices/system/cpu/intel_pstate/no_turbo"
    TURBO_INVERT=1
elif [[ -r /sys/devices/system/cpu/cpufreq/boost ]]; then
    TURBO_PATH="/sys/devices/system/cpu/cpufreq/boost"
fi

get_turbo() {
    local value

    if [[ -z "$TURBO_PATH" ]]; then
        TURBO="Unknown"
        return
    fi

    value=$(<"$TURBO_PATH")

    if [[ "$value" == "$TURBO_INVERT" ]]; then
        TURBO="OFF"
    else
        TURBO="ON"
    fi
}

# ============================================================
# CPU Temperature (hwmon / coretemp)
# ============================================================

TEMP_PATH=""

for hwmon in /sys/class/hwmon/hwmon*; do
    [[ -r "$hwmon/name" ]] || continue
    [[ $(<"$hwmon/name") == "coretemp" ]] || continue

    for label in "$hwmon"/temp*_label; do
        [[ -r "$label" ]] || continue

        if [[ $(<"$label") == "Package id 0" ]]; then
            TEMP_PATH="${label%_label}_input"
            break 2
        fi
    done
done

get_temperature() {
    if [[ -n "$TEMP_PATH" && -r "$TEMP_PATH" ]]; then
        local millideg
        millideg=$(<"$TEMP_PATH")
        printf -v TEMPERATURE '%d.%d°C' \
            "$((millideg / 1000))" \
            "$(((millideg % 1000) / 100))"
    else
        TEMPERATURE="N/A"
    fi
}

# ============================================================
# Intel RAPL (CPU package energy)
# ============================================================

RAPL_PATH=""
MAX_ENERGY=0

for path in /sys/class/powercap/intel-rapl:*; do
    [[ -r "$path/name" ]] || continue

    if [[ $(<"$path/name") == package-* ]]; then
        if [[ -r "$path/energy_uj" &&
              -r "$path/max_energy_range_uj" ]]; then
            RAPL_PATH="$path/energy_uj"
            MAX_ENERGY=$(<"$path/max_energy_range_uj")
        fi
        break
    fi
done

# ============================================================
# CPU Usage (/proc/stat)
# ============================================================

read_cpu() {
    local cpu user nice system idle iowait irq softirq steal rest

    read -r cpu user nice system idle iowait irq softirq steal rest \
        < /proc/stat

    CPU_IDLE=$((idle + iowait))
    CPU_TOTAL=$((user + nice + system + idle +
                 iowait + irq + softirq + steal))
}

# ============================================================
# CPU Frequency (/proc/cpuinfo)
# ============================================================

get_frequency() {
    local line mhz
    local sum=0 count=0

    while IFS= read -r line; do
        if [[ "$line" =~ ^cpu[[:space:]]MHz[[:space:]]*:[[:space:]]*([0-9]+) ]]; then
            mhz=${BASH_REMATCH[1]}
            sum=$((sum + mhz))
            count=$((count + 1))
        fi
    done < /proc/cpuinfo

    if ((count > 0)); then
        local avg_mhz=$((sum / count))
        printf -v FREQUENCY '%d.%02d GHz (avg)' \
            "$((avg_mhz / 1000))" \
            "$(((avg_mhz % 1000) / 10))"
    else
        FREQUENCY="N/A"
    fi
}

# ============================================================
# Initialize counters
# ============================================================

read_cpu
PREV_IDLE=$CPU_IDLE
PREV_TOTAL=$CPU_TOTAL

PREV_ENERGY=""

if [[ -n "$RAPL_PATH" ]]; then
    PREV_ENERGY=$(<"$RAPL_PATH")
fi

# Bash 5+ high-resolution timestamp
get_time() {
    local sec frac
    sec=${EPOCHREALTIME%.*}
    frac=${EPOCHREALTIME#*.}
    TIME_US=$((10#$sec * 1000000 + 10#$frac))
}

get_time
PREV_TIME=$TIME_US

# Restore cursor on exit
trap 'printf "\033[?25h"' EXIT
printf '\033[?25l'

# ============================================================
# Monitoring Loop
# ============================================================

while true; do
    sleep "$INTERVAL"

    get_time
    ELAPSED_US=$((TIME_US - PREV_TIME))
    PREV_TIME=$TIME_US

    # --------------------------------------------------------
    # CPU Usage
    # --------------------------------------------------------

    read_cpu

    DIFF_IDLE=$((CPU_IDLE - PREV_IDLE))
    DIFF_TOTAL=$((CPU_TOTAL - PREV_TOTAL))

    PREV_IDLE=$CPU_IDLE
    PREV_TOTAL=$CPU_TOTAL

    if ((DIFF_TOTAL > 0)); then
        USAGE_X10=$((1000 * (DIFF_TOTAL - DIFF_IDLE) /
                     DIFF_TOTAL))
    else
        USAGE_X10=0
    fi

    printf -v USAGE '%d.%d%%' \
        "$((USAGE_X10 / 10))" \
        "$((USAGE_X10 % 10))"

    # --------------------------------------------------------
    # CPU Frequency, Turbo, Temperature
    # --------------------------------------------------------

    get_frequency
    get_turbo
    get_temperature

    # --------------------------------------------------------
    # CPU Power (RAPL)
    # --------------------------------------------------------

    POWER="N/A"

    if [[ -n "$RAPL_PATH" ]]; then
        ENERGY=$(<"$RAPL_PATH")

        if [[ -n "$PREV_ENERGY" && $ELAPSED_US -gt 0 ]]; then
            DIFF_ENERGY=$((ENERGY - PREV_ENERGY))

            if ((DIFF_ENERGY < 0)); then
                DIFF_ENERGY=$((DIFF_ENERGY + MAX_ENERGY))
            fi

            if ((DIFF_ENERGY >= 0)); then
                # energy: microjoules
                # time: microseconds
                # result: watts x 100
                POWER_X100=$((DIFF_ENERGY * 100 /
                              ELAPSED_US))

                printf -v POWER '%d.%02d W' \
                    "$((POWER_X100 / 100))" \
                    "$((POWER_X100 % 100))"
            fi
        fi

        PREV_ENERGY=$ENERGY
    fi

    # --------------------------------------------------------
    # Display
    # --------------------------------------------------------

    printf '\033[H\033[J'

    printf 'CPU: %s\n\n' "$CPU_MODEL"

    echo "=== Specifications ==="
    printf 'Cores / Threads : %s / %s\n' \
        "$CPU_CORES" "$CPU_THREADS"
    printf 'Base Frequency  : %s GHz\n' "$CPU_BASE"
    printf 'Max Turbo       : %s GHz\n' "$CPU_TURBO_MAX"
    printf 'TDP             : %s W\n' "$CPU_TDP"

    echo
    echo "=== Current Status ==="
    printf 'CPU Usage       : %s\n' "$USAGE"
    printf 'CPU Frequency   : %s\n' "$FREQUENCY"
    printf 'Turbo Boost     : %s\n' "$TURBO"
    printf 'CPU Temperature : %s\n' "$TEMPERATURE"
    printf 'CPU Power       : %s\n' "$POWER"
    printf 'Update Interval : %ss\n' "$INTERVAL"

done
