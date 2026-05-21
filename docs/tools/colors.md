# 🎨 colors

Displays ANSI color codes and xterm 256-color tables in your terminal.

## Usage

```bash
colors [subcommand]
```

| Subcommand | Description |
|---|---|
| `colors` (default) | Show ANSI basic color code reference |
| `256` | Show all 256 xterm colors with index numbers |
| `256hex` | Show 256 colors with HEX codes (foreground) |
| `256hexbg` | Show 256 colors with HEX codes (background) |

## Examples

```bash
colors
colors 256
colors 256hex
colors 256hexbg
```

## Notes

- Useful for customizing shell prompts or scripts where you need to look up color codes.
