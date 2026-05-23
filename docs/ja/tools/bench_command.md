# 💻 bench_command <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

任意のシェルコマンドを複数回実行し、平均・最短・最長の実行時間を計測します。

## 必要なもの

- `zsh`, `bc`

## 使い方

```zsh
bench_command <コマンド> [回数=100]
```

## 例

### コマンドを100回計測（デフォルト）

```bash
bench_command ls
```

**Output:**

```
💻 コマンド: ls
🔁 回数: 100
⏱️ 平均: 0.000005s
⚡ 最短: 0.000003s
🐢 最長: 0.000008s
```

### 計測回数を指定して実行

```bash
bench_command "echo hello" 50
```

**Output:**

```
💻 コマンド: echo hello
🔁 回数: 50
⏱️ 平均: 0.000002s
⚡ 最短: 0.000001s
🐢 最長: 0.000004s
```
