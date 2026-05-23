# 🌐 deepl-translater <Badge type="info" text="Python Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

使用 DeepL API 翻译剪贴板文本或标准输入，自动检测源语言。

## 环境要求

- Python 3
- DeepL API 密钥（支持免费计划）

```bash
pip install -r requirements.txt
```

## 初始设置

### 1. 获取 DeepL API 密钥

1. 在 [https://www.deepl.com/zh/pro#developer](https://www.deepl.com/zh/pro#developer) 注册免费账户
2. 进入 **账户** → **DeepL API 的身份验证密钥**
3. 复制 API 密钥（免费计划的密钥以 `:fx` 结尾）

### 2. 创建 credentials 文件

```bash
mkdir -p ~/.config/shell-tools/deepl-translater
echo "DEEPL_API_KEY=your_api_key_here" > ~/.config/shell-tools/deepl-translater/credentials
```

## 用法

```bash
deepl-translater [-o 目标语言]
```

| 选项 | 说明 |
|---|---|
| `-o EN` | 翻译为英语（默认） |
| `-o JA` | 翻译为日语 |
| `-o ZH` | 翻译为中文 |
| `-o KO` | 翻译为韩语 |

若无标准输入，则从剪贴板读取。

## 示例

### 将剪贴板文本翻译为英语（默认）

```bash
deepl-translater
```

**Output:**

```
Hello, world.
```

### 将剪贴板文本翻译为日语

```bash
deepl-translater -o JA
```

**Output:**

```
こんにちは、世界。
```

### 从标准输入翻译

```bash
echo "こんにちは" | deepl-translater
```

**Output:**

```
Hello
```

### 翻译文件内容

```bash
cat document.txt | deepl-translater -o ZH
```

**Output:**

```
你好，世界。
```

### 翻译并复制结果到剪贴板

```bash
deepl-translater | pbcopy    # macOS
deepl-translater | xclip     # Linux
```

## 说明

- 需要在 `~/.config/shell-tools/deepl-translater/credentials` 中写入 `DEEPL_API_KEY=...`。
- 使用 DeepL 免费 API 端点（`api-free.deepl.com`）。
- 若标准输入为管道则从 stdin 读取，否则从剪贴板读取。
