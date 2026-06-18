---
name: spec-pusher
description: Re-derive local spec files from Notion when a Core Context module changes. Triggers on "push my specs", "sync CLAUDE.md from Notion", or after editing a Core Context module. Runs in Claude Code; reads Core Context modules + their Target property and regenerates Personal/project CLAUDE.md files, project specs, and resume/site fragments - showing a per-file diff and flagging hand-edits before writing. Writes local files only, never Notion.
---

# Spec Pusher

Keeps spec derivatives in sync with Notion as the source of truth. Core Context is canonical;
local CLAUDE.md files, specs, and resume/site fragments are derived. This pushes changes outward.
Runs in Claude Code (needs filesystem access); never writes to Notion.

## Data source IDs
- Core Context: cee84109-c3b4-49b0-91f1-f6b4e7215ec5  (modules + the "Target" property naming each derivative)

## Steps
1. SCOPE. Default: all Core Context modules with a non-empty Target and Status=Active. If invoked
   right after editing one module, scope to that module (and anything that lists it as a source).
2. RESOLVE TARGETS. For each in-scope module, read its Target property to get the derivative paths:
   Personal CLAUDE.md, project CLAUDE.md files, project specs, resume/site fragments.
3. RE-DERIVE. For each target, regenerate the derived content from the current module body, applying
   the target's format (a project CLAUDE.md is terser than a spec; a resume fragment is prose).
4. DIFF. For each target file, show a per-file diff (current on disk vs newly derived). No diff -> skip.
5. CONFLICT CHECK. If a target was hand-edited after its last derivation (content diverges in ways the
   module doesn't explain), FLAG it as a conflict and do not overwrite - present both versions and ask.
   This is the architecture-drift early warning in reverse.
6. WRITE (on confirm, per file). Write approved derivatives to disk. Skip flagged conflicts unless the
   user resolves them explicitly.
7. REPORT. List files written, files skipped (no change), and conflicts left for manual resolution.

## Key rules
- Notion is the source of truth; this is a one-way push outward. Never write back to Notion.
- Never silently overwrite a hand-edited derivative - conflicts are surfaced, not clobbered.
- Show diffs before writing; the user confirms per file.
