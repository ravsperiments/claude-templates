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

3. Analyze staged changes for:
   - Type: feat, fix, refactor, chore, docs, test
   - Scope: area affected
   - Purpose: what and why

4. Generate commit message:
```
<type>(<scope>): <description>

[optional body - why, not how]

Co-Authored-By: Claude <noreply@anthropic.com>
```

Rules:
- Subject: imperative, <50 chars, no period
- Body: wrap 72 chars

5. Commit using HEREDOC:
```bash
git commit -m "$(cat <<'EOF'
<message>
EOF
)"
```

6. Confirm with `git log -1 --oneline`

$ARGUMENTS
