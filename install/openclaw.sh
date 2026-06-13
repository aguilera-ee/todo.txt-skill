#!/usr/bin/env bash
set -euo pipefail

DEST="$HOME/.openclaw/skills/todo.txt-skill"

if [ -d "$DEST" ]; then
  git -C "$DEST" pull
else
  mkdir -p "$HOME/.openclaw/skills"
  git clone https://github.com/aguilera-ee/todo.txt-skill.git "$DEST"
fi

echo "Done. Restart OpenClaw — todo.txt-skill will be available."
