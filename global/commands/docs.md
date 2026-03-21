# Organize Documentation

Keep docs organized, never scattered.

## Default Structure

```
project/
├── README.md              # Project overview only
├── CLAUDE.md              # Claude instructions
└── docs/
    ├── spec.md            # Project-level requirements
    ├── architecture.md    # Project-level design
    ├── plan.md            # Project-level execution plan
    ├── api.md
    │
    ├── features/          # Simple: feature-level docs
    │   └── <feature-name>/
    │       ├── spec.md
    │       ├── design.md
    │       └── plan.md
    │
    ├── milestones/        # Complex: milestone → features
    │   └── <milestone-name>/
    │       ├── spec.md    # Milestone-level spec
    │       ├── plan.md    # Milestone-level plan
    │       └── features/
    │           └── <feature-name>/
    │               ├── spec.md
    │               ├── design.md
    │               └── plan.md
    │
    └── archive/           # Completed/obsolete docs
        └── <date>-<name>.md
```

## Hierarchy

Standard docs (spec.md, design.md, architecture.md, plan.md) can exist at any level:

| Level | Scope | Example |
|-------|-------|---------|
| `docs/` | Entire project | `docs/spec.md` |
| `docs/milestones/<name>/` | Milestone | `docs/milestones/v1/spec.md` |
| `docs/features/<name>/` | Feature | `docs/features/auth/spec.md` |
| `docs/milestones/<m>/features/<f>/` | Feature in milestone | `docs/milestones/v1/features/auth/spec.md` |

Choose the simplest structure that fits:
- Solo feature? Use `docs/features/<name>/`
- Multiple related features? Use `docs/milestones/<name>/`

## Archive

Move completed or obsolete docs to `docs/archive/`:

```
docs/archive/
├── 2024-01-auth-spec.md       # Completed feature spec
├── 2024-02-old-architecture.md # Superseded design
└── 2024-03-v1-plan.md          # Finished milestone plan
```

Rules:
- Prefix with date: `YYYY-MM-<original-name>.md`
- Keep for reference, don't delete
- Archive when: feature shipped, design superseded, or plan completed

## Standard Doc Types

### spec.md — Product Requirements (PRD-style)

```markdown
# <Project/Feature> Spec

One-line summary of what this is.

## Problem

What problem are we solving? Who has this problem? Why now?

## Users

| User | Need | Current solution |
|------|------|------------------|
| Who | What they need | How they solve it today |

## Goals

What success looks like:
- Goal 1 (measurable)
- Goal 2 (measurable)

## Non-Goals

Explicitly out of scope:
- Not doing X
- Not solving Y

## Requirements

| ID | Requirement | Priority | Notes |
|----|-------------|----------|-------|
| R1 | Must do X | Must | Core functionality |
| R2 | Should do Y | Should | Important but not blocking |
| R3 | Could do Z | Could | Nice to have |

## User Stories

- As a [user], I want [action] so that [benefit]
- As a [user], I want [action] so that [benefit]

## Constraints

| Constraint | Impact |
|------------|--------|
| Budget/time | What it limits |
| Technical | What it requires |
| Business | What it demands |

## Success Criteria

How we know this is done:
- [ ] Criteria 1
- [ ] Criteria 2

## Open Questions

| Question | Status | Decision |
|----------|--------|----------|
| Unresolved issue | Open/Resolved | Answer if resolved |
```

### architecture.md — Technical Architecture

```markdown
# <Project> Architecture

High-level technical design and system structure.

## Overview

2-3 sentences: what the system does technically, key technologies, deployment model.

## System Diagram

```
[Client] --> [API] --> [Database]
                  \--> [External Service]
```

(ASCII or link to diagram)

## Components

| Component | Purpose | Technology |
|-----------|---------|------------|
| Frontend | User interface | React/Next.js |
| API | Business logic | Node.js |
| Database | Data persistence | PostgreSQL |

## Data Model

| Entity | Fields | Relationships |
|--------|--------|---------------|
| User | id, email, name | has many Posts |
| Post | id, title, body | belongs to User |

## API Design

| Endpoint | Method | Purpose |
|----------|--------|---------|
| /api/users | GET | List users |
| /api/users/:id | GET | Get user |

## Data Flow

1. User action triggers X
2. Frontend calls Y
3. API processes Z
4. Database stores W

## Security

| Concern | Mitigation |
|---------|------------|
| Auth | JWT tokens, session management |
| Data | Encryption at rest, HTTPS |
| Access | Role-based permissions |

## Dependencies

| Dependency | Purpose | Risk |
|------------|---------|------|
| External API | Payment processing | Rate limits |
| Library X | Auth | Maintenance |

## Scalability

How system handles growth:
- Horizontal: Load balancing, replicas
- Vertical: Resource limits
- Data: Partitioning strategy

## Decisions

| Decision | Options considered | Choice | Rationale |
|----------|-------------------|--------|-----------|
| Database | Postgres vs Mongo | Postgres | Relational data, ACID |
| Auth | JWT vs Sessions | JWT | Stateless API |
```

