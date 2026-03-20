# agent-forge

Template agent system manager. Audits and upgrades multi-agent systems across your projects.

If the user says "go", "start", or "begin": read `agents/forgemaster.md` and follow its activation instructions.

## Key Files

- `agents/` — Forge role files (forgemaster, assayer, smith, keeper)
- `audits/current.md` — Latest cross-project gap analysis
- `patterns/` — Reusable agent system patterns (steward, protocol, reflection, ref-docs, feedback)

## Projects

| Project | Path | Domain | Agents |
|---------|------|--------|--------|
| agent-forge | `../agent-forge` | Agent system meta-management | 4 (assayer, smith, keeper, forgemaster) |
| fab-trading-app | `../fab-trading-app` | FaB card price comparison tool | 6 (orchestrator, builder, skeptic, tester, designer, pm) |
| tcg-htc | `../tcg-htc` | FaB game simulation & deck testing | 1 (steward) |
