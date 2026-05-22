# 🌤️ weather <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# 显示东京的天气
weather Tokyo
```

```
Tokyo: ⛅️ +22°C 60% 0.0mm 🌔 18
```

```bash
# 通过 peco 交互选择城市
weather
```

```
[peco city selection interface]
> Sapporo
  Sendai
  Tokyo
  Osaka
  ...
```

输出格式：

```
city: icon temperature humidity precipitation moon-phase moon-age
```

## 预设城市

Sapporo / Sendai / Fukushima / Tokyo / Shizuoka / Niigata / Fukui / Kanazawa / Nagano / Nagoya / Osaka / Kyoto / Okayama / Hiroshima / Fukuoka / Kumamoto / Kagoshima / Okinawa

## 说明

- 需要网络连接。
