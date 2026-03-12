# Cross-Project Agent System Audit

**Date**: 2026-03-12

## Pattern Adoption Matrix

| Pattern | thisminute | mainmenu | AGI | RTS | RTS-Bevy |
|---------|-----------|----------|-----|-----|----------|
| Standalone PROTOCOL.md | Yes | Yes | No | No | No |
| AGENTS.md (separate from CLAUDE.md) | Yes | Yes | No | No | No |
| Slim AGENTS.md + ref/ docs | Yes | N/A | No | No | No |
| Timestamp in startup | Yes | No | No | No | No |
| Shutdown reflection | Yes | No | No | No | No |
| Librarian feedback loop | Yes | No | No | No | No |
| Role file ref doc routing | Yes | No | No | No | No |
| Forum voting minimums | Yes | Yes | No | No | No |

## Maturity Levels

1. **thisminute** — Fully evolved. All patterns adopted. Self-improving context loop operational.
2. **mainmenu** — Has protocol structure but missing reflection, timestamps, and feedback loop.
3. **AGI, RTS, RTS-Bevy** — Agent system embedded in CLAUDE.md. No protocol file. No reflection. No feedback processing.

---

## Per-Project Upgrade Plans

### mainmenu (`~/mainmenu`)

**Effort: Small** — already has the right structure, just needs features added.

1. **Add timestamp to PROTOCOL.md startup** (step 3):
   ```
   3. **Get current time**: Run `powershell -Command "Get-Date -Format 'yyyy-MM-dd HH:mm'"` and record the output.
   ```
   Insert after step 2, renumber subsequent steps.

2. **Add shutdown reflection to PROTOCOL.md** (new step 9, before Exit):
   ```
   9. **Shutdown reflection**: The orchestrator will ask you to evaluate each context layer. Be specific and honest.
   ```

3. **Add reflection prompt to `agents/orchestrator.md`**:
   Copy the §5b "Shutdown Reflection" section from `~/thisminute/agents/orchestrator.md`. Adapt the layer list (mainmenu has no ref/ docs, so skip that layer).

4. **No ref/ docs needed** — AGENTS.md is only ~55 lines. The project is small enough that every agent reading everything is fine.

5. **No dedicated librarian needed** — Add a "Between Spawns" cleanup note to orchestrator.md instead.

### AGI (`~/agi`)

**Effort: Medium** — needs structural refactoring of CLAUDE.md.

1. **Extract PROTOCOL.md** from CLAUDE.md/AGENT_INSTRUCTIONS.md:
   - Move the startup procedure, communication rules, forum voting, and spawn requests into a new `PROTOCOL.md`
   - Add timestamp step, reflection step, forum voting minimum
   - Update CLAUDE.md to point to PROTOCOL.md: `> For Claude agents: see PROTOCOL.md`

2. **Extract AGENTS.md** from CLAUDE.md:
   - Move architecture overview, fractal structure, zoo description, key files into `AGENTS.md`
   - CLAUDE.md keeps: project overview, core philosophy, validated results, hard rules (Rust-first)
   - AGENTS.md is the "what agents need to know about the codebase" doc

3. **Consider ref/ docs**:
   - `ref/training.md` — training protocol, feature discovery loop, transfer learning
   - `ref/rust-bindings.md` — PyO3 API reference, when to use Rust vs Python
   - Route: builder reads both, verifier reads training, strategist reads neither

4. **Add shutdown reflection to `agents/orchestrator.md`**:
   Copy the reflection prompt from thisminute. Include layers: spawn prompt, role file, AGENTS.md, PROTOCOL.md, memory, forum.

5. **Upgrade librarian** to process feedback:
   Add the context feedback processing section from `~/thisminute/agents/librarian.md`.

### RTS (`~/rts`)

**Effort: Medium** — same structural issues as AGI.

1. **Extract PROTOCOL.md** from CLAUDE.md/AGENT_INSTRUCTIONS.md:
   - Same template as AGI. Add timestamp, reflection, voting minimum.

2. **Extract AGENTS.md** from CLAUDE.md:
   - Move: architecture overview, module structure, system execution order, coordinate systems, key types
   - CLAUDE.md keeps: project overview, tech stack, build/run commands, core philosophy

3. **Consider ref/ docs**:
   - `ref/ecs.md` — Bevy ECS patterns, component/resource design, system ordering
   - `ref/game-design.md` — pointer to `design.md` + implementation notes
   - Only needed if AGENTS.md grows past ~150 lines

4. **Add reflection to orchestrator** — same as AGI.

5. **Upgrade librarian** — same as AGI.

### RTS-Bevy (`~/rts-bevy`)

**Effort: Medium** — nearly identical to RTS.

Same steps as RTS. The two projects share agent structure, so changes can be applied in parallel.

Additional note: RTS-Bevy's CLAUDE.md is more detailed (~180 lines) because it documents the Bevy ECS architecture inline. This is a strong candidate for ref/ doc splitting:
- `ref/ecs.md` — ECS architecture, system execution order, coordinate systems
- CLAUDE.md stays focused on overview + build commands

---

## Priority Order

1. **mainmenu** — smallest effort, highest ROI (already has structure)
2. **AGI** — most complex project, would benefit most from ref/ doc splitting
3. **RTS / RTS-Bevy** — apply together since they share structure

## Cross-Cutting Observations

### Agent Role Convergence
All projects use similar roles with different names:
- **builder** = builder (universal)
- **tester/verifier** = quality gate (thisminute calls it "tester", others call it "verifier")
- **skeptic** = critical reviewer (universal)
- **strategist** = direction setter (universal)
- **librarian** = doc maintenance (thisminute, AGI, RTS have it; mainmenu doesn't)
- **debugger** = deep diagnostics (AGI, RTS have it; thisminute, mainmenu don't)

### Missing from All Projects
- **Cross-project learning**: When one project discovers a pattern (like the `replace_all` danger in thisminute), other projects don't learn from it. This meta-project is the start of fixing that.
- **Agent capability profiles**: No project tracks what each agent is actually good/bad at. The orchestrator has no data on which agents produce useful output vs waste cycles.
- **Spawn cost tracking**: No project tracks how many tokens/minutes each agent spawn costs. This would inform scheduling decisions.
