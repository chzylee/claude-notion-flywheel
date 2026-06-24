---
name: resync
description: One-screen re-entry on a single Effort — what it is, recent work, open items, next action, content debt. Use on "resync me on <effort>", "where did I leave off on <effort>", "step back into <effort>".
---

# Resync → re-enter one Effort

> Inherits **[`_SHARED-PREAMBLE.md`](../_SHARED-PREAMBLE.md)** — User Sovereignty · canonical IDs · field semantics (priority cascade, impact locality, status ladders).

Targets:
- efforts_ds   4a693f27-0e14-46fd-ad86-f5031e5d035f   (🎯 Efforts)
- items_ds     2a0bbe01-6191-466a-a72d-7b67b4604ce9   (✅ Work Items)
- worklog_ds   050c4600-3aeb-4d12-9af1-71bb72c0a2c5   (📓 Work Log)
- leverage_ds  34bb2752-e50f-4633-8867-d2c15fc2f0ff   (⚡ Leverage Board)

Convention: **User Sovereignty** — read-only; offer to update Next action only on confirmation.

## Procedure
1. MATCH the named Effort in efforts_ds (ask if ambiguous).
2. READ: the Effort row (Priority, Status, Next action, body) + its open Work Items (Status != Done, with Priority/Impact/Commitment) + recent Work Log entries tagged to it + unclaimed Leverage items.
3. OUTPUT one screen:
   - **WHAT** — one line on the Effort.
   - **STATE** — Status + effective priority (note if the Effort itself is parked).
   - **RECENTLY** — last few Work Log entries.
   - **OPEN** — top open Work Items by effective priority, with commitment.
   - **NEXT** — the single next action.
   - **DEBT** — unclaimed postable output.
4. OFFER to update the Effort's Next action — only on confirmation.
