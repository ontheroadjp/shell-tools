#!/usr/bin/env bats

SELF=$(cd $(dirname $0); pwd)
#TMP_DIR="${SELF}/tmp_dammy_bats"
TMP_DIR="$(pwd)/tmp_dammy_bats"

setup() {
    echo 'mkdir:'
    mkdir -p "${TMP_DIR}"
}

teardown() {
    rm -rf ${TMP_DIR}
}

@test "Status code is 0 when run with no argument" {
    cd ${TMP_DIR}
    run dammy
    [ ${status} -eq 0 ]
}

@test "1 file appear when run with no argument" {
    cd ${TMP_DIR}
    run dammy
    num=$(find . -type f -maxdepth 1 | wc -l | xargs)
    [ ${num} -eq 1 ]
}

@test "-n option working well: 3 files appear (-n 3)" {
    cd ${TMP_DIR}
    run dammy -n 3
    num=$(find . -type f -maxdepth 1 | wc -l | xargs)
    [ ${num} -eq 3 ]
}

@test "-e option working well: 3 files appear (-n 5 -e jpg)" {
    cd ${TMP_DIR}
    run dammy -n 5 -e jpg
    num=$(find . -type f -maxdepth 1 -name '*.jpg' | wc -l | xargs)
    [ ${num} -eq 5 ]
}

@test "--cold-run option working well: 0 files appear (-n 5 -e jpg --cold-run)" {
    cd ${TMP_DIR}
    run dammy -n 5 -e jpg --cold-run
    num=$(find . -type f -maxdepth 1 -name '*.jpg' | wc -l | xargs)
    [ ${num} -eq 0 ]
}

@test "Create directoris hoge/foo: 10 files appear in hoge/foo dir. (-n 10 hoge/foo)" {
    cd ${TMP_DIR}
    run dammy -n 10 hoge/foo
    num=$(find . -type f -maxdepth 3 | wc -l | xargs)
    [ ${num} -eq 10 ]
}

@test "-each option working well: 21 files appear (hoge/foo/bar -n 7 --each)" {
    cd ${TMP_DIR}
    run dammy -n 7 hoge/foo/bar --each
    num=$(find . -type f -maxdepth 4 | wc -l | xargs)
    [ ${num} -eq 21 ]
}

