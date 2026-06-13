#!/usr/bin/env bash
set -euo pipefail

DEST="$HOME/.claude/skills/todo.txt-skill"

if [ -d "$DEST" ]; then
  echo "todo.txt-skill is already installed at $DEST"
  exit 0
fi

mkdir -p "$HOME/.claude/skills"
git clone https://github.com/aguilera-ee/todo.txt-skill.git "$DEST"
echo "Done. Restart Claude Code — /todo.txt-skill will be available."
