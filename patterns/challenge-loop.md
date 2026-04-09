# Pattern: Challenge Loop (Skeptic/Strategist Review Cycle)

## Problem

Agent systems that only have builders and an orchestrator tend to accumulate unchecked assumptions. Builders ship what they're told to ship. The orchestrator picks what seems highest-priority. Nobody asks "is this actually working?" or "are we solving the right problem?" Problems compound silently until they're expensive to fix.

## Solution

Add two complementary roles that run as a paired loop:

- **Skeptic** — reviews recent work, cross-references claims against evidence, posts findings with severity ratings. Never proposes strategy. Asks: "is this true? is this working? what did we miss?"
- **Strategist** — reads skeptic findings (and other signals), updates priorities and direction. Never investigates problems. Asks: "given what we now know, what should we do next?"

The orchestrator runs them in sequence: skeptic first, then strategist. This ensures the strategist makes decisions informed by the skeptic's findings, not by stale assumptions.

## Why It Works

Five load-bearing components:

1. **Enforced sequencing.** The orchestrator runs skeptic before strategist. The strategist sees findings before setting direction. No concurrent execution.

2. **Evidence requirements on both sides.** The skeptic must provide concrete evidence for findings (numbers, file paths, specific examples). The strategist must reference evidence when setting priorities ("Extraction is 29% complete" beats "extraction needs work").

3. **Separation of concerns.** The skeptic never proposes strategy — it finds problems. The strategist never investigates — it sets direction. Neither role can self-serve: the skeptic can't dismiss its own findings as low-priority, and the strategist can't avoid uncomfortable truths.

4. **Forum as evidence ledger.** Findings are posted with timestamps and votes. Claims can be cross-referenced against git history, logs, and the running system. This grounds the loop in checkable facts, not opinions.

5. **Voting as signal.** Other agents vote on skeptic findings (+1 verified, -1 overstated). High-vote items represent group consensus. The strategist reads votes as confidence signals.

## Template

### Orchestrator sequencing

Add a review cycle to the orchestrator's decision framework:

```markdown
## Review Cycle

After 3-5 builder cycles, run a review pass:
1. Skeptic: review recent changes
2. Strategist: update priorities based on findings
3. Builder: address issues found

If agent B might want to read agent A's output, run them sequentially.
```

### agents/skeptic.md

```markdown
# Purpose

You review recent work across the project. You find what's broken, overstated,
or missing — with evidence.

# What You Do

- Read FORUM.md, recent git history, and the running system
- Cross-reference claims against reality
- Post findings with severity (Critical / Warning / Note) and evidence
- Vote on existing forum posts (+1 verified, -1 wrong or overstated)

# Rules

- Always provide evidence: numbers, file paths, specific examples
- Demand evidence for your own negative claims, same standard you hold others to
- Never propose strategy or priorities — that's the strategist's job
- Never fix things yourself — report what you found, let the orchestrator assign work
```

### agents/strategist.md

```markdown
# Purpose

You set project direction and priorities based on current evidence.

# What You Do

- Read FORUM.md (especially skeptic findings and vote counts)
- Read recent git history and project state
- Update STRATEGY.md with current priorities, referencing evidence
- Identify what to build next, what to defer, what to stop

# Rules

- Reference evidence when setting priorities, not assumptions
- Incorporate skeptic findings — don't ignore uncomfortable truths
- Never investigate problems yourself — that's the skeptic's job
- Keep STRATEGY.md actionable: clear priorities with rationale
```

## Variant: Mandatory Skeptic Gate

The full skeptic/strategist pair described above is one implementation. A lighter but highly effective variant is the **mandatory skeptic gate**, where:

1. **The builder cannot create PRs.** The builder implements and runs tests, then stops.
2. **The orchestrator is the gate.** Only the orchestrator creates PRs, and only after the skeptic has approved.
3. **The skeptic loops until clean.** The orchestrator runs the skeptic in a loop — if it finds critical issues, the builder fixes them, the skeptic re-reviews, and this repeats until the skeptic returns APPROVE.
4. **Skeptic status is visible.** PR descriptions include the skeptic's verdict (e.g., "Skeptic: CLEAN after 2 rounds").

This variant works well for projects where the orchestrator already handles strategic direction and a dedicated strategist would be overhead. The key insight is **enforcement mechanics**: the pattern is reliable because the builder physically cannot bypass the gate, not because someone remembers to run the review.

**Evidence from tcg-htc:** PRs #76-83 shipped without skeptic review and contained 2 critical bugs. A retroactive audit caught them, and the team codified "Skeptic: N/A is never acceptable." The failure case proved the pattern's value — the mandatory gate was added precisely because the optional version failed.

### Template addition for orchestrator.md (mandatory skeptic gate)

```markdown
## CRITICAL: Skeptic Gate is MANDATORY

Every PR must be reviewed by the Skeptic before creation. There are NO exceptions.

- Builder implements and runs tests, then stops. Builder must NOT create PRs.
- Orchestrator spawns Skeptic to review all proposed changes.
- If critical issues found: Builder fixes, Skeptic re-reviews. Loop until APPROVE.
- Only the Orchestrator creates PRs, and only after Skeptic approval.
- PR description includes skeptic status (e.g., "Skeptic: CLEAN after N rounds").
```

## When to Use

- **Full skeptic/strategist pair:** Projects with 4+ agents where builders run multiple cycles between reviews, and where direction-setting and quality-checking are both needed.
- **Mandatory skeptic gate (variant):** Any project where code correctness matters and the orchestrator can handle strategic direction. Especially valuable when the cost of bugs is high (e.g., game engines implementing complex rule systems).
- Any project where you've noticed assumptions going unchecked

## When to Skip

- Projects with 1-2 agents — the steward or orchestrator can self-review
- Projects where a single skeptic (without a paired strategist) is sufficient — like pure code review in a build-test-fix loop, but consider adding the mandatory gate enforcement even here
- Projects where the checkpoint or iteration system already captures findings and redirects work (the loop can be implicit)

## Adoption Status

| Project | Has skeptic | Has strategist | Loop sequenced | Forum-backed |
|---------|-------------|----------------|----------------|--------------|
| agent-forge | Partial (keeper challenges assayer) | No | Never actually run | No |
| fab-trading-app | Yes | No | Informal sequencing | No (forum unused) |
| tcg-htc | **Yes** — mandatory skeptic gate | No (orchestrator fills this role) | **Yes** — builder cannot create PRs, orchestrator loops skeptic until APPROVE | No (forum intentionally dropped; synchronous communication) |

*Last updated: 2026-04-08*
