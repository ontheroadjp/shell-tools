# Usage

If you haven't installed it yet, please do so first.

After the installation is complete, let's try using dammy.

## Generating a file

When the dammy command is executed, a dummy file will be created in the directory where it was executed.

```bash
$ dammy
$ tree
.
└── 0hi)_mB.wf.txt
```

### Number of files to generate

The number of files to be generated can be changed with the ``-n`` option.

```bash
$ dammy -n 3
$ tree
.
├── $qxT2+_'uW.txt
├── pdK:gXwu.Q.txt
└── tl4NUT(q7b.txt
```

### Extension of the generated file

You can change the extension of the generated file by adding the ``-e`` option.

```bash
$ dammy -n 3 -e jpg
$ tree
.
├── ;mSu179.QE.jpg
├── JGElYbT3d\.jpg
└── tyP+\woXGQ.jpg
```

### Symbol-free file names

By giving the ``--no-symbol`` option, files are generated with file names that do not contain symbols.

```bash
$ dammy -n 3 --no-symbol
$ tree
.
├── Q5aocxH9uI.txt
├── TfxZIic3Rg.txt
└── ucmiz657Ae.txt
```

### File names with whitespace

The ``--with-whitespace`` option is used to generate files with whitespace in the file name.


```bash
$ dammy -n 3 --with-whitespace
$ tree
.
├── J L $ A ( .txt
├── T w N V c .txt
└── V n 0 ) Z .txt
```

## Creating a directory

When you pass the argument to ``dammy``, a directory will be created and a file will be created in it.

```bash
$ dammy hoge
$ tree
.
└── hoge
    └── YQ_7eEW5bH.txt
```

It is not possible to generate only directories. If you want to generate only a directory, use mkdir.

:::TIP
Of course, the ``-e`` and ``-n`` options can be used together.
:::

### Multiple Directories

It is also possible to create multiple directories at the same time.

```bash
$ dammy hoge foo bar
$ tree
.
├── bar
│   └── J(q=E.@Ma0.txt
├── foo
│   └── x&bY,2s)qg.txt
└── hoge
    └── 9BcTRkOgLw.txt
```

### Nesting

Directories can be nested. There is no need to create the directories in advance.

```bash
$ dammy hoge/foo/bar
tree
.
└── hoge
    └── foo
        └── bar
            └── :w9a@DmC~N.txt
```

When the --each option is given, a file will be created in each directory.

```bash
$ dammy hoge/foo/bar --each
$ tree
.
└── hoge
    ├── foo
    │   ├── &dGzWh!F2f.txt
    │   └── bar
    │       └── %\'fRw2z,h.txt
    └── yLv*lTz\BG.txt
```

## Shell brace expansion.

``dammy`` can also be combined with brace expansion of the shell.

```bash
$ dammy hoge/{foo,bar}/piyo
$ tree
.
└── hoge
    ├── bar
    │   └── piyo
    │       └── ey\%lAFx2V.txt
    └── foo
        └── piyo
            └── 9k~MYXwoH!.txt
```

## cold run

When the ``--cold-run`` option is given, no files/directories are actually created.

Instead, the contents of the directory tree that would be generated without the ``--cold-run`` option will be displayed.

If there are no problems, just remove the ``--cold-run`` option and run the dammy command.

```bash
$ dammy hoge/{foo,bar}/piyo --each -n 3 --cold-run
.
└── hoge
    ├── +_60SaTUoh.txt
    ├── COrDP*WZ2X.txt
    ├── S:0myGYPX(.txt
    ├── bar
    │   ├── 9\\=o7y5):e.txt
    │   ├── CJso1@z)ZD.txt
    │   ├── Lg7)ruOtbH.txt
    │   └── piyo
    │       ├── &:u-BmLSa3.txt
    │       ├── _j,eoIl1nZ.txt
    │       └── gd,5xhU(!o.txt
    ├── d6g.pTULy9.txt
    ├── foo
    │   ├── 0A)T=qK@Uh.txt
    │   ├── R8*.40;B_u.txt
    │   ├── kd$%K,)24l.txt
    │   └── piyo
    │       ├── (\\3p0ibK1S.txt
    │       ├── B0dGSQxzmv.txt
    │       └── ~L3\\SGc$X9.txt
    ├── n(x5@_alTr.txt
    └── nCH:qsx\\(f.txt

5 directories, 18 files
```

## Options

```bash
Options:
  -h, --help                     Show help
  -v, --version                  Show script version
  -n, --number                   Specify the number of files to create
  -e, --ext                      Specify the extension of the file to be created
      --with-whitespace          Contain whitespace characters
      --no-symbol                Contain symbol characters
      --each                     Create a file in the specified intermediate directory
      --cold-run                 Run script as test running
      --verbose                  Print various logging information
```
