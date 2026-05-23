# 🚀 bench_zsh <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

多次测量 `zsh -l` 登录 Shell 的启动时间，并报告平均、最短和最长耗时。

## 依赖

- `bash`, `zsh`

## 用法

```bash
bench_zsh
```

修改脚本中的 `N=10` 可更改测量次数。

## 示例

### 测量 Zsh 启动时间（10 次）

```bash
bench_zsh
```

**Output:**

```
Run 1: 0.037s
Run 2: 0.019s
Run 3: 0.019s
Run 4: 0.020s
Run 5: 0.017s
Run 6: 0.020s
Run 7: 0.018s
Run 8: 0.019s
Run 9: 0.016s
Run 10: 0.020s
----------------------------
Average start time: 0.020s (10backs)
Minimum: 0.016s
Maximum: 0.037s
```
