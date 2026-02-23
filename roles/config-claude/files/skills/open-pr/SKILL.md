# /open-pr

Create a pull request with research and plan context embedded as collapsible sections.

Workflow: `/research` → `/plan` → `/revise` → `/open-pr`

## Process

1. Resolve task directory by matching the current git branch name to entries under `./claude-plans/`; if no match, proceed without research/plan context
2. Read `research.md` and `plan.md` from the task directory (both optional)
3. Analyze branch changes against the base branch (`git log`, `git diff --stat`, `git diff`)
4. Generate a PR title (under 70 characters) and body using the output format below
5. Run pre-flight checks:
   - `gh auth status` — exit if not authenticated
   - Verify branch is pushed to remote; offer to push if not
   - Verify commits ahead of base branch; exit if none
   - `gh pr view` — if PR already exists, show its URL instead of creating a duplicate
6. Create the PR via `gh pr create` using a heredoc for the body; display the resulting URL

## Output Format

PR body structure:

```markdown
## Summary

- {Bullet point summarizing key change}
- {Another bullet if needed}

## Changes

{Description of what was changed and why, organized by area}

## Test Plan

- [ ] {How to verify the changes work}
- [ ] {Additional verification steps}

<details>
<summary>Research Context</summary>

{Full contents of research.md, or "No research document found." if missing}

</details>

<details>
<summary>Implementation Plan</summary>

{Full contents of plan.md, or "No implementation plan found." if missing}

</details>

---
Generated with [Claude Code](https://claude.com/claude-code)
```

## Constraints

- Works without research.md and plan.md — can create a standard PR from branch changes alone
- If the combined PR body exceeds ~60,000 characters, truncate the longer of research.md or plan.md with a note: `*Content truncated due to length. See ./claude-plans/{task-name}/ for full documents.*` — never truncate the Summary or Test Plan
- PR title should reflect the actual changes, not just the task name
- Base branch is auto-detected but can be overridden if the user specifies one
