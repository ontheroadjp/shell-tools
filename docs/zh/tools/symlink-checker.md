# 🔗 symlink-checker <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-linux">Linux</span>

递归扫描目录，列出损坏的符号链接，并可交互式删除。

## 用法

```bash
symlink-checker [-i] <dir>
```

| 选项 | 说明 |
|---|---|
| `<dir>` | 要扫描的目录 |
| `-i` | 交互模式：删除前逐一提示 Y/n 确认 |

## 示例

### 列出损坏的符号链接

```bash
symlink-checker /tmp/test-links
```

**Output:**

```
/tmp/test-links/old-tool
/tmp/test-links/missing-target
```

### 交互式删除

```bash
symlink-checker -i /tmp/test-links
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

### 未发现损坏链接

```bash
symlink-checker /tmp/test-links
```

**Output:**

```
No broken symlinks found in '/tmp/test-links'.
```

## 注意事项

- 需要 **bash 4+**（使用 `mapfile` 内置命令）。Linux 系统默认搭载 bash 4+。
- 递归扫描所有子目录。
- Y/n 提示时直接按 Enter 默认为 **Y**（删除）。
