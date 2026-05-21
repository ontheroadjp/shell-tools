# dictionary

Look up English words using weblio, showing definitions and usage examples.

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

- Combines a native Swift dictionary lookup (`lib/dictionary.swift`) with weblio usage examples.
- Requires a network connection.
