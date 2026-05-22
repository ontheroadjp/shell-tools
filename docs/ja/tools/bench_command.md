# 💻 bench_command <Badge type="tip" text="Shell" />

任意のシェルコマンドを複数回実行し、平均・最短・最長の実行時間を計測します。

## 必要なもの

- `zsh`, `bc`

## 使い方

```zsh
bench_command <コマンド> [回数=100]
```

## 例

```zsh
bench_command "git status --porcelain" 50
bench_command "ls -l" 100
```

## 出力例

```
💻 コマンド: git status --porcelain
🔁 回数: 50
⏱️ 平均: 0.012345s
⚡ 最短: 0.010123s
🐢 最長: 0.018456s
```
