# 🚀 bench_zsh <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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
