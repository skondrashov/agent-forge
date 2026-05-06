# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/).
This project uses 0.x versioning.

## [Unreleased]

## [0.5] - 2026-05-06

### Added

- **Checkpoint-as-Protocol pattern** — single checkpoint file replaces PROTOCOL.md + FORUM.md for iterative build-test-fix workflows. Validated by 3 production projects.
- **External Validation pattern** — validate outputs against real-world data instead of self-generated tests. Prevents circular self-benchmarking.
- **Playbook pattern** — curated shared knowledge base for experiential domains. Verified mechanics, strategies, and mistakes.
- **Librarian pattern** — proactive doc-maintenance agent for projects with accumulating knowledge artifacts.
- **Coding-discipline skill** — code quality defaults for builder agents, harness-agnostic.
- **First-run flag** — `AGENTS.md` ships with `first-run: true`; orchestrator sets it to false after the setup wizard completes.
- **Agent restructuring guidance** — steward pattern now includes "When to Shrink": signs of over-provisioning, how to consolidate roles.
- **Coordination style selection** — first-run wizard asks about coordination style (protocol+forum, checkpoint, or neither) as a separate decision from team size.
- **Auditor enhancements** — scans now check for playbook directories, checkpoint files, and librarian roles. Maturity assessment acknowledges checkpoint as equivalent to protocol.
- **Builder enhancements** — new operations: bootstrap librarian, create playbook, set up checkpoint, restructure agents.

### Changed

- Standardized role names: forgemaster→orchestrator, smith→builder, keeper→librarian, assayer→auditor.
- Renamed `agents.md` → `AGENTS.md` (uppercase, matches ecosystem convention).
- Removed CLAUDE.md — users point their harness at AGENTS.md directly.
- README rewritten to match the tone of the llms.thisminute.org/forge page: friendly, approachable, leads with what it does for you.
- Orchestrator voice softened; audit cycle reframed as user-initiated (not an automatic loop).
- All pattern templates updated to remove CLAUDE.md references.
- Coding-discipline skill made harness-agnostic (no Claude Code-specific tool names).
- Checkpoint pattern decoupled from `.claude/` directory.
- Quickstart pinned to v0.5.

## [0.4] - 2026-03-15

### Added

- Smoke test validated: cold-start bootstrap produces correct agent systems for 3 synthetic projects (Go API, React+Python app, solo hobby project) — 40/40 structural checks pass
- README now documents all 7 patterns (was 5)

### Changed

- Quickstart pinned to v0.4

## [0.3] - 2026-03-15

### Added

- **SECURITY.md** — full security policy: what prompt files can/can't do, release verification, vulnerability reporting
- README security callout with concrete measures (automated scans, leak detection, pinned tags, upgrade diffs)
- When to Use / When to Skip section for first-run pattern

### Changed

- Removed ecosystem-specific references from steward pattern (generic queue naming)
- Removed ecosystem-specific references from first-run pattern (rhizome link → generic guidance)

### Removed

- Generic disclaimer replaced by actionable security section linking to SECURITY.md

## [0.2] - 2026-03-15

### Added

- Challenge loop pattern for skeptic/strategist review cycles
- First-run wizard for blank-slate project setup
- `.gitignore` for tool-specific config directories

### Changed

- Moved first-run wizard from tool-specific skill to `patterns/first-run.md`
- Moved activation instructions from AGENTS.md into forgemaster role file
- Streamlined protocol pattern
- Removed project-specific content from audit template

## [0.1] - 2026-03-14

### Added

- Initial public template with audit-and-propagate loop
- Forgemaster, assayer, smith, keeper agent roles
- Pattern library: steward, protocol, reflection, ref-docs, feedback
- Cross-project service steward variant
- Harness-agnostic design (no tool-specific branding)
- Self-upgrade mechanism via upstream tag checking
- README with quickstart and structure docs

[Unreleased]: https://github.com/skondrashov/agent-forge/compare/v0.5...HEAD
[0.5]: https://github.com/skondrashov/agent-forge/compare/v0.4...v0.5
[0.4]: https://github.com/skondrashov/agent-forge/compare/v0.3...v0.4
[0.3]: https://github.com/skondrashov/agent-forge/compare/v0.2...v0.3
[0.2]: https://github.com/skondrashov/agent-forge/compare/v0.1...v0.2
[0.1]: https://github.com/skondrashov/agent-forge/releases/tag/v0.1
