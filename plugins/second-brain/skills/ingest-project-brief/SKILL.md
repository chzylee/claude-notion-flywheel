---
name: ingest-project-brief
description: 'Ingest a "=== NOTION BRIEF v1 ===" block (from the Generate Notion Brief prompt) and populate the Second Brain for that project — Projects row + documentation page, Core Context spec modules, Map issues, and a Work Log snapshot. Idempotent: detect first-ingest vs re-ingest by project Name and upsert. Use when the user pastes a NOTION BRIEF v1 block or says "ingest this project brief" / "apply this brief to my Second Brain".'
---

# Ingest Project Brief → Notion

Canonical Second Brain data source IDs (fallback if a brief omits machine-targets):
  projects_ds      74eb6f32-87f9-40d5-807a-9f0d9eadb733
  core_context_ds  cee84109-c3b4-49b0-91f1-f6b4e7215ec5
  map_ds           0cc8af20-2f35-4e0c-985f-67ddddd2e5b0
  work_log_ds      050c4600-3aeb-4d12-9af1-71bb72c0a2c5

## Procedure

0. VALIDATE. Confirm the block has the v1 header and "=== END BRIEF ===".
   Read machine-targets for the data source IDs. If absent, fall back to the
   IDs above. If neither resolves, STOP and ask.

1. PARSE sections: PROJECT ROW, PROJECT PAGE BODY, CORE CONTEXT MODULES, TODOS,
   WORK LOG SEED, FLAGS. Treat any field == "UNSET" as "leave blank".

2. RESOLVE MODE. Search projects_ds for a row whose Name matches exactly.
     - No match  -> FIRST INGEST.
     - Match     -> RE-INGEST (capture that page's id as PROJECT_URL).

3. PROJECTS — upsert by Name.
   FIRST INGEST: create the row with PROJECT PAGE BODY as the page content.
   RE-INGEST (preserve the user's manual edits; refresh what the brief owns):
     - Update properties ONLY for fields the brief actually sets. Never overwrite
       a set Notion value with UNSET — UNSET means "leave whatever's there."
     - Do NOT clobber Status/Priority the user changed when the brief value is
       UNSET or merely inferred. On conflict, keep the existing value and report it.
     - Refresh the brief-owned description block but keep hand-added sections; if
       unsure, replace only the auto-generated description and append a dated
       "Updated from brief <date>" note rather than nuking the page.
   BOTH: map only allowed values (Status, Tech subset, Priority); reject off-schema.
   Put primary URL in Links; if a separate live/deploy URL appears in FLAGS/body,
   ensure it's the first line of the page body.

4. CORE CONTEXT — one module per spec file (skip if "No spec files").
   - Upsert by Name. New -> create row. Existing -> REPLACE the page body with the
     new verbatim BEGIN/END CONTENT (specs are canonical; newest wins).
   - Set Category, Target, Status from the module header.

5. ISSUES (the brief's TODOS section) — skip if "None."
   - Dedupe against existing open Map issue rows for this project by matching name.
   - Create only new items as leaf Map rows: Name, Priority, Status="Next up",
     Source, Area="Projects", Parent = the project's Map effort if it resolves by
     name (else leave Parent blank and flag). Leave already-done matches as Completed.

6. WORK LOG — skip if no seed.
   - A snapshot is point-in-time, so re-briefs SHOULD add a new dated row.
   - Dedupe key = Title (contains the date). Same title present (re-run same day)
     -> skip; else create a NEW row: Title, Date=today, Summary, Surface,
     relate Project -> PROJECT_URL. This section accumulates by design.

7. ACTIVITY LOG — optional. If the brief implies something postable shipped, you
   MAY add one row (Type=Work, Claimed?=unchecked). Otherwise skip.

8. REPORT. State the MODE (first ingest vs update). List created/updated/skipped
   per database, surface EVERY FLAG, note any conflict where you kept an existing
   value, and give PROJECT_URL. Never silently accept a FLAG or overwrite an edit.
