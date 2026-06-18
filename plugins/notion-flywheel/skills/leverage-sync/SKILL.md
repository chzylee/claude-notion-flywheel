---
name: leverage-sync
description: Reconcile the Leverage Board with reality. Triggers on "sync my leverage board", "leverage audit", "is my leverage board up to date". Finds postable Work Log entries never flagged, fixes rows missing Effort/Date, surfaces stale debt for post-or-drop decisions, asks about unrecorded posts, and reports a cross-platform pulse. Plan-first.
---

# Leverage Sync

Keeps the Leverage Board true to its job - the quick look at postable work and shipped posts
across every avenue. Audits both directions and shows the full reconciliation before writing.

## Data source IDs
- Leverage Board: 34bb2752-e50f-4633-8867-d2c15fc2f0ff  (Type, Claimed?, Platform, Effort, Date, Link)
- Work Log:       050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (Effort relation, Summary, Key decisions)
- Efforts:        0cc8af20-2f35-4e0c-985f-67ddddd2e5b0

## Steps
1. WORK -> BOARD: scan recent Work Log (last 14 days, or the asked window) for shipped outputs
   (feature, doc, event run, stream highlight) with no corresponding Work row. Propose Type=Work
   rows (Effort, Date, Claimed?=false). Outputs only, never plans.
2. HYGIENE: fix rows missing Effort/Date (infer from name; ask where unclear). List Work rows
   unclaimed > 21 days as STALE DEBT -> post it (queue for Content-Debt Drafter) or consciously
   drop it (delete on confirm). Debt you'll never pay is clutter.
3. REALITY -> BOARD: you can't see the user's accounts, so ASK one question - "posted anything this
   week not on the board?" For each answer, create a Post row (Platform, Link, Date, Effort) and
   flip the matching Work row's Claimed?.
4. PULSE (read-only): debt count + oldest; posts this month by Platform; avenues quiet > 30 days;
   pillars generating no leverage at all.
5. Show plan -> confirm -> write -> report with links.

## Key rules
- Never flag plans as debt - outputs only.
- Stale debt gets a decision, not a guilt trip.
- Never invent posts; external reality comes from the user's one-question answer.
- Good cadence: weekly, right before clearing content debt.
