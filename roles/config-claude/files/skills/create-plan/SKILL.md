# /plan

Create an implementation plan from a user instruction, informed by research findings.

Workflow: `/research` → `/plan` → `/revise` → `/open-pr`

## Process

1. Extract the planning instruction from the user's prompt (everything after `/plan`)
2. Resolve task directory by matching the current git branch name to entries under `./claude-plans/`; if no match, ask the user which to use
3. Read `./claude-plans/{task-name}/research.md` for supporting context (if missing, offer to proceed without it or run `/research` first)
4. Write an implementation plan to `./claude-plans/{task-name}/plan.md` driven by the user's instruction, using research as context
5. Suggest the user review the plan, edit it, then run `/revise` or proceed to implementation

## Output Format

Write `plan.md` using this structure (adapt sections to fit the task):

```markdown
# Plan: {Task Description}

## Context

{Brief summary of the problem and why this work is needed}

## Files to Create/Modify

| File | Description |
|------|-------------|
| path/to/file | What changes and why |

## Implementation Steps

### Step 1: {Step Title}

{What to do, why, and any important details}

### Step 2: {Step Title}

{Continue for each step}

## Testing

{How to verify the implementation works}

## Open Questions

{Anything unresolved that needs user input before implementation}
```

## Constraints

- The user's instruction drives the plan; research.md is supporting context, not direction
- The plan should be concrete enough that implementation is mostly mechanical
- File paths should be real paths in the codebase, not placeholders
- Surface uncertainties in Open Questions rather than making silent assumptions
- If `plan.md` already exists, confirm before overwriting
