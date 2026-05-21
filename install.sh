#!/bin/bash

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
BIN_DIR="${HOME}/dotfiles/bin"

mkdir -p "${BIN_DIR}"

linked=0
skipped=0
errors=0

for script in "${REPO_ROOT}"/shell_scripts/*/*.sh; do
    name="$(basename "${script}" .sh)"
    link="${BIN_DIR}/${name}"

    if [ -L "${link}" ]; then
        echo "skip:   ${name} (symlink already exists)"
        (( skipped++ ))
    elif [ -e "${link}" ]; then
        echo "error:  ${name} (file already exists, not a symlink)"
        (( errors++ ))
    else
        ln -s "${script}" "${link}"
        echo "linked: ${name}"
        (( linked++ ))
    fi
done

echo ""
echo "done. linked=${linked} skipped=${skipped} errors=${errors}"
