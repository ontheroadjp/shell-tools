# 🚀 bench_zsh <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

`zsh -l` のログインシェル起動時間を複数回計測し、平均・最短・最長を報告します。

## 必要なもの

- `bash`, `zsh`

## 使い方

```bash
bench_zsh
```

計測回数はスクリプト内の `N=10` を編集して変更できます。

## 例

### Zsh の起動時間を計測（10回）

```bash
bench_zsh
```

**Output:**

```
Zsh startup time (10 runs):
  min:  0.124s
  max:  0.201s
  avg:  0.158s
```
