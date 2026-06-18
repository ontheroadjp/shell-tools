# Consistency Checks

When adding, removing, or renaming a tool, the following items must stay in sync:

## Checklist

| Item | Location | Check |
|---|---|---|
| Script file | `tools/<category>/<name>/<name>.sh` | Executable, depth-3 |
| EN docs | `docs/tools/<name>.md` | Exists |
| JA docs | `docs/ja/tools/<name>.md` | Exists |
| ZH docs | `docs/zh/tools/<name>.md` | Exists |
| EN sidebar | `docs/.vitepress/config.mts:toolsSidebarEn` | Entry present |
| JA sidebar | `docs/.vitepress/config.mts:toolsSidebarJa` | Entry present |
| ZH sidebar | `docs/.vitepress/config.mts:toolsSidebarZh` | Entry present |
| README tool table | `README.md` | Row present |

## Verification Commands

```bash
# List all installable scripts
./install.sh list

# Verify symlink is correct after install
ls -la ~/dotfiles/bin/<tool-name>

# Check sidebar entries
grep -n "fix_filename\|text_converter\|converter" docs/.vitepress/config.mts

# Check docs pages exist
ls docs/tools/ docs/ja/tools/ docs/zh/tools/
```

## Known Inconsistency Patterns

- Removing a tool: sidebar entries and docs pages often lag behind the script removal → always update `config.mts` and docs in the same PR
- Renaming a tool: the symlink in `~/dotfiles/bin` retains the old name until `./install.sh uninstall <old-name>` is run
