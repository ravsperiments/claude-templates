# Create Pull Request

Push branch and create PR.

## Instructions

1. Gather context:
```bash
git branch --show-current
git log $(git merge-base HEAD origin/main)..HEAD --oneline
git diff $(git merge-base HEAD origin/main)..HEAD --stat
```

2. Run `/verify` — if fails, ask to fix first or proceed anyway

3. Push branch:
```bash
git push -u origin $(git branch --show-current)
```

4. Create PR:
```bash
gh pr create --title "<type>: <description>" --body "$(cat <<'EOF'
## Summary
<1-3 bullets: what and why>

## Test Plan
- [ ] Lint passes
- [ ] Tests pass
- [ ] Build succeeds

---
Co-authored with Claude
EOF
)"
```

5. Output PR URL

If $ARGUMENTS contains "draft", add `--draft` flag.

$ARGUMENTS
