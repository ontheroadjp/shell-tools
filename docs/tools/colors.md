# 🎨 colors <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

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

### Show all ANSI basic colors

```bash
colors
```

**Output:**

```
[displays colored terminal output with ANSI color codes and names]
```

### Show 256-color table

```bash
colors 256
```

**Output:**

```
[displays 256-color table with color indices]
```

## Notes

- Useful for customizing shell prompts or scripts where you need to look up color codes.
