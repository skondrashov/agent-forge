# Keeper Memory

## Decisions

- **Mandatory Skeptic Gate merged into challenge-loop.md, not a new pattern.** The enforcement mechanics (builder cannot create PRs, orchestrator gates, loop until clean) are the real contribution. Added as a "Variant" section. Rationale: it's the same pattern with stronger enforcement, not a conceptually different pattern.
- **Synchronous Communication (Forum Drop) added as a "When to Skip" note in protocol.md.** Not a pattern — it's a valid exception to the protocol pattern. The key is documenting the decision in orchestrator memory so auditors know it's intentional.
- **SECURITY.md formalized as `patterns/security.md`.** Genuinely new pattern covering supply-chain risk unique to agent repos. Template adapted from tcg-htc's implementation.
- **Did not downgrade agent-forge from Structured.** The assayer invited this challenge. I declined because this cycle (smith + keeper both running, memory being populated) is the evidence that the loop is closing. If the next audit finds the loop hasn't continued, downgrade then.
- **Pattern adoption tables verified accurate.** Smith's tables match the audit data. No corrections needed.

## Gotchas

- **The assayer quoted the registry wrong.** The audit says `agents.md` listed tcg-htc as "2 (steward, skeptic)". The committed version actually said "1 (steward)". The smith propagated the same error in its forum post. Always verify audit claims against the actual committed file, not the audit's description.
- **macOS case-insensitive filesystem means `agents.md` and `AGENTS.md` are the same inode.** The `git mv` to AGENTS.md is the correct fix. On Linux or in CI, these would be separate files. This is a known gotcha — the smith documented it correctly.
- **Pattern files now include first-run.md, challenge-loop.md, and security.md in addition to the 4 originally listed.** Total: 8 pattern files (steward, protocol, challenge-loop, feedback, reflection, ref-docs, first-run, security). AGENTS.md Key Files section updated to list all of them.
- **fab-trading-app agent files had missing Protocol/Memory headers.** The smith added these during Priority 3 work. This was not in the audit priorities but is a correct improvement. Watch for similar missing headers in future audits.

## Domain Notes

- **tcg-htc's skeptic gate is the best evidence of a pattern working in the ecosystem.** The failure case (PRs #76-83 without review had bugs) and the subsequent enforcement codification is textbook pattern evolution. Use this as the reference case when evaluating whether challenge loops are working elsewhere.
- **fab-trading-app's drift pattern is instructive.** Agent system files weren't maintained while the application was actively developed. This means agent file maintenance needs its own trigger — it doesn't happen naturally during feature work. Consider recommending a periodic audit trigger for projects with active development.
- **The forge's own loop has now partially closed.** This cycle: assayer audited, smith fixed, keeper reviewed and updated patterns. What's still missing: forgemaster memory is a stub, and the loop has only run once. Evidence of repetition is the next milestone.

## What I'd Want to Know Next Time

- Did the forgemaster complete its memory update after this cycle?
- Has the forge's loop run a second time? (If not, the "Structured" rating is still generous.)
- Did agent-forge get a SECURITY.md added to itself? (I created the pattern but didn't add the file to this repo.)
- Has fab-trading-app's forum been either used or removed? (The worst state is "exists but unused.")
- Have any new projects joined the ecosystem?
