# 🔄 converter <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

转换全角/半角字符、空格及自定义词语模式——支持转换文件内容或重命名文件。

## 用法

```bash
converter [OPTIONS] [file|dir ...]
find . | converter [OPTIONS] --rename
```

## 选项

| 选项 | 说明 |
|---|---|
| `-z`, `--zen` | 全角 → 半角 |
| `-h`, `--han` | 半角 → 全角 |
| `-s`, `--space` | 空格（半角/全角）→ 下划线 |
| `-w`, `--words` | 应用 `specific_words.conf` 中的替换规则 |
| `--rename` | 转换**文件名**并重命名（`mv`）；不加此选项则转换**文件内容** |

至少需要指定一个转换选项。`-z` 与 `-h` 不能同时使用。

## 模式

**内容模式**（默认，无 `--rename`）：从文件参数或 stdin 读取，将转换结果写入 stdout。

**重命名模式**（`--rename`）：重命名文件。接受文件、目录（递归展开）或 stdin 的路径列表（每行一个路径）。使用 `mv -n`，不会覆盖已有文件。

## 示例

### 转换文件内容

```bash
# 全角 → 半角
echo 'Ａｂｃ　１２３' | converter -z
# → Abc 123

# 半角 → 全角
echo 'Abc 123' | converter -h
# → Ａｂｃ　１２３

# 组合：全角 → 半角 + 空格 → 下划线
echo 'Ａｂｃ　１２３' | converter -z -s
# → Abc_123

# 转换文件内容
converter -z inputfile.txt > output.txt
```

### 重命名文件

```bash
# 重命名单个文件
converter -z --rename 'Ａｂｃ.mp3'
# → Abc.mp3

# 递归重命名目录内所有文件
converter -z -s --rename ./music/

# 通过管道传入 find 的输出
find . -name '*.mp3' | converter -z --rename

# 组合：全角 → 半角 + 空格 → 下划线
converter -z -s --rename 'Ａ Ｂ Ｃ.mp3'
# → A_B_C.mp3
```

### 应用词语替换规则

```bash
# 应用 specific_words.conf 中的规则
converter -w --rename ./music/
```

`specific_words.conf` 中每行一条 `pattern,replacement` 规则（sed BRE 语法，`#` 开头为注释）。