### design.md — Feature Design

```markdown
# <Feature> Design

Technical design for implementing a specific feature.

## Summary

One line: what this feature does and how.

## Approach

How we're building this (high-level strategy).

## Changes

| File/Component | Change | Reason |
|----------------|--------|--------|
| path/to/file | Add function X | Handles Y |
| path/to/other | Modify Z | Support new flow |

## Interface

```typescript
// New or modified APIs, props, functions
function newFeature(input: Type): ReturnType
```

## State Changes

| State | Before | After |
|-------|--------|-------|
| Component state | X | Y |
| Database | Schema A | Schema B |

## Edge Cases

| Case | Handling |
|------|----------|
| Empty input | Return default |
| Invalid data | Validation error |
| Network failure | Retry with backoff |

## Testing

| Test | Type | Covers |
|------|------|--------|
| Test 1 | Unit | Core logic |
| Test 2 | Integration | API flow |

## Migration

Steps to deploy (if breaking changes):
1. Step 1
2. Step 2
```

### plan.md — Execution Plan

```markdown
# <Project/Feature> Plan

Execution roadmap with phases, tasks, and dependencies.

## Summary

One line: what we're delivering and rough timeline.

## Phases

| Phase | Description | Deliverable | Depends On |
|-------|-------------|-------------|------------|
| 1 | Setup | Infrastructure ready | - |
| 2 | Core | MVP functionality | Phase 1 |
| 3 | Polish | Production ready | Phase 2 |

## Tasks

### Phase 1: Setup
- [ ] Task 1.1
- [ ] Task 1.2

### Phase 2: Core
- [ ] Task 2.1
- [ ] Task 2.2

### Phase 3: Polish
- [ ] Task 3.1
- [ ] Task 3.2

## Dependencies

| Dependency | Blocker for | Status |
|------------|-------------|--------|
| API access | Phase 2 | Pending |
| Design review | Phase 3 | Done |

## Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Scope creep | Medium | High | Strict non-goals |
| Tech unknown | Low | Medium | Spike first |

## Checkpoints

| Checkpoint | Criteria | Phase |
|------------|----------|-------|
| Ready for review | Core features work | Phase 2 |
| Ready for launch | All tests pass | Phase 3 |
```

### api.md — API Reference

```markdown
# API Reference

API endpoints and usage.

## Base URL

`https://api.example.com/v1`

## Authentication

How to authenticate (header, token format).

## Endpoints

### Resource Name

#### List Resources

`GET /resources`

| Param | Type | Required | Description |
|-------|------|----------|-------------|
| limit | int | No | Max results (default 20) |

Response:
```json
{ "data": [...], "total": 100 }
```

#### Get Resource

`GET /resources/:id`

Response:
```json
{ "id": "123", "name": "Example" }
```

## Errors

| Code | Meaning |
|------|---------|
| 400 | Bad request |
| 401 | Unauthorized |
| 404 | Not found |
```

### deployment.md — Deployment Guide

```markdown
# Deployment

How to deploy and operate this project.

## Environments

| Environment | URL | Purpose |
|-------------|-----|---------|
| Development | localhost:3000 | Local dev |
| Staging | staging.example.com | Testing |
| Production | example.com | Live |

## Prerequisites

What's needed before deploying:
- [ ] Access to hosting platform
- [ ] Environment variables configured
- [ ] Database provisioned

## Environment Variables

| Variable | Required | Description | Example |
|----------|----------|-------------|---------|
| DATABASE_URL | Yes | Database connection | postgres://... |
| API_KEY | Yes | External API key | sk_live_... |
| DEBUG | No | Enable debug mode | false |

## Deploy Steps

### First-time Setup

1. Step one
2. Step two
3. Step three

### Regular Deploy

```bash
# Commands to deploy
npm run build
npm run deploy
```

## Infrastructure

| Service | Provider | Purpose |
|---------|----------|---------|
| Hosting | Vercel/AWS/etc | Application |
| Database | Supabase/RDS | Data |
| Storage | S3/Cloudflare | Files |

## Monitoring

| What | Tool | Alert threshold |
|------|------|-----------------|
| Uptime | Pingdom | < 99.9% |
| Errors | Sentry | > 10/min |
| Performance | Vercel Analytics | p95 > 3s |

