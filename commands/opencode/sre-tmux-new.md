---
description: Create a new tmux session if not exists.
---

Repeat the following text to user and nothing else:

!`bash << 'EOF'
# 1. Grab and trim the session name
S_NAME=$(echo "$ARGUMENTS" | xargs)

# 2. Strict Conditional Flow
if [ -z "$S_NAME" ]; then
    echo "❌ Error: Please provide a tmux session name!"
elif tmux has-session -t "$S_NAME" 2>/dev/null; then
    echo "❓tmux session [$S_NAME] already exists."
else
    # 3. If we are here, the name is NOT empty and the session does NOT exist
    tmux new-session -d -s "$S_NAME"
    
    # 4. Final Verification
    if tmux has-session -t "$S_NAME" 2>/dev/null; then
        echo "✅ tmux session [$S_NAME] created successfully."
    else
        echo "❌ Error: Failed to create session [$S_NAME]."
        echo "   Check if tmux is installed: $(which tmux)"
    fi
fi
EOF`



