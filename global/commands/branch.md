# Create Branch

Create a well-named branch from task description.

## Instructions

1. Parse $ARGUMENTS to understand the task
2. Determine type:
   - `feat/` — new feature
   - `fix/` — bug fix
   - `chore/` — maintenance, deps
   - `refactor/` — restructuring
3. Generate slug: kebab-case, 2-4 words max
4. Create and checkout:

```bash
git checkout -b <type>/<slug>
```

5. Confirm: show branch name created

## Examples

| Input | Branch |
|-------|--------|
| "add user authentication" | `feat/user-auth` |
| "fix login timeout bug" | `fix/login-timeout` |
| "update dependencies" | `chore/update-deps` |
| "simplify error handling" | `refactor/error-handling` |

$ARGUMENTS
