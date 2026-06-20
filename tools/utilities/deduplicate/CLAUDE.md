# Repository Guidance

Before changing implementation behavior, read:

- `docs/L0_concept/concept.md`
- `docs/L0_concept/policy.md`
- `docs/L1_project/repository_structure.md`
- `docs/L3_implementation/specification_summary.md`

Treat `deduplicate.py` as the source of truth. Keep documentation claims linked
to concrete paths, line ranges, or configuration keys. Preserve dry-run and
pre-deletion revalidation for changes affecting file removal
(`deduplicate.py:117-158`).

## Custom / Command の使い分け（AI向けルール）

- task.md: ドキュメント変更を伴う実装に特化。issue 自動生成〜実装〜ドラフト PR 作成まで。docs/* は変更しない。
- patch.md: ドキュメント変更を伴わない軽微な修正に特化。issue/PR 不要。branch + commit → ユーザーが main へマージ。スコープが広がった場合は /task へエスカレーション。
- docs-sync.md: git diff を事実として docs を最小更新し、ドラフト PR を公開する。HARD STOP 時は /init-docs を要求して終了する。
- init-docs.md: repo の実態把握と設計ドキュメント再構築。重い初期化。docs-sync が説明不能になった時点でここに戻る。
