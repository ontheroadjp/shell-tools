# 🚀 bench_zsh

多次测量 `zsh -l` 登录 Shell 的启动时间，并报告平均、最短和最长耗时。

## 依赖

- `bash`, `zsh`

## 用法

```bash
bench_zsh
```

修改脚本中的 `N=10` 可更改测量次数。

## 输出示例

```
Run 1: 0.312s
Run 2: 0.298s
...
----------------------------
Average start time: 0.305s (10 runs)
Minimum: 0.290s
Maximum: 0.330s
```
