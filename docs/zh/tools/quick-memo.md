# 📝 quick-memo <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

从终端快速管理备忘录和待办事项，笔记以 Markdown 文件形式保存。

## 环境要求

- `vim`
- `gsed`（GNU sed）
- `rg`（ripgrep）

```bash
brew install gnu-sed ripgrep
```

## 配置

数据默认保存至 `~/.local/share/shell-tools/quick-memo/`（遵循 XDG Base Directory 规范）。如需自定义路径：

```bash
export QUICK_MEMO_DATA_DIR="/path/to/dir"  # 可选覆盖
```

## 用法

```bash
quick-memo [子命令]
```

| 子命令 | 说明 |
|---|---|
| `memo`（默认）| 用 vim 打开备忘录文件（自动插入时间戳标题）|
| `todo [内容...]` | 添加待办事项；不带参数时显示未完成事项 |
| `mail <地址>` | 通过邮件发送备忘录 |

## 示例

### 用 vim 打开备忘录文件

```bash
quick-memo
```

**Output:**

```
[opens ~/.local/share/shell-tools/quick-memo/quick_memo.md in vim]
```

### 添加一个待办事项

```bash
quick-memo todo "Review pull request"
```

**Output:**

```
add todo: Review pull request
```

### 一次添加多个待办事项

```bash
quick-memo todo "Fix bug #42" "Write tests" "Update docs"
```

**Output:**

```
add todo: Fix bug #42
add todo: Write tests
add todo: Update docs
```

### 显示所有未完成的待办事项

```bash
quick-memo todo
```

**Output:**

```
[ ] Fix bug #42
[ ] Write tests
[ ] Update docs
```

## 说明

- 备忘录保存至 `~/.local/share/shell-tools/quick-memo/quick_memo.md`（若设置了 `$QUICK_MEMO_DATA_DIR` 则使用该路径）。
- 待办事项使用 `[ ]` 复选框格式管理。
