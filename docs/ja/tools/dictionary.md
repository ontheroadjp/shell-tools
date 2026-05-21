# dictionary

英単語を weblio で検索し、定義と用例を表示します。

## Requirements

- `w3m`

```bash
brew install w3m
```

## Usage

```bash
dictionary <word>
```

## Examples

```bash
dictionary serendipity
dictionary appreciate
```

## Notes

- Swift 製のネイティブ辞書検索 (`lib/dictionary.swift`) と、weblio の用例検索を組み合わせて表示します。
- ネットワーク接続が必要です。
