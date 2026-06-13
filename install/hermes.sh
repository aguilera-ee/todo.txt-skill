#!/usr/bin/env bash
set -euo pipefail

DEST="$HOME/.hermes/skills/todo.txt-skill/SKILL.md"

if [ -f "$DEST" ]; then
  echo "todo.txt-skill is already installed at $DEST"
  exit 0
fi

mkdir -p "$HOME/.hermes/skills/todo.txt-skill"
curl -fsSL https://raw.githubusercontent.com/aguilera-ee/todo.txt-skill/master/SKILL.md -o "$DEST"
echo "Done. Start a new Hermes session — todo.txt-skill will be available."