## Rollback

How to rollback if deployment fails:

```bash
# Rollback command
vercel rollback
```

## Troubleshooting

| Issue | Cause | Fix |
|-------|-------|-----|
| Build fails | Missing env var | Check .env |
| 500 errors | DB connection | Check DATABASE_URL |
```

### contributing.md — Contribution Guide

```markdown
# Contributing

How to contribute to this project.

## Quick Start

1. Fork the repo
2. Create a branch (`git checkout -b feature/name`)
3. Make changes
4. Run tests (`npm test`)
5. Commit (`git commit -m "feat: add X"`)
6. Push (`git push origin feature/name`)
7. Open PR

## Development Setup

```bash
# Clone
git clone <repo>
cd <project>

# Install
npm install

# Run
npm run dev
```

## Code Standards

| Area | Standard |
|------|----------|
| Style | Prettier + ESLint |
| Commits | Conventional commits |
| Tests | Required for new features |
| Docs | Update if behavior changes |

## Commit Messages

Format: `type(scope): description`

| Type | Use for |
|------|---------|
| feat | New feature |
| fix | Bug fix |
| docs | Documentation |
| refactor | Code restructuring |
| test | Adding tests |
| chore | Maintenance |

## Pull Requests

- Keep PRs focused (one feature/fix)
- Update tests and docs
- Fill out PR template
- Request review
```

### testing.md — Testing Guide

```markdown
# Testing

How to test this project.

## Quick Start

```bash
# Run all tests
npm test

# Run with coverage
npm run test:coverage

# Run specific test
npm test -- --grep "test name"
```

## Test Structure

```
tests/
├── unit/           # Unit tests
├── integration/    # Integration tests
└── e2e/            # End-to-end tests
```

## Test Types

| Type | Purpose | Speed | Scope |
|------|---------|-------|-------|
| Unit | Test functions in isolation | Fast | Single function |
| Integration | Test components together | Medium | Multiple units |
| E2E | Test full user flows | Slow | Entire app |

## Writing Tests

```typescript
describe('Feature', () => {
  it('should do X when Y', () => {
    // Arrange
    const input = 'test';

    // Act
    const result = feature(input);

    // Assert
    expect(result).toBe('expected');
  });
});
```

## Coverage Requirements

| Metric | Minimum |
|--------|---------|
| Statements | 80% |
| Branches | 75% |
| Functions | 80% |
| Lines | 80% |

## Test Data

| Data | Location | Purpose |
|------|----------|---------|
| Fixtures | `tests/fixtures/` | Static test data |
| Factories | `tests/factories/` | Dynamic test data |
| Mocks | `tests/mocks/` | External service mocks |

## CI/CD

Tests run automatically on:
- Pull request
- Push to main
- Nightly schedule
```

### runbook.md — Operations Runbook

```markdown
# Runbook

Operational procedures for incidents and maintenance.

## Contacts

| Role | Name | Contact |
|------|------|---------|
| On-call | Rotation | PagerDuty |
| Escalation | Team lead | Slack #team |

## Common Incidents

### Service Down

**Symptoms**: 5xx errors, health check failing

**Diagnosis**:
```bash
# Check service status
kubectl get pods

# Check logs
kubectl logs <pod>
```

**Resolution**:
1. Check recent deployments
2. Rollback if needed: `vercel rollback`
3. Check database connectivity
4. Restart service if stuck

### High Latency

**Symptoms**: p95 > 3s, slow responses

**Diagnosis**:
```bash
# Check resource usage
kubectl top pods

# Check database
SELECT * FROM pg_stat_activity;
```

**Resolution**:
1. Check for slow queries
2. Scale horizontally if CPU-bound
3. Check external dependencies

### Database Issues

**Symptoms**: Connection errors, timeouts

**Diagnosis**:
```bash
# Check connections
SELECT count(*) FROM pg_stat_activity;

# Check locks
SELECT * FROM pg_locks WHERE NOT granted;
```

**Resolution**:
1. Kill long-running queries
2. Increase connection pool
3. Failover if primary down

## Maintenance Procedures

### Database Backup

```bash
# Manual backup
pg_dump $DATABASE_URL > backup.sql
```

Schedule: Daily at 00:00 UTC

### Log Rotation

Logs retained for 30 days.
Location: CloudWatch / Datadog

### Certificate Renewal

Certificates auto-renew via Let's Encrypt.
Check expiry: `openssl s_client -connect example.com:443`

## Escalation

