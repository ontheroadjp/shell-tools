# 🎨 colors <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
# Show all ANSI basic colors
colors
```

```
[displays colored terminal output with ANSI color codes and names]
```

```bash
# Show 256-color table
colors 256
```

```
[displays 256-color table with color indices]
```

## Notes

- Useful for customizing shell prompts or scripts where you need to look up color codes.
