#!/bin/bash
# TODO: Effort level not yet in status line payload
#       https://github.com/anthropics/claude-code/issues/31987
# TODO: Rate limit / remaining quota not yet in status line payload
#       https://github.com/anthropics/claude-code/issues/8412
input=$(cat)

MODEL=$(echo "$input" | jq -r '.model.display_name')
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0 | round')

# Pull effort from settings.json (workaround for missing status line field)
EFFORT=$(jq -r '.effortLevel // "high"' ~/.claude/settings.json 2>/dev/null)
EFFORT="${CLAUDE_CODE_EFFORT_LEVEL:-$EFFORT}"

echo "[$MODEL] Effort: $EFFORT | Context: ${PCT}%"
