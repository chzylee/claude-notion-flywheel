---
name: new-effort
description: Create a well-formed Efforts row. Triggers on "new effort", "add this to my efforts", "track a new effort". Asks for Pillar if missing, dedupes by name, creates the row with the standard Resync body, and reminds about the Recent-work view filter.
---

# New Effort

The consistency keeper. Prevents the slow drift where new efforts get created bare and the
system degrades.

## Data source IDs
- Efforts: 0cc8af20-2f35-4e0c-985f-67ddddd2e5b0
  (Name title; Pillar/Stream/Status/Priority selects; Links url)

## Steps
1. PARSE / ASK: Name (required), Pillar (required - ask if missing), Stream (infer from
   pillar+name, confirm), Status (default Idea; "starting now" -> Active), Priority, Links,
   a one-line description, and the first concrete action.
2. DEDUPE by Name: search Efforts for a match. If found, show it and ask - open existing, or
   really create a second?
3. CREATE the row with the Resync body:
   - What this is: the one-liner
   - Next up: the first concrete action (no first action -> it's an Idea; set Status=Idea)
   - Recent work: placeholder for the linked Work Log view
   - Links & context
   - Notes
4. REMIND of the one manual step: add the "Recent work" linked Work Log view filtered to
   Effort = this page (one click).
5. REPORT with the page link.

## Key rules
- Pillar is load-bearing - never guess it silently.
- No first action means it's an Idea, and the row should say so honestly.
