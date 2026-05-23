# 🌤️ weather <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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

### 東京の天気を表示

```bash
weather Tokyo
```

**Output:**

```
Tokyo: ⛅️ +22°C 60% 0.0mm 🌔 18
```

### peco でインタラクティブに都市を選択

```bash
weather
```

**Output:**

```
[peco city selection interface]
> Sapporo
  Sendai
  Tokyo
  Osaka
  ...
```

出力フォーマット:

```
city: icon temperature humidity precipitation moon-phase moon-age
```

## Preset Cities

Sapporo / Sendai / Fukushima / Tokyo / Shizuoka / Niigata / Fukui / Kanazawa / Nagano / Nagoya / Osaka / Kyoto / Okayama / Hiroshima / Fukuoka / Kumamoto / Kagoshima / Okinawa

## Notes

- ネットワーク接続が必要です。
