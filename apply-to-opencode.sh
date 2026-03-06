#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "The script DIR: $SCRIPT_DIR"

echo "Copy $SCRIPT_DIR/agents/opencode/primary/SRE-Lite.md => ~/.config/opencode/agents/"
cp -rf $SCRIPT_DIR/agents/opencode/primary/SRE-Lite.md ~/.config/opencode/agents/

echo "Copy $SCRIPT_DIR/agents/opencode/subagent/sre-tmux-agent.md => ~/.config/opencode/agents/"
cp -rf $SCRIPT_DIR/agents/opencode/subagent/sre-tmux-agent.md ~/.config/opencode/agents/

echo "Copy $SCRIPT_DIR/commands/opencode/* => ~/.config/opencode/commands/"
cp -rf $SCRIPT_DIR/commands/opencode/* ~/.config/opencode/commands/
