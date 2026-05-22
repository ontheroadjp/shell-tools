# 🎨 colors <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# ANSI 基本カラーをすべて表示
colors
```

```
[displays colored terminal output with ANSI color codes and names]
```

```bash
# 256色テーブルを表示
colors 256
```

```
[displays 256-color table with color indices]
```

## Notes

- シェルスクリプトやプロンプトのカスタマイズ時にカラーコード番号を確認するのに便利です。
