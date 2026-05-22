# 🌐 bench_net <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

speedtest.net を使ってネットワークのダウンロード・アップロード速度を計測します。

## 必要なもの

- Python 2 または 3

## 使い方

```bash
bench_net
```

## 例

```bash
# speedtest.net でネットワーク速度を計測
bench_net
```

```
Download: 487.32 Mbps
Upload:   198.54 Mbps
```

## メモ

- 内部的に speedtest-cli プロトコルを使用しています。
- 結果はサーバーの負荷や回線状況によって変動します。
