# Notion Flywheel Skills

Noah's Notion Flywheel skill suite (29 skills) packaged as a Claude Code plugin **and** a
drop-in skills folder. One repo, two install routes.

This repo is the **source of truth** for the skills recorded in the Notion 🛠 Skill
Index. Edit SKILL.md files here, then run `sync-skill-index` to push the changes to
Notion (see [Sync with Notion](#sync-with-notion)).

## What's here

```
claude-notion-flywheel/
├── .claude-plugin/
│   └── marketplace.json          # marketplace catalog (one plugin)
└── plugins/
    └── notion-flywheel/
        ├── .claude-plugin/
        │   └── plugin.json       # plugin manifest
        └── skills/
            ├── capture-router/SKILL.md
            ├── chat-debrief/SKILL.md
            ├── sync-skill-index/SKILL.md   # keeps Notion 🛠 Skill Index in sync
            └── ... (29 skills total)
```

Skills auto-load from `plugins/notion-flywheel/skills/` — each `<name>/SKILL.md` is one skill.

## Install — Route A: plugin marketplace (versioned, push-to-update)

Push this repo to GitHub, then in Claude Code:

```
/plugin marketplace add <your-github-user>/claude-notion-flywheel
/plugin install notion-flywheel@noah-notion-flywheel
```

Installing the one plugin installs all 29 skills at once. Add the marketplace with the
`owner/repo` form (git), **not** a raw URL to marketplace.json — the `./plugins/...`
relative source only resolves for git-added marketplaces.

After future edits: `git push`, then `/plugin marketplace update` and reinstall.
`plugin.json` deliberately omits `version`, so **every commit counts as a new version** —
no version bumping needed. (Add a `version` field if you ever want to pin releases.)

## Install — Route B: drop into your skills dir (Code + Desktop)

`~/.claude/skills/` is shared between Claude Code and Claude Desktop, so:

```
cp -r plugins/notion-flywheel/skills/* ~/.claude/skills/      # personal, all projects
# or, project-scoped (committed with a repo):
cp -r plugins/notion-flywheel/skills/* /path/to/repo/.claude/skills/
```

Each skill must end up as `~/.claude/skills/<name>/SKILL.md` (not double-nested).
Claude Code picks up changes live; restart a session if a skill doesn't appear.

> claude.ai (web) and the API don't read this folder — they take zip uploads / API
> uploads respectively. This repo targets Claude Code + Desktop.

## Validate before pushing

```
claude plugin validate .
```

## Sync with Notion

The skills here are mirrored in the Notion **🛠 Skill Index** database (the canonical
home for skill docs — the old Skill Library page is retired). The repo is the source
of truth; Notion is the catalog/index.

Two skills keep them in sync:

| Skill | Scope | Use when |
|---|---|---|
| `skill-forge` | **one** skill | Creating a brand-new skill — writes the SKILL.md *and* its Index row in one go. |
| `sync-skill-index` | the **whole** folder | After editing/renaming/removing several skills — reconciles every SKILL.md against the Index in one pass. |

`sync-skill-index` enumerates every `<name>/SKILL.md`, then **creates** missing Index
rows, **updates** changed ones, and proposes **retiring** rows whose skill no longer
exists — always showing the full plan and writing only after you confirm. It's
idempotent (re-run with no changes → nothing written) and resolves both the skills
folder (relative to itself) and the Notion target (by searching for "🛠 Skill Index"
by name) dynamically, so it survives a directory rename. Invoke it with "sync the
skill index" / "sync my skills to Notion".

## Renaming the plugin

The directory name `notion-flywheel` is **not** baked into any skill — skills resolve
paths relative to themselves and resolve Notion targets by name. Renaming only touches
config + docs. The one-command path:

```
bash scripts/rename-plugin.sh <new-name>      # e.g. bash scripts/rename-plugin.sh my-brain
```

That renames `plugins/notion-flywheel/` → `plugins/<new-name>/` and rewrites the plugin
`name` + `source` in `.claude-plugin/marketplace.json`, the `name` in
`plugins/<new-name>/.claude-plugin/plugin.json`, and the path references in this README.

Doing it by hand instead? Update exactly these, then `claude plugin validate .`:

1. **Rename the directory** — `plugins/notion-flywheel/` → `plugins/<new-name>/` (use
   `git mv` to keep history).
2. **`.claude-plugin/marketplace.json`** — set the plugin entry's `source` to
   `./plugins/<new-name>` and its `name` to `<new-name>`.
3. **`plugins/<new-name>/.claude-plugin/plugin.json`** — set `name` to `<new-name>`.
4. **README.md** — update the `plugins/notion-flywheel/...` path references.

Notes:
- The plugin `name` is the install identity, so the command users run becomes
  `/plugin install <new-name>@noah-notion-flywheel`. Already-installed copies must
  reinstall under the new name.
- The marketplace catalog `name` (`noah-notion-flywheel`) is **separate** from the
  directory and left untouched by the script — rename it by hand only if you also
  want a new marketplace id.
- Nothing in Notion changes: the Skill Index keys on each skill's `name`, not the
  directory.

## Migration status — complete

This suite uses **Map issue rows** (JIRA-style epic → feature → issue); the standalone
Todos database is retired. See `MIGRATION.md` for the per-skill record.
