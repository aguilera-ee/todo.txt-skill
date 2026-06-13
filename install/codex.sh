#!/usr/bin/env bash
set -euo pipefail

AGENTS_FILE="$HOME/.codex/AGENTS.md"

if grep -q "## todo.txt Skill" "$AGENTS_FILE" 2>/dev/null; then
  echo "todo.txt skill is already present in $AGENTS_FILE"
  exit 0
fi

mkdir -p "$HOME/.codex"
curl -fsSL https://raw.githubusercontent.com/aguilera-ee/todo.txt-skill/master/SKILL.md >> "$AGENTS_FILE"
echo "Done. Instructions appended to $AGENTS_FILE."
