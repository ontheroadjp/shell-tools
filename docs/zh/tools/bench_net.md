# 🌐 bench_net <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

通过 speedtest.net 测量网络下载和上传速度。

## 依赖

- Python 2 或 3

## 用法

```bash
bench_net
```

## 示例

### 通过 speedtest.net 测量网速

```bash
bench_net
```

**Output:**

```
Ping: 12.34 ms
Download: 487.32 Mbit/s
Upload: 198.54 Mbit/s
```

## 说明

- 内部使用 speedtest-cli 协议。
- 结果会因服务器负载和网络状况而有所不同。
