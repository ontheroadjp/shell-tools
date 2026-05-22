# 📊 bench_function

Zsh ファイルをソースして、指定した関数の実行時間を複数回計測します。

## 必要なもの

- `zsh`, `bc`

## 使い方

```zsh
bench_function <関数ファイル> <関数名> [回数=100] [引数...]
```

## 例

```zsh
bench_function ~/.zshrc __git_ps1_update_fast 100
bench_function ./myfunc.zsh myfunc 50 arg1 arg2
```

## 出力例

```
📊 function: myfunc
🔁 times: 50
⏱️ average: 0.002345s
⚡ Shortest: 0.001900s
🐢 longest: 0.005100s
```
