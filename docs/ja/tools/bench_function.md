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
Benchmark: my_func (10 runs)
  min:  0.012s
  max:  0.025s
  avg:  0.018s
```
