# 🔋 battery <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span> <span class="tc-badge tc-badge-tmux">tmux</span>

バッテリー残量と残り時間を表示します。プレーン・ANSIカラー・tmuxカラー出力に対応しています。

## 使い方

```bash
battery [-p] [-t] [-c [tmux]]
```

| オプション | 説明 |
|---|---|
| (なし) または `-p` | バッテリー残量（%）を表示 |
| `-t` | 残り時間を表示 |
| `-c` | ANSIカラーで出力 |
| `-c tmux` | tmux ステータスバー用カラーで出力 |

## 例

### バッテリー残量を表示

```bash
battery
```

**Output:**

```
87%
```

### 残量と残り時間を表示

```bash
battery -pt
```

**Output:**

```
87% 3:42
```

### tmux ステータスバー用カラー出力

```bash
battery -c tmux
```

**Output:**

```
#[fg=blue]87%#[default]
```

## 備考

- macOS: `pmset` または `ioreg` を使用。
- Linux: `/sys/class/power_supply/BAT0`（または `BAT1`）から読み取り。
- tmux ステータスバーでの使用を想定しています。
