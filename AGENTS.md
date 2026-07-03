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
3. Inspect `_templates/` and reuse the closest template.
4. Search existing notes before creating a duplicate.

## File Placement

Use two top-level content areas:

- `Memory/`: raw captures, summaries, task logs, lightly processed history.
- `Wiki/`: refined, reusable knowledge.

Current placement:

- `Memory/Summaries/` for `history-summary` notes.
- `Wiki/Concepts/` for `concept`, `paper`, and durable topic notes.
- `Wiki/Projects/` for `project` notes.
- `Wiki/Decisions/` for `decision` notes.
- `_skills/` for AI maintenance workflows and Codex skill copies. Do not use it as an ordinary note area.

Root-level files should be limited to project documentation, home page, configuration, and AI maintenance instructions.

## Language

Use Chinese for ordinary note prose by default. Keep English technical terms in titles, aliases, paths, and wikilinks when they are the natural names, such as `Engram`, `MoE`, `MemoryWiki`, and `nanochat`.

## Note Types

- `history-summary`: a summary of one conversation or task.
- `concept`: a reusable topic or idea.
- `decision`: a durable decision and rationale.
- `paper`: notes about a paper or article.
- `project`: reusable context about a project.

`history-summary` notes are the intake layer, not the whole vault. When a pattern repeats or becomes durable, create or update a `concept`, `decision`, `paper`, or `project` note and link the raw summary to it.

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
