# 🔊 get-volume <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span> <span class="tc-badge tc-badge-tmux">tmux</span>

システム音量を tmux ステータスバー向けのバー形式で出力します。

## 必要環境

- macOS: `osascript`（組み込み）
- Linux: `pactl` または `amixer`

## 使い方

```bash
get-volume
```

tmux の `status-right` または `status-left` から呼び出して使います。

## 例

### 音量 75% の場合

```bash
get-volume
```

**Output:**

```
#[bold][■■■■■■■■■■■■        ]#[default]
```

### ミュート中

```bash
get-volume
```

**Output:**

```
#[bold][   mute   ]#[default]
```

## 備考

- macOS: `osascript` で音量設定を取得。
- Linux: `pactl` を試み、失敗時は `amixer` にフォールバック。
- 出力には tmux カラーディレクティブ（`#[...]`）が含まれます。tmux ステータスバー専用です。
- バーの幅は 16 セルです。
