# 📊 bench_function

加载 Zsh 文件并对指定函数进行多次执行时间基准测试。

## 依赖

- `zsh`, `bc`

## 用法

```zsh
bench_function <函数文件> <函数名> [次数=100] [参数...]
```

## 示例

```zsh
bench_function ~/.zshrc __git_ps1_update_fast 100
bench_function ./myfunc.zsh myfunc 50 arg1 arg2
```

## 输出示例

```
📊 function: myfunc
🔁 times: 50
⏱️ average: 0.002345s
⚡ 最短: 0.001900s
🐢 最长: 0.005100s
```
