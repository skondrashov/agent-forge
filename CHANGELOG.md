# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/).
This project uses 0.x versioning.

## [Unreleased]

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

[Unreleased]: https://github.com/skondrashov/agent-forge/compare/v0.3...HEAD
[0.3]: https://github.com/skondrashov/agent-forge/compare/v0.2...v0.3
[0.2]: https://github.com/skondrashov/agent-forge/compare/v0.1...v0.2
[0.1]: https://github.com/skondrashov/agent-forge/releases/tag/v0.1
