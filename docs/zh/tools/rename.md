# ✏️ rename <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

通过转换全角/半角字符、空格及自定义词语模式来重命名文件和目录。

## 用法

```bash
rename [OPTIONS] [file_or_dir ...]
find . | rename [OPTIONS]
```

## 选项

| 选项 | 说明 |
|---|---|
| `--han` | 半角 → 全角（替代默认的全角 → 半角） |
| `--no-zen` | 不执行全角 → 半角 |
| `--no-space` | 不执行空格 → 下划线 |
| `--no-words` | 不应用 `specific_words.conf` 规则 |
| `-r`, `--recursive` | 同时重命名所有子目录中的文件和目录（默认仅指定目录下的直接子项） |
| `--dry-run` | 仅显示将要执行的操作，不做任何更改 |

默认会同时应用全角 → 半角、空格 → 下划线以及 `specific_words.conf` 规则。

## 行为

接受文件、目录或 stdin 的路径列表（每行一个路径）。目录仅展开其**直接子项**（加 `-r` 则包含所有子目录内的内容）。从最深层开始重命名。只转换基本名称，不转换父路径。显示预览并询问 `Proceed? [Y/n]`；使用 `mv -n`，不会覆盖已有文件。使用 `--dry-run` 可仅预览而无需确认。

## 示例

```bash
# 重命名单个文件
rename 'Ａｂｃ.mp3'
# Will rename:
#   Ａｂｃ.mp3  →  Abc.mp3
# Proceed? [Y/n]

# 试运行：仅预览
rename --dry-run ./music/
# [DRY RUN] Would rename:
#   Ａ Ｂ Ｃ.mp3  →  A_B_C.mp3

# 重命名目录下的直接子项
rename ./music/

# 递归重命名
rename -r ./music/

# 从 find 输出重命名
find . -name '*.mp3' | rename

# 应用词语替换规则
rename --dry-run --no-zen --no-space ./music/
```

`specific_words.conf` 包含 `pattern,replacement` 规则（每行一条，sed BRE 语法）。以 `#` 开头的行为注释。
