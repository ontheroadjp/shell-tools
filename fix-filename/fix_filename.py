#!/usr/local/var/pyenv/shims/python
# -*- coding: utf-8 -*-

import argparse
import os
from pathlib import Path
import glob
import unicodedata

SELF = os.path.basename(__file__)

def _init():
    parser = argparse.ArgumentParser(
        prog = SELF
        , usage='python ' + SELF +  '<dir>'
        , description = 'This script fix filename.'
        , epilog='end'
        , add_help=True
    )
    parser.add_argument('-d', '--directory'
        , type = Path
        , default = './'
        , help = 'Target directory'
    )
    args = parser.parse_args()
    return args

def normalize(filename):
    out = unicodedata.normalize("NFKC", filename).replace(' ', '_')
    return out.strip()

def main(ini):
    dir_path = ini.directory
    files = glob.glob(os.path.join(dir_path, "*.jpg"))
    for file in files:
        old = os.path.basename(file)
        new = normalize(old)
        old_path = os.path.join(dir_path, old)
        new_path = os.path.join(dir_path, new)
        os.rename(old_path, new_path)
#        print(bool(old != new), end = ': ')
#        print(old, end = ' => ')
#        print(new)

main(_init())
print('All done.')
