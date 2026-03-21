# Commit Changes

Create well-formatted commit for staged changes.

## Instructions

1. Check status:
```bash
git status
git diff --staged --stat
```

If nothing staged, show unstaged changes and ask what to stage.

2. Run `/verify` — do NOT proceed if it fails

3. Check untracked files for gitignore candidates:
   - Build artifacts (dist/, build/, *.pyc)
   - Secrets (.env, *.key, credentials)
   - Dev workspace (.dev/)
   - Dependencies (node_modules/, .venv/)

   If found, ask user: "Should these be added to .gitignore?"

4. Analyze staged changes for:
   - Type: feat, fix, refactor, chore, docs, test
   - Scope: area affected
   - Purpose: what and why

5. Generate commit message:
```
<type>(<scope>): <description>

[optional body - why, not how]

Co-Authored-By: Claude <noreply@anthropic.com>
```

Rules:
- Subject: imperative, <50 chars, no period
- Body: wrap 72 chars

6. Commit using HEREDOC:
```bash
git commit -m "$(cat <<'EOF'
<message>
EOF
)"
```

7. Confirm with `git log -1 --oneline`

$ARGUMENTS
