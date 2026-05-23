# ☀️ today <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

今日の日付・天気・世界時計をまとめて表示するデイリーサマリーです。

## Requirements

- `curl` (weather が使用)

## Usage

```bash
today
```

## Examples

### デイリーサマリーを表示

```bash
today
```

**Output:**

```
令和8年 05月 23日 ⛅️ +22°C 60%
Sydney:      [ 8:00 AM] Friday, May 23, 2026
Tokyo:       [ 7:00 AM] Friday, May 23, 2026
Shanghai:    [ 6:00 AM] Friday, May 23, 2026
London:      [11:00 PM] Thursday, May 22, 2026
New York:    [ 6:00 PM] Thursday, May 22, 2026
Los Angeles: [ 3:00 PM] Thursday, May 22, 2026
enjyo! :-)
```

## Notes

- 内部で `wareki`・`weather`・`worldtime` を呼び出しています。
- `weather` はネットワーク接続が必要です。
