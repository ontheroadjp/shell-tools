# today

今日の日付・天気・世界時計をまとめて表示するデイリーサマリーです。

## Requirements

- `curl` (weather が使用)

## Usage

```bash
today
```

## Output

```
令和7年,2025 05月 21日 Tokyo: ⛅️ +18°C 65% 0.0mm 🌘 25
Sydney:       [ 8:00 AM] Wednesday, May 21, 2025
Tokyo:        [ 7:00 AM] Wednesday, May 21, 2025
Shanghai:     [ 6:00 AM] Wednesday, May 21, 2025
London:       [11:00 PM] Tuesday, May 20, 2025
New York:     [ 6:00 PM] Tuesday, May 20, 2025
Los Angeles:  [ 3:00 PM] Tuesday, May 20, 2025
enjyo! :-)
```

## Notes

- 内部で `wareki`・`weather`・`worldtime` を呼び出しています。
- `weather` はネットワーク接続が必要です。
