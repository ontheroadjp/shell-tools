#!/bin/bash
# numstats.sh - Compute min, max, avg, count for numbers
# Usage: ./numstats.sh [-m] [-M] [-a] [-c] [-q] [numbers...]

function print_usage() {
    echo "Usage: $0 [-m] [-M] [-a] [-c] [-q] [numbers...]"
    echo "Options:"
    echo "  -m   print minimum value"
    echo "  -M   print maximum value"
    echo "  -a   print average value"
    echo "  -c   print count"
    echo "  -q   quiet mode: print only numbers, no labels"
    echo "Numbers can be passed as arguments or via standard input."
}

# --- Parse options ---
show_min=0
show_max=0
show_avg=0
show_count=0
quiet=0

while getopts ":mMaCq" opt; do
    case $opt in
        m) show_min=1 ;;
        M) show_max=1 ;;
        a) show_avg=1 ;;
        c) show_count=1 ;;
        q) quiet=1 ;;
        \?) echo "Invalid option: -$OPTARG" >&2; print_usage; exit 1 ;;
    esac
done

shift $((OPTIND-1))

# --- Read numbers ---
nums=()
if [ $# -gt 0 ]; then
    nums=("$@")
else
    while read -r line; do
        [[ -n "$line" ]] && nums+=("$line")
    done
fi

if [ ${#nums[@]} -eq 0 ]; then
    echo "No numbers provided."
    exit 1
fi

# --- Compute statistics ---
min="${nums[0]}"
max="${nums[0]}"
sum=0

for v in "${nums[@]}"; do
    is_lt=$(echo "$v < $min" | bc -l)
    is_gt=$(echo "$v > $max" | bc -l)
    if (( is_lt )); then min="$v"; fi
    if (( is_gt )); then max="$v"; fi
    sum=$(echo "$sum + $v" | bc -l)
done

count=${#nums[@]}
avg=$(echo "scale=6; $sum / $count" | bc -l)

# --- Determine which stats to print ---
if [[ $show_min -eq 0 && $show_max -eq 0 && $show_avg -eq 0 && $show_count -eq 0 ]]; then
    show_min=1
    show_max=1
    show_avg=1
    show_count=1
fi

# --- Print statistics safely ---
output_list=()
[[ $show_min -eq 1 ]] && output_list+=("min=$min")
[[ $show_max -eq 1 ]] && output_list+=("max=$max")
[[ $show_avg -eq 1 ]] && output_list+=("avg=$avg")
[[ $show_count -eq 1 ]] && output_list+=("count=$count")

if [[ $quiet -eq 1 ]]; then
    for v in "${output_list[@]}"; do
        # ラベルを取り除いて値だけ出力
        echo "${v#*=}"
    done
else
    IFS=', '
    echo "${output_list[*]}"
    unset IFS
fi
