# 📈 numstats <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

数値リストの統計（最小値・最大値・平均値・件数）を計算します。引数または標準入力から数値を受け取ります。

## Usage

```bash
numstats [options] [numbers...]
```

| Option | Description |
|---|---|
| `-m` | 最小値 (min) を表示 |
| `-M` | 最大値 (max) を表示 |
| `-a` | 平均値 (avg) を表示 |
| `-c` | 件数 (count) を表示 |
| `-q` | ラベルなしで値のみ出力 |

オプション未指定の場合は全項目を表示します。

## Examples

### 引数として渡した数値の統計を計算

```bash
numstats 10 20 30 40 50
```

**Output:**

```
min=10,max=50,avg=30.000000,count=5
```

### 標準入力から数値をパイプ

```bash
echo -e "3.5\n7.2\n1.8\n9.4" | numstats
```

**Output:**

```
min=1.8,max=9.4,avg=5.475000,count=4
```

### 最小値と最大値だけ表示

```bash
numstats -m -M 5 10 15 20 25
```

**Output:**

```
min=5, max=25
```

### 静粛モード（ラベルなしで値のみ出力）

```bash
numstats -q -m -M 10 20 30
```

**Output:**

```
10
30
```
