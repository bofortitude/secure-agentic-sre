---
description: Force the OpenCode to execute tasks in tmux session.
---
Remember the following rules:
- IMPORTANT: All bash commands MUST be executed in the tmux session using tmux send-keys, not executed on the host system directly.
- IMPORTANT: Never generate commands requiring manual input or keypress to exit
- IMPORTANT: Always disable pagers for AWS CLI and other tools (e.g. `AWS_PAGER=""` or `--no-cli-pager`)
- IMPORTANT: Never generate commands requiring manual input or keypress to exit
- IMPORTANT: For all "write" commands, the warning and explanation MUST be presented to user.

In the tmux session $ARGUMENTS

