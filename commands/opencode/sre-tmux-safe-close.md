---
description: Directly captures tmux history and kills session
---

Repeat the following text and nothing else:

!`bash << 'EOF'
# 1. Grab and trim the session name
S_NAME=$(echo "$ARGUMENTS" | xargs)

# 2. Strict Conditional Flow
if [ -z "$S_NAME" ]; then
    echo "❌ Error: Please provide a tmux session name!"
elif tmux has-session -t "$S_NAME" 2>/dev/null; then
    # 3. If we are here, the name is NOT empty and the session exists
    TS=$(date +%Y%m%d_%H%M%S)
    LOG="./tmux-history/$S_NAME-$TS.log"
    mkdir -p ./tmux-history && tmux capture-pane -p -S - -t "$S_NAME" > "$LOG" && echo "✅ Tmux session [$S_NAME] history is saved to $LOG" && tmux kill-session -t "$S_NAME" && echo "✅ Complete: Tmux session [$S_NAME] safely closed.";

else
    echo "❓Tmux session [$S_NAME] not exist, nothing else to do."
fi
EOF`

