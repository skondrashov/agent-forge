# Cross-Project Audit — 2026-04-08

Focus: Progress since last audit (2026-03-19), registry accuracy, and whether the self-improving loop has closed for any project.

---

## Previous Audit Follow-Up

The 2026-03-19 audit identified 8 upgrade priorities. Status:

| # | Priority | Status | Evidence |
|---|----------|--------|----------|
| 1 | fab-trading-app: Fix orchestrator.md corruption (line 23) | **NOT FIXED** | Still reads `"significamv collin/* .nt"` instead of `"significant"` |
| 2 | fab-trading-app: Fix stale persistence in builder.md and skeptic.md | **NOT FIXED** | Both still say `Persistence: Session-only` |
| 3 | fab-trading-app: Fix stale constraint in pm.md | **NOT FIXED** | Still says `session-only (no persistence)` |
| 4 | fab-trading-app: Relabel AGENTS.md Open Questions section | **NOT FIXED** | Still says "These must be answered before building" |
| 5 | agent-forge: Resolve duplicate registry files | **NOT FIXED** | `AGENTS.md` and `agents.md` are still identical |
| 6 | agent-forge: Fill pattern adoption tables | **NOT FILLED** | All 5 pattern files still have `<!-- Fill in during audits -->` |
| 7 | fab-trading-app: Add strategist or re-scope challenge loop | **NOT ADDRESSED** | No strategist added, gap not acknowledged |
| 8 | agent-forge: Add keeper routing mechanism | **NOT ADDRESSED** | No messages inbox, no processing mechanism |

**Zero of eight priorities were addressed.** The v0.5 commit (7d282e0) message says "Full maturity across all projects" but introduced no material changes to fix any flagged issue. The self-improvement loop has not closed for agent-forge.

---

## 1. agent-forge (self-audit)

### File Scan

