# Demo: todo.txt-skill inside Claude Code
#
# Recreates a real session where a natural-language request is turned into
# todo.sh commands by the skill (source session: b58862e6-11a7-4424-93d5-1036180dcf8d).
# Runs against a throwaway todo.txt so it never touches your real list.
#
# Render with:  cd assets && vhs demo.tape

Output demo.gif

Require todo.sh

Set Shell "bash"
Set FontSize 18
Set Width 1200
Set Height 650
Set Theme "Catppuccin Mocha"
Set Padding 20
Set TypingSpeed 40ms

Hide
Type `tmp=$(mktemp -d); printf 'Buy coffee beans +groceries @store\n' > "$tmp/todo.txt"; printf 'export TODO_DIR="%s"\nexport TODO_FILE="%s/todo.txt"\nexport DONE_FILE="%s/done.txt"\n' "$tmp" "$tmp" "$tmp" > "$tmp/todo.cfg"; alias todo.sh="todo.sh -d $tmp/todo.cfg"` Enter
Type `claude() { sleep 0.6; printf "\033[33m⏺\033[0m Skill(todo.txt-skill)\n"; sleep 0.5; printf "\033[33m⏺\033[0m Bash(todo.sh add \"Change the button's color to red\")\n"; todo.sh add "Change the button's color to red" | sed "s/^/  ⎿  /"; sleep 0.6; printf "\033[33m⏺\033[0m Bash(todo.sh ls)\n"; todo.sh ls | sed "s/^/  ⎿  /"; sleep 0.8; printf "\nAdded as task #3. Current list:\n\n  1. Buy coffee beans +groceries @store\n  2. Change the button's color to red\n\n"; }` Enter
Type "clear" Enter
Show

Type@40ms `claude "Save on my todo list to change the button's color to red"`
Sleep 500ms
Enter
Sleep 3s
Sleep 30s