| Severity | Response time | Escalate after |
|----------|---------------|----------------|
| P1 - Down | 15 min | 30 min |
| P2 - Degraded | 1 hour | 4 hours |
| P3 - Minor | 24 hours | 3 days |
```

### Default — General Documentation

For unknown doc types, use this structure:

```markdown
# <Title>

One-line description of what this document covers.

## Overview

Context and background (2-3 paragraphs max).

## <Main Content Sections>

Organize by topic. Use:
- Tables for structured data
- Code blocks for examples
- Lists for sequences

## Reference

Links, resources, related docs.
```

Let Claude determine appropriate sections based on content purpose.

## Naming Convention

| Pattern | Example | Use for |
|---------|---------|---------|
| `kebab-case.md` | `api-reference.md` | Standard docs |
| `UPPERCASE.md` | `README.md` | Root-level special files only |

Rules:
- Always lowercase with hyphens: `api-reference.md` not `API_Reference.md`
- No spaces or underscores: `quick-start.md` not `quick_start.md`
- Be specific: `auth-flow.md` not `auth.md`
- No version numbers: `migration.md` not `migration-v2.md`

Reserved uppercase names (root only):
- `README.md`, `CLAUDE.md`, `CHANGELOG.md`, `LICENSE.md`

## Rules

NEVER create markdown files in:
- Root directory (except README.md, CLAUDE.md, CHANGELOG.md)
- Random subdirectories
- Next to source files (unless inline code docs)

ALWAYS put documentation in `docs/` folder.

## Instructions

If $ARGUMENTS is empty:
1. Find scattered .md files: `find . -name "*.md" -not -path "./docs/*" -not -path "./node_modules/*" -not -path "./.git/*"`
2. List files that should move to `docs/`
3. Exclude: README.md, CLAUDE.md, CHANGELOG.md, LICENSE.md
4. Ask user to confirm before moving
5. Move files, update any internal links

If $ARGUMENTS is "sync" or "update":
1. Review git history for recent changes:
   ```bash
   git log --oneline -20
   git diff --stat HEAD~10
   ```
2. Check if README.md reflects current state:
   - Project description accurate?
   - Install/usage instructions current?
   - Features list up to date?
3. Check if CHANGELOG.md needs updating (if exists)
4. Scan docs/ for outdated content
5. Propose updates, ask for confirmation before editing

If $ARGUMENTS is "review":
Perform deep documentation review to consolidate and clean up docs.

### Step 1: Inventory
List all docs with:
| File | Purpose | Lines | Issues |
|------|---------|-------|--------|

### Step 2: Naming Check
Flag files not matching kebab-case:
| Before | After |
|--------|-------|
| `API.md` | `api.md` |
| `CODE_QUALITY.md` | `code-quality.md` |

### Step 3: Redundancy Analysis
Identify docs that should be merged or deleted:

| File | Verdict | Reason |
|------|---------|--------|
| `sheets.md` | Merge → architecture.md | Data model belongs in architecture |
| `code-quality.md` | Delete | Covered by /verify skill |
| `old-plan.md` | Archive | Completed milestone |
| `react-native.md` | Move → backlog or .dev/ | Future feature, not reference |

Questions to ask:
- Is this covered by a skill? → Delete
- Is this a subset of another doc? → Merge
- Is this a future plan? → Move to .dev/ or backlog
- Is this completed work? → Archive
- Is this duplicated in CLAUDE.md? → Keep in one place only

### Step 4: Template Compliance
For known doc types, check against templates and add missing sections:

| Doc Type | Required Sections |
|----------|-------------------|
| spec.md | Problem, Users, Goals, Non-Goals, Requirements, Success Criteria |
| architecture.md | Overview, Components, Data Model, Security, Decisions |
| design.md | Approach, Changes, Interface, Edge Cases |
| plan.md | Phases, Tasks, Dependencies, Risks |
| api.md | Base URL, Auth, Endpoints, Errors |
| deployment.md | Environments, Env Vars, Deploy Steps, Rollback |
| testing.md | Quick Start, Test Structure, Test Types, Coverage |
| runbook.md | Contacts, Common Incidents, Maintenance, Escalation |

If doc matches a known type but is missing sections → add them.

### Step 5: Content Cleanup
For each doc, check:
| Issue | Fix |
|-------|-----|
| Emoji | Remove |
| Changelog/history | Remove (use git) |
| File listings | Remove (use codebase) |
| Marketing speak | Rewrite plainly |
| Excessive detail | Summarize, link to code |

### Step 6: Content Structure Check
Each doc MUST follow this structure:

```markdown
# Title

One-line purpose statement.

## Section 1

Content...

## Section 2

