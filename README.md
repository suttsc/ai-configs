# ai-configs

Personal configuration files and scripts for Claude Code.

## Contents

### `bash/.bashrc-commit-claude`

A bash `commit()` function that wraps `git commit` with optional AI-generated commit messages.

**Usage:**

```bash
# Source it in your .bashrc
source ~/ai-configs/bash/.bashrc-commit-claude

# Auto-generate a commit message from staged changes
commit

# Commit with a manual message (commits all tracked changes)
commit fix: correct typo in readme
```

When called without arguments, it pipes `git diff --cached` into the Claude CLI (`claude -p`) and uses the generated message. A spinner is shown while the message is being generated.

Requires the [Claude Code CLI](https://claude.ai/code) to be installed and authenticated.

### `.claude/statusline.sh`

A status line script for Claude Code's terminal UI. Displays contextual information in the Claude Code status bar:

- Current working directory
- Git branch (with Powerline glyph)
- Active Claude model
- Context window usage (turns red at ≥80%)
- Vim mode (when active)

To use, configure it as a status line script in your Claude Code settings.

### `.github/copilot-instructions.md`

Custom instructions for GitHub Copilot, keeping it consistent with the Claude Code conventions (commit message prefixes, British English).

## Setup

Clone the repo and source the bash helper from your `.bashrc`:

```bash
git clone https://github.com/suttsc/ai-configs.git ~/ai-configs
echo 'source ~/ai-configs/bash/.bashrc-commit-claude' >> ~/.bashrc
```

For the status line script, add the path to `.claude/statusline.sh` in your Claude Code settings.
