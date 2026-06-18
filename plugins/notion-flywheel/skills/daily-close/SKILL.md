---
name: daily-close
description: One command to close the day - run the existing Chat Debrief flow, then audit the knowledge base for duplicates, staleness, and gaps, and triage the day's outputs into their canonical homes. Trigger on "daily close", "close out my day", "debrief and audit", or any request to dedupe/audit the knowledge base or Notion workspace.
---

# Daily Close

## Step 1 - Debrief (reuse, don't duplicate)
Run the existing **Chat Debrief** skill exactly as written (log chats -> Work Log, create
deduped Map issues, flag content debt to the Leverage Board). Do not reimplement its logic here.

## Step 2 - Knowledge-base audit
Scan Core Context, Skill Index, and the Map (efforts + issues) for:
- **Duplicates:** near-identical titles or purposes (two effort rows for one project; a skill
  and a page covering the same flow). Propose a merge target; never delete without confirmation.
- **Supersession:** chat/file outputs or repo docs that an authoritative Notion row has replaced;
  archive pointers, keep one canonical copy. Rule: **Notion is canonical for durable knowledge;
  repos are canonical for code and per-company study kits; chat outputs are ephemeral.**
- **Staleness:** Core Context rows in Draft > 7 days, "Last reviewed" > 30 days, or content
  contradicted by newer rows.
- **Gaps:** unfilled placeholders, issues past Due, Efforts with no Work Log entry in 14 days,
  skills with no Trigger.

## Step 3 - Promote
For anything durable produced today (research, decisions, refined answers): promote it into the
right home - facts/standards -> Core Context; repeatable process -> Skill Index; action -> Map issue;
history -> Work Log. Sessions produce; daily-close files.

## Step 4 - Report + confirm
Output one short report: duplicates found, stale rows, gaps, promotions made. Apply non-destructive
fixes directly; list destructive ones (merges/archives) for one-tap confirmation. Log the audit to
the Work Log (Kind=Admin). Target runtime: ~10 minutes of attention, not a project.

## Scheduling / one-click
- **One-click, any surface:** say "daily close" in Claude chat or Claude Code.
- **Actually scheduled:** Claude chat can't run on a timer; Claude Code can, via an OS scheduler
  (e.g. a daily task that runs `claude -p "run daily-close from my Notion Skill Index"`). Requires
  the Notion MCP configured in that repo; review the morning output rather than trusting silent writes.
- **Pragmatic default:** phone, end of day, "daily close." The habit is the automation.
