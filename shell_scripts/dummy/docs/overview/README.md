# Overview

## What's dammy ?
This shell script builds a directory tree. With this script, there is no need to build a directory tree by using commands such as mkdir or touch.

In system development where files and directories are read from directories, this can greatly reduce the time and effort required to build a directory tree for testing.

## Main Features
- Create multi-level directories
- Create files in the created directory.
- The files created can contain symbols and spaces.

## Example
Just run this command...

```bash
dammy hoge/{foo,bar}/piyo -n 3 --each --with-whitespace
```

A directory tree will be constructed as shown below.

Inside the ``hoge`` directory, we create the ``foo`` directory, and under the ``foo`` directory, we create the ``piyo`` directory.

In each of these directories, three files with blank/symbolic filenames are created.

At the same time, using bash's brace expansion, it creates a ``bar`` directory inside the ``hoge`` directory and a ``piyo`` directory under it, and creates three files with blank/symbolic filenames in each of these directories.

```bash
hoge
├── ) R a Y A .txt
├── H t 8 9 h .txt
├── \ U X , ! .txt
├── bar
│   ├── ! + w 2 q .txt
│   ├── , ) R ; c .txt
│   ├── d P 9 6 i .txt
│   └── piyo
│       ├── % U 2 P L .txt
│       ├── 5 R J j c .txt
│       └── O S : 3 E .txt
├── d M 6 2 x .txt
├── foo
│   ├── $ A P H _ .txt
│   ├── J Z d ' a .txt
│   ├── i W S _ 1 .txt
│   └── piyo
│       ├── : L w & I .txt
│       ├── A e @ j & .txt
│       └── r W 2 * ( .txt
├── v @ R q j .txt
└── y g R , 9 .txt
```
