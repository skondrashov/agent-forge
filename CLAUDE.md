# agent-forge

Meta-project that manages multi-agent systems across your projects. Audits agent systems, identifies gaps, and propagates best practices.

## How It Works

You register your projects in `agents.md`. The forge scans them, compares against its pattern library, and produces gap analyses with concrete upgrade plans. Then it applies those upgrades, one project at a time.

## Getting Started

Open this project in Claude Code and say **`go`**. The forgemaster takes over.

On first run it walks you through setup — asks what projects you have, scans them, and runs the first audit. On return visits, it picks up where it left off.

## Key Files

- `agents.md` — Project registry (your projects and their agent roles)
- `agents/` — Forge agent role files (assayer, smith, keeper, forgemaster)
- `audits/current.md` — Latest cross-project gap analysis with concrete fixes
- `patterns/` — Reusable agent system patterns (steward, protocol, reflection, ref-docs, feedback)
