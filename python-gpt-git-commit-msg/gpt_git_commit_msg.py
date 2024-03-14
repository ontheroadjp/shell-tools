#!/usr/local/var/pyenv/shims/python
# -*- coding: utf-8 -*-

import argparse
import os
import sys
import subprocess

SELF = os.path.basename(__file__)

def _init():
    parser = argparse.ArgumentParser(
        prog = SELF
        , usage='python ' + SELF
        , description = 'This script is python script.'
        , epilog='end'
        , add_help=True
    )
    parser.add_argument('command'
        , default = 'diff --cached'
        , help = 'command'
    )
    args = parser.parse_args()
    return args


def _shell_command(command):
    process = (subprocess.Popen(command,
                stdout=subprocess.PIPE
                , shell=True).communicate()[0]).decode('utf-8')
    return '### result of ' + command + '\n' + process


def main(ini):
    pre_prompts = {
        'diff': '''Generate git commit messages for the following diff output.
Each commit message must be one line starting with one of the following words.
    * [NEW]: (new feature for the user, not a new feature for build script)
    * [ADD]: (Add to the new file)
    * [CHANGE]: (changes to the source codes)
    * [REMOVE]: (remove something)
    * [UPDATE]: (updating function etc)
    * [FIX]: (bug fix for the user, not a fix to a build script)
    * [DOC]: (changes to the documentation)
    * [STYLE]: (formatting, missing semi colons, etc; no production code change)
    * [REFACTOR]: (refactoring production code, eg. renaming a variable)
    * [TEST]: (adding missing tests, refactoring tests; no production code change)
'''
    }

    result = _shell_command('git ' + ini.command)
    print(pre_prompts[ini.command] + '\n' + result)

main(_init())
