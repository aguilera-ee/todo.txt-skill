#!/usr/bin/env bash
set -euo pipefail

AGENTS_FILE="$HOME/.codex/AGENTS.md"
SKILL_URL="https://raw.githubusercontent.com/aguilera-ee/todo.txt-skill/master/SKILL.md"
START_MARKER="<!-- todo.txt-skill:start -->"
END_MARKER="<!-- todo.txt-skill:end -->"

mkdir -p "$HOME/.codex"
touch "$AGENTS_FILE"

SKILL_CONTENT=$(curl -fsSL "$SKILL_URL")

if grep -qF "$START_MARKER" "$AGENTS_FILE"; then
  # Replace existing block
  TMPFILE=$(mktemp)
  awk -v start="$START_MARKER" -v end="$END_MARKER" -v content="$START_MARKER\n$SKILL_CONTENT\n$END_MARKER" \
    'BEGIN{skip=0} $0==start{print content; skip=1; next} $0==end{skip=0; next} !skip{print}' \
    "$AGENTS_FILE" > "$TMPFILE"
  mv "$TMPFILE" "$AGENTS_FILE"
else
  printf "\n%s\n%s\n%s\n" "$START_MARKER" "$SKILL_CONTENT" "$END_MARKER" >> "$AGENTS_FILE"
fi

echo "Done. Instructions updated in $AGENTS_FILE."
