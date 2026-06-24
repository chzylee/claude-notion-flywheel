---
name: debrief
description: Log a Claude conversation into the Second Brain and move the board. Extract title/summary/key-decisions/next-actions, match to the Effort(s), upsert a Work Log row keyed by Source URL (set Kind + Effort relation), propose flipping finished Work Items to Done, surface new next-actions as Work Items (hand to create), and flag postable output to the Leverage Board. "--close" mode adds an end-of-day board-hygiene pass. Replaces chat-debrief + daily-log + daily-close. Use on "debrief this chat", "debrief today", "close out my day", "log to Notion".
---

# Debrief → Notion (3-tier model)

> Inherits **[`_SHARED-PREAMBLE.md`](../_SHARED-PREAMBLE.md)** — User Sovereignty · canonical IDs · field semantics (priority cascade, impact locality, status ladders).

Targets:
- efforts_ds   4a693f27-0e14-46fd-ad86-f5031e5d035f   (🎯 Efforts)
- streams_ds   f8ff9bfa-231c-44d3-bf46-58bb64bad7f4   (🧭 Work Streams)
- items_ds     2a0bbe01-6191-466a-a72d-7b67b4604ce9   (✅ Work Items)
- worklog_ds   050c4600-3aeb-4d12-9af1-71bb72c0a2c5   (📓 Work Log)
- leverage_ds  34bb2752-e50f-4633-8867-d2c15fc2f0ff   (⚡ Leverage Board)

Model: **Effort → Work Stream (optional) → Work Item.** The Work Log relates to an **Effort** (and optionally a **Work Item**). There is no Map and no Todos database anymore.

Convention: **User Sovereignty** — recommend, then confirm before any write or status change. Always set **Kind** + the **Effort** relation on Work Log rows.

## Procedure
1. SCOPE. "this chat" = current conversation. "today"/"this week" = use recent_chats to gather the set; debrief each.
2. EXTRACT, per chat: short title, 2–3 sentence summary, key decisions, the single most concrete next action (+ any other discrete actions).
3. MATCH to Effort(s) in efforts_ds (by name; a chat can touch more than one). If durable work has no Effort, propose creating one (hand to `create`).
4. WORK LOG upsert (idempotent on **Source URL**): find a row with this Source URL → update; else create with Title, Date=today, Summary, Key decisions, Next actions, Source URL, **Surface** (Claude Code vs Claude chat), **Kind**, the **Effort** relation, and the **Work Item** relation if the work maps to one.
5. COMPLETE (the merge): if a Work Item was finished this session, propose flipping its Status (To do/Doing → **Done**). Apply on confirm.
6. NEW ACTIONS: surface discrete next actions as candidate Work Items and hand them to `create` — do not create malformed rows here.
7. LEVERAGE: if the chat produced postable output and no Leverage row references this Source URL, propose one (Claimed? unchecked = content debt).
8. REPORT what was created/updated, with links; call out any Work Items moved to Done.

## --close mode ("close out my day")
After the debrief, run a board-hygiene pass over Work Items: orphans (no Effort), items stuck in Doing, missing Priority/Acceptance criteria, `3h+` items that should be split. Surface them, then summarize the day. Read-mostly; ask before fixing.

## Idempotency
Source URL is the Work Log dedup key — re-running updates, never duplicates. Effort write-backs are single-field overwrites, safe to re-run. Works the same from chat or Claude Code (set Surface accordingly).
