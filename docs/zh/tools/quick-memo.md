# quick-memo

从终端快速管理备忘录和待办事项，笔记以 Markdown 文件形式保存。

## 环境要求

- `vim`
- `gsed`（GNU sed）
- `rg`（ripgrep）

```bash
brew install gnu-sed ripgrep
```

## 配置

通过环境变量指定保存目录：

```bash
export QUICK_MEMO_DATA_DIR="$HOME/.quick-memo"
```

未设置时默认使用 `$HOME/.quick-memo`。

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

```bash
quick-memo
quick-memo todo "撰写方案" "准备会议材料"
quick-memo todo
quick-memo mail you@example.com
```

## 说明

- 备忘录保存至 `$QUICK_MEMO_DATA_DIR/quick_memo.md`。
- 待办事项使用 `[ ]` 复选框格式管理。
