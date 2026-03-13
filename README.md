# agent-forge

A meta-project for [Claude Code](https://claude.ai/code) that audits and upgrades multi-agent systems across your coding projects.

You register your projects. The forge scans them against a pattern library, identifies gaps, and propagates best practices — one project at a time.

## Setup

```bash
git clone https://github.com/skondrashov/agent-forge.git
cd agent-forge
```

## Usage

Open agent-forge in Claude Code and say:

```
light the forge
```

On first run, the orchestrator walks you through setup — asks what projects you have, scans their existing agent systems, registers them, and runs the first audit. On return visits, it picks up where it left off.

The orchestrator runs a loop:

1. **Audit** — scans every registered project's agent system
2. **Review** — compares against the pattern library, ranks by priority
3. **Propagate** — applies upgrades to one project at a time
4. **Update** — refreshes patterns and the registry
5. **Repeat**

## What It Looks For

The forge audits for four patterns:

| Pattern | What it is |
|---------|-----------|
| **Startup Protocol** | Standalone `PROTOCOL.md` with timestamps, forum voting, ref doc routing |
| **Shutdown Reflection** | Agents evaluate their context at session end; feedback fixes the docs |
| **Reference Doc Splitting** | Slim `AGENTS.md` + role-specific `ref/*.md` files to reduce context bloat |
| **Librarian Feedback Loop** | A doc-maintenance agent (or orchestrator task) that processes reflection feedback |

Each pattern has a template in `patterns/` with problem statement, solution, and when-to-use guidance.

## Structure

```
agents.md              # Your project registry
agents/
  orchestrator.md      # Runs the audit-propagate loop
  auditor.md           # Scans projects against patterns
  propagator.md        # Applies upgrades to target projects
  librarian.md         # Maintains patterns, challenges self-audit
audits/
  current.md           # Latest gap analysis (overwritten each cycle)
patterns/
  protocol.md          # Startup protocol pattern + template
  reflection.md        # Shutdown reflection pattern + template
  ref-docs.md          # Reference doc splitting pattern + template
  feedback.md          # Librarian feedback loop pattern + template
```

## How Projects Get Upgraded

The propagator adapts patterns to each project's domain and conventions. It doesn't paste templates blindly — it reads the existing system first, preserves project identity, and only adds what's missing. A 3-agent project won't get a librarian it doesn't need. A 50-line AGENTS.md won't get ref doc splitting.

## Adding New Patterns

If the auditor notices a project doing something well that isn't in the library, it flags it. The librarian creates the pattern file:

```markdown
# Pattern: {Name}
## Problem
## Solution
## Template
## When to Use / When to Skip
## Adoption Status
```

The pattern library grows from what actually works, not from theory.

## Disclaimer

This repo contains instructions that are read directly by Claude Code as project context. You should never blindly clone and use context files sourced from the internet — they can influence model behavior in ways you don't expect. Read through the files in this repo and understand what they do before using them. If you've vetted the contents and they match how you want your agent systems to work, go for it.
