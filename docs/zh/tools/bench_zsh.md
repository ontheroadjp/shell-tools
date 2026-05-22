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

```bash
# 测量 Zsh 启动时间（10 次）
bench_zsh
```

```
Zsh startup time (10 runs):
  min:  0.124s
  max:  0.201s
  avg:  0.158s
```