Content...
```

Structure rules:
| Rule | Bad | Good |
|------|-----|------|
| Single H1 | Multiple `#` headings | One `#`, rest `##` or lower |
| Purpose first | Jump into content | First line explains what this doc is |
| Heading hierarchy | `#` → `###` (skip) | `#` → `##` → `###` (sequential) |
| Consistent depth | Mix of `##` and `####` | Same level for same importance |
| No orphan text | Text before first `##` | All content under a heading |
| Section order | Random | Logical flow (overview → details → reference) |
| Tables over lists | Long bullet lists | Tables for structured data |
| Code blocks labeled | \`\`\` | \`\`\`bash or \`\`\`typescript |

Writing style:
| Avoid | Use |
|-------|-----|
| "This document describes..." | Just describe it |
| "We will..." | Imperative: "Run..." |
| Passive voice | Active voice |
| Jargon without context | Plain language or define terms |
| Walls of text | Short paragraphs, tables, lists |

### Step 7: Report
Present changes table:
```
Documentation Review:

Renames:
| Before | After |
|--------|-------|

Merges:
| Source | Target | Sections moved |
|--------|--------|----------------|

Deletions:
| File | Reason |
|------|--------|

Content fixes:
| File | Changes |
|------|---------|

Link updates needed:
| File | Old link | New link |
|------|----------|----------|
```

### Step 8: Execute
After user approval:
1. Rename files (git mv)
2. Merge content
3. Delete redundant files
4. Clean content
5. Update all links in README.md, CLAUDE.md, and other docs
6. Report final structure

If $ARGUMENTS is "readme":
1. Analyze codebase: package.json, main files, structure
2. Review recent git history for context
3. Generate/update README.md using template below
4. Keep it concise — link to docs/ for details

## README Template

```markdown
# Project Name

One-line description of what this does.

## Quick Start

\`\`\`bash
# Install
<install command>

# Run
<run command>
\`\`\`

## What It Does

2-3 sentences explaining the core functionality.
No marketing speak. Just what it does.

## Usage

\`\`\`bash
# Basic example
<command or code>
\`\`\`

## Configuration

| Option | Default | Description |
|--------|---------|-------------|
| `option` | `value` | What it does |

(Only if config exists. Skip if not needed.)

## Project Structure

\`\`\`
src/
├── main.ts      # Entry point
└── lib/         # Core logic
\`\`\`

(Only for non-obvious structures. Skip for simple projects.)

## License

MIT (or whatever applies)
```

### README Rules

- No badges unless meaningful
- No "Features" list with checkmarks
- No screenshots unless essential
- No "Contributing" section for solo projects
- Quick Start must actually work — test it
- Link to docs/ for anything longer than 3 lines

If $ARGUMENTS is "spec", "architecture", or "plan":
1. Create the doc in `docs/` using the template above
2. Pre-fill sections based on codebase analysis
3. Ask user to review and refine

If $ARGUMENTS is "feature <name>":
1. Create `docs/features/<name>/` directory
2. Create spec.md, design.md, plan.md using templates
3. Pre-fill based on any existing context

If $ARGUMENTS is "milestone <name>":
1. Create `docs/milestones/<name>/` directory
2. Create spec.md, plan.md at milestone level
3. Ask if features should be added

If $ARGUMENTS is "milestone <milestone> feature <name>":
1. Create `docs/milestones/<milestone>/features/<name>/`
2. Create spec.md, design.md, plan.md using templates

If $ARGUMENTS is "archive <path>":
1. Move the doc to `docs/archive/` with date prefix
2. Format: `YYYY-MM-<original-name>.md`
3. Update any links pointing to the archived doc

If $ARGUMENTS is other text:
1. Create the requested doc in `docs/` folder
2. Use clear heading structure
3. Keep it concise

## Examples

```
/docs                     # Find and organize scattered docs
/docs review              # Deep review: consolidate, clean, rename
/docs sync                # Update docs based on git history
/docs readme              # Update README.md from codebase

# Project-level docs
/docs spec                # Create docs/spec.md
/docs architecture        # Create docs/architecture.md
/docs plan                # Create docs/plan.md

# Feature docs
/docs feature auth        # Create docs/features/auth/ with spec, design, plan

# Milestone docs
/docs milestone v1        # Create docs/milestones/v1/ with spec, plan
/docs milestone v1 feature auth  # Create docs/milestones/v1/features/auth/

# Archive
/docs archive docs/features/auth/spec.md  # Move to docs/archive/2024-03-auth-spec.md

# Other
/docs api reference       # Create docs/api-reference.md
```

$ARGUMENTS
