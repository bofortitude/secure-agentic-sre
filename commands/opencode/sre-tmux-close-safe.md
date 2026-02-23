---
description: Close a new tmux session with saving the history.
---
1. Create the directory `./tmux-history` if it does not already exist.
2. Capture the complete history of the tmux session specified by `$1`.
3. Save the captured history to the file: `./tmux-history/$1-$timestamp.log`.
4. Kill the tmux session $1
