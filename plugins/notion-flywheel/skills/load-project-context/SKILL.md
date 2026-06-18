---
name: load-project-context
description: 'Find and load a Notion project brief to instantly gain context about any project. Searches the Projects database by name, reads the project page body and any linked Core Context modules, then loads everything as background for the chat. Use when the user names a project they want you to understand — on "load project context for X", "get context on X", "what''s the brief for X", "pull up X project", "load X project", or any opening message that names a project without further context.'
---

# Load Project Context

Pull a project's brief out of the Second Brain so the rest of the chat has full
context without the user re-explaining anything. Read-only: this skill loads
background, it never writes.

Canonical Second Brain data source IDs (fallback if search needs them):
  projects_ds      74eb6f32-87f9-40d5-807a-9f0d9eadb733
  core_context_ds  cee84109-c3b4-49b0-91f1-f6b4e7215ec5

## Procedure

1. RESOLVE THE NAME. Take the project name from the user's message (the X in
   "load project context for X", "pull up X", etc.). If the opening message just
   names something with no other ask, treat that as the project to load.

2. SEARCH projects_ds for a row whose Name matches. Prefer an exact Name match;
   if none, take the closest single fuzzy match. If several plausibly match,
   list the candidates and ask which one rather than guessing.

3. NO MATCH → don't invent context. Tell the user no project by that name exists
   in Projects, and suggest running `/ingest-project-brief` to create it (paste a
   "=== NOTION BRIEF v1 ===" block). Stop there.

4. MATCH → FETCH the project page and read its full body (description, links,
   any live/deploy URL on the first line, hand-added sections).

5. LINKED CORE CONTEXT. Follow any relation from the project row into
   core_context_ds, plus any Core Context modules referenced by name in the page
   body. Read each linked module's page body. Skip modules that don't resolve;
   don't fetch the whole Core Context database.

6. LOAD AS BACKGROUND. Hold the page body and module bodies as context for the
   rest of the conversation. Do not dump it back to the user.

7. CONFIRM IN ONE LINE. State what you loaded — the project name and the count /
   names of Core Context modules — e.g. "Loaded **Acme Portal** + 2 Core Context
   modules (General Platform Spec, Design Standard). Ready." Then wait for the
   user's real ask.

## Notes

- Read-only. Never create or edit Projects, Core Context, Map, or Work Log rows
  from this skill — loading context is not logging work.
- One project per invocation. If the user names two, load the first and ask before
  loading the second.
- If the project page is sparse (no body, no linked modules), say so plainly in the
  one-line confirm so the user knows context is thin.
