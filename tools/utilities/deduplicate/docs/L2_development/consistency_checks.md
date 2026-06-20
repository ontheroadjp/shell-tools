# Consistency Checks

## Required Checks

1. Run the syntax check defined in `docs/.ai/repo.profile.json`.
2. Run `python3 deduplicate.py --help` and confirm that the positional
   `directory` argument and `--dry-run` option match
   `deduplicate.py:163-182`.
3. Use a temporary directory containing controlled duplicate files to verify
   dry-run output before exercising deletion behavior.
4. Confirm documentation commands remain identical to
   `docs/.ai/repo.profile.json`.
5. Confirm every implementation path cited by the documentation exists.

## Filesystem Safety Review

Changes to scanning or deletion require review of these invariants:

- traversal does not follow directory symlinks (`deduplicate.py:45-46`);
- symlinks and non-files are skipped (`deduplicate.py:51-58`);
- hard links are not counted as reclaimable duplicates
  (`deduplicate.py:106-112`);
- observed metadata is revalidated before unlinking
  (`deduplicate.py:117-128`, `deduplicate.py:148-153`);
- dry-run never reaches `Path.unlink()` (`deduplicate.py:140-153`).

## CI Status

No CI configuration exists, so these checks are not automatically enforced.
Add `.github/workflows/*.yml` to define an authoritative automated procedure.
