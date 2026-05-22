# 💻 bench_command <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

任意のシェルコマンドを複数回実行し、平均・最短・最長の実行時間を計測します。

## 必要なもの

- `zsh`, `bc`

## 使い方

```zsh
bench_command <コマンド> [回数=100]
```

## 例

```bash
# コマンドを10回計測（デフォルト）
bench_command ls
```

```
Benchmark: ls (10 runs)
  min:  0.003s
  max:  0.008s
  avg:  0.005s
```

```bash
# 計測回数を指定して実行
bench_command -n 50 "echo hello"
```

```
Benchmark: echo hello (50 runs)
  min:  0.001s
  max:  0.003s
  avg:  0.002s
```
