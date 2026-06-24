---
name: cover-letter
description: 'Draft a tailored, evidence-led cover letter for a specific job, fast enough to actually finish and send. Auto-detects a pasted job description or a Job Application Tracker row; loads the Story & Answer Bank, Overarching Narrative, Voice module, and real Work Log evidence; builds a problem-obsession-led argument anchored to true logged outcomes; runs the humanizer; outputs an editable .docx (one-step PDF export) and logs to Notion + a Cover Letter Log that tracks the user''s voice over time. Triggers on "cover letter for [company]", "draft a cover letter", "write a cover for this job", "cover letter for this JD".'
---

# Cover Letter

Draft a cover letter that makes the hiring manager think *"this person already
understands our problem and has done something like solving it"* — and get it into
an editable, submittable file fast. This skill sits between **job-hunt** (find/score)
and **interview-prep** (prep the conversation), and reuses the **same Story & Answer
Bank + Overarching Narrative** so the resume, the letter, and interview answers all
tell one consistent story.

The point is acceleration: a finished, sendable letter — not a writing exercise.

## The product — what an effective cover letter actually is

The one job, in ~250–350 words: prove you understand *their* problem and have
adjacent proof you can help with it. Four levers, strongest first. Build in this order;
do not let the weak one lead.

1. **Argument / synthesis (strongest).** The resume lists *what*. The letter *argues*
   why those specific things make the candidate right for **this** role. Connect the
   dots the resume leaves implicit.
2. **Company-specificity via problem-obsession (the spine).** Open on *their* problem
   with real homework — its texture, why it's hard, what's at stake. This is a costly,
   uncopyable signal: it can't be faked without doing the work, and it reframes the
   candidate from job-seeker to peer already thinking alongside them.
3. **Proactive objection-handling.** Name and reframe the obvious gap (pivot,
   employment gap, non-traditional path, over/under-qualified) before it becomes a "no".
4. **Voice / the human side (the finish, not the lead).** It's a writing sample and a
   motivation signal — but it lands *because* it wraps levers 1–3, not instead of them.

**Hard reframe to enforce:** the pitch is *"how I help them win at their specific
problem,"* never *"how I fit in with them."* Culture-fit framing is weak and supplicant;
value framing is strong. Fit is the byproduct of demonstrated value.

## The argument arc (use this structure for the draft)

1. **Hook** — their problem, not the candidate's introduction. Show the homework.
2. **Bridge** — their problem → the candidate's proof. "You're working on X; I've done
   Y, the same muscle."
3. **Evidence** — 1–2 concrete, true, logged outcomes. Built/shipped/cut/grew, with the
   number when there is one. Never "experienced in".
4. **Bridge the gap** — handle the likely objection honestly.
5. **Close** — forward-looking and low-ego: what they'd build together. Confident, not needy.

## Guardrails (refuse to ship slop)

- **A generic or fabricated letter is worse than none** — it signals low effort and
  actively hurts. If there isn't enough real evidence or company specificity to clear
  the bar, say so and stop rather than padding.
- **Truth constraint on every claimable line.** Every claim must be true and traceable
  to a logged Work Log outcome (same rule interview-prep uses). Never invent enthusiasm,
  metrics, or experience.
- **Problem-obsession ≠ armchair-quarterbacking.** Showing you understand their hard
  problem is magnetic; telling them what they're doing wrong is repellent. Curiosity +
  relevant experience only — never unsolicited critique of their product or strategy.
- **No orphan problem essays.** Every problem-obsession setup must bridge back to the
  candidate's real evidence. The problem is the setup; the logged proof is the payoff.

## Procedure

### 0. Triage first — is a cover letter worth it here? (ask before proceeding)
Before any drafting, judge whether spending time on a letter is the right move for
**this** application, and get the user's go/no-go. A weak or pointless letter costs time
and can hurt; the most valuable answer is sometimes "skip it." Weigh:
- **Is it expected?** Required / optional / "not accepted" — read the JD or application
  form. A required letter clears the bar by default; a form with no upload slot is a "no".
- **Can it move the decision?** Is there a real problem-obsession angle (genuine homework
  to do on their problem) AND at least one strong, true logged outcome to anchor it? If
  both are thin, the letter can't do its job — say so.
- **Is there an objection worth pre-empting?** Pivot, gap, non-traditional path raise the
  value of a letter; a clean, on-the-nose fit lowers it (the resume already argues it).
