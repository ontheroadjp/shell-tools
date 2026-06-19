# 🔗 symlink-checker <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-linux">Linux</span>

Scan a directory for broken symbolic links and optionally remove them interactively.

## Usage

```bash
symlink-checker [-i] <dir>
```

| Option | Description |
|---|---|
| `<dir>` | Directory to scan recursively for broken symlinks |
| `-i` | Interactive mode: prompt Y/n before removing each broken symlink |

## Examples

### List broken symlinks

```bash
symlink-checker /tmp/test-links
```

**Output:**

```
/tmp/test-links/old-tool
/tmp/test-links/missing-target
```

### Remove broken symlinks interactively

```bash
symlink-checker -i ~/dotfiles/bin
```

**Output:**

```
WARNING: The following broken symlinks will be removed:
  /tmp/test-links/old-tool
  /tmp/test-links/missing-target

Remove '/tmp/test-links/old-tool'? [Y/n] y
  Removed: /tmp/test-links/old-tool
Remove '/tmp/test-links/missing-target'? [Y/n] n
  Skipped: /tmp/test-links/missing-target
```

### No broken symlinks found

```bash
symlink-checker /tmp/test-links
```

**Output:**

```
No broken symlinks found in '/tmp/test-links'.
```

## Notes

- Requires **bash 4+** (`mapfile` builtin). Linux systems ship bash 4+ by default.
- Scans recursively through all subdirectories.
- Empty Enter at the Y/n prompt defaults to **Y** (remove).