| Item | Status | Notes |
|------|--------|-------|
| CLAUDE.md | Slim (1 line) | "See AGENTS.md." — correct |
| AGENTS.md / agents.md | **Still duplicated** | Identical files. CLAUDE.md points to AGENTS.md; forgemaster.md reads `agents.md`. Flagged in previous audit, not fixed. |
| PROTOCOL.md | Present | Correctly adapted. Steps are clear. |
| FORUM.md | Present | One real post (assayer, 2026-03-19). No other agents have ever posted. |
| agents/*.md | 4 files | forgemaster, assayer, smith, keeper — all well-structured |
| memory/forgemaster.md | **Stub** | Still `_(none yet)_` across all sections |
| memory/smith.md | **Stub** | Still `_(none yet)_` across all sections |
| memory/keeper.md | **Stub** | Still `_(none yet)_` across all sections |
| memory/assayer.md | **Real content** | Has decisions, gotchas, domain notes, methodology — written by the previous audit cycle |
| patterns/*.md | 7 files | All adoption tables still empty |

### Content Quality Assessment

**3 of 4 memory files are still stubs.** The assayer memory was populated during the last audit cycle (the only agent that has actually run). Forgemaster, smith, and keeper memories remain empty, meaning those agents have never completed a full protocol cycle with memory updates.

**FORUM.md has one post.** The assayer's post from 2026-03-19. No other agent has ever posted. The forum is technically no longer empty, but it is not being used as a communication channel.

**Registry is stale.** `agents.md` line 19 says tcg-htc has "2 (steward, skeptic)". tcg-htc now has 5 agents (orchestrator, builder, skeptic, test-generator, playtester). This is exactly the kind of silent drift the previous audit warned about. The registry has not been updated since initial setup.

**Pattern adoption tables are all empty.** This was Priority 6 in the previous audit. The keeper is supposed to fill these. The keeper has never run. The tables are still placeholder comments.

**Forgemaster reads `agents.md` (lowercase).** CLAUDE.md points to `AGENTS.md` (uppercase). Both files are identical, but the divergence risk is real. If a smith or keeper updates one, the other becomes stale instantly.

---

## 2. fab-trading-app

### File Scan

| Item | Status | Notes |
|------|--------|-------|
| CLAUDE.md | 42 lines | Good: project overview, tech stack, scripts, module structure. Correctly references AGENTS.md, agents/, learnings.md. |
| PROTOCOL.md | Present | 9-step startup. Correctly adapted (references learnings.md as domain knowledge). |
| AGENTS.md | 65 lines | Architecture, agents table, UI sketch. Open Questions section still framed as open. |
| agents/ | 6 files | orchestrator, builder, skeptic, tester, designer, pm |
| FORUM.md | Present | Empty shell — "no active threads", "no archive" |
| memory/ | 6 files — mixed quality | orchestrator: real decisions. builder: strong technical content. skeptic: real patterns. tester: real decisions. designer: real mobile gotchas. pm: minimal domain notes. |
| learnings.md | 115 lines | Excellent shared domain knowledge: API details, architecture decisions, testing patterns, mobile design notes, Vercel gotchas. |

### Content Quality Assessment

**Orchestrator.md still has corrupted text.** Line 23: `"significamv collin/* .nt"` — a corruption artifact that should read `"significant"`. Flagged as Priority 1 in the previous audit. Still present.

**Builder.md and skeptic.md still have stale persistence.** Both say `Persistence: Session-only`. The real persistence is Vercel KV + IndexedDB + URL state. Tester.md has the correct info. This inconsistency means the builder and skeptic spawn with wrong context.

**PM.md still has stale constraints.** `Constraints: Web app, session-only (no persistence)` — incorrect. Will mislead the PM into ignoring or misjudging persistence-related features.

**AGENTS.md Open Questions still framed as open.** The header reads "These must be answered before building. The orchestrator asks the user on first spawn." All questions are long since answered. The orchestrator memory even says "do not re-ask on startup." But the file hasn't been updated.

**FORUM.md has never been used.** Zero posts. The forum exists but no agent has ever posted to it. Unlike agent-forge (which has one real post), fab-trading-app's forum is completely inert.

**Memory files are real and high-quality.** Builder memory in particular has strong technical content (dedup keys, CDN patterns, API gotchas). Designer memory has real mobile breakpoint data. Tester memory has test infrastructure decisions. This is the memory loop working as intended.

**learnings.md is a strong shared knowledge base.** This file functions as a team-wide ref doc without being in ref/. It covers API details, architecture decisions, testing patterns, and deployment notes. Any agent reading it gets immediate domain context.

**Recent git activity is feature work, not agent system maintenance.** The last 10 commits are all feature development (TypeUI design system, e2e tests, PWA manifest, multi-currency). No commits touch agent files, memory, or protocol. The agent system infrastructure has been stable but unmaintained since initial setup.

---

## 3. tcg-htc

### File Scan

| Item | Status | Notes |
|------|--------|-------|
| CLAUDE.md | 1 line | "You are the orchestrator. Read `agents/orchestrator.md` and follow `PROTOCOL.md`." — correct. |
| AGENTS.md | 100 lines | Comprehensive: purpose, tech stack, key files, module architecture with line counts, reference docs table, versioning, roadmap, agent table. |
| PROTOCOL.md | 97 lines | Detailed: startup, builder/skeptic handoff, git hygiene, memory policy, communication. Well beyond the template. |
| SECURITY.md | Present | Defines what agent prompt files are/can't do. Unique to this project. |
| agents/ | 5 files | orchestrator, builder, skeptic, test-generator, playtester |
| memory/ | 5 files — **all with real content** | orchestrator: 130+ lines of session learnings, TODOs, process notes. builder: 249+ lines of decisions, gotchas, phase-by-phase status. skeptic: 80+ lines of review history, patterns, recurring bugs. test-generator: 40+ lines of patterns and learnings. playtester: game analysis logs. |
| ref/ | **16 files** | comprehensive-rules.md, 4 decklists, talishar analysis (2 files), fab-cube dataset, 7 strategy articles |
| FORUM.md | **Absent (intentional)** | Orchestrator memory explicitly notes "Forum dropped. Agents don't use it in practice — communication is synchronous via spawn prompts and skeptic reviews." |

### Content Quality Assessment

**This project has transformed since the last audit.** The previous audit (2026-03-19) found tcg-htc as a Minimal project with a single steward agent and a memory stub. It now has:
- 5 agents with distinct, well-defined roles
- A full PROTOCOL.md with builder/skeptic handoff rules and git hygiene
- 16 reference docs
- Rich memory files across all agents
- 959+ tests
- A working skeptic gate (mandatory PR review)
- A SECURITY.md (unique in the ecosystem)
- Active development through PR #103

**Memory quality is the best in the ecosystem.** The orchestrator memory alone contains detailed session-by-session learnings from 2026-03-27 through 2026-04-06, including PR numbers, test counts, bug classes, and process decisions. The builder memory has phase-by-phase implementation notes. The skeptic memory has structured review history with verdicts and specific findings. This is what the memory pattern looks like when it works.

**The challenge loop is operational.** The skeptic gate is documented, enforced, and has demonstrable evidence of working:
- Skeptic memory has review history with verdicts
- Orchestrator memory notes "Skeptic: CLEAN after N rounds" and "CRITICAL LESSON: Skeptic must ALWAYS run before PRs"
- PRs that shipped without skeptic review (PRs #76-83) had 2 critical bugs caught by a retroactive audit
- The failure case proved the pattern's value

**No FORUM.md is a conscious adaptation.** The orchestrator memory explicitly records the decision to drop the forum because agents communicate synchronously via spawn prompts. This is a valid adaptation — the protocol pattern says "use a forum for asynchronous coordination" but tcg-htc's workflow is synchronous. The project chose what works for its actual workflow.

**Ref-doc splitting is working.** 16 ref docs, routed per-role. Builder reads comprehensive-rules + talishar docs. Skeptic reads comprehensive-rules + talishar docs. Test-generator reads strategy articles + comprehensive-rules. Playtester reads strategy articles. This is textbook pattern adoption.

**AGENTS.md module architecture is current.** Lists engine (2945 lines), state (246 lines), cards (334 lines), decks (207 lines), player (66 lines) with per-file descriptions. This is actively maintained.

**The agent count in the forge registry is wrong.** `agents.md` says "2 (steward, skeptic)". Reality is 5 agents. The steward no longer exists — the project grew into a full orchestrator/builder/skeptic/test-generator/playtester system. The forge has not been updated to reflect this.

**PROTOCOL.md goes beyond the template.** Includes builder/skeptic handoff rules, git hygiene (never push to main, branch naming, rebase before push, never push to merged branches), memory policy (what each agent writes, when to write, what NOT to write), and the mandatory skeptic gate. This is the most evolved protocol file in the ecosystem.

---

## Pattern Adoption Matrix

| Pattern | agent-forge | fab-trading-app | tcg-htc |
|---------|-------------|-----------------|---------|
| **Steward** | N/A | N/A | N/A (outgrown — started as steward, now has 5 agents) |
| **Protocol** | Partial — file exists, only assayer has demonstrably followed it | Partial — file exists, agents have followed it (memory has content), but forum is unused | **Yes** — detailed protocol with domain-specific adaptations (git hygiene, skeptic gate, memory policy). Agents demonstrably follow it. |
| **Challenge Loop** | Partial — keeper challenges assayer, never actually run | Partial — skeptic exists, no strategist, sequencing informal | **Yes** — skeptic gate is mandatory, enforced, and has evidence of catching bugs. No strategist, but the orchestrator fills that role. Adaptation is appropriate for the domain. |
| **Feedback (Keeper)** | No — keeper role exists, never run, no routing mechanism | Partial — orchestrator has between-spawns cleanup | Partial — orchestrator fixes flagged docs between spawns. No dedicated keeper, but the orchestrator's session learnings function as feedback processing. |
| **Reflection** | Partial — forgemaster has reflection prompt, never used | Partial — orchestrator has 4-layer reflection, agents have used it (memory content suggests shutdown was done) | **Yes** — protocol includes shutdown reflection, and the detailed session learnings in orchestrator memory are evidence of it being followed. |
| **Ref-Doc Splitting** | N/A — AGENTS.md is 20 lines | No — not needed yet. learnings.md partially fills this role. | **Yes** — 16 ref docs, routed per-role in each agent's role file. |
| **First-Run Wizard** | Yes — in patterns/first-run.md | Applied — project was onboarded | Applied — project was onboarded and outgrew initial setup |

---

## Maturity Levels

| Project | Previous (2026-03-19) | Current (2026-04-08) | Rationale |
|---------|----------------------|---------------------|-----------|
| **agent-forge** | Structured | **Structured** (unchanged) | Protocol and FORUM.md exist. Only the assayer has demonstrably followed the protocol (1 forum post, 1 populated memory file). Forgemaster, smith, and keeper memories are all stubs. Pattern adoption tables are empty. The forge scaffolding exists but the operational loop has not closed. |
| **fab-trading-app** | Structured+ | **Structured** (downgraded) | Memory files have real content (agents ran and recorded learnings). But 4 of 8 previous audit priorities — all small fixes — were not addressed. The forum has never been used. The challenge loop is half-implemented. And critically, the self-improvement loop has not closed: no keeper or maintenance cycle has fixed the stale content that agents keep spawning with. Downgraded because "Structured+" implied active maintenance that isn't happening. |
| **tcg-htc** | Minimal | **Full** (upgraded) | All applicable patterns adopted and actively used. Protocol file is the most evolved in the ecosystem. Challenge loop (skeptic gate) is operational with evidence. Reflection is practiced (shutdown learnings in memory). Ref-doc splitting is in use (16 docs, routed per-role). Memory files have real, detailed content across all agents. The self-improvement loop has demonstrably closed: agents run, find issues, record learnings, orchestrator fixes docs between spawns, next spawn starts with better context. The only missing pattern is a dedicated keeper — but the orchestrator fills that role adequately for the current team size. |

**Note on tcg-htc's Full rating:** This is earned. The project started as Minimal 3 weeks ago and has organically grown through all the tiers: steward → orchestrator+builder → +skeptic → +test-generator+playtester. Each agent has real memory. The protocol was adapted to the project's actual workflow (synchronous spawns, mandatory skeptic gate, git hygiene). The forum was tried and dropped as unnecessary — a conscious adaptation, not a gap. This is what "Full maturity" looks like: not file existence, but operational evidence of the patterns working.

---

## Upgrade Plans

### Priority 1: agent-forge — Fix stale registry (Small effort)

`agents.md` line 19 says tcg-htc has "2 (steward, skeptic)". Reality: 5 agents (orchestrator, builder, skeptic, test-generator, playtester). This is the forge's core job — knowing what exists in the ecosystem — and it's wrong.

Also update `AGENTS.md` identically (or resolve the duplicate file issue per Priority 4).

### Priority 2: fab-trading-app — Fix orchestrator.md corruption (Small effort)

Line 23: `"significamv collin/* .nt"` → `"significant"`. This was Priority 1 in the previous audit and is still unfixed. Critical — this is the orchestrator's role file.

### Priority 3: fab-trading-app — Fix all stale Key Context fields (Small effort)

Three files need updating:
- `agents/builder.md` line 20: `Persistence: Session-only` → `Persistence: Vercel KV (shared trades), IndexedDB (card cache + trade history), URL state (current session)`
- `agents/skeptic.md` line 14: `Persistence: Session-only` → `Persistence: Vercel KV (shared trades), IndexedDB (card cache + trade history), URL state (current session)`
- `agents/pm.md` line 12: `Constraints: Web app, session-only (no persistence)` → `Constraints: Web app, Vercel KV + IndexedDB persistence, TCGPlayer prices, plain CSS`

### Priority 4: agent-forge — Resolve duplicate registry files (Small effort)

Delete `agents.md`. Update `agents/forgemaster.md` to reference `AGENTS.md` instead. This was Priority 5 in the previous audit.

### Priority 5: fab-trading-app — Relabel AGENTS.md Open Questions (Small effort)

Rename "Open Questions" to "Design Decisions" and reframe as answered decisions, not open questions. This was Priority 4 in the previous audit.

### Priority 6: agent-forge — Fill pattern adoption tables (Medium effort)

Use findings from this audit to populate the Adoption Status tables in all 5 pattern files that have them (steward.md, protocol.md, challenge-loop.md, feedback.md, reflection.md, ref-docs.md). This was Priority 6 in the previous audit. The keeper should do this, but the keeper has never run — so the smith should handle it.

### Priority 7: agent-forge — Actually run the forgemaster/smith/keeper loop (Medium effort)

The forge's own agents have mostly never run. The forgemaster, smith, and keeper all have empty memory files. The self-improvement loop diagram (agents identify gaps → forgemaster captures feedback → keeper fixes docs → next spawn starts better) has not operated. To close this loop:
1. Run the smith to apply Priorities 1-6
2. Run the keeper to update pattern tables and challenge this audit
3. Both agents update their memory files on shutdown

This is the highest-leverage action: it would populate 2 more memory files, fill the pattern tables, and provide evidence that the forge's own agent loop works.

### Priority 8: fab-trading-app — Decide on forum usage (Small effort)

FORUM.md exists but has never been used. Either:
(a) Remove it and document that agents coordinate via orchestrator spawn prompts (like tcg-htc chose to do), or
(b) Start using it by having agents post findings during their sessions.

The current state — forum exists but nobody uses it — is the worst option.

---

## New Patterns to Flag

### Pattern Candidate: Mandatory Skeptic Gate

tcg-htc has evolved a pattern worth documenting:

**What:** Every PR must be reviewed by the skeptic before creation. No exceptions. The orchestrator enforces this by: (1) never letting the builder create PRs, (2) running the skeptic in a loop until APPROVE, (3) including skeptic status in PR descriptions.

**Evidence it works:** PRs #76-83 shipped without skeptic review and had 2 critical bugs. The subsequent retroactive audit caught them, and the team explicitly codified "Skeptic: N/A is never acceptable."

**Why it's worth extracting:** The current challenge-loop pattern describes the skeptic/strategist pair but doesn't emphasize enforcement mechanics. tcg-htc's version adds: (1) builder cannot create PRs, (2) orchestrator is the gate, (3) loop until clean. This enforcement structure is what makes the pattern reliable.

### Pattern Candidate: Synchronous Communication (Forum Drop)

tcg-htc tried the forum and explicitly dropped it: "Agents don't use it in practice — communication is synchronous via spawn prompts and skeptic reviews."

This is a legitimate adaptation for projects where agents are spawned sequentially by an orchestrator and don't need asynchronous coordination. The current protocol pattern assumes a forum is needed for 3+ agents, but tcg-htc's 5-agent system works without one.

Worth adding as a "When to Skip" note in the protocol pattern: "Projects where all inter-agent communication happens synchronously through orchestrator spawn prompts may not need a forum."

### Pattern Candidate: SECURITY.md for Agent Systems

tcg-htc has a SECURITY.md defining what agent prompt files are and aren't allowed to do. This is a supply-chain-risk awareness document that any public agent system repo should have.

---

## Cross-Cutting Observations

### The self-improvement loop has closed — but only for tcg-htc

The audit loop is: agents run → find issues → record learnings → next spawn starts better. tcg-htc demonstrates this working: the orchestrator records session learnings, the builder records architecture decisions, the skeptic records review patterns, and subsequent sessions build on this knowledge. The critical lesson about skeptic enforcement was learned from a real failure (PRs without review had bugs) and immediately codified.

agent-forge's loop has partially run (assayer ran once, recorded learnings). fab-trading-app's loop partially ran (agents ran, memory was written) but the maintenance step never happened (stale content persists).

### The forge's own maintenance is the biggest gap

agent-forge exists to audit and upgrade agent systems across projects. But its own agent system is the least maintained in the ecosystem:
- 3 of 4 memory files are stubs
- Pattern adoption tables are empty
- The registry is stale
- Zero of 8 previous audit priorities were addressed
- The smith and keeper have never run

The forge is the cobbler's children — it maintains other projects' agent systems while its own goes unmaintained.

### tcg-htc has outpaced the forge

tcg-htc started as the simplest project in the ecosystem (Minimal, 1 agent, memory stub). It now has the most evolved agent system: more agents, richer memory, better protocol, working challenge loop, ref-doc splitting, and a SECURITY.md. It independently arrived at the same patterns the forge prescribes — and in some cases evolved past them (mandatory skeptic gate, intentional forum drop).

The forge should learn from tcg-htc, not just audit it.

### fab-trading-app is stable but drifting

fab-trading-app's agent system was set up well (good PROTOCOL.md, good memory content, good learnings.md). But it has received zero maintenance since initial setup. The same stale content flagged 3 weeks ago is still there. The project is actively developed (feature commits in the last week) but the agent system files aren't maintained alongside the code.

This is a predictable failure mode: the agent system works well enough that nobody maintains it, but the small inconsistencies accumulate. The builder spawns with `Persistence: Session-only` in its Key Context — slightly wrong — and works around it because the correct info is in CLAUDE.md and learnings.md. The system is resilient but not self-correcting.
