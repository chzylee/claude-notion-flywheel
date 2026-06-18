---
name: content-debt-drafter
description: Draft posts for unclaimed work. Triggers on "clear my content debt", "draft posts for unclaimed work", "what work haven't I posted about". Reads unclaimed Work rows on the Leverage Board, pulls detail from the related Effort's Work Log history, loads the Voice & Writing module, and drafts platform-appropriate posts. Flips Claimed? only on explicit user confirmation.
---

# Content-Debt Drafter

Drafts posts for work you haven't shared yet. Pairs with Leverage Sync (which surfaces the debt);
this skill drafts it and owns flipping Claimed? once you've posted.

## Data source IDs
- Leverage Board: 34bb2752-e50f-4633-8867-d2c15fc2f0ff  (Type, Claimed?, Platform, Effort relation)
- Efforts:        0cc8af20-2f35-4e0c-985f-67ddddd2e5b0
- Work Log:       050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (Effort relation - source of concrete detail)
- Core Context:   cee84109-c3b4-49b0-91f1-f6b4e7215ec5  (Category = "Voice & Writing")

## Steps
1. LOAD VOICE: read Core Context rows where Category="Voice & Writing", Status=Active. Apply to all
   drafts. If no module exists, say so and draft in a neutral-professional register.
2. QUERY Leverage Board: Type="Work", Claimed?=false. Apply any scope filter (pillar via Effort
   relation / effort / platform).
3. PER ITEM: resolve the Effort relation, read its Resync body + most recent related Work Log entries
   for concrete detail, infer target platform(s) (code -> LinkedIn/blog/X; stream moment -> clips;
   event -> community channels), and draft a platform-appropriate post.
4. PRESENT all drafts for editing/approval; the user posts manually.
5. ON CONFIRM ("posted the FindMyFGC one"): flip Claimed?=true on the Work row; optionally create a
   Post row (Type=Post, Platform, Link, Date=today, same Effort relation).

## Key rules
- Never flip Claimed? without explicit confirmation that the post is live.
- Concrete over generic: every draft cites real decisions/numbers/before-after from the log.
