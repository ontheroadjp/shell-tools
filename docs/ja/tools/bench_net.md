# 🌐 bench_net <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

speedtest.net を使ってネットワークのダウンロード・アップロード速度を計測します。

## 必要なもの

- Python 2 または 3

## 使い方

```bash
bench_net
```

## 例

### speedtest.net でネットワーク速度を計測

```bash
bench_net
```

**Output:**

```
Ping: 12.34 ms
Download: 487.32 Mbit/s
Upload: 198.54 Mbit/s
```

## メモ

- 内部的に speedtest-cli プロトコルを使用しています。
- 結果はサーバーの負荷や回線状況によって変動します。
