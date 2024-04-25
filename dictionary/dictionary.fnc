function _dict-word-example() {
  w3m "http://ejje.weblio.jp/content/$1" | grep "用例"
}

function _run_dictionary() {
    ${TOOLSPATH}/dictionary/lib/dictionary.swift ${1}
    _dict-word-example ${1}
}

alias dict="_run_dictionary" ${1}
