# agent-forge

Meta-project that manages multi-agent systems across your projects. Audits agent systems, identifies gaps, and propagates best practices.

## How It Works

You register your projects in `agents.md`. The forge scans them, compares against its pattern library, and produces gap analyses with concrete upgrade plans. Then it applies those upgrades, one project at a time.

## Getting Started

1. Add your projects to `agents.md` (path, domain, agent count)
2. Tell Claude Code: "you are the orchestrator"
3. The orchestrator runs the audit-and-propagate loop

## Key Files

- `agents.md` — Project registry (your projects and their agent roles)
- `agents/` — Forge agent role files (auditor, propagator, librarian, orchestrator)
- `audits/current.md` — Latest cross-project gap analysis with concrete fixes
- `patterns/` — Reusable agent system patterns (protocol, reflection, ref-docs, feedback)
