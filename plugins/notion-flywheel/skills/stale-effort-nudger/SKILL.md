---
name: stale-effort-nudger
description: Weekly review of stale efforts. Triggers on "weekly project review", "what's gone stale", "stale effort check". Reads Efforts (Status=Active, Last touched more than ~10 days ago) across all pillars, cross-checks recent Work Log entries, and proposes next actions. Read-only unless the user confirms a Next action write.
---

# Stale-Effort Nudger

The accountability backstop: disjoint long-term efforts go quiet silently; this makes the silence
visible. Pairs with Resync Briefing (which gets you back into a stale effort).

## Data source IDs
- Efforts:  0cc8af20-2f35-4e0c-985f-67ddddd2e5b0  (Status select, Last touched, Next action)
- Work Log: 050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (Effort relation, Date)

## Steps
1. QUERY Efforts: Status="Active", Last touched < today - 10 days (or the user-given window).
   Apply a pillar filter if requested.
2. CROSS-CHECK Work Log: an effort with a Work Log entry inside the window is NOT stale even if
   Last touched is old (debriefs edit the Work Log side, not the effort row). Drop those.
3. SORT remaining oldest-first. For each, read the Resync body ("Next up" + recent log) and propose
   a concrete next action (or surface the existing Next action if still sensible).
4. REPORT grouped by pillar: Effort, Last touched, days stale, proposed action. Flag any Active
   effort with no Next action set at all.
5. WRITE-BACK only on explicit per-effort confirmation: update the Next action property.

## Key rules
- 10 days is the default window; the user can override ("stale after 14 days").
- Never change Status. If something looks abandoned, suggest moving it to On hold - don't do it.
