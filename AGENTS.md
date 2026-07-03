# AI Maintenance Guide

This vault stores durable cross-session knowledge. Any AI assistant working in this directory should follow these rules.

## Default Location

Write notes in this vault, not in a project repository:

```text
C:\Users\Administrator\Documents\MemoryWiki
```

## Before Writing

1. Read `README.md`.
2. Read `00_Index.md`.
3. Inspect `01_MOCs/` for the right topic index.
4. Inspect `_templates/` and reuse the closest template.
5. Search existing notes before creating a duplicate.

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
- Link every new note to `[[00_Index]]` and at least one MOC in `01_MOCs/`.
- Prefer linking to existing notes by exact filename/title.
- Dangling topic links are acceptable when they are useful future nodes.

## Git

Commit meaningful batches of changes. Do not commit Obsidian workspace state or cache files.

## Codex Skill

The note-saving skill lives at:

```text
_skills\save-history-summary\SKILL.md
```

Keep it synchronized with the installed Codex copy when changing the workflow.
