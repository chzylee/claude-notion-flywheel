---
name: event-ops
description: Run the operations pipeline for an MBAACC event. Triggers on "event ops for an event", "prep the tournament". For a planned event row in the MBAACC Activities table, generates the dated run-up checklist as Map issue rows (start.gg setup, announcements, check-in reminders, bracket prep), drafts promo posts, and after the event logs a Work Log entry (Kind=Event) and flags the Leverage item. A per-event pipeline: plan, promote, run, log, post.
---

# Event Ops

Operations support for MBAACC events, using the MBAACC Activities table inside the MBAACC Community
effort. Builds on NEST's automation for the online pieces; this carries the offline organizing.

## Data source IDs
- MBAACC Activities: table inside the MBAACC Community effort (resolve by fetching that effort page)
- Work Log:       050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (Kind=Event)
- Leverage Board: 34bb2752-e50f-4633-8867-d2c15fc2f0ff
- Efforts:        0cc8af20-2f35-4e0c-985f-67ddddd2e5b0  (MBAACC Community; NEST for tooling)

## Steps
1. RESOLVE the event row in the MBAACC Activities table (name, date, format). Ask if ambiguous.
2. GENERATE THE RUN-UP CHECKLIST as dated Map issue rows, back-timed from the event date:
   - start.gg event creation
   - announcement post(s)
   - check-in / reminder nudges
   - bracket prep
   Create each as a leaf Map row (Parent = MBAACC Community, Area = FGC, Status = Next up, Source = Chat), Due set relative to the event. Reuse NEST
   automation where it already covers a step rather than duplicating it.
3. DRAFT PROMO POSTS by calling the Content-Debt Drafter voice-loading pattern (Voice & Writing
   module) so announcements match the user's voice. Present for approval; don't post.
4. POST-EVENT (when the user says it ran): log a Work Log entry (Kind=Event, Effort=MBAACC Community,
   Date, Summary, outcome/turnout) and flag a Leverage Work row (Claimed?=false) for the recap/clips.
5. REPORT every Map issue and row created, with links.

## Key rules
- Don't duplicate steps NEST already automates - build on it.
- Promo drafts are presented, never auto-posted.
- The post-event log + Leverage flag is what makes the event count as evidence later.
