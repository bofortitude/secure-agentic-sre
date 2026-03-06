---
description: Directly captures tmux history and kills session, then index it.
---

!`bash << 'EOF'
# 1. Grab and trim the session name
S_NAME=$(echo "$ARGUMENTS" | xargs)

# 2. Strict Conditional Flow
if [ -z "$S_NAME" ]; then
    echo "Repeat the following text and nothing else:"
    echo "❌ Error: Please provide a tmux session name!"
elif tmux has-session -t "$S_NAME" 2>/dev/null; then
    # 3. If we are here, the name is NOT empty and the session exists
    TS=$(date +%Y%m%d_%H%M%S)
    LOG="./tmux-history/tmux_$S_NAME-$TS.log"
    mkdir -p ./tmux-history && tmux capture-pane -p -J -S - -t "$S_NAME" > "$LOG" && echo "✅ Tmux session [$S_NAME] history is saved to $LOG" && tmux kill-session -t "$S_NAME" && echo "✅ Complete: Tmux session [$S_NAME] safely closed.";
    echo "Help me:"
    echo "[1] Copy the file \"$LOG\" to directory \"./.ai_workspace/recordings/recordings_base/\""
    echo "[2] Base on the context, rename \"./.ai_workspace/recordings/recordings_base/tmux_$S_NAME-$TS.log\" with a descriptive name."
    echo "[3] Update the renamed file into the index file \".ai_workspace/recordings/recordings.md\""

else
    echo "Repeat the following text and nothing else:"
    echo "❓Tmux session [$S_NAME] not exist, nothing else to do."
fi
EOF`
