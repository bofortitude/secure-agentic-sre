---
description: Execute tasks in tmux session with rules.
---
Remember the following rules:
- IMPORTANT: All bash commands MUST be executed in the tmux session using tmux send-keys, not executed on the host system directly.
- IMPORTANT: Never generate commands requiring manual input or keypress to exit
- IMPORTANT: Always disable pagers for AWS CLI and other tools (e.g. `AWS_PAGER=""` or `--no-cli-pager`)
- IMPORTANT: Never generate commands requiring manual input or keypress to exit
- IMPORTANT: For all "write" commands, the warning and explanation MUST be presented to user.


Please perform the following steps in order:
**[Step 1]**: Create a To-Do List. Outline the specific sub-tasks required to: 
In the tmux session $ARGUMENTS.

**[Step 2]**: Execute. Complete each item on the To-Do list in order.

**[Step 3]**: Review. Check the final output against the original To-Do list to ensure nothing was missed.

