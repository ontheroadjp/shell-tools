# 📈 numstats <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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

### 计算通过参数传入的数字统计信息

```bash
numstats 10 20 30 40 50
```

**Output:**

```
min=10,max=50,avg=30.000000,count=5
```

### 通过管道传入数字

```bash
echo -e "3.5\n7.2\n1.8\n9.4" | numstats
```

**Output:**

```
min=1.8,max=9.4,avg=5.475000,count=4
```

### 仅显示最小值和最大值

```bash
numstats -m -M 5 10 15 20 25
```

**Output:**

```
min=5, max=25
```

### 静默模式（仅输出数值，不显示标签）

```bash
numstats -q -m -M 10 20 30
```

**Output:**

```
10
30
```
