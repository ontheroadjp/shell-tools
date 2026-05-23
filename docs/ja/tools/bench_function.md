# 📊 bench_function <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
