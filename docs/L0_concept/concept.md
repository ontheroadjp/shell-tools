# Concept

## Purpose

Shell Tools is a personal collection of standalone shell scripts for everyday terminal operations. Each tool is a self-contained unit that does one thing — no framework, no global state, no inter-tool dependencies.

## Problem Solved

Repetitive terminal tasks (filename normalization, character encoding conversion, time lookups, weather checks, postal code search, etc.) that would otherwise require memorizing one-off commands or writing ad-hoc scripts each time.

## Target User

The author (ontheroadjp) and anyone with a similar dotfiles-based terminal workflow on macOS or Linux.

## Design Constraints

- **No install-time dependencies per tool** — each script must declare its own requirements and fail gracefully when they are missing.
- **Symlink-based distribution** — `install.sh` creates symlinks in `~/dotfiles/bin`; no package registry, no global prefix.
- **Depth-3 tool layout** — `tools/<category>/<tool-name>/<script>.<ext>` is enforced by `install.sh`'s `find -mindepth 3 -maxdepth 3` scan (`install.sh:9`).
- **No shared library** — tools must not import from each other. Each tool ships everything it needs.
- **XDG compliance for persistent data** — tools that write state follow XDG Base Directory spec (`README.md:Data Storage`).
