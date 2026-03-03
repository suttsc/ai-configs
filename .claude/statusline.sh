#!/usr/bin/env bash
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
vim_mode=$(echo "$input" | jq -r '.vim.mode // empty')

parts=()

# Directory (full path from root)
if [ -n "$cwd" ]; then
    parts+=("$(printf '\033[34m%s\033[0m' "$cwd")")
fi

# Git branch
if git -C "$cwd" rev-parse --git-dir >/dev/null 2>&1; then
    branch=$(git -C "$cwd" branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
        parts+=("$(printf '\033[33m\ue0a0 %s\033[0m' "$branch")")
    fi
fi

# Model
if [ -n "$model" ]; then
    parts+=("$(printf '\033[36m%s\033[0m' "$model")")
fi

# Context used
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used" ]; then
    used_int=${used%.*}
    if [ "$used_int" -ge 80 ] 2>/dev/null; then
        parts+=("$(printf '\033[31mctx: %s%%\033[0m' "$used_int")")
    else
        parts+=("$(printf 'ctx: %s%%' "$used_int")")
    fi
fi

# Vim mode
if [ -n "$vim_mode" ]; then
    parts+=("$(printf '\033[35m[%s]\033[0m' "$vim_mode")")
fi

output=""
for part in "${parts[@]}"; do
    if [ -z "$output" ]; then
        output="$part"
    else
        output="$output | $part"
    fi
done
printf '%s' "$output"
