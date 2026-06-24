---
name: queue-job
description: 'Add one job to Noah''s apply queue, fully prepped so he can just review and submit. Triggers on "queue this job", "add this job to my queue", "add to apply queue", "prep this job to apply", or pasting a job-board URL or JD with intent to apply. Scores the role via career-ops A–G, generates the tailored ATS résumé PDF, then gives an explicit cover-letter verdict — write or skip, with the reason — from a reader / form-field / narrative-edge / 1–2-cap rubric (delegating the actual writing to the cover-letter skill). Upserts the Notion Job Application Tracker row (Queue-flagged, deduped by company+role), appends paste-ready apply answers and recruiter + hiring-manager DM drafts to the Job Application Queue page, and outputs one ready-to-submit checklist. Never submits or sends — preps to ready; Noah clicks Submit.'
user_invocable: true
user-invocable: true
license: MIT
---

# queue-job — line up one application, ready to submit

Takes a single job from a link (or JD, or an already-scored slug) to fully-prepped-and-queued, so Noah sits down to nothing but review → click. It's the single-role companion to **job-hunt** (which runs the whole batch loop): `job-hunt` (batch) → **queue-job** (one role, lined up) → **cover-letter** / **interview-prep**.

The one job here is to remove every micro-decision between "this looks worth applying to" and "submitted" — including the decision Noah keeps stalling on: *do I write a cover letter for this one?* This skill answers that explicitly, with a reason.

**Source of truth (read, never invent):** `cv.md`, `config/profile.yml`, `modes/_profile.md` (incl. `## Writing Style` — apply to all candidate-facing text) in the career-ops repo. Comp floor $135K, target $140–155K, US-authorized / no sponsorship. **Resolve Notion targets by name-search** (the 💼 Job Application Tracker, its `▶ Apply queue (this round)` view, and the Job Application Queue page); IDs are cached in the agent memory file `notion-job-tracker.md` — don't hardcode them here. Plan limits: cannot SQL-query or delete rows over MCP — enumerate by searching scoped to the data source, dedupe by company+role.

Each step is a checkpoint. **Never submit an application or send a message — that's always Noah.**

---

## Step 1 — Intake

Accept one of:
- a **company-board URL** (Greenhouse / Ashby / Lever / Workday / careers page),
- **pasted JD text**, or
- an **existing report slug** (already scored — skip to Step 4).

If given a **LinkedIn job link**, stop and ask Noah for the external board URL (open it → Apply on company site). The pipeline can't score a `linkedin.com/jobs/view/...` link. If a board link won't load, paste the JD to `jds/<company>-<role>.md` and reference `local:jds/<file>.md`.

## Step 2 — Liveness + score

Liveness-check first (verify "dead" verdicts against the full board API — `https://boards-api.greenhouse.io/v1/boards/<org>/jobs/<id>` or `https://api.ashbyhq.com/posting-api/job-board/<org>` — the WebFetch summarizer truncates and produces false deads). Then run the career-ops A–G evaluation (`modes/oferta.md` / auto-pipeline): write the report to `reports/`, mirror a row into `data/applications.md`. Read `cv.md` for every metric — never fabricate.

**Keep ≥ 3.5.** Apply at **≥ 4.0**; for **3.5–3.9**, surface the score and ask Noah for a specific reason before continuing. Below 3.5, recommend skipping.

## Step 3 — Tailored PDF

Generate the ATS-optimized résumé (`modes/pdf.md` → `node generate-pdf.mjs <html> output/cv-noah-lee-<company>-<slug>-<date>.pdf --format=letter`). Inject only JD vocabulary Noah genuinely has; reorder bullets and pick the top projects by relevance. **Target 2 pages** — if it runs to 3, condense the oldest roles and trim a project, then regenerate.

## Step 4 — Cover-letter verdict (the core add)

Decide **WRITE** or **SKIP**, and state the one-line reason. Run the four tests:

