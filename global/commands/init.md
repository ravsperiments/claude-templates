# Initialize Project

Set up or review project-level Claude configuration following the philosophy.

## Usage

- `/init` — Create project CLAUDE.md
- `/init review` — Review existing CLAUDE.md for philosophy adherence
- `/init skill <name>` — Create a new custom skill/command

## Philosophy Checklist

Every CLAUDE.md and skill must follow:

| Principle | Check |
|-----------|-------|
| Simplicity | No enterprise patterns, one dial complexity |
| Explicit | Clear instructions, no ambiguity |
| Minimal | Only what's needed, no "just in case" |
| Forkable | Strangers can understand and use it |

## Create Project CLAUDE.md (`/init`)

1. Analyze the project:
   - Stack (package.json, Cargo.toml, etc.)
   - Structure (src/, lib/, etc.)
   - Existing patterns

2. Generate CLAUDE.md with sections:

```markdown
# <Project Name>

<One-line description>

## Stack

<Language, framework, key dependencies>

## Structure

```
<key directories and their purpose>
```

## Commands

| Command | Purpose |
|---------|---------|
| `npm run dev` | Start development server |
| `npm test` | Run tests |

## Patterns

<Project-specific conventions to follow>

## Rules

<Project-specific rules, if any>
```

3. Keep it concise — link to docs/ for details
4. Ask user to review before writing

## Review CLAUDE.md (`/init review`)

1. Read existing project CLAUDE.md
2. Score against philosophy:

| Check | Pass/Fail |
|-------|-----------|
| Under 100 lines | |
| No redundant sections | |
| Commands are runnable | |
| Patterns are specific | |
| No enterprise jargon | |
| A stranger could follow it | |

3. Report:
```
CLAUDE.md Review:
- Simplicity: PASS/ISSUES
- Clarity: PASS/ISSUES
- Usefulness: PASS/ISSUES

Score: X/10

[Specific recommendations if any]
```

4. Offer to fix issues if found

## Create Skill (`/init skill <name>`)

1. Create `commands/<name>.md` in project root or `.claude/commands/`

2. Use this template:

```markdown
# <Skill Name>

<One-line description of what this skill does>

## Usage

- `/<name>` — Default behavior
- `/<name> <arg>` — With argument

## Instructions

<Clear, numbered steps>

1. First step
2. Second step
3. Report results

## Rules

- Rule 1
- Rule 2

$ARGUMENTS
```

3. Skill design principles:
   - Single purpose — one skill, one job
   - Clear output — always report what was done
   - Fail fast — stop on errors, explain why
   - No side effects — don't change unrelated things

4. Ask user to review before writing

## Examples

```
/init                    # Create project CLAUDE.md
/init review             # Review existing CLAUDE.md
/init skill deploy       # Create deploy skill
/init skill test-e2e     # Create e2e testing skill
```

$ARGUMENTS
