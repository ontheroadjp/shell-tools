# 🎌 holiday <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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

### 今年の祝日を一覧表示

```bash
holiday
```

**Output:**

```
20260101 元日
20260112 成人の日
20260211 建国記念の日
20260223 天皇誕生日
20260320 春分の日
20260429 昭和の日
20260503 憲法記念日
20260504 みどりの日
20260505 こどもの日
20260720 海の日
20260811 山の日
20260921 敬老の日
20260923 秋分の日
20261012 スポーツの日
20261103 文化の日
20261123 勤労感謝の日
```

### キーワードで絞り込む

```bash
holiday 正月
```

**Output:**

```
20260101 元日
```

### 特定の月の祝日を表示

```bash
holiday 2026-05
```

**Output:**

```
20260503 憲法記念日
20260504 みどりの日
20260505 こどもの日
```

## Notes

- ネットワーク接続が必要です。
- Google カレンダーの「日本の祝日」カレンダー (ICS) を参照しています。
