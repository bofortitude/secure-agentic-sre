---
description: Execute tasks in tmux session with rules.
---
**MUST** follow the rules:
- **MUST:** All bash commands **MUST** be executed in the **tmux_session** using `tmux send-keys`, not executed on the host system directly.
- **MUST:** Never generate commands requiring manual input or keypress to exit
- **MUST:** Always disable pagers for AWS CLI and other tools by `AWS_PAGER=""` or `--no-cli-pager`
- **MUST:** Use `tmux capture-pane -J` (avoid line wrapping)
- **WARNING:** Explain any "write" commands before execution.

Please perform the following steps in order:
**[Step 1]**: Create a To-Do List. Outline the specific sub-tasks required to: 
In the tmux session $ARGUMENTS.

**[Step 2]**: Execute. Complete each item on the To-Do list in order.

**[Step 3]**: Review. Check the final output against the original To-Do list to ensure nothing was missed.

