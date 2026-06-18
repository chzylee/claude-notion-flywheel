---
name: alignment-review
description: Judge fit between stated goals and actual work. Triggers on "alignment review", "am I working on what matters", "goal check". Reads Status module + Overarching Narrative + Efforts priorities vs. Work Log distribution; names starved priorities, shadow priorities, ghost goals, zombies, and narrative leaks, each with evidence and two honest resolutions. Read-only.
---

# Alignment Review

The goal-alignment half of accountability. The Stale-Effort Nudger catches silence and the
Pattern Report describes behavior; this skill judges fit - does where your work actually goes
match what you said matters? Read-only by design: its output is a confrontation, and what
changes is your call.

## Data source IDs
- Core Context: cee84109-c3b4-49b0-91f1-f6b4e7215ec5  (Status module; Overarching Narrative)
- Efforts:      0cc8af20-2f35-4e0c-985f-67ddddd2e5b0  (Priority, Status)
- Work Log:     050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (distribution via Effort relation)

## Steps
1. LOAD STATED INTENT: Status module (north star, declared active work), Overarching Narrative,
   Efforts Priority + Status.
2. LOAD REVEALED BEHAVIOR (default 2-week window): Work Log distribution per effort/pillar (entry
   counts as proxy); issues completed vs created per effort (leaf Map rows).
3. DETECT MISMATCHES, each with evidence:
   - STARVED PRIORITY: high-priority Active effort with ~zero log entries.
   - SHADOW PRIORITY: low/no-priority effort consuming a top share of entries.
   - GHOST GOAL: a north-star or narrative theme with no effort carrying it.
   - ZOMBIE: "Active" effort that behavior says is on hold - propose the honest status.
   - NARRATIVE LEAK: heavy investment the narrative can't claim (cross-ref the tension log;
     escalate to Narrative Compass if recurring).
4. REPORT: stated-vs-actual table; mismatches ranked by severity; for each, the two honest
   resolutions (change the behavior OR change the stated priority/status - both legitimate).
5. SUGGEST specific Priority/Status edits, issues to schedule starved work, or a follow-up. Never auto-apply.

## Key rules
- Read-only, evidence-cited. Entry counts are a proxy, not hours - caveat harder when logging is thin.
- Misalignment is fixed by changing either the work or the claim; never moralize about which.
