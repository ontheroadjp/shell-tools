# 🔄 text-converter <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

转换全角/半角字符、空格及自定义词语模式——支持原地修改文件内容或重命名文件。

## 用法

```bash
text-converter [OPTIONS] [file ...]
find . | text-converter [OPTIONS] --rename [dir ...]
```

## 选项

| 选项 | 说明 |
|---|---|
| `-z`, `--zen` | 全角 → 半角 |
| `-h`, `--han` | 半角 → 全角 |
| `-s`, `--space` | 空格（半角/全角）→ 下划线 |
| `-w`, `--words` | 应用 `specific_words.conf` 中的替换规则 |
| `--rename` | 转换**文件名**并重命名（`mv`）；不加此选项则转换**文件内容** |
| `-n`, `--dry-run` | 仅显示将要执行的操作，不实际修改任何文件 |

至少需要指定一个转换选项。`-z` 与 `-h` 不能同时使用。

## 模式

**内容模式**（默认，无 `--rename`）：
- 指定文件参数时：确认后**原地修改**文件
- 无文件参数（stdin）：将转换结果写入 stdout（无需确认）

**重命名模式**（`--rename`）：确认后重命名文件。接受文件、目录（递归展开）或 stdin 的路径列表（每行一个路径）。使用 `mv -n`，不会覆盖已有文件。

执行前显示操作列表并询问 `Proceed? [Y/n]`（stdin→stdout 除外）。使用 `--dry-run` 可在不被询问的情况下仅预览操作。

## 示例

### 转换文件内容

```bash
# stdin → stdout（无需确认）
echo 'Ａｂｃ　１２３' | text-converter -z
# → Abc 123

# 原地修改文件（显示确认提示）
text-converter -z inputfile.txt
# Will modify in place:
#   inputfile.txt
# Proceed? [Y/n]

# 干运行：预览而不修改
text-converter -z --dry-run inputfile.txt
# [DRY RUN] Would modify in place:
#   inputfile.txt
```

### 重命名文件

```bash
# 重命名单个文件（显示确认提示）
text-converter -z --rename 'Ａｂｃ.mp3'
# Will rename:
#   Ａｂｃ.mp3  →  Abc.mp3
# Proceed? [Y/n]

# 干运行：预览重命名而不执行
text-converter -z -s --dry-run --rename ./music/
# [DRY RUN] Would rename:
#   Ａ Ｂ Ｃ.mp3  →  A_B_C.mp3

# 递归重命名目录内所有文件
text-converter -z -s --rename ./music/

# 通过管道传入 find 的输出
find . -name '*.mp3' | text-converter -z --rename
```

### 应用词语替换规则

```bash
text-converter -w --dry-run --rename ./music/
text-converter -w --rename ./music/
```

`specific_words.conf` 中每行一条 `pattern,replacement` 规则（sed BRE 语法，`#` 开头为注释）。
