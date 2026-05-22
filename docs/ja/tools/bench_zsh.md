# 🚀 bench_zsh

`zsh -l` のログインシェル起動時間を複数回計測し、平均・最短・最長を報告します。

## 必要なもの

- `bash`, `zsh`

## 使い方

```bash
bench_zsh
```

計測回数はスクリプト内の `N=10` を編集して変更できます。

## 出力例

```
Run 1: 0.312s
Run 2: 0.298s
...
----------------------------
Average start time: 0.305s (10 runs)
Minimum: 0.290s
Maximum: 0.330s
```
