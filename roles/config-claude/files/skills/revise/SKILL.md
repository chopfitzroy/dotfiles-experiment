# /revise

Rewrite the implementation plan incorporating the user's edits into a clean, coherent document.

Workflow: `/research` → `/plan` → `/revise` → `/open-pr`

## Process

1. Resolve task directory by matching the current git branch name to entries under `./claude-plans/`; if no match, ask the user which to use
2. Read `./claude-plans/{task-name}/research.md` (for context) and `plan.md` (to revise); if `plan.md` is missing, suggest running `/plan` first
3. Rewrite `plan.md` as a clean, complete, standalone plan that incorporates the user's inline edits (added text, rewritten sections, deleted content, comments)
4. Summarize what changed and suggest the user review again or proceed to implementation

## Constraints

- Can be run multiple times — each pass reads the latest `plan.md` and produces a clean rewrite
- The rewritten plan must be standalone; never reference "the previous version"
- Also serves as a session re-entry point: reloads context from both files even if no edits were made
- If the user's edits are ambiguous, ask for clarification rather than guessing
