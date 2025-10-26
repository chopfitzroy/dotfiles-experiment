# Agentic Workflow: Git-Centric Development

## Overview

This workflow uses **git as the locus of control** for agentic development, where AI tools (like Claude Code) modify files while you observe changes in real-time through git diffs.

## Core Concept

Instead of maintaining persistent editor windows that can fall out of sync with external changes, this approach:

1. **Uses lazygit as the primary interface** - your central command center
2. **Watches AI modifications live** - see diffs update in real-time as agents work
3. **Makes quick manual edits when needed** - press `e` in lazygit to jump into your editor
4. **Avoids file reload issues entirely** - no persistent windows = no sync problems

## Workflow Steps

### 1. Open lazygit in your project
```bash
cd ~/Developer/your-project
lazygit
```

### 2. Start your AI coding tool
Run Claude Code, OpenAI Codex, or similar tools that modify files.

### 3. Watch changes in real-time
As the AI modifies files, lazygit automatically refreshes every second, showing you:
- Unstaged changes (what the AI is modifying)
- Staged changes (what you've approved)
- Live diffs of all modifications

### 4. Make quick manual edits
When you spot something that needs a manual tweak:
- Press `e` on the file in lazygit
- Make your edit in Helix
- Save and exit
- lazygit automatically returns you to the diff view

### 5. Stage and commit
Review the combined AI + manual changes, stage what you want, and commit.

## lazygit Configuration

Location: `~/.config/lazygit/config.yml`

```yaml
gui:
  # Refresh every second to see AI changes live
  refreshInterval: 1

os:
  # Use Helix for quick edits (uses hx binary)
  editPreset: 'helix'

# Return to lazygit immediately after editing
promptToReturnFromSubprocess: false
```

## Benefits

### No File Reload Issues
By not keeping editor windows open, you completely avoid the problem of buffers falling out of sync with external changes.

### Git as Single Source of Truth
All changes—whether from AI or manual edits—flow through git diffs. You review everything in one place.

### Unix Philosophy: One Tool, One Job
- **lazygit**: Git interface and change orchestration
- **AI tools**: Code generation and modification
- **Helix**: Quick, focused edits
- Each tool does exactly one thing well

### Smooth Workflow
With `promptToReturnFromSubprocess: false`, jumping into Helix and back is seamless. No friction between viewing diffs and making edits.

### Live Feedback Loop
With 1-second refresh, you see AI changes almost instantly. This creates a tight feedback loop where you can:
- Spot issues early
- Interrupt if the AI goes off-track
- Make corrections immediately

## Philosophy

> "externalize tools, one tool for the job, the helix way is the unix way"
>
> — From [Helix GitHub Issue #1125](https://github.com/helix-editor/helix/issues/1125)

This workflow embraces the Unix philosophy by:
- Using specialized tools for specific tasks
- Composing tools together for complex workflows
- Avoiding monolithic solutions that try to do everything
- Making git the coordination layer between tools

## Multiple Editor Windows Anti-Pattern

Traditional workflow with persistent editors:
```
Editor Window 1 (file.ts) ←→ Filesystem ←→ Editor Window 2 (file.ts)
                                ↕
                             AI Tool

Result: Out-of-sync buffers, constant reload prompts, merge conflicts
```

Git-centric workflow:
```
                    Filesystem
                        ↕
                    lazygit (diffs)
                    ↗   ↓   ↘
            AI Tool   You   Helix (quick edits)

Result: Single source of truth, no sync issues, clear change visibility
```

## Tips

- **Stage progressively**: Don't wait until the AI is "done". Stage good changes as they appear.
- **Interrupt early**: If you see the AI going the wrong direction, stop it and make a manual correction.
- **Use git as memory**: Your commit history becomes a log of the AI + human collaboration.
- **Trust the diffs**: Let git show you exactly what changed, rather than trying to track it mentally.

## When to Use This vs. Traditional Editors

**Use this workflow when:**
- Working with AI coding tools
- Collaborating across multiple tools/processes
- Need to review changes carefully before committing
- Want to avoid file sync issues

**Use traditional persistent editors when:**
- Deep focus on a single file/feature
- No external modifications to files
- Prefer IDE features (autocomplete, inline errors, etc.)
- Working solo without AI assistance

## Related Concepts

- **Git-based code review**: Similar to PR review workflow, but for AI-generated changes
- **TDD with AI**: Watch tests turn green in real-time as AI implements features
- **Pair programming with AI**: You're the "driver" (reviewing), AI is the "navigator" (typing)
