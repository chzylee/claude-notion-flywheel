---
name: chat-debrief
description: Log a Claude conversation (chat or Claude Code) into the Second Brain. Extract title/summary/key-decisions/next-actions, match to the Effort(s) in the Map, upsert a Work Log row keyed by the chat's Source URL, WRITE BACK the next action onto the matched Effort, create deduped issue rows in the Map for discrete next actions, and flag postable output to the Leverage Board. Use on "debrief this chat", "debrief today", "debrief this week", or "log to Notion".
---

# Chat Debrief → Notion

Targets:
- work_log_ds  050c4600-3aeb-4d12-9af1-71bb72c0a2c5
- map_ds       0cc8af20-2f35-4e0c-985f-67ddddd2e5b0   (the 🗺️ Map — Efforts AND issues)
- leverage_ds  34bb2752-e50f-4633-8867-d2c15fc2f0ff   (⚡ Leverage Board)

The Map is one database holding the full epic→feature→issue hierarchy. Efforts are the
epic/feature rows, grouped by the **Area** select (FGC / Content / Career / Projects).
Action items ("todos") are **leaf issue rows** parented under their Effort — there is no
separate Todos database.

## Procedure

1. SCOPE. "this chat" = current conversation. "today" / "this week" = use
   recent_chats to gather the set, and debrief each.
2. EXTRACT, per chat: a short title, a 2-3 sentence summary, key decisions, and
   the single most concrete next action (plus any other discrete actions).
3. MATCH to Effort(s). Search the Map for the effort row(s) this work belongs to
   (by name; a chat can touch more than one). If none exists and the work is
   durable, create one (Area + Status=Active + Next action) or flag it. Note the
   matched effort's page URL(s) for the relation and the write-back.
4. WORK LOG upsert (idempotent on Source URL):
   - Search the Work Log for a row where Source URL == this chat's URL.
   - Found     -> update it.
   - Not found -> create a row: Title, Date=today, Summary, Key decisions,
     Next actions, Source URL, **Surface** (Claude Code if run from Code, else
     Claude chat), and the **Effort** relation to the matched row(s).
5. WRITE BACK TO EFFORT (the state wire — do not skip):
   For each matched Effort, update the Map row:
   - **Next action** <- the single most concrete next step from this session
     (overwrite the stale one; this is what the ▶ Active by Area board shows).
   - **Status** -> bump only if the session clearly changed it (e.g. Active ->
     Shipped when done, Active -> On hold when blocked). Never invent a status.
   Last touched updates itself on any edit.
6. ISSUES: for each discrete next action, create a **Map issue row** — a leaf
   child of the matched Effort:
   - Name = the action, Parent = the Effort, Area = the Effort's Area,
     Status = "Next up", Source = "Chat", Priority/Due if known.
   - Skip if an identical open issue already exists under that Effort (search
     leaf rows by Name).
7. LEVERAGE BOARD: if the chat produced something postable, create one row
   (Work, the right Area/Platform, Claimed? = unchecked = content debt) unless
   one already exists for it.
8. REPORT what was created/updated, with links — and call out the effort(s)
   whose Next action you refreshed.

## Idempotency / run-at-will
- Source URL is the Work Log dedup key: re-debriefing the same chat updates,
  never duplicates.
- The Effort write-back is an overwrite of one field, so re-running is safe.
- Issue rows and Leverage rows are guarded by "unless one already exists"
  (match open leaf rows by Name under the same Effort).
- Works the same from a Claude chat or Claude Code (set Surface accordingly).
  Run it whenever you want to sync — mid-session or at the end.
