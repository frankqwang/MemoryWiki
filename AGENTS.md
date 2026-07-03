# AI Maintenance Guide

This vault stores durable cross-session knowledge. Any AI assistant working in this directory should follow these rules.

## Default Location

Write notes in this vault, not in a project repository:

```text
C:\Users\Administrator\Documents\MemoryWiki
```

## Before Writing

1. Read `README.md`.
2. Read `Home.md`.
3. Inspect `Indexes/` for the right topic index.
4. Inspect `_templates/` and reuse the closest template.
5. Search existing notes before creating a duplicate.

## File Placement

Keep the vault root clean. Put concrete notes under `Notes/`:

- `Notes/History/` for `history-summary` notes.
- `Notes/Concepts/` for `concept`, `paper`, and durable topic notes.
- `Notes/Projects/` for `project` notes.
- `Notes/Skills/` for `skill` notes.

Root-level files should be limited to project documentation, indexes, configuration, and AI maintenance instructions.

## Language

Use Chinese for ordinary note prose by default. Keep English technical terms in titles, aliases, paths, and wikilinks when they are the natural names, such as `Engram`, `MoE`, `MemoryWiki`, and `nanochat`.

## Note Types

- `history-summary`: a summary of one conversation or task.
- `concept`: a reusable topic or idea.
- `decision`: a durable decision and rationale.
- `paper`: notes about a paper or article.
- `project`: reusable context about a project.
- `skill`: reusable AI workflow instructions.

`history-summary` notes are the intake layer, not the whole vault. When a pattern repeats or becomes durable, create or update a `concept`, `decision`, `paper`, `project`, or `skill` note and link the raw summary to it.

## Linking

- Use Obsidian `[[WikiLinks]]`.
- Link every new note to `[[Home]]` and at least one index in `Indexes/`.
- Prefer linking to existing notes by exact filename/title.
- Dangling topic links are acceptable when they are useful future nodes.

## Git

Commit meaningful batches of changes. Do not commit Obsidian workspace state or cache files.

## Codex Skill

The note-saving skill lives at:

```text
_skills\memory-wiki\SKILL.md
```

Keep it synchronized with the installed Codex copy when changing the workflow.