- **Cost vs. payoff.** Stage of the application, how much the role is worth pursuing, and
  whether the time is better spent elsewhere (more applications, a referral, prep).

Give a one-line verdict with a reason — **Worth it**, **Skip it**, or **Borderline** —
and **ask the user to confirm before proceeding or stopping.** Don't draft on a "Skip it"
without an explicit override. If they override, proceed; the call is theirs.

### 1. Take the input (auto-detect)
Accept **either**:
- a **pasted JD** (raw text or a link the user pastes), **or**
- a **Job Application Tracker row** (company/role) in Notion.

Detect which was given. If a tracker row, resolve it (role, stage, JD link, notes). If a
pasted JD with no tracker row yet, proceed from the text and offer to create/link a row
at logging time. If both are ambiguous or missing, ask one question.

### 2. Read the user's context (read-first, never rebuilt)
Resolve all targets by **searching Notion by name** — don't hardcode IDs.
- **Story & Answer Bank** (Core Context, Category = Career) — canonical stories, answers,
  evidence anchors. Same Bank interview-prep uses; tune emphasis, don't duplicate.
- **Overarching Narrative** (Core Context, Category = Career) — the one-line narrative,
  evidence anchors, tension log. Keep the letter consistent with it.
- **Voice & Writing** module / the **Cover Letter Log** (see below) — for tone.
- **Work Log** evidence via the **Effort relation** — pull concrete STAR-shaped outcomes
  (situation, action, measured result) that match this JD's requirements.

### 3. Map the JD to evidence (the homework)
- Extract the role's real requirements and, crucially, the **problem the role exists to
  solve** (read between the lines of the JD; use the company's product/mission if known).
- For each requirement, find the **strongest true logged outcome** that maps to it.
- Decide the 1–2 evidence anchors strong enough to carry the letter. If nothing clears
  the bar, flag the gap — don't fabricate.
- Pick the single problem to obsess over in the hook (the one the candidate has the most
  real proof against).

### 4. Draft using the argument arc
Hook (their problem) → bridge → 1–2 evidence anchors → objection-handling → close.
Keep it ~250–350 words. Every claimable line traces to the Bank or Work Log. Hold the
voice loosely here — the humanizer pass finishes it.

### 5. Annotate
Flag any line that's a stretch, a soft claim, or an unverified specific — with an
explicit opinion (keep / cut / soften + why). This is how the user keeps editorial
control without re-reading the whole thing against their evidence.

### 6. Humanize (non-negotiable)
Run the **humanizer** skill on the draft, using the Cover Letter Log + Voice module as
the voice sample. Light touch — break rule-of-three rhythms, kill constructed inversions,
remove em/en dashes, vary sentence length, prefer plain constructions. Don't sand off the
specificity that makes it land.

### 7. Show the draft and confirm (User Sovereignty)
Present the humanized letter in chat with the annotations. **Confirm before any file
write or Notion write.** The user edits/approves first.

### 8. Output — make it sendable
On confirm:
- **Generate an editable `.docx`** (use the docx skill) — clean business-letter
  formatting the user can tweak and **one-step export to PDF** for submission. Name it for
  the company/role and date. Write it where the user keeps applications (ask once if unknown).
- **Log to Notion:**
  - **Work Log** entry — Kind = outreach (cover letter), Effort = the application /
    Job Search effort, dated, with a one-line summary of the angle taken.
  - **Link to the Job Application Tracker row** (create the row if the JD was pasted and
    no row exists yet); update stage if appropriate.
  - **Send-reminder follow-up** — a leaf Map issue (Area = Career, Status = Next up,
    Source = Chat, due ~+1 day): "submit cover letter to [company]".
  - **Cover Letter Log** (Core Context, Category = Voice & Writing) — append the full
    letter body, company/role, the problem angle used, and the evidence anchors cited.
    Model it on how linkedin-post uses the LinkedIn Post Log: this is the voice memory
    that compounds, so future letters get faster and more consistent. Read it first on
    later runs; don't re-derive voice each time.

### 9. Hand off
Give the `.docx` path, the Notion links, and the one next action ("export to PDF and
submit"). Note that the letter, resume, and interview answers now share one story.

## Keep it cheap
The expensive part is one-time: the Bank, the Narrative, and the Cover Letter Log. Once
those exist, a tailored letter is fast. Spend the real effort on the **homework** (their
problem) and the **evidence mapping** — that's what separates a letter that gets read from
one that gets skimmed and dropped. Don't re-derive voice every run; read the log.
