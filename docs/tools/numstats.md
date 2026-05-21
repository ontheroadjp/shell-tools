# numstats

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
# 引数で指定
numstats 10 20 30 40 50
# → min=10, max=50, avg=30.000000, count=5

# 最大値と平均値だけ表示
numstats -Ma 10 20 30

# 標準入力から読み込み
echo -e "5\n10\n15" | numstats

# パイプと組み合わせ
cat scores.txt | numstats -a

# ラベルなしで値だけ出力（スクリプト組み込み用）
numstats -mq 10 20 30
# → 10
```
