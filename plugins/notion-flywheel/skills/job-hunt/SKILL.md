---
name: job-hunt
description: Noah's end-to-end job-search loop built on career-ops — collect, score, flag master-résumé updates, prep + open tabs to vet, track in Notion, queue morning outreach, convert. Use when Noah says "run the hunt", "job hunt", "daily job loop", "run my job search", or wants to take a batch of jobs from inbox to applied.
user_invocable: true
user-invocable: true
license: MIT
---

# job-hunt — Noah's career-ops loop

Orchestrates the full pipeline the way Noah runs it. Each step is a checkpoint — confirm before moving on; never submit applications or send messages (that's always Noah).

Source of truth for personalization: `cv.md`, `config/profile.yml`, `modes/_profile.md` (includes `## Writing Style` — apply it to all candidate-facing text). Notion tracker IDs live in the agent's memory file `notion-job-tracker.md`.

---

## Step 1 — Collect (two sources, one inbox)

- **LinkedIn (manual):** add each job worth scoring to `## Pendientes` in `data/pipeline.md` as `- [ ] <url> | Company | Role`. If a LinkedIn URL won't load, paste the JD to `jds/<company>-<role>.md` and reference `local:jds/<file>.md | Company | Role`.
- **Scanner:** `node scan.mjs --verify` (Greenhouse/Ashby/Lever APIs, zero tokens).

## Step 2 — Score everything

Run `/career-ops pipeline`. For each unchecked line: liveness-check → full A–G eval → report in `reports/` → row in `data/applications.md`.

**Liveness caveat:** verify "dead" verdicts against the *full* board API (`https://api.ashbyhq.com/posting-api/job-board/<org>`, or `https://boards-api.greenhouse.io/v1/boards/<org>/jobs/<id>`). The WebFetch summarizer truncates long lists and has produced false "dead" verdicts.

## Step 3 — Flag master-résumé updates (do this BEFORE tailoring)

The master (`cv.md`) is what compounds — a randomized trial found AI résumé help lifts hires ~7.8% only when it *edits human-written prose*, not when it generates from scratch. So before spending effort on per-role tailoring, check whether the batch is telling you to improve the master itself.

After scoring, scan the **top-fit reports (≥ 4.0, and any ≥ 4.3 standout)** and flag:

1. **Recurring requirements** — a keyword/skill that shows up across ≥ 3 high-fit JDs but is under-emphasized in `cv.md` *and that Noah genuinely has* → fold it into the master (better framing, surface it higher). Example: if four roles foreground "event-driven systems" and the master buries Kafka, lift it.
2. **Standout-fit roles (≥ 4.3 or a dream company)** — worth hand-tuning the master's summary/lead bullets toward, because this is a role you'll really push on.
3. **Genuine gaps worth a real upskill** (not a résumé tweak) — e.g. production Go recurring as a hard gate. Name it as a learning investment, not something to fake.

**Output a short "Master-résumé feedback" list** and ask Noah whether to update `cv.md` now. Only after the master reflects what these strong roles need does per-role tailoring pay off. Update `cv.md` directly when he approves; re-tailor downstream from the improved master.

## Step 4 — Prep the winners (vet before applying)

For each keeper (apply at ≥ 4.0; 3.5–3.9 only with a specific reason):
- `/career-ops pdf` — tailored ATS CV → `output/cv-noah-lee-<company>-<slug>.pdf`
- `/career-ops apply` — fills the form + drafts answers, **stops before Submit**. (With the Playwright MCP connected, it can fill a live browser; without it, it produces paste-ready answers.)
- **Open the tabs:** launch every winner's job URL in Noah's default browser (`Start-Process <url>`) so he eyeballs each posting + form before applying. Nothing is ever submitted automatically.

## Step 5 — Track in Notion

Populate the **💼 Job Application Tracker** (Career → Job Search 2026; data source `34476356-d6fe-8188-bf82-000bec1092e3`) via `notion-create-pages`. One row per winner: `Company · Role title · Score · Priority · Status=Evaluated · Job URL · LinkedIn contact · Notes`. When Noah applies, flip `Status`→Applied + set `Date applied`. Local `data/applications.md` is the offline mirror.

## Step 6 — Queue outreach for the morning

Output a contacto doc (recruiter + hiring-manager message per role, ≤300 chars, in Noah's voice per `## Writing Style`, no phone number). Write it as a checkbox page under the Notion **Job Search** hub so it's ready to send in bulk.

**Best send window (verified):** Tuesday–Thursday, 8–11 AM in the *recipient's* local time (sweet spot ~10–11 AM). Weekends/Mondays lag. Personalize one line per message (+15–40% reply rate).

## Step 7 — Message + check off

Noah sends each message in the morning, then checks **Message sent?** and sets **Date messaged** in the tracker (Status → Messaged). This is the one manual record-keeping step.

## Step 8 — Convert

When a reply lands, move the row (Response received / Phone screening / Interview booked), then `/career-ops deep` (company research) and `/career-ops interview-prep` (STAR stories + likely questions). Comp: ask their band first; if pressed, "$140–155K depending on total package"; never open with the floor.

---

**Scale to intent.** "Run the hunt on these 5 URLs" → just those. "Process my inbox" → everything pending. Always end a run by telling Noah exactly what's ready for his review (tabs open, tracker rows added, outreach queued) and what needs his hand (apply clicks, messages, any flagged master-résumé updates).
