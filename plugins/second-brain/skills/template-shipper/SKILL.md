---
name: template-shipper
description: Produce a clean, shippable template copy of the Second Brain system. Triggers on "ship the template", "prep a template copy". Works only on a duplicated copy - deletes instance rows (keeps EXAMPLE rows), resets the Status module to the blank scaffold, applies the genericization map from the Template Kit, verifies pillar view filters, and walks the publish step. Plan-first with a full delete/rename diff before any write; never touches the live workspace.
---

# Template Shipper

Automates the Template Kit's strip-to-ship procedure on a duplicated copy. The Template Kit page is
the source of truth for the genericization map; this skill executes it safely. Validate the output
against one hand-shipped copy before trusting it end to end.

## Inputs
- Template Kit: the page holding the genericization map (select-option renames) and the strip checklist.
- The duplicated workspace section to operate on (the user provides/confirms this copy).

## Steps
1. CONFIRM TARGET. Verify you are pointed at a DUPLICATE, not the live workspace. If there's any doubt
   the target is live, stop and ask. This skill never edits the live system.
2. LOAD THE MAP. Read the Template Kit: the strip checklist and the genericization map (which select
   options get renamed, which rows are kept).
3. BUILD THE PLAN (no writes yet):
   - Instance rows to DELETE across all databases (keep rows prefixed "EXAMPLE - ").
   - The Status module reset to the blank scaffold.
   - Select-option RENAMES from the genericization map.
   - Pillar-page view filters to verify.
4. SHOW THE DIFF. Present the full list of deletions and renames for confirmation. Nothing is written
   until the user approves.
5. EXECUTE (on confirm, on the copy only): delete instance rows, reset the Status module, apply renames.
6. VERIFY. Check each pillar page's view filters resolve correctly on the stripped copy; report mismatches.
7. PUBLISH WALKTHROUGH. Walk the user through the manual publish/share step (don't change sharing
   permissions automatically).

## Key rules
- Operate only on the duplicated copy - never the live workspace. Confirm the target first.
- Plan-first: full delete/rename diff before any write.
- Keep "EXAMPLE - " rows; they're the template's sample content.
- The Template Kit is canonical for the map; if it and this skill disagree, trust the Kit and flag the drift.
