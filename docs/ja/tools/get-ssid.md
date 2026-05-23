# 📶 get-ssid <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span> <span class="tc-badge tc-badge-tmux">tmux</span>

tmux ステータスバー向けに Wi-Fi SSID を整形して出力します。macOS では電波強度インジケーター付きです。

## 必要環境

- macOS: `airport`（組み込み）
- Linux: `iwgetid` または `nmcli`

## 使い方

```bash
get-ssid
```

tmux の `status-right` または `status-left` から呼び出して使います。

## 例

### 接続中（macOS — 電波強度バー付き）

```bash
get-ssid
```

**Output:**

```
#[bold]|#[default] #[underscore]MyHomeWifi#[default] | ▁▂▄▆ #[fg=colour014]|#[default]
```

### 接続中（Linux）

```bash
get-ssid
```

**Output:**

```
#[bold]|#[default] #[underscore]MyHomeWifi#[default] #[fg=colour014]|#[default]
```

### 未接続

```bash
get-ssid
```

**Output:**

```
#[fg=red] ✘  
```

## 備考

- macOS: RSSI をもとに電波強度バー（`▁▂▄▆█`）を表示。
- 出力には tmux カラーディレクティブ（`#[...]`）が含まれます。tmux ステータスバー専用です。
