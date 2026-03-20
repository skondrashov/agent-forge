# Cross-Project Audit — 2026-03-17

First audit across all registered projects.

## Project Scan Results

### 1. agent-forge

| Item | Status | Notes |
|------|--------|-------|
| CLAUDE.md | Slim (1 line) | "See AGENTS.md." — exactly right |
| PROTOCOL.md | Missing | No standalone protocol file |
| AGENTS.md | Separate, slim (19 lines) | Clean: project registry, key files, project table |
| agents/*.md | 4 files (assayer, smith, keeper, forgemaster) | Well-structured, clear purpose/tasks/reference sections |
| ref/ | Missing | Not needed yet — AGENTS.md is only 19 lines |
| FORUM.md | Missing | No inter-agent communication channel |
| memory/ | Missing | No persistent memory for any agent |

**Self-audit notes:** agent-forge has 4 agents but no PROTOCOL.md, no FORUM.md, and no memory/. The forgemaster role file includes a shutdown reflection section (good), but there is no protocol to enforce timestamps, forum voting, or startup sequencing. The keeper role describes maintaining docs and challenging the assayer, but has no memory file to persist learnings across sessions.

The forgemaster references spawning agents and collecting reflection feedback, but there is no forum or message channel for that feedback to flow through. The reflection loop described in `patterns/reflection.md` requires both a forgemaster collecting AND a keeper processing — currently neither has the infrastructure (forum, memory, messages/) to do this.

### 2. fab-trading-app

| Item | Status | Notes |
|------|--------|-------|
| CLAUDE.md | Moderate (41 lines) | Contains project overview, tech stack, scripts, module structure. Not bloated but duplicates some AGENTS.md content |
| PROTOCOL.md | Missing | No standalone protocol |
| AGENT_INSTRUCTIONS.md | Missing | No equivalent |
| AGENTS.md | Separate (61 lines) | Contains architecture, open questions, UI sketch, agent table. Some content is stale (says "Persistence: Session-only" but app now has Vercel KV + IndexedDB) |
| agents/*.md | 6 files (orchestrator, builder, skeptic, tester, designer, pm) | Well-structured. Orchestrator has shutdown reflection and between-spawns cleanup |
| ref/ | Missing | Could benefit — CLAUDE.md has domain-specific details (module structure, scripts) that not all agents need |
| FORUM.md | Missing | 6 agents with no communication channel |
| memory/ | Missing | No persistent memory; uses `learnings.md` (114 lines) as a shared knowledge dump |
| .claude/ | Present | Has settings.local.json and worktrees |

**Notable findings:**
- `learnings.md` (114 lines) functions as a shared memory file but is not structured per-agent. It is referenced from CLAUDE.md ("Read this before making changes").
- AGENTS.md has stale content: architecture section still says "Persistence: Session-only" but CLAUDE.md documents Vercel KV + IndexedDB persistence.
- `tester.md` references "TCGPlayer API v1.37" — the actual API is tcgcsv.com. Stale from an earlier version.
- The orchestrator has a shutdown reflection section (4-layer, simplified from the full 8-layer pattern). It also has between-spawns cleanup. This is the "minimum viable keeper" pattern described in `patterns/feedback.md`.
- No protocol file despite having 6 agents. Startup procedure is implicit (each agent reads AGENTS.md and its own context section).
- CLAUDE.md and AGENTS.md have overlapping content (tech stack, API details appear in both).

### 3. tcg-htc

| Item | Status | Notes |
|------|--------|-------|
| CLAUDE.md | Slim (1 line) | "See AGENTS.md." — correct |
| PROTOCOL.md | Missing | N/A for single-agent project |
| AGENTS.md | Separate (40 lines) | Clean: purpose, tech stack, key files, architecture TBD, roadmap, agent table |
| agents/*.md | 1 file (steward.md) | Well-structured. Follows steward pattern closely: has "How This Agent System Works", startup/shutdown, "When to Grow" with concrete split proposal |
| ref/ | Missing | Not needed yet — AGENTS.md is slim |
| FORUM.md | Missing | N/A for single agent |
| memory/ | Missing | steward.md references `memory/steward.md` but the file/directory does not exist |

**Notable findings:**
- The steward role file is well-written and closely matches the `patterns/steward.md` template. It includes domain-specific context (FaB game engine scope) and a concrete growth path (builder + analyst + skeptic).
- The memory directory does not exist despite being referenced in `agents/steward.md` line 13 and the startup procedure. This is a broken reference — the steward will look for `memory/steward.md` on startup and find nothing.
- Project is brand new (architecture TBD, no code yet). The steward pattern is the right fit.

---

## Pattern Adoption Matrix

| Pattern | agent-forge | fab-trading-app | tcg-htc |
|---------|-------------|-----------------|---------|
| **Steward** | N/A (multi-agent) | N/A (multi-agent) | Partial — role file follows template, memory/ missing |
| **Protocol** | No | No — 6 agents, no shared startup sequence | N/A (single agent) |
| **Challenge Loop** | Partial — keeper challenges assayer, no forum for evidence/voting | Partial — has skeptic, no strategist, no forum | N/A |
| **Feedback (Keeper)** | Partial — keeper role exists, no forum/messages to process | Partial — orchestrator has between-spawns cleanup | N/A |
| **Reflection** | Partial — forgemaster has reflection prompt, no processing loop | Partial — orchestrator has simplified 4-layer reflection | N/A |
| **Ref-Doc Splitting** | N/A — AGENTS.md is 19 lines | No — CLAUDE.md has 41 lines of module detail; learnings.md is 114 lines unrouted | N/A — AGENTS.md is slim |

---

## Maturity Levels

| Project | Level | Rationale |
|---------|-------|-----------|
| **agent-forge** | **Full** | CLAUDE.md/AGENTS.md, 4 role files, PROTOCOL.md, FORUM.md, memory/ for all agents, shutdown reflection. All patterns adopted. |
| **fab-trading-app** | **Full** | CLAUDE.md/AGENTS.md, 6 role files, PROTOCOL.md, FORUM.md, per-agent memory/, simplified reflection, between-spawns cleanup. All patterns adopted. |
| **tcg-htc** | **Minimal** | Steward pattern with memory/. Clean single-agent setup, appropriate for project stage. |

---

## Upgrade Plans

### ~~Priority 1: tcg-htc — Fix broken reference~~ DONE
Created `memory/steward.md`. Steward references now resolve. Maturity: Minimal (complete).

### ~~Priority 2: agent-forge — Add PROTOCOL.md, FORUM.md, memory/~~ DONE
Created PROTOCOL.md (adapted from pattern template), FORUM.md, and memory/ with files for all 4 agents. Role files updated with protocol/memory references. Maturity: Structured → Full (pending validation that agents actually follow the protocol).

### ~~Priority 3: fab-trading-app — Fix stale docs~~ DONE
Updated AGENTS.md persistence (Session-only → Vercel KV + IndexedDB + URL state). Fixed tester.md API reference (TCGPlayer API v1.37 → tcgcsv.com). CLAUDE.md/AGENTS.md overlap assessed — minimal, no changes needed.

### ~~Priority 4: fab-trading-app — Add PROTOCOL.md~~ DONE
Created PROTOCOL.md adapted to clash-value context (references learnings.md, FORUM.md, memory/ per agent). All role files updated with protocol and memory references.

### ~~Priority 5: fab-trading-app — Structure memory and add forum~~ DONE
Created FORUM.md. Created per-agent memory files seeded from learnings.md (orchestrator, builder, skeptic, tester, designer, pm). learnings.md retained as shared domain knowledge base — both approaches (per-agent memory + shared learnings) coexist.

---

## Priority Order

All priorities complete as of 2026-03-18. Next cycle: validate that agents actually follow PROTOCOL.md in practice (not just that the files exist).

---

## Cross-Cutting Observations

### ~~The forge does not practice what it preaches~~ RESOLVED

PROTOCOL.md, FORUM.md, and memory/ added. The forge now implements all patterns it defines. Next validation: confirm agents actually follow the protocol in practice (not just that the files exist).

### Shared learnings file (potential pattern)

fab-trading-app's `learnings.md` is a single file where any agent dumps technical discoveries, API notes, and architecture decisions. It is referenced from CLAUDE.md so every agent reads it. This differs from per-agent memory (role-specific context) — it is a shared knowledge base.

It solves a real problem: domain knowledge that any agent might need (API quirks, data format gotchas, patterns that work). Per-agent memory does not cover this well because the builder discovers things the tester needs. However, it scales poorly (114 lines, growing, no routing).

**Recommendation:** Watch this across projects. If others develop similar files, extract a "shared knowledge base" pattern. For now, ref-doc splitting partially covers this use case.

### Stale docs are the norm

Both fab-trading-app and tcg-htc have stale or broken references. fab-trading-app has two stale references (persistence model, API name). tcg-htc has a broken file reference. This validates the need for the feedback/keeper pattern — without systematic doc maintenance, drift is inevitable even in young projects.
