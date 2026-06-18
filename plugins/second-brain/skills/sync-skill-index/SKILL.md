---
name: sync-skill-index
description: Reconcile this repo's whole skills folder against the user's Notion 🛠 Skill Index in one pass — the bulk counterpart to skill-forge (which handles one new skill). Trigger on "sync skills to Notion", "sync the skill index", "update the skill library", "reconcile my skills with Notion", "push my skills to Notion", or after adding/renaming/removing several SKILL.md files. Enumerates every local skill, creates missing Index rows, updates changed ones, and proposes retiring rows whose skill no longer exists — always showing the full plan and writing only after confirmation.
---

# Sync Skill Index

Keep the Notion **🛠 Skill Index** in lockstep with the SKILL.md files in this
repo. Where `skill-forge` documents **one** skill as you create it, this skill
reconciles the **entire** folder in a single pass: new skills get rows, edited
skills get refreshed, and rows for deleted skills are proposed for retirement.

This is a read-plan-confirm-write flow. Never write to Notion before showing the
full plan and getting a go-ahead.

## Step 1 — Find the local skills

The skills folder is the directory that contains this skill's siblings — i.e. the
`skills/` directory this `sync-skill-index/SKILL.md` lives in. **Resolve it
relative to this file; never hardcode the plugin/directory name** (it may be
renamed — see the repo README's "Renaming the plugin" guide). Concretely: the
parent of this skill's own folder.

List every immediate child `<name>/SKILL.md`. For each, parse:
- `name` (kebab-case) → the Skill Index **Skill name** (title, the match key).
- `description` → source for **Trigger** and a sanity check on Purpose.
- The body → source for **Definition** and **Purpose**.

Skip this skill itself only if the user asks to; by default include it too.

## Step 2 — Find the Notion target

Resolve by **searching Notion by name** (no hardcoded IDs in committed files,
matching `skill-forge`): find the **🛠 Skill Index** database and its data source.
The Skill Index is the canonical home for skill docs — the old **Skill Library**
page was retired, so do **not** create child pages there. If a `.env` is present,
`NOTION_SKILL_INDEX_DS_ID` may override the search.

Then query the data source to pull every existing row (Skill name + current
property values) so the diff in Step 4 is accurate.

## Step 3 — Derive each row's fields

For every local skill, build the target row from the SKILL.md. The Skill Index
schema and how to fill it:

- **Skill name** (title) — the frontmatter `name`, verbatim. This is the match key.
- **Definition** (text) — a few sentences on what the skill mechanically does
  (the "what it is"), distilled from the body. Include the confirm/no-auto-send
  guardrails where the skill has them.
- **Purpose** (text) — one sentence on the outcome/why.
- **Trigger** (text) — the user-facing phrases, ` · `-separated, pulled from the
  `description`'s trigger clause.
- **Status** (select: Idea / Draft / Active / Retired) — set **Active** for every
  skill that exists in the repo.
- **Surface** (select: Claude chat / Claude Code / Both) — default **Both** unless
  the body restricts it.
- **Tools used** (multi-select: Notion / recent_chats / vision / web_search) — only
  the ones the body actually uses. Use existing options; don't invent new ones.
- **Writes to** (multi-select; existing options: Work Log / Todos / Core Context /
  Leverage Board / Efforts / Nothing (read-only)) — what the skill mutates. Use
  existing select options only. (Note: this suite now writes action items as **Map
  issue rows**, but if the Notion select has no "Map issues" option yet, leave the
  closest existing option or "Nothing (read-only)" and flag it rather than adding a
  new option.)

## Step 4 — Diff and show the plan

Compare local skills against existing Index rows by **Skill name** and bucket:

- **Create** — local skill with no matching row.
- **Update** — matching row whose fields differ from the derived values (list which
  fields change; skip rows that already match — no-op).
- **Retire** — an Index row with Status ≠ Retired whose Skill name has **no** local
  folder. Propose flipping it to **Retired** (never delete the row).

Present the three buckets as a compact table/list. State counts ("3 create, 5
update, 1 retire, 19 unchanged"). **Wait for confirmation** before writing.

## Step 5 — Write (idempotent)

After the go-ahead:
- **Create**: add a row with the derived fields. Leave the page body blank — Skill
  Index rows are property-only (the SKILL.md lives in this repo, not in Notion).
- **Update**: patch only the changed properties on the existing row. Don't touch
  `readOnly`/system fields.
- **Retire**: set Status = Retired on the orphaned rows. Don't delete.

Idempotent by design: re-running with no local changes produces "0 create, 0
update, 0 retire" and writes nothing.

## Step 6 — Report

Summarize what changed with Notion links to created/updated/retired rows, and note
anything you couldn't map cleanly (e.g. a "Writes to" value with no matching select
option) so the user can adjust the Index schema.

## Notes

- **Match key is `name`/folder** — keep it stable across edits so the row, the repo
  file, and any saved skill stay one identity. A rename reads as retire-old +
  create-new; if a rename was intended, tell the user so they can re-link instead.
- **Pairs with [[skill-forge]]** — forge one new skill end-to-end; sync to bulk
  reconcile the whole folder afterward (e.g. after editing several skills at once).
- **Directory-rename-proof** — this skill resolves its folder relative to itself, so
  renaming the plugin directory needs no change here.
