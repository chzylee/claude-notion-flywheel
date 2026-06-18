---
name: interview-prep
description: 'Build a round-appropriate interview prep pack for a specific company and role. Loads the persistent Story & Answer Bank (Core Context, Category=Career), the application row, and real Work Log evidence; scans Projects-pillar efforts for JD alignment and generates a per-repo Claude Code study-guide prompt; produces fit map, STAR stories, likely questions, and honest gaps; captures the debrief back to the Bank after. Trigger on "prep for [company]", "prep me for the interview", "study guide for [company]", "study sheet for an application", any mention of an upcoming screen/HM call/onsite, or post-interview "log how it went".'
---

# Interview Prep

Round-aware prep that reuses a persistent Story & Answer Bank and pairs a narrative
layer (Notion) with a technical layer (per-repo Claude Code study guides). Read-mostly;
writes prep issues (Map rows) and appends the pack to the application row on confirm.

## Data source IDs
- Job Application Tracker: database inside the Job Search 2026 effort page
  (fetch effort 37c76356d6fe815f8c96cdd6ace223c0 to resolve it)
- Core Context: cee84109-c3b4-49b0-91f1-f6b4e7215ec5  (Category=Career: Story & Answer Bank, Status/resume modules)
- Efforts:      0cc8af20-2f35-4e0c-985f-67ddddd2e5b0  (Pillar="Projects" for the alignment scan; Tech, Links)
- Work Log:     050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (evidence via Effort relations)

## Step 0 — Identify the round. This decides everything.
Read or ask WHO is interviewing and what round it is. Never default to deep technical study.
- **Recruiter screen** → canonical answers + narrative spine + light company research + 2-3 questions. No system design.
- **Hiring manager** → story selection + role mapping + related-project bridges + deeper research.
- **Technical / panel** → PRIMARY EMPHASIS: project deep-dives, related-tech map, likely technical questions for this stack. Technical depth is where prep effort goes.
- **Final / onsite** → full review + per-interviewer notes.
If round unknown, ask one question first.

## Persistent assets — live in Notion, never local, never rebuilt
Load the **Story & Answer Bank** (Core Context, Category=Career). Tune emphasis per role;
update it after every interview; create nothing duplicative. Hard rule: every story must
be fully true and survive 5 minutes of probing.

## Procedure
1. RESOLVE the application row in the Job Application Tracker (role, stage, notes, JD link).
2. GATHER EVIDENCE: Story & Answer Bank + Status/resume modules (Core Context); the efforts
   most relevant to the role, pulling concrete decisions/outcomes from the Work Log (STAR format).
3. PROJECT ALIGNMENT SCAN: query Efforts where Pillar="Projects". Score each against the JD —
   Tech multi-select overlap with the role's stack, plus requirement keywords vs the Resync body /
   Work Log. Rank; keep the top 2-4 with a one-line "why it maps". Thin log coverage does not
   disqualify — the repo stage (step 5) covers what the log can't.
4. RESEARCH (web_search, optional): company news, product, eng blog, interview-format signals.
   Skip silently if not requested and the stage is early.
5. GENERATE CLAUDE CODE STUDY-GUIDE PROMPTS — one per aligned project. Fill the template below
   with project name, repo hint (from Links), the role + JD requirements it maps to, and the stage.
   Emit each as a separate fenced block labeled with the project and where to run it.
6. BUILD THE PREP PACK:
   - Fit map: each JD requirement → strongest logged evidence.
   - Aligned projects: the ranked list with reasons.
   - 3-5 STAR stories from the Bank / real efforts (cite effort + date).
   - Related projects & tech map: (a) adjacent things built, each with a one-line bridge; (b) their
     stack you haven't used → nearest thing you have + key difference + a 30-min study target.
   - Likely questions (8-12 for this round) + your questions for them.
   - Gaps: weak-evidence requirements + how to frame them honestly.
7. REHEARSE: answer out loud; Claude plays skeptical interviewer and probes the stories.
8. WRITE BACK (on confirm): prep issues — leaf Map rows under Job Search 2026 (e.g. "run study-guide prompt in <repo>", "rehearse scaling
   story"), Status = Next up; append the dated pack to the application row's page body.

## Post-interview capture (mandatory — the compounding step)
Prompt for: what they asked, what landed, what stumbled, comp/process learned. Then append the
debrief to the company folder, update the Story & Answer Bank where anything stumbled, update the
Job Application Tracker with stage + follow-up date, and log to the Work Log.

## Claude Code study-guide prompt template
The skill fills the `<...>` slots and emits one block per aligned project:
```
You are building a TECHNICAL INTERVIEW STUDY GUIDE for me from this repository.
Read-only: do NOT modify files, do NOT write to Notion, do NOT call MCP tools.
Output a single markdown document.

CONTEXT
- Project: <project name>
- I am interviewing at: <company> for <role>, stage: <stage>
- The role emphasizes: <JD requirements this project maps to>
- I built this project; the guide prepares me to discuss it with technical depth.

STEP 1 — UNDERSTAND THE REPO
Read CLAUDE.md, README, docs/, ADRs, specs; then the code structure, entry points,
data flow, infra (CI, Dockerfiles, IaC). Use git log for the evolution story.

STEP 2 — PRODUCE THE GUIDE:
1. 60-SECOND PITCH — what it is, for whom, the architecture in one breath.
2. ARCHITECTURE WALKTHROUGH — components, data flow, boundaries; note WHERE each lives.
3. DECISION DEFENSE — the 5-8 most interview-worthy decisions: choice, alternatives,
   tradeoff, and how to defend under pushback.
4. REQUIREMENT MAPPING — for each role emphasis: where the repo demonstrates it.
5. DRILL Q&A — 10-15 likely technical questions, each with a strong code-grounded answer.
6. WEAK SPOTS — what's underbuilt/hacky and how to discuss it honestly.
7. REHEARSAL LIST — the 3 things to practice out loud.

RULES
- Ground everything in the actual repo — real file paths and names. Never invent.
- Flag docs that contradict the code so I'm not blindsided by my own stale README.
```

## Hard rules
- Round-appropriate or it's wasted effort. One round per run.
- Truth constraint on every claimable line; gaps flagged, never papered over.
- Persistent assets load + update in Notion, never recreated.
- Study-guide prompts are read-only in the repo and grounded in actual code.
- Re-runs append dated sections; never replace earlier prep.
