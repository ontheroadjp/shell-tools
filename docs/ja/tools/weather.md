# 🌤️ weather

[wttr.in](https://wttr.in) API を使って現在の天気を取得します。

## Requirements

- `curl`
- `peco` (都市をインタラクティブに選択する場合)

## Usage

```bash
weather [city]
```

| 引数 | Description |
|---|---|
| (なし) | `peco` で都市を選択 |
| `city` | 指定した都市の天気を表示 |

## Examples

```bash
# peco で都市を選択
weather

# 都市を直接指定
weather Tokyo
weather Osaka
weather Sapporo
```

## Output

```
Tokyo: ⛅️ +18°C 65% 0.0mm 🌘 25
```

出力フォーマット: `都市名: 天気アイコン 気温 湿度 降水量 月相 月齢`

## Preset Cities

Sapporo / Sendai / Fukushima / Tokyo / Shizuoka / Niigata / Fukui / Kanazawa / Nagano / Nagoya / Osaka / Kyoto / Okayama / Hiroshima / Fukuoka / Kumamoto / Kagoshima / Okinawa

## Notes

- ネットワーク接続が必要です。
