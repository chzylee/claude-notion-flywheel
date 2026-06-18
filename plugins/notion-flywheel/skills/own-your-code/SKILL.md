---
name: own-your-code
description: 'Review a project and produce an "own your code" mastery guide for an engineer with senior chops filling in decision-space gaps left by AI-assisted building. For every significant technical decision it gives the why, the alternatives, the explicit decision axes, linked firsthand docs, and a study path deep enough to re-derive (and re-build) the decision yourself — so you own each project at a senior level in full, not just defend it. Triggers on "own my code for X", "study guide for X project", "interview-prep my code", "review X for interviews", "help me own/defend my code", or after pushing updates to a project you want to re-study. Re-runnable on demand and after any code change.'
---

# Own Your Code

Turn a repo into a **decision-space mastery guide**. The user already has senior
engineering chops; what they lack is immersion in specific tool landscapes because
the decisions were partially made by AI agents. The goal is not to defend the code —
it is to make the user able to **re-derive every significant decision from first
principles**, as if they had personally evaluated the full option space and chosen.
A senior knows all their options and picks accordingly; this guide reconstructs the
options the user didn't get to survey, so the choice becomes genuinely theirs.

The bar: after reading a section, the user could rebuild that decision themselves on
a blank project — name the axes that matter, place each option on them, and justify
the pick for their context — without this guide in front of them.

This is Pass 1 of a technical-depth prep flow. Own your own code before studying
anything external; it is the highest-ROI prep because it converts "I read about
this" into "I could have designed this."

## When to run

On demand for any project, and again after updates — the guide is disposable and
should be regenerated whenever the code changes. Don't keep an old guide in sync;
re-run.

## Step 1 — Locate and read the project

Resolve the project the user named:

- **Claude Code / repo on disk:** read the actual source. Prioritize entry points,
  state management, the type layer, API/data-fetching boundaries, build/deploy
  config, and any file the user flagged. Read enough to reconstruct *why*, not just
  *what*.
- **Chat with a connector:** if the project lives in GitHub or the user's Notion
  Efforts/Projects, fetch the repo and any architecture notes (CLAUDE.md, ADRs, a
  Notion effort page) to ground decisions in reality.
- **No access:** ask the user to paste the key files (state store, main types, a
  representative component, the API layer, package.json). Don't guess at unseen code.

Always prefer the codebase's own source-of-truth (CLAUDE.md, ADRs) over any older
spec — agentic builds drift from their specs, and the user must own what's *built*.

## Step 2 — Extract the significant decisions

A "significant decision" is any place where a competent engineer chose one approach
over a real alternative. Hunt across these categories (skip what doesn't apply):

- **State management** — what holds state; client-state vs server-state libraries.
- **Type design** — discriminated unions, shared type boundaries, unknown vs any,
  type guards, generics.
- **Data fetching / async** — client vs server state, caching, event-loop
  implications, parallel vs sequential, optimistic updates.
- **Rendering / performance** — re-render boundaries, memoization, keys,
  SSR/ISR/CSR, code splitting.
- **Architecture boundaries** — module/process boundaries, security boundaries
  (client- vs server-side and why), API contracts.
- **Build / deploy / infra** — bundler, hosting, CI/CD, env/secrets.
- **Library choices** — every notable dependency is a decision with alternatives.

Flag any decision whose rationale is undocumented or AI-defaulted — those are the
ones the user most needs to internalize or overturn.

## Step 3 — Produce the mastery guide

Output a guide (markdown file in chat, or a repo doc in Claude Code), one section per
significant decision. **Each section MUST contain all eight parts** — the decision
axes and the rebuild path are what separate this from a defense cheat-sheet:

1. **The decision** — what the code does, with the specific file/symbol reference so
   the user can open it.
2. **Why it works that way** — the mental model from first principles, not the API.
3. **The decision axes** — the 3-5 dimensions a senior would actually evaluate this
   class of decision on (e.g. for state: server-vs-client state, re-render
   granularity, boilerplate cost, devtools/middleware needs, team size, bundle
   size). These axes are the reusable senior skill — they let the user re-derive the
   choice for any future project.
4. **The option landscape** — the real alternatives, each placed on the axes above,
   with its honest tradeoff. Include the options the user has NOT used, since
   immersion gaps are the whole point. A compact table (option × axes) works well.
5. **Why this option wins here** — map the project's actual context onto the axes and
   show why the choice follows. This is the move an interviewer probes and the part
   AI-assisted authors can't do.
6. **Rebuild path** — what the user would study and do to implement this decision
   themselves from scratch, including the chosen tool AND enough of the top 1-2
   alternatives to have genuinely chosen between them. Concrete: "build a toy X with
   tool A, then the same with tool B, feel the difference in Y."
7. **Firsthand docs** — primary/official sources for the chosen tool and its main
   alternatives (official docs, language handbook, the library's own docs), so the
   user verifies against ground truth, not this guide. If no solid primary source
   exists, say so rather than inventing one.
8. **Would I make this call again?** — an explicit verdict: confirm the decision with
   reasons, or name what you'd reconsider now that the landscape is clear. AI
   defaults are sometimes wrong or generic; a senior catches that. This yields the
   strongest interview answer and the truest sense of ownership.

End the guide with two things:
- **A self-interview drill** — the depth questions per decision, no answers, for
  rehearsing out loud cold.
- **A rebuild checklist** — the toy-build exercises from each section's rebuild path,
  as a hands-on track for converting reading into muscle.

## Step 4 — Flag the gaps honestly

Close with a short, ranked list of the decisions where the user's immersion is
thinnest or the rationale was most AI-defaulted — where to concentrate. Honesty here
is the whole point; a guide that makes everything look already-owned defeats it.

## Notes

- Read-only on the user's code and databases. Never modifies either.
- Regenerate freely — the guide is meant to be rebuilt after changes.
- Calibrate to senior level: don't re-explain fundamentals the user clearly owns;
  spend the depth on the specific tool landscapes where AI made the call and the user
  lacks immersion (the user will often name these, e.g. "I know I needed state but
  don't know the landscape").
- Separate certainty levels: "here's what the code does" (certain) vs "here's likely
  why it was chosen" (to verify) vs "here's what I'd reconsider" (judgment). Never
  present a reconstructed rationale as confirmed history.
- The success test for any section: could the user now rebuild this decision on a
  blank project without the guide? If not, the rebuild path and axes aren't concrete
  enough.
