# holiday

Google カレンダーの ICS フィードから日本の祝日を取得して一覧表示します。

## Requirements

- `curl`

## Usage

```bash
holiday [keyword]
```

| 引数 | Description |
|---|---|
| (なし) | 全祝日を日付順に表示 |
| `keyword` | キーワードでフィルタ |

## Examples

```bash
# 全祝日を表示
holiday

# "天皇" を含む祝日を検索
holiday 天皇

# 特定の月の祝日を確認
holiday 2025
```

## Output

```
20250101 元日
20250113 成人の日
20250211 建国記念の日
...
```

## Notes

- ネットワーク接続が必要です。
- Google カレンダーの「日本の祝日」カレンダー (ICS) を参照しています。
