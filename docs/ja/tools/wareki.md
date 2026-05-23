# 📜 wareki <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-macos">macOS</span> <span class="tc-badge tc-badge-linux">Linux</span>

西暦と和暦を対応させて表示します。明治元年（1868年）から令和10年（2028年）まで対応しています。

## Usage

```bash
wareki [year]
```

| 引数 | Description |
|---|---|
| (なし) | 現在の西暦に対応する和暦を表示 |
| `year` | 指定した西暦または和暦の文字列で検索 |

## Examples

### 今年の和暦を表示

```bash
wareki
```

**Output:**

```
令和8年,2026
```

### 特定の西暦を変換

```bash
wareki 2019
```

**Output:**

```
平成31年,2019
令和元年,2019
```

### 元号で検索

```bash
wareki 昭和
```

**Output:**

```
昭和元年,1926
昭和2年,1927
...
昭和64年,1989
```

### 西暦の一部で検索

```bash
wareki 1989
```

**Output:**

```
昭和64年,1989
平成元年,1989
```
