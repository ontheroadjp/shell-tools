# 📊 bench_function <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

Zsh ファイルをソースして、指定した関数の実行時間を複数回計測します。

## 必要なもの

- `zsh`, `bc`

## 使い方

```zsh
bench_function <関数ファイル> <関数名> [回数=100] [引数...]
```

## 例

### Zsh 関数を10回計測

```bash
bench_function my_func
```

**Output:**

```
📊 function: my_func
🔁 times: 100
⏱️ average: 0.000123s
⚡ Shortest: 0.000089s
🐢 longest: 0.000201s
```
