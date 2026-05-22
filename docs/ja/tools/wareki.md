# 📜 wareki <Badge type="tip" text="Shell" />

西暦と和暦を対応させて表示します。明治元年（1868年）から令和10年（2028年）まで対応しています。

## Usage

```bash
wareki [year]
```

| 引数 | Description |
|---|---|
| (なし) | 現在の西暦に対応する和暦を表示 |
| `year` | 指定した西暦または和暦の文字列で検索 |

## Examples

```bash
# 今年の和暦を表示
wareki

# 指定した年を検索
wareki 2025
# → 令和7年,2025

# 複数ヒットする年を検索（改元年）
wareki 1989
# → 昭和64年,1989
# → 平成元年,1989

# 元号で検索
wareki 昭和
```
