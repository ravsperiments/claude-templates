# Dev Workspace

Manage local development docs that don't sync to git.

## Structure

```
.dev/
├── plans/       # Implementation plans
├── specs/       # Requirements, specifications
├── designs/     # Design docs, diagrams, mockups
├── notes/       # Research, scratchpad, ideas
└── milestones/  # Project tracking, progress
```

## Rules

- `.dev/` is gitignored — local working docs only
- `docs/` is for polished, committed documentation
- Move from `.dev/` to `docs/` when finalized

## Instructions

If $ARGUMENTS is empty:
1. Create `.dev/` structure if missing
2. List existing contents
3. Remind to add `.dev/` to `.gitignore`

If $ARGUMENTS starts with a category (plan, spec, design, note, milestone):
1. Create file in appropriate subfolder
2. Use kebab-case filename
3. Add basic template structure

If $ARGUMENTS is "clean":
1. List old/stale files in `.dev/`
2. Ask which to delete or move to `docs/`

## Examples

```
/dev                           # Init .dev/ structure
/dev plan user-auth            # Create .dev/plans/user-auth.md
/dev spec api-endpoints        # Create .dev/specs/api-endpoints.md
/dev design homepage           # Create .dev/designs/homepage.md
/dev note research-caching     # Create .dev/notes/research-caching.md
/dev milestone v1-launch       # Create .dev/milestones/v1-launch.md
/dev clean                     # Review and clean stale files
```

## Templates

### Plan
```markdown
# Plan: [Name]

## Goal
[1-2 sentences]

## Approach
1. [Step]
2. [Step]

## Files
- `path/to/file` — [change]

## Risks
- [Consideration]
```

### Spec
```markdown
# Spec: [Name]

## Overview
[What this is]

## Requirements
- [ ] [Requirement]

## Non-goals
- [What this is NOT]
```

### Milestone
```markdown
# Milestone: [Name]

## Target
[Date or condition]

## Deliverables
- [ ] [Item]

## Status
[Current state]
```

$ARGUMENTS
