# ⏱️ timer <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

指定した時間が経過すると macOS の通知センターに通知を出し、サウンドを鳴らすカウントダウンタイマーです。

## Requirements

- macOS (osascript / afplay を使用)

## Usage

```bash
timer <time>
```

時間は `h`（時間）・`m`（分）・`s`（秒）の単位を組み合わせて指定します。

## Examples

### 30分タイマーをセット

```bash
timer 30m
```

**Output:**

```
After 1800 sec
[macOS notification / Linux notify-send after 30 minutes]
```

### 1時間30分タイマーをセット

```bash
timer 1h30m
```

**Output:**

```
After 5400 sec
```

### 90秒タイマーをセット

```bash
timer 90s
```

**Output:**

```
After 90 sec
```

### バックグラウンドで実行

```bash
timer 25m &
```

**Output:**

```
[1] 12345
After 1500 sec
```

## Notes

- タイマーはフォアグラウンドで動作します。バックグラウンド実行する場合は `timer 30m &`。
- 通知音は Glass → Submarine → Ping の順に3回鳴ります。
