# worldtime

Sydney / Tokyo / Shanghai / London / New York / Los Angeles の現在時刻を一覧表示します。タイムゾーン一覧から `peco` でインタラクティブに選択することもできます。

## Requirements

- `peco` (`tz` サブコマンドで都市を選択する場合)

## Usage

```bash
worldtime [keyword]
worldtime tz [timezone]
```

| 呼び方 | Description |
|---|---|
| `worldtime` | 6都市の現在時刻を表示 |
| `worldtime <keyword>` | キーワードでフィルタして表示 |
| `worldtime tz` | peco でタイムゾーンを選択して表示 |
| `worldtime tz <timezone>` | 指定タイムゾーンの時刻を表示 |

## Examples

```bash
# 全都市を表示
worldtime

# "Tokyo" を含む行だけ表示
worldtime Tokyo

# peco でタイムゾーンを選択
worldtime tz

# タイムゾーンを直接指定
worldtime tz Asia/Seoul
```

## Output

```
Sydney:         [ 8:00 AM] Wednesday, May 21, 2025
Tokyo:          [ 7:00 AM] Wednesday, May 21, 2025
Shanghai:       [ 6:00 AM] Wednesday, May 21, 2025
London:         [11:00 PM] Tuesday, May 20, 2025
New York:       [ 6:00 PM] Tuesday, May 20, 2025
Los Angeles:    [ 3:00 PM] Tuesday, May 20, 2025
```
