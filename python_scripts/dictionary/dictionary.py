#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
import sys
from DictionaryServices import DCSCopyTextDefinition


def look_up(word):
    """macOS 辞書から単語を引く"""
    return DCSCopyTextDefinition(None, word, (0, len(word)))


def format_for_j_to_e(line):
    """日本語 → 英語 辞書結果を整形"""
    line = re.sub(r'([ぁ-んァ-ン一-龥])\s*([a-zA-Z])', r'\1\n\2', line)
    line = re.sub(r'([a-zA-Z.\)!?])\s*([ぁ-んァ-ン一-龥▸])', r'\1\n\n\2', line)
    line = re.sub(r'(名詞|動詞|形容詞|副詞)', r'\1\n', line)
    return '\n' + line


def format_for_e_to_j(line):
    """英語 → 日本語 辞書結果を整形"""
    line = re.sub(r'([0-9] )', r'\n\n\1', line)
    line = re.sub(r'(名詞|動詞|形容詞|他動詞|接頭辞|副詞)', r'\n\n\1\n ', line)
    line = re.sub(r'(▸)', r'\n\1 ', line)
    return '\n' + line


def process(word):
    """単語の言語を判定して処理"""
    result = look_up(word)
    if not result:
        print(f'⚠️ "{word}" は辞書で見つかりませんでした。')
        return

    if re.match(r'[a-zA-Z]', word):
        print(format_for_e_to_j(result))
    else:
        print(format_for_j_to_e(result))


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: python3 dictionary.py <word>")
        sys.exit(1)

    word = sys.argv[1]
    process(word)

