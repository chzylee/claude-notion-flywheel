# Skill migration — old Map model → 3-tier PM model (2026-06-23)

The system was rebuilt from a single overloaded **Map** database (Effort/Sub-effort/Work-Stream/Activity nested by Type+Parent) to three clean tiers: **🎯 Efforts → 🧭 Work Streams → ✅ Work Items**. The old Map is trashed. Skills must target the new data sources.

## New data-source IDs (use everywhere)
| Store | ID |
|---|---|
| 🎯 Efforts | `4a693f27-0e14-46fd-ad86-f5031e5d035f` |
| 🧭 Work Streams | `f8ff9bfa-231c-44d3-bf46-58bb64bad7f4` |
| ✅ Work Items | `2a0bbe01-6191-466a-a72d-7b67b4604ce9` |
| 📓 Work Log | `050c4600-3aeb-4d12-9af1-71bb72c0a2c5` *(unchanged)* |
| 🧠 Core Context | `a09861f2-b5dd-4758-894a-2f2192fea320` *(unchanged)* |
| ⚡ Leverage Board | `34bb2752-e50f-4633-8867-d2c15fc2f0ff` *(unchanged)* |
| ❌ old Map (DEAD) | `0cc8af20-2f35-4e0c-985f-67ddddd2e5b0` — trashed; never reference |

## Core suite — 6 skills (consolidated 2026-06-23, second pass)
`init-direction` · `create` · `plan` · `review` · `debrief` · `resync`
All share **[`_SHARED-PREAMBLE.md`](_SHARED-PREAMBLE.md)** (canonical IDs + User Sovereignty + field semantics + the gstack skill contract).

**Consolidation (9 → 6):**
- `new-effort` + `clarify` + `capture` → **`create`** — one tier-agnostic creation flow (Effort / Stream / Item): reads the Direction north star, fully populates, validates against goals, ends by asking next steps.
- `daily-standup` → **`plan`** — day *and* week; sets the new Work-Items **Plan** tag (Today / This week) that drives the top-level **📋 Todo** boards.
- `accountability-audit` + `review` → **`review`** — opens with a depth question (Quick hygiene vs. Full audit).

## Retire (replaced — DONE: `git rm`'d 2026-06-23)
- `chat-debrief`, `daily-log`, `daily-close` → **debrief**
- `alignment-review`, `stale-effort-nudger` → **accountability-audit**
- `weekly-digest`, `pattern-report` → **review** (still to write)
- `resync-briefing` → **resync**
- `capture-router` → **capture** (still to write; + folds in any notebook-todos)

```bash
git rm -r chat-debrief daily-log daily-close alignment-review stale-effort-nudger \
         weekly-digest pattern-report resync-briefing capture-router
```

## Written (DONE)
- **review [window]** — merged weekly-digest + pattern-report.
- **capture** — lossless, field-light dump that hands off to `clarify`.

## Keep, but REPOINT (career / leverage / system packs)
These still work conceptually but read the dead Map. Swap `0cc8af20…` → the new IDs (Efforts `4a693f27…`, Work Items `2a0bbe01…`); group by the **Effort** (the top-level entity — there is no `Area`/`Pillar` taxonomy anymore); replace old issue rows with Work Items.
- Leverage/output: `content-debt-drafter`, `effort-storyteller`, `linkedin-post`, `leverage-sync`
- Career: `interview-prep`, `proposal-builder`, `job-hunt`, `master-resume-feedback`, `own-your-code`
- Context/system: `load-context`, `load-project-context`, `ingest-project-brief`, `spec-pusher`, `skill-forge`, `sync-skill-index`, `template-shipper`, `sharpen`, `event-ops`, `humanizer`, `narrative-compass`

## Convention for all rewritten skills
Frontmatter `name` + `description` (triggers embedded in the description). Body: a `Targets:` block of the new IDs, then a numbered `Procedure`. Honor **User Sovereignty** (recommend, confirm before writing). Set the **Effort** relation AND the denormalized **Effort key** select together. Effective priority cascades (parent priority caps child) and is skill-computed; Impact is local to parent.
