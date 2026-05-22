# 📈 numstats <Badge type="tip" text="Shell" />

计算数字列表的统计信息（最小值、最大值、平均值、数量）。可通过参数或标准输入传入数字。

## 用法

```bash
numstats [选项] [数字...]
```

| 选项 | 说明 |
|---|---|
| `-m` | 显示最小值 |
| `-M` | 显示最大值 |
| `-a` | 显示平均值 |
| `-c` | 显示数量 |
| `-q` | 静默模式：仅输出数值，不显示标签 |

不指定选项时，显示全部统计信息。

## 示例

```bash
numstats 10 20 30 40 50
# → min=10, max=50, avg=30.000000, count=5

numstats -Ma 10 20 30

echo -e "5\n10\n15" | numstats

cat scores.txt | numstats -a

numstats -mq 10 20 30
# → 10
```
