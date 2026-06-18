---
name: proposal-builder
description: Turn a pasted Upwork/Fiverr job post into a tailored, evidence-backed proposal. Triggers on "draft a proposal for this job", "proposal for this gig", "should I bid on this?". Reads the Business/Freelance effort, Core Context career modules, and Work Log evidence; scores lane fit (GO/STRETCH/SKIP), drafts a 3-line proposal + package/price + same-day delivery plan, optionally researches the client. Logs the proposal to Work Log and creates a 3-day follow-up Map issue on confirm.
---

# Proposal Builder

Turns a freelance job post into a tailored, evidence-backed proposal in minutes. Pairs with the
Upwork/Fiverr workflow inside the Business/Freelance effort: that page holds the strategy (niche,
gigs, pricing, review flywheel); this skill runs the per-job loop.

## Data source IDs
- Business/Freelance effort: 37c76356d6fe819486dff55d7a772798  (strategy, gigs, pricing)
- Efforts:      0cc8af20-2f35-4e0c-985f-67ddddd2e5b0  (Tech, Links, relations)
- Core Context: cee84109-c3b4-49b0-91f1-f6b4e7215ec5  (Category=Career, Status module)
- Work Log:     050c4600-3aeb-4d12-9af1-71bb72c0a2c5  (evidence + proposal logging)

## Steps
1. INTAKE the pasted job post (title, scope, budget, client signals). Ask for it if missing.
2. RESOLVE the Business/Freelance effort (gigs, pricing anchors) and GATHER EVIDENCE: Core Context
   Status/career modules + concrete Work Log outcomes matching the job.
3. FIT SCORE -> GO / STRETCH / SKIP with a one-line reason: tech overlap (job stack vs AWS, Lambda,
   Python, Node, TS, Terraform, CI/CD), scope vs same-day deliverability, budget vs price floor.
   Bias to SKIP off-lane or underpriced work to protect proposal volume.
4. RESEARCH (optional, web_search): client history, red flags (vague scope, lowball). Skip silently if early/low-budget.
5. DRAFT the proposal (3 lines, no fluff): (1) proof you've done exactly this, citing a logged
   outcome; (2) concrete fast approach; (3) one sharp scoping question. Add a recommended package +
   price (under market until 3-5 reviews are banked, then raise) and a same-day delivery plan.
6. WRITE BACK (on confirm): Work Log entry (Effort=Business/Freelance, Kind=outreach: job title,
   platform, price quoted, date) and a "follow up in 3 days" Map issue (leaf under Business/Freelance, Status = Next up, Due = +3 days, Source = Chat).

## Key rules
- Cite only real logged outcomes; never fabricate client-facing claims.
- Default SKIP over STRETCH - reliability comes from volume of on-lane proposals.
- Pricing comes from the effort's pricing section; honor the review-building discount.
- Log every proposal so the funnel stays measurable (proposals -> replies -> wins).
