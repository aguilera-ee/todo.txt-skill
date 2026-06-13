#!/usr/bin/env bash
set -euo pipefail

DEST="$HOME/.openclaw/skills/todo.txt-skill"

if [ -d "$DEST" ]; then
  echo "todo.txt-skill is already installed at $DEST"
  exit 0
fi

mkdir -p "$HOME/.openclaw/skills"
git clone https://github.com/aguilera-ee/todo.txt-skill.git "$DEST"
echo "Done. Restart OpenClaw — todo.txt-skill will be available."
