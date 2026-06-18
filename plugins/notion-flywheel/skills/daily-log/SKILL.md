---
name: daily-log
description: Debrief and log daily activity into the date-organized Daily Log in Notion. Triggers on "log my day", "debrief my day", "daily log", "log today", "debrief the past week", or "log a specific date". For each in-scope day, gathers that day's chats and Work Log entries, writes one dated page (what I did / where I left off / pick up here / decisions / sources), and upserts so re-running a date updates instead of duplicating. Best in a Claude chat with the Notion connector.
---

# Daily Log

Maintains a date-organized journal — one page per day — so you can open a date and instantly
re-enter: what you did, where you left off, and where to pick up. Complements chat-debrief
(per-chat to Work Log) and daily-close (end-of-day audit): this rolls a whole day into one dated brief.

## Where it writes
- Daily Log home page: 37e76356-d6fe-8126-9332-f0410fc1ac79  (under System). One child page per date.
  Fallback: search for a page titled "Daily Log" under the System page.
- Source — Work Log: 050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (Date, Summary, Key decisions, Next actions, Effort, Kind, Source URL)
- Source — chats: the recent_chats tool (chat surface only).

## Steps
1. RESOLVE SCOPE.
   - "log my day" / "log today" -> today.
   - "debrief the past week" -> each of the last 7 days.
   - "log 2026-06-12" / "what did I do Friday" -> that date.
2. GATHER per day, from the richest source available:
   - recent_chats for that date (what was worked on, decisions, where it stopped).
   - Work Log entries whose Date = that day (Summary, Key decisions, Next actions, Effort, Kind).
   - Optionally: issues completed that day; Leverage posts shipped.
   If a day has no activity in any source, skip it (don't create an empty page) and note it in the report.
3. SYNTHESIZE one brief per day, grouped by effort/theme, using this template:
   > **TL;DR** 2-3 sentences. · Pillars: ...
   ## What I did
   - **theme:** concrete outcome (+ key decision inline)
   ## Where I left off -> pick up here
   - **effort:** state. -> **Next:** the single most concrete next action.
   ## Decisions
   - ...
   ## Sources
   - chat links / Work Log entries
   The "Where I left off -> pick up here" section is the point: tomorrow-morning-you must know exactly where to continue.
4. UPSERT the dated page. Search the Daily Log home page's children for a page titled "YYYY-MM-DD - Weekday".
   - Found -> update its content (merge new detail; never duplicate).
   - Not found -> create a child page under the Daily Log home, titled "YYYY-MM-DD - Weekday".
   Create newest-first so the latest date reads at the top.
5. REPORT which dates were created vs updated vs skipped, with links.

## Key rules
- One page per calendar date; the date is the dedup key. Re-running a date updates it, never duplicates.
- Never invent activity — build only from chats and the Work Log; if a day is empty, say so.
- Keep each brief skimmable; lead with what unblocks tomorrow morning.
- Compute the weekday for the title (don't guess) so days scan fast.