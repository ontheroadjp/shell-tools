# 🔗 symlink-checker <span class="tc-badge tc-badge-shell">Shell Script</span> <span class="tc-badge tc-badge-linux">Linux</span>

ディレクトリを再帰的にスキャンし、リンク切れシンボリックリンクを一覧表示・対話的に削除します。

## Usage

```bash
symlink-checker [-i] <dir>
```

| オプション | 説明 |
|---|---|
| `<dir>` | スキャン対象のディレクトリ |
| `-i` | 対話モード: 削除前に Y/n で確認する |

## Examples

### リンク切れシンボリックリンクの一覧表示

```bash
symlink-checker /tmp/test-links
```

**Output:**

```
/tmp/test-links/old-tool
/tmp/test-links/missing-target
```

### 対話的に削除する

```bash
symlink-checker -i /tmp/test-links
```

**Output:**

```
WARNING: The following broken symlinks will be removed:
  /tmp/test-links/old-tool
  /tmp/test-links/missing-target

Remove '/tmp/test-links/old-tool'? [Y/n] y
  Removed: /tmp/test-links/old-tool
Remove '/tmp/test-links/missing-target'? [Y/n] n
  Skipped: /tmp/test-links/missing-target
```

### リンク切れなしの場合

```bash
symlink-checker /tmp/test-links
```

**Output:**

```
No broken symlinks found in '/tmp/test-links'.
```

## Notes

- **bash 4+** が必要です（`mapfile` 組み込みコマンドを使用）。Linux は標準で bash 4+ 搭載。
- サブディレクトリを再帰的にスキャンします。
- Y/n プロンプトでそのまま Enter を押すと **Y**（削除）になります。