1. **Reader** — will a human actually read it? Small / engineering-led / founder-read company → yes. Large high-volume ATS funnel or a rigorous big-lab loop → no.
2. **Field** — does the form have a real cover field or a substantive "why" prompt? No field → skip (short answer only).
3. **Narrative edge** — does Noah's strongest angle for *this* role need prose to land (live-events-operator story, the security-philosophy / 16K-CVE framing, a career-pivot) versus being self-evident from the résumé bullets?
4. **Budget cap** — is Noah already holding **2 deep covers in flight this round**? The strategy doc caps tailored letters at 1–2 at a time. If at the cap, default to SKIP even on a strong role.

**Verdict = WRITE** only if Reader = yes **and** Field = substantive **and** Narrative-edge = high **and** under the cap. Otherwise **SKIP** and produce a 2–3 sentence "why [company]" answer for the form's short field instead.

**Always pair the application with a direct DM regardless of the cover verdict** — the strategy weights human outreach above applications; the DM, not the cover, carries the narrative in the high-volume cases.

If **WRITE**: hand off to the **cover-letter** skill (it loads the Story & Answer Bank + Narrative, builds the problem-obsession argument, humanizes, and outputs an editable file). Don't draft the letter inline — queue-job owns the *decision*, cover-letter owns the *writing*.

*Calibration examples (current round): WorkOS, Render → WRITE (small, eng-read, strong narrative). Gametime → optional (operator angle is narrative, but third priority). SeatGeek, Anthropic → SKIP, short "why" only (high-volume / rigorous-loop; spend the energy on the DM and loop prep).*

## Step 5 — Upsert the tracker row

In the 💼 Job Application Tracker (resolve by name), **dedupe by company + role** — search the data source first; update the existing row, never create a duplicate. One row with: `Company` · `Role title` · `Score` · `Priority` · `Status = Evaluated` · `Job URL` · `Notes`, plus the checkboxes `Queue`, `Applied?`, `Cover letter?`, `Message sent?`. Set **`Queue` = checked** if this role is part of the current round (so it shows in the `▶ Apply queue (this round)` view). Note the cover verdict and any flags in `Notes`. Keep `data/applications.md` as the offline mirror.

## Step 6 — Append the paste-ready block to the queue page

On the **Job Application Queue** page, add the role's block:
- **Apply:** the board URL
- **PDF:** the `output/...` path
- **Cover:** the Step 4 verdict (write + file, or skip + the short "why" answer)
All candidate-facing text here uses the **Problem-Obsession framework** (`modes/_profile.md` → Outreach & Messaging Framework): engage their problem as if already on the team → show how you'd contribute (real proof, pointed forward) → think alongside them (curious, not critique). The goal is a genuine peer conversation, not a pitch — don't sell; start an interesting talk and let it flow (most important at startups/Anthropic). Truthful, no invented skills; voice per `## Writing Style`.
- **Paste-ready answers:** why-this-role / why-company / relevant-experience / good-fit. Lead "why this role" with their problem, not Noah's credential. For high-volume form boxes, give a **compressed** version and route the full one to the DM.
- **DM drafts:** a recruiter and a hiring-manager message (≤300 chars, no phone number) — the **full** problem-obsession version (this is where it earns the interview). Find the real contact names via Exa (`category:people`); **flag any unverified guess and never fabricate a name** — leave `[find on LinkedIn]` if unsure.

## Step 7 — Emit the ready-to-submit checklist

Output a single block Noah can act on top-to-bottom:
- Apply link · PDF to upload · cover (yes + file / no) · paste-ready answers · the two DM drafts
- **On-screen flags to confirm:** target level, comp band (ask theirs first), and any form gimmick (e.g. a required keyword/tool name).
- Reminder: **Noah clicks Submit and sends the DMs.** After he acts, he ticks `Applied?` / `Cover letter?` / `Message sent?` in the tracker (or tells the skill, which flips `Status` and stamps `Date applied` / `Date messaged`).

---

**Scale to intent.** "Queue this one" → run all steps for that role. "Queue these three" → loop, honoring the 1–2 cover cap across the set. Always end by telling Noah exactly what's ready (row added, queue block appended, checklist printed) and what needs his hand (apply click, DMs, any flagged level/comp pre-screen). A role that scores <3.5, or whose posting is dead, stops with a one-line reason instead of being queued.
