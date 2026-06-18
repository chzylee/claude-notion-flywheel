---
name: resync-briefing
description: One-screen re-entry brief for any effort. Triggers on "resync me on this effort", "step back into this effort", "where did I leave off". Reads the Efforts row body, recent Work Log via the Effort relation, open issues, and unclaimed Leverage items, then outputs a WHAT/STATE/RECENTLY/OPEN/NEXT/DEBT brief. Updates Next action only on confirmation.
---

# Resync Briefing

The one-command re-entry tool. Say "resync me on FindMyFGC" after weeks away and get a one-screen
brief. Pairs with Stale-Effort Nudger: the Nudger tells you what needs re-entry; this gets you back in.

## Data source IDs
- Efforts:        0cc8af20-2f35-4e0c-985f-67ddddd2e5b0
- Work Log:       050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (Effort relation, Date desc)
- (Issues are leaf children of the effort in the Map — Status = Next up/Active, open only)
- Leverage Board: 34bb2752-e50f-4633-8867-d2c15fc2f0ff  (Effort relation, Claimed?=false)

## Steps
1. RESOLVE the effort by name (fuzzy match; confirm if ambiguous).
2. GATHER: row properties (Status, Pillar, Stream, Priority, Next action, Links) + Resync body +
   last 5-10 Work Log entries (newest first) + open issues (leaf children, Status Next up/Active) + unclaimed Leverage Work rows.
3. BRIEF (one screen):
   - WHAT: one line.
   - STATE: status + last touched + trajectory in a sentence.
   - RECENTLY: 3-5 bullets from the Work Log (decisions + outcomes, not noise).
   - OPEN: open issues (child rows) in priority order.
   - NEXT: the single best re-entry action (keep the existing Next action if still valid, else propose one).
   - DEBT: any unposted Leverage items (one line).
4. REFRESH (on confirm only): update the Next action property and the "Next up" line in the Resync body.

## Key rules
- The brief is the product - keep it to one screen; detail lives a click away in the effort page.
- Never invent state - if there are no Work Log entries, say so and build from the body alone.
