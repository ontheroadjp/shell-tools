# 📊 bench_function <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

加载 Zsh 文件并对指定函数进行多次执行时间基准测试。

## 依赖

- `zsh`, `bc`

## 用法

```zsh
bench_function <函数文件> <函数名> [次数=100] [参数...]
```

## 示例

### 对 Zsh 函数进行 10 次基准测试

```bash
bench_function my_func
```

**Output:**

```
📊 function: my_func
🔁 times: 100
⏱️ average: 0.000123s
⚡ Shortest: 0.000089s
🐢 longest: 0.000201s
```
