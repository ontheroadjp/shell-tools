# 🌤️ weather

通过 [wttr.in](https://wttr.in) API 获取当前天气信息。

## 环境要求

- `curl`
- `peco`（交互选择城市时需要）

## 用法

```bash
weather [城市]
```

| 参数 | 说明 |
|---|---|
| （无）| 通过 `peco` 交互选择城市 |
| `城市` | 显示指定城市的天气 |

## 示例

```bash
weather
weather Tokyo
weather Osaka
```

## 输出示例

```
Tokyo: ⛅️ +18°C 65% 0.0mm 🌘 25
```

格式：`城市: 天气图标 气温 湿度 降水量 月相 月龄`

## 预设城市

Sapporo / Sendai / Fukushima / Tokyo / Shizuoka / Niigata / Fukui / Kanazawa / Nagano / Nagoya / Osaka / Kyoto / Okayama / Hiroshima / Fukuoka / Kumamoto / Kagoshima / Okinawa

## 说明

- 需要网络连接。
