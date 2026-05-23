# 📊 bench_function <Badge type="tip" text="Shell Script" /> <Badge type="tip" text="macOS" /> <Badge type="info" text="Linux" />

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
Benchmark: my_func (10 runs)
  min:  0.012s
  max:  0.025s
  avg:  0.018s
```
