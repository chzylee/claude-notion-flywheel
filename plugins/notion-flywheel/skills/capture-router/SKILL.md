---
name: capture-router
description: Route a raw text dump or notebook photo into the right Second Brain database. Triggers on "capture this", "route this", "sync my notebook". Classifies each item to a Map issue / Effort / Work Log / Core Context, deduplicates, shows the full routing plan, and writes only after confirmation. Handles handwritten-photo capture directly (transcribes, reads checkmarks/strikethroughs as done). Best on mobile for photo captures.
---

# Capture Router

Takes a raw text dump or notebook photo and routes each item to the right Second Brain
database. Action items become **issue rows in the Map** (leaf rows under the relevant
Effort) — there is no separate Todos database anymore. Also handles handwritten-photo
capture directly: transcribe, and read checkmarks / strikethroughs as done.

## Design principles
Read-first (always show the plan) · idempotent (dedupe before writing) · confirm before write-back · set Parent + Area.

## Data source IDs
- Map (Efforts + issues): 0cc8af20-2f35-4e0c-985f-67ddddd2e5b0  (title: Name; Parent/Children self-relation; Area/Kind/Status/Priority selects; Due date; Source select)
- Work Log:               050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (title: Title; Effort relation; Kind select)
- Core Context:           cee84109-c3b4-49b0-91f1-f6b4e7215ec5  (title: Name)

## The Map issue model (what used to be a Todo)
An action item is a **leaf Map row**, child of the Effort it belongs to:
- **Name** = the task text
- **Parent** = the Effort (epic/feature) it falls under; leave blank + flag if unclear
- **Area** = the Effort's Area (FGC / Content / Career / Projects)
- **Status** = "Next up" (not started) | "Active" (in progress) | "Completed" (done)
- **Priority**, **Due** (date), **Source** = Notebook | Chat | Manual
- **Kind** = set only when it's a meaningful issue type (e.g. bug, feature, Study); else leave blank
- Capture date is the row's built-in created-time — no separate field.

## Steps
1. TRANSCRIBE (image only). Read via vision; for handwriting, read checkmarks/strikethroughs as done; show the transcription; ask for corrections first.
2. CLASSIFY each item:
   - Actionable, concrete next step       -> Map issue (leaf row under its Effort)
   - New long-term pursuit                -> Effort (a Map row, top-level or a feature)
   - Already happened, log-worthy         -> Work Log
   - Durable fact / preference / standard -> Core Context
3. DEDUPE. Issues: match Name against open leaf rows under the same Effort/Area (use created-time for recency). Efforts: match Name. Skip anything already present.
4. SHOW PLAN. Every item with proposed destination + key properties (issues: Parent + Area + Status + Priority + Due; new Efforts: proposed Area + Kind). Wait for confirmation; the user can re-route individual items first.
5. WRITE (on confirm).
   - Issue: Map row — Name, Parent (Effort) if inferable, Area, Status="Next up" (or "Completed" if marked done), Priority, Due if given, Source=Notebook|Chat.
   - Effort: Map row — Name, Area (required), Kind, Status=Idea unless clearly Active, Resync body.
   - Work Log: Title, Date=today, Summary, Kind, Surface=Claude chat|Manual, Effort relation if inferable.
   - Core Context: Name, Category, Status=Draft, Surface=Chat|Both.
6. REPORT every row created with links; note skipped dupes and any issues left without a Parent Effort.

## Key rules
- Ambiguous items are flagged in the plan step, not silently assigned.
- Parent (Effort): set where clear; leave blank and flag where uncertain. Never guess.
- New Efforts always get an Area — ask if not obvious.
- An issue with no clear Effort still gets its Area set, so it stays on the right board.
