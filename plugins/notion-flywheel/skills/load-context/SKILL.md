---
name: load-context
description: Load Core Context modules as background for a chat, or initialize a repo from stored specs. Fetch matching Core Context rows and read their page bodies. For a chat, load as background and confirm in one line. For Claude Code project init, feed the General Platform Spec + Design Standard (+ relevant Stack/App spec) and scaffold the repo. Use on "load my context", "load my [category] context", "init this project with my [category] specs", or "set up with my standards".
---

# Load Context / Init from specs

Source: core_context_ds cee84109-c3b4-49b0-91f1-f6b4e7215ec5.

## Procedure

1. SCOPE: a category, a named module, or default to Status.
2. FETCH matching Core Context rows; read their page bodies.
3. FOR A CHAT: load as background; confirm in one line what you loaded.
4. FOR PROJECT INIT (Claude Code): feed General Platform Spec + Design Standard
   (+ relevant Stack/App spec) to Claude Code, which scaffolds the repo per
   spec-general.md (CLAUDE.md, docs/, .platform/, ADRs, Makefile, etc.).

## Persistent memory mapping

- Status module        -> ~/.claude/CLAUDE.md (personal, global)
- Coding Standards      -> fed on init; spec-general.md generates the project
                          CLAUDE.md and scaffold
Notion is the single source of truth; every CLAUDE.md copy is derived. Edit the
module, then re-push the derivatives.
