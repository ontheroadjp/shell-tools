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

```bash
# 30分タイマーをセット
timer 30m
```

```
After 1800 sec
[macOS notification / Linux notify-send after 30 minutes]
```

```bash
# 1時間30分タイマーをセット
timer 1h30m
```

```
After 5400 sec
```

```bash
# 90秒タイマーをセット
timer 90s
```

```
After 90 sec
```

```bash
# バックグラウンドで実行
timer 25m &
```

```
[1] 12345
After 1500 sec
```

## Notes

- タイマーはフォアグラウンドで動作します。バックグラウンド実行する場合は `timer 30m &`。
- 通知音は Glass → Submarine → Ping の順に3回鳴ります。
