---
name: linkedin-post
description: 'Draft a LinkedIn post start to finish from a rough idea, in the user''s voice. Triggers on "linkedin post", "draft a post", "post idea", "sharpen this into a post", or a pasted kernel of an idea. Reads the LinkedIn Post Log (Core Context, Voice & Writing) for voice and pillar coverage, sharpens the idea, drafts, applies the humanizer, recommends hashtags, auto-assigns an Anchor/Quick tier, suggests future post ideas, and holds until the user confirms they posted before logging. Goal: high value, low time and effort.'
---

# LinkedIn Post

Turn a rough idea into a posted LinkedIn post the user is glad a hiring manager
might read — fast. The end goal behind every post is hiring visibility: showing
how the user thinks and what they're building, to attract recruiters, interviews,
and good impressions on interviewers. Optimize for high value at low time/effort.
Most posts should be cheap; spend real effort only on posts that could move a
hiring decision.

## The one habit that makes this cheap
The **LinkedIn Post Log** (a Core Context page, Category = Voice & Writing) is the
voice memory. Read it first, every time. It holds prior post bodies, derived voice
notes, pillar coverage, posting conventions, hashtags, and interaction counts. The
log is what lets this skill stay consistent without re-deriving the user's voice
each run — and as interaction data accrues, it turns tier and hashtag guesses into
evidence-backed calls.

## Process (idea → posted → logged)

### 1. Read the log first
Fetch the LinkedIn Post Log. Note: voice notes, recurring themes, which narrative
pillars are already covered (steer toward gaps), posting conventions (line breaks
between paragraphs), and past hashtag sets + any interaction counts.

### 2. Take the input
Required: the idea/kernel (rough is fine — sharpening it is the job).
Optional: context-only material (motivation that should shape tone but NOT appear
in the post), audience lean (default: broad), a pillar to hit or avoid.

**Enforced rule:** whenever it's unclear whether something the user said is meant
for the post or is only context/motivation, ask — and give an opinion on whether to
include, exclude, or change it. Never silently fold motivation into the post.

### 3. Sharpen
Restate the real claim in one line. Flag if the framing is stale, off-target, or
making a weaker point than the idea underneath it. Prefer a personal, specific
claim ("here's the bet I'm making") over a corrective one ("most people do X wrong").

### 4. Draft
Match the log's voice notes. The house voice: open on a specific tension or
observation, never an announcement; short sentences; earn the broader point through
a concrete personal story first; end on a transferable principle that lands for
engineers and non-engineers; no hype, no buzzword soup; show thinking, not
credentials. Use a bookend/analogy only when it pays off (extends, doesn't just
restate).

### 5. Annotate
Flag every uncertain inclusion with an explicit opinion (include / cut / change +
why). This is the vetting step — it's how the user keeps editorial control without
re-reading the whole thing.

### 6. Humanize
Apply the humanizer patterns against the Post Log as the voice sample: break
rule-of-three rhythms, kill constructed inversions, remove em/en dashes, prefer
plain constructions, vary sentence length. **Light touch** — this user's drafts are
usually already close; over-processing sands off the specificity that makes it sound
like them. Output should be copy-paste ready with blank lines between paragraphs.

### 7. Recommend hashtags
Propose 3–5: one broad for reach, two-to-three niche for targeting, placed at the
end. Skip dead generics (#Success, #Business, #Motivation). Avoid stacking
job-search tags — "Open to Work" already carries that, and the user doesn't want to
look like they're asking. Lean toward tag sets that correlated with engagement in
the log once data exists.

### 8. Assign the tier (you decide, user corrects)
Auto-assign **Anchor** or **Quick** and state the reason in one line. The user has
explicitly delegated this call — they lack the data to judge a topic's potential
impact, so default the responsibility here and let them override.
- **Anchor** — demonstrates judgment or a way of thinking an interviewer could
  reference; anchors a claim the user makes in interviews. Worth the full loop.
- **Quick** — keeps the user visible and consistent but won't independently change
  how someone evaluates them. Keep it cheap: one pass, light annotation, post, log.

The test: *would the user be glad a hiring manager they're interviewing with had
read this, and would it shift that person's read?* Yes to both → Anchor.

### 9. Suggest future post ideas
At the end of a draft, surface 1–2 adjacent post ideas noticed while drafting (an
unspent angle, a thread planted for later). Offer to log each as a **Low-priority Map issue** (Source = Chat). The user manages whether they survive — having them on the
sprint board is the point.

### 10. Hold, then log on post
**Never log a post until the user confirms they posted it.** On confirmation, add an
entry to the Post Log archive (full body with line breaks, theme, narrative pillar,
hook, hashtags, tier), and update the pillar tracker. Don't backfill hashtags onto
older posts that didn't have them — the record should stay accurate to what actually
shipped.

### 11. Ingest interactions later (optional)
When the user reports interactions ("Post 5 got 40"), log the number against that
post. The user won't distinguish reaction types and may not count comments, so treat
both a single interaction count and a comment count as **optional** fields — log
whatever is given, don't ask for more.

## Notion targets
Resolve by searching Notion by name (don't hardcode IDs):
- **LinkedIn Post Log** — Core Context page, Category = Voice & Writing. Read for
  voice/pillars; write new post entries and interaction counts here.
- **Map** (issues) — write future post ideas as leaf rows (Area = Career, Priority = Low, Status = Next up, Source = Chat).

## Keep it cheap
The expensive part is one-time: building the voice record and this process. Don't
re-litigate voice every run. Don't make every post an Anchor. The highest-leverage
thing the user can do is capture idea kernels when they strike — the draft is fast
once a kernel exists. Drafting is not the bottleneck; ideas are.
