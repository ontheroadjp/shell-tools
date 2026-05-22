# 📈 numstats <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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

```bash
# 引数として渡した数値の統計を計算
numstats 10 20 30 40 50
```

```
min=10, max=50, avg=30.000000, count=5
```

```bash
# 標準入力から数値をパイプ
echo -e "3.5\n7.2\n1.8\n9.4" | numstats
```

```
min=1.8, max=9.4, avg=5.475000, count=4
```

```bash
# 最小値と最大値だけ表示
numstats -m -M 5 10 15 20 25
```

```
min=5, max=25
```

```bash
# 静粛モード（ラベルなしで値のみ出力）
numstats -q -m -M 10 20 30
```

```
10
30
```
