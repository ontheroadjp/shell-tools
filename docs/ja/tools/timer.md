# ⏱️ timer

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
# 30分後に通知
timer 30m

# 1時間30分後に通知
timer 1h30m

# 90秒後に通知
timer 90s

# 組み合わせ
timer 2h15m30s
```

## Notes

- タイマーはフォアグラウンドで動作します。バックグラウンド実行する場合は `timer 30m &`。
- 通知音は Glass → Submarine → Ping の順に3回鳴ります。
