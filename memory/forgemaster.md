# Forgemaster Memory

## Decisions

- **2026-04-08:** First full loop completed (assayer → smith → keeper). All 3 agents ran, posted to forum, updated memory. This is the cycle working as designed.
- **2026-04-08:** Accepted keeper's reasoning not to downgrade agent-forge from Structured. The loop closing this session is the evidence — if next audit finds no continuation, downgrade then.
- **2026-04-08:** Approved keeper's pattern decisions: skeptic gate merged into challenge-loop.md, forum drop noted in protocol.md, SECURITY.md added as new pattern.

## Gotchas

- **macOS case-insensitive FS:** `AGENTS.md` and `agents.md` were the same inode. Resolved via `git mv`. On Linux/CI these would be genuinely separate files — watch for this in cross-platform scenarios.
- **Assayer factual error:** Registry actually said "1 (steward)" not "2 (steward, skeptic)" for tcg-htc. Smith propagated the same error in its forum post. Assayer should quote exact values from files, not paraphrase.
- **Previous audit priorities persisted 3 weeks unfixed.** Root cause: the smith and keeper were never spawned between cycles. The system design works; the operational cadence failed. The forgemaster needs to run the full loop each session, not just the assayer.

## Domain Notes

- **tcg-htc is the model project.** Grew from Minimal to Full in 3 weeks organically. Best memory, best protocol, working skeptic gate, 16 ref docs. The forge should learn from it.
- **fab-trading-app agent maintenance is decoupled from feature dev.** The project ships features actively but agent files go unmaintained. Need a trigger for agent system maintenance separate from feature work.
- **Memory content is the real maturity signal.** File existence means nothing. Real accumulated learnings across sessions is what separates working systems from scaffolding.
