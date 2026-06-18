---
name: weekly-digest
description: Summarize the week. Triggers on "weekly digest", "what did I do this week". Reads Work Log + Leverage Board + Map issues for the last 7 days, groups by pillar via the Effort relation, reports the Kind mix, and optionally logs an idempotent "Weekly digest - WW##" entry.
---

# Weekly Digest

Summarizes your week across the whole system. Report-only by default. Distinct from Pattern Report
(deeper trends over time) and Stale-Effort Nudger (the dedicated tool for what's gone quiet).

## Data source IDs
- Work Log:       050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (Effort relation, Kind, Date)
- Efforts:        0cc8af20-2f35-4e0c-985f-67ddddd2e5b0  (Pillar - resolve via Effort relation)
- Leverage Board: 34bb2752-e50f-4633-8867-d2c15fc2f0ff  (Type, Claimed?, Date)

## Steps
1. GATHER (last 7 days): Work Log entries (group by the Effort relation's Pillar), Leverage Board
   activity (work flagged, posts shipped), issues completed (leaf Map rows now Completed).
2. SUMMARIZE: per pillar (what moved, key decisions, shipped items); Kind mix (Build/Write/Plan/
   Stream/Event/Admin counts); content debt added vs cleared; untouched Active efforts (one line).
3. REPORT in chat.
4. LOG (only if asked): upsert a Work Log row "Weekly digest - WW##" (week number = dedup key),
   Kind=Admin, Surface=Claude chat, no Effort relation (it's cross-cutting).

## Notes
- The Kind mix line is the bridge to pattern analysis; for deeper trends use Pattern Report.
- "Untouched" is deliberately one line, not a guilt trip.
