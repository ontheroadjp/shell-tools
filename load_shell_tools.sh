# ----------------------------------------------------
# Shell Scripts
# ----------------------------------------------------
# backup
source ${SHELL_TOOLS_ROOT}/shell_functions/backup/backup.fnc

# colors
source ${SHELL_TOOLS_ROOT}/shell_functions/colors/colors.fnc

# counts
source ${SHELL_TOOLS_ROOT}/shell_functions/counts/counts.fnc

# dictionary
source ${SHELL_TOOLS_ROOT}/shell_functions/dictionary/dictionary.fnc

# dirmarks
export DIRMARKS_DATA_DIR="${SHELL_TOOLS_ROOT}/shell_functions/dirmarks/data"
source ${SHELL_TOOLS_ROOT}/shell_functions/dirmarks/dirmarks.fnc

# holiday
source ${SHELL_TOOLS_ROOT}/shell_functions/holiday/holiday.fnc

# quick-memo
export QUICK_MEMO_DATA_DIR="${SHELL_TOOLS_ROOT}/shell_functions/quick-memo/data"
source ${SHELL_TOOLS_ROOT}/shell_functions/quick-memo/quick-memo.fnc

# shell-stash
export SHELL_STASH_DATA_DIR="${SHELL_TOOLS_ROOT}/shell_functions/shell-stash/data"
source ${SHELL_TOOLS_ROOT}/shell_functions/shell-stash/shell-stash.fnc

# timer
source ${SHELL_TOOLS_ROOT}/shell_functions/timer/timer.fnc

# wareki
source ${SHELL_TOOLS_ROOT}/shell_functions/wareki/wareki.fnc

# weather
source ${SHELL_TOOLS_ROOT}/shell_functions/weather/weather.fnc

# world time
source ${SHELL_TOOLS_ROOT}/shell_functions/worldtime/worldtime.fnc

# today
source ${SHELL_TOOLS_ROOT}/shell_functions/today/today.fnc

# wifi health check
source ${SHELL_TOOLS_ROOT}/shell_functions/wifi-helth-check/wifi-helth-check.fnc

# yubin
export YUBIN_DATA_DIR="${SHELL_TOOLS_ROOT}/shell_functions/yubin/data"
source ${SHELL_TOOLS_ROOT}/shell_functions/yubin/yubin.fnc

# ----------------------------------------------------
# Python Scripts
# ----------------------------------------------------
# dictionary
alias pdict="python ${SHELL_TOOLS_ROOT}/python_scripts/dictionary/dictionary.py"
alias dictp="python ${SHELL_TOOLS_ROOT}/python_scripts/dictionary/dictionary.py"

# fix filename
alias fix="python ${SHELL_TOOLS_ROOT}/python_scripts/fix-filename/fix-filename.py"

