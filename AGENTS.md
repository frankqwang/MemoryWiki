# AI Maintenance Guide

This vault stores durable cross-session knowledge. Any AI assistant working in this directory should follow these rules.

## Default Location

Write notes to the MemoryWiki vault chosen by the user, not to the current project repository.

Default portable location:

```text
~/Documents/MemoryWiki
```

On this machine, that currently resolves to:

```text
C:\Users\Administrator\Documents\MemoryWiki
```

If the user explicitly provides a different MemoryWiki path, use that path and keep the same structure.

## Before Writing

1. Read `README.md`.
2. Read `Home.md`.
3. Inspect `_skills/memory-wiki/templates/` and reuse the closest template.
4. Search existing notes before creating a duplicate.

## File Placement

Use three top-level content areas:

- `Memory/`: raw captures, summaries, task logs, lightly processed history.
- `Notes/`: user-maintained manual notes, drafts, observations, and material waiting to be refined.
- `Wiki/`: refined, reusable knowledge.

Current placement:

- `Memory/Summaries/` for `history-summary` notes.
- `Notes/` for `note` files written or explicitly requested by the user.
- `Wiki/Concepts/` for `concept`, `paper`, and durable topic notes.
- `Wiki/Projects/` for `project` notes.
- `_skills/` for AI maintenance workflows, templates, and Codex skill copies. Do not use it as an ordinary note area.

Root-level files should be limited to project documentation, home page, configuration, and AI maintenance instructions.

## Language

Use Chinese for ordinary note prose by default. Keep English technical terms in titles, aliases, paths, and wikilinks when they are the natural names, such as `Engram`, `MoE`, `MemoryWiki`, and `nanochat`.

## Note Types

- `history-summary`: a summary of one conversation or task.
- `note`: a user-maintained manual note.
- `concept`: a reusable topic or idea.
- `paper`: notes about a paper or article.
- `project`: reusable context about a project.

`history-summary` notes are the intake layer, not the whole vault. `note` files are the user's manual writing area; preserve the user's wording unless asked to rewrite. When a pattern repeats or becomes durable, create or update a `concept`, `paper`, or `project` note and link the raw summary or manual note to it.

## Linking

- Use Obsidian `[[WikiLinks]]`.
- Link every new note to `[[Home]]`.
- Prefer linking to existing notes by exact filename/title.
- Dangling topic links are acceptable when they are useful future nodes.

## Git

Commit meaningful batches of changes. Do not commit Obsidian workspace state or cache files.

## Codex Skill

The note-maintenance skill lives at:

```text
_skills\memory-wiki\SKILL.md
```

Keep it synchronized with the installed Codex copy when changing the workflow.

### Syncing Skill Copies

The vault copy of the skill at `_skills/memory-wiki/` is the canonical version. When you modify `SKILL.md` or the templates, sync the changes to installed agent directories.

Run the sync script manually:

```bash
bash _skills/memory-wiki/sync.sh
```

Or install the post-commit hook so skill changes are auto-synced after each commit:

```bash
cp _skills/memory-wiki/hooks/post-commit .git/hooks/post-commit
chmod +x .git/hooks/post-commit
```

The hook checks whether the latest commit touched `_skills/memory-wiki/` and, if so, runs `sync.sh` to update the Codex and kimi-code copies.

> Note: `.git/hooks/` is not tracked by Git. Each fresh clone must reinstall the hook from `scripts/hooks/post-commit`.
