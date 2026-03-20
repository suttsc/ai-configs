# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

A personal configuration repository for Claude Code tooling. It contains:

- **`bash/.bashrc-commit-claude`** — A bash `commit()` helper function. When called without arguments, it uses `claude -p` (Claude CLI in pipe mode) to auto-generate a commit message from `git diff --cached`. When called with arguments, it commits all tracked changes with the provided message directly.
- **`.claude/statusline.sh`** — A Claude Code status line script. Reads JSON from stdin (provided by Claude Code's statusline hook) and outputs a formatted status string showing: current directory (blue), git branch (yellow, with Powerline glyph), active model (cyan), context window usage (red if ≥80%), and vim mode (magenta). Fields are pipe-separated.
- **`.github/copilot-instructions.md`** — Custom instructions for GitHub Copilot, mirroring the conventions in `.claude/CLAUDE.md`.

## Maintenance

When adding, removing, or modifying any file in this repository, update both `README.md` and `CLAUDE.md` to reflect the change if it is not already documented there. Keep descriptions accurate and in sync with the actual behaviour of the scripts.

## Conventions

- Commit messages must begin with one of: `fix: `, `feat: `, `chore: `, `build: `, `docs: `
- Use British English in all prose and comments
