---
description: Directly captures tmux history and kills session
---

!`sh -c 'S="$1"; if tmux has-session -t "$S" 2>/dev/null; then TS=$(date +%Y%m%d_%H%M%S); LOG="./tmux-history/${S}-${TS}.log"; mkdir -p ./tmux-history && tmux capture-pane -p -S - -t "$S" > "$LOG" && echo "Saved to $LOG" && tmux kill-session -t "$S" && echo "Complete: $S safely closed, nothing else to do."; else echo "Complete: Session [$S] not exist, nothing else to do."; exit 1; fi' -- "$ARGUMENTS"`

The safely backup tmux history and kill session script has been executed completely. There is nothing else to do, just tell user: The tmux session $ARGUMENTS backup and close complete.

