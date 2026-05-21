# 🎨 colors

ANSI カラーコードと xterm 256色テーブルをターミナルに表示します。

## Usage

```bash
colors [subcommand]
```

| Subcommand | Description |
|---|---|
| `colors` (省略可) | ANSI 基本カラーコード一覧 |
| `256` | xterm 256色を番号付きで表示 |
| `256hex` | 256色を HEX カラーコード付きで表示（前景色） |
| `256hexbg` | 256色を HEX カラーコード付きで表示（背景色） |

## Examples

```bash
# 基本カラーコードを表示
colors

# 256色を番号付きで表示
colors 256

# 256色を HEX 付きで表示
colors 256hex

# 背景色として HEX 付きで表示
colors 256hexbg
```

## Notes

- シェルスクリプトやプロンプトのカスタマイズ時にカラーコード番号を確認するのに便利です。
