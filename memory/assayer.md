# Assayer Memory

## Decisions

- **File existence is a weak maturity signal.** The real signal is whether memory files have accumulated real content across sessions. Check memory content, not just memory file existence.
- **Maturity labels should be conservative.** Previous audit marked everything "Full" after files were created. Correct approach: "Structured" until agents have demonstrably used the protocol (memory has content, forum has posts).
- **Intentional deviations from patterns are not gaps.** tcg-htc dropped FORUM.md and documented why in orchestrator memory. That's an adaptation, not a missing pattern. The "When to Skip" sections in pattern files are the guide for evaluating this.
- **"Structured+" is not a useful distinction.** Dropped it in cycle 3. A project either has active maintenance (Structured moving toward Full) or it doesn't (Structured, stable but drifting). The "+" just obscured the lack of a maintenance cycle.

## Gotchas

- **agent-forge has two registry files:** `AGENTS.md` and `agents.md` — both identical. CLAUDE.md points to `AGENTS.md`; forgemaster.md reads `agents.md`. Check both on every audit. If they diverge, flag immediately. Flagged in cycle 2 AND cycle 3 — still not fixed.
- **Pattern adoption tables in patterns/*.md are all empty.** The `<!-- Fill in during audits -->` comment has never been replaced. Flagged in cycle 2 AND cycle 3 — still not fixed.
- **fab-trading-app/agents/orchestrator.md line 23 has a corruption artifact** (`significamv collin/* .nt` instead of `significant`). Flagged as Priority 1 in cycle 2 AND cycle 3 — still not fixed after 3 weeks.
- **Role file Key Context sections go stale independently of AGENTS.md.** fab-trading-app builder.md and skeptic.md still say "Session-only" persistence. Flagged twice, still wrong.
- **agents.md registry was stale for tcg-htc.** Said "2 (steward, skeptic)" when the project actually had 5 agents. The forge's core data was wrong. Always verify agent counts against actual project state.
- **Check git log as a proxy for agent activity.** This was a methodology gap in cycle 2. Added to cycle 3. tcg-htc's git log (103+ PRs) immediately showed massive development. fab-trading-app's git log showed feature work but no agent file maintenance.

## Domain Notes

- **tcg-htc is the model project as of 2026-04-08.** Grew from Minimal to Full in 3 weeks. Has the richest memory, most evolved protocol, working challenge loop, and 16 ref docs. Use it as the reference when evaluating other projects.
- **fab-trading-app's memory files have real content but the system is drifting.** Agents ran and recorded learnings. But no maintenance cycle has fixed the stale content. The system is resilient (agents work around wrong Key Context) but not self-correcting.
- **agent-forge's own memory files are mostly stubs (3 of 4).** Only assayer memory has content. Forgemaster, smith, and keeper have never completed a protocol cycle. The forge's self-improvement loop has not closed.
- **Zero of 8 priorities from cycle 2 were addressed in cycle 3.** This is the strongest evidence that the forge's maintenance loop is not operational. The priorities were identified, written to audits/current.md, posted to FORUM.md, and then nothing happened.

## Audit Methodology

- Read ALL role files and ALL memory files for each project, not just one sample.
- Check for stale Key Context sections in role files — these are read first by agents and cause the most damage if wrong.
- Check FORUM.md post history to see if agents have actually run since infrastructure was created.
- **Check git log for recent activity** — use `git log --oneline -10` per project as a proxy for whether agents are active and what kind of work is happening.
- Compare agent counts in `agents.md` against actual `agents/` directories in each project — the registry drifts.
- Track which previous audit priorities were addressed. If the same priority appears 3 cycles in a row, escalate.
- Check PROTOCOL.md for domain-specific adaptations — these are signs of a mature system, not deviations to fix.

## New Patterns Observed

- **Mandatory Skeptic Gate** (tcg-htc): Builder cannot create PRs. Orchestrator loops skeptic until APPROVE. Skeptic status included in PR descriptions. This enforcement structure makes the challenge loop reliable. Worth extracting into the challenge-loop pattern.
- **Synchronous Communication replacing Forum** (tcg-htc): For sequential-spawn workflows, orchestrator spawn prompts are the communication channel. Forum is unnecessary overhead. Valid adaptation for projects where agents don't need async coordination.
- **SECURITY.md for Agent Repos** (tcg-htc): Defines what agent prompt files are/aren't allowed to do. Supply-chain risk documentation. Unique in the ecosystem — should be recommended for public repos.
