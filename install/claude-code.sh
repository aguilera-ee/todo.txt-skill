#!/usr/bin/env bash
set -euo pipefail

DEST="$HOME/.claude/skills/todo.txt-skill"

if [ -d "$DEST" ]; then
  git -C "$DEST" pull
else
  mkdir -p "$HOME/.claude/skills"
  git clone https://github.com/aguilera-ee/todo.txt-skill.git "$DEST"
fi

echo "Done. Restart Claude Code — /todo.txt-skill will be available."
