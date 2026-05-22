# 🔧 fix_filename <Badge type="tip" text="Shell" />

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

```bash
fix_filename -c zenkaku_to_hankaku.conf ./files
fix_filename -c space_to_underbar.conf -c specific_words.conf ./docs
find . -name "*.md" | fix_filename -c zenkaku_to_hankaku.conf
```
