# Smith Memory

## Decisions

- **Priority 4 (duplicate registry):** On macOS, `AGENTS.md` and `agents.md` are the same file (case-insensitive filesystem, same inode). Git only tracked `agents.md` (lowercase). Used `git mv agents.md AGENTS.md` to rename the git-tracked entry to match the canonical name referenced by CLAUDE.md. There is no second file to delete — the "duplicate" was a case-sensitivity illusion.
- **Priority 5 (Open Questions relabel):** Rewrote the Open Questions section as "Design Decisions" with the actual answers filled in (pulled from the Architecture section of the same file), not just a header rename. This makes the section actively useful instead of misleading.
- **Priority 6 (pattern tables):** Filled all 6 pattern files that have adoption tables (steward, protocol, challenge-loop, feedback, reflection, ref-docs). first-run.md has no adoption table — skipped correctly. Added `*Last updated: 2026-04-08*` to each table for tracking freshness.

## Gotchas

- **macOS case-insensitive filesystem:** `AGENTS.md` and `agents.md` resolve to the same inode. `git ls-files` only showed one entry (`agents.md`). The "duplicate file" issue from the audit was a filesystem artifact, not two actual files. On Linux (or in CI) they would be truly separate. The fix (`git mv`) is the correct approach — it renames the tracked entry without creating/deleting files.
- **Edit tool and replace_all:** When using `replace_all: true` on `agents.md` → `AGENTS.md` in forgemaster.md, it correctly replaced all 4 occurrences. But be careful — this can overshoot. I verified after by re-reading the file.
- **Cross-project edits need careful path verification.** fab-trading-app files exist at `../fab-trading-app/` relative to agent-forge. Always use absolute paths.

## Domain Notes

- tcg-htc has grown to 5 agents: orchestrator, builder, skeptic, test-generator, playtester. The steward no longer exists — the project organically evolved past tier 1.
- fab-trading-app persistence is: Vercel KV (shared trades), IndexedDB (card cache + trade history), URL state (current session). Three different persistence mechanisms for different concerns.
- The protocol pattern's adoption table is the most differentiated across projects — tcg-htc's domain adaptations (git hygiene, skeptic gate, memory policy) are worth studying as examples of pattern evolution.
