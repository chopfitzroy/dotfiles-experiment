# /research

Scaffold a task directory and research a topic for future implementation.

Workflow: `/research` → `/plan` → `/revise` → `/open-pr`

## Process

1. Extract the task description from the user's prompt (everything after `/research`)
2. Infer a kebab-case task name and confirm with the user
3. Create `./claude-plans/{task-name}/`
4. Ensure `claude-plans/` is listed in `.gitignore` (create or append as needed)
5. Carry out the research described in the user's prompt using whatever tools are appropriate
6. Write findings to `./claude-plans/{task-name}/research.md`
7. Suggest the user review findings, then run `/plan`

## Output Format

Write `research.md` using this structure (adapt sections to fit the findings):

```markdown
# Research: {Task Description}

## Summary

{Brief overview of findings}

## Findings

{Detailed research results, organized by topic}

## Key Considerations

{Important constraints, risks, trade-offs, or decisions that will affect implementation}

## References

{Links, file paths, or other sources consulted}
```

## Constraints

- The user's prompt is the primary input — the skill provides scaffolding, not research direction
- `claude-plans/` must be gitignored so research artifacts don't pollute the repo
- If the task directory already exists, confirm before continuing
