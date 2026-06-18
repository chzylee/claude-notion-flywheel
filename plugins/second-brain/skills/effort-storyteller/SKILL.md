---
name: effort-storyteller
description: Turn an effort's Work Log history into a narrative. Triggers on "tell the story of this effort", "build a case study", "resume bullets for", "STAR stories for". Reads all Work Log entries via the Effort relation chronologically, extracts the problem-approach-decisions-outcome arc, renders in the requested format, and flags log gaps instead of inventing.
---

# Effort Storyteller

Turns an effort's Work Log history into a story - the payoff of the audit log. The log becomes
the proof that "I optimize and productize workflows."

## Data source IDs
- Efforts:        0cc8af20-2f35-4e0c-985f-67ddddd2e5b0
- Work Log:       050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (Effort relation, oldest first)
- Leverage Board: 34bb2752-e50f-4633-8867-d2c15fc2f0ff  (Type=Post for public artifacts)
- Core Context:   cee84109-c3b4-49b0-91f1-f6b4e7215ec5  (Voice & Writing for public formats)

## Steps
1. Resolve the effort + format (case study | resume bullets | STAR | blog). Default: case study.
2. Gather the full Work Log timeline (oldest first) + Resync body + shipped Posts + Voice module.
3. Extract the arc: problem -> approach -> key decisions -> obstacles -> outcomes. Pull concrete
   details: dates, tech, numbers.
4. Render in the requested format:
   - Case study: problem / approach / decisions / outcome / what I'd do differently.
   - Resume bullets: 3-5, impact-first, quantified only where the log allows.
   - STAR: 2-3 stories, each Situation/Task/Action/Result.
   - Blog draft: narrative voice per the Voice module.
5. Flag gaps explicitly where the log is thin (missing outcomes, no numbers) - never invent.
6. On confirm: add the output as a Leverage Work row (Type=Work, Effort relation) so publishing
   it is tracked as content debt.

## Notes
- Never fabricate; the narrative's authority comes from the log. Flagged gaps tell you what to log better.
- Strong resume bullets should feed the Core Context resume module - suggest updating it.
- For interview prep specifically, use the Interview Prep skill, which calls this pattern per-application.
