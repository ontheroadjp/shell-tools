# 🔧 fix_filename <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

通过配置文件中定义的模式/替换规则重命名文件，支持批量重命名、目录递归和 stdin 管道。

## 环境要求

- macOS / Linux
- `sed`, `find`

## 用法

```bash
fix_filename -c <conf_file> <file|dir> ...
```

必须通过 `-c` 提供一个或多个配置文件。每个配置文件每行包含一个 `pattern,replacement` 对，以 `#` 开头的行为注释。

## 配置文件格式

```
# 注释
pattern,replacement
old_word,new_word
```

内置配置文件：
- `zenkaku_to_hankaku.conf` — 全角转半角
- `space_to_underbar.conf` — 空格转下划线
- `specific_words.conf` — 自定义词语替换

## 示例

### 将文件名中的全角字符转为半角

```bash
fix_filename -c zenkaku_to_hankaku.conf ./files/
```

**Output:**

```
./files/ABC_test.txt
./files/report_2025.pdf
```

### 将空格替换为下划线

```bash
fix_filename -c space_to_underbar.conf "my document.txt"
```

**Output:**

```
my_document.txt
```

### 同时应用多个规则

```bash
fix_filename -c zenkaku_to_hankaku.conf -c space_to_underbar.conf ./docs/
```

**Output:**

```
./docs/ABC_report_2025.txt
./docs/project_notes.md
```

### 通过 stdin 与 find 配合使用

```bash
find . -name "*.txt" | fix_filename -c zenkaku_to_hankaku.conf
```

**Output:**

```
./ABC_test.txt
./report_2025.txt
```
