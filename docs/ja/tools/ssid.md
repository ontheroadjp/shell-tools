# 📡 ssid <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

現在接続中の Wi-Fi SSID を表示します。

## 必要環境

- macOS: `airport`（組み込み）
- Linux: `iwgetid` または `nmcli`

## 使い方

```bash
ssid
```

## 例

### 現在の SSID を表示

```bash
ssid
```

**Output:**

```
MyHomeWifi
```

### 未接続の場合

```bash
ssid
```

**Output:**

```
no_wifi
```

## 備考

- macOS: `airport` ユーティリティを使用。
- Linux: `iwgetid` を試み、失敗時は `nmcli` にフォールバック。
- 未接続時は `no_wifi` を出力し、終了コード `1` で終了。
