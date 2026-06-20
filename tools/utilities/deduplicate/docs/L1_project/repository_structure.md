# Repository Structure

## Current Layout

```text
.
├── deduplicate.py
├── README.md
├── CLAUDE.md
└── docs/
    ├── .ai/repo.profile.json
    ├── L0_concept/
    ├── L1_project/
    ├── L2_development/
    └── L3_implementation/
```

## Responsibilities

- `deduplicate.py`: the executable CLI, filesystem traversal, content hashing,
  duplicate grouping, keeper selection, deletion safeguards, and result output
  (`deduplicate.py:45-208`).
- `README.md`: user-facing installation, command, usage, and design constraints.
- `CLAUDE.md`: repository-local AI operating guidance.
- `docs/.ai/repo.profile.json`: machine-readable documentation roots and
  verified commands.
- `docs/L0_concept/`: product purpose and policies derived from implementation.
- `docs/L1_project/`: repository-wide overview and structure.
- `docs/L2_development/`: operation and consistency procedures.
- `docs/L3_implementation/`: implementation behavior and data flow.

There is no monorepo layout: the only implementation entry is the root-level
`deduplicate.py`, and no `apps/` or `packages/` directory exists.

## Why This Structure

The implementation remains at repository root because the repository currently
contains one executable module. Documentation is separated by decision,
project, operation, and implementation layers so claims can be traced without
changing the runtime layout.

## Unconfirmed

- No future module or package boundaries are established. Confirm them only
  after corresponding implementation directories or packaging configuration
  are added.
