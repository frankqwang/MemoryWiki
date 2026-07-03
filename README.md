# HistorySummary

This directory is a portable, Obsidian-compatible knowledge vault for durable AI conversation notes, task summaries, decisions, and reusable project context.

It is intentionally stored under `Documents` instead of a single tool's private config directory so Codex, other AI assistants, Obsidian, editors, and git can all work with the same notes.

## How To Use

Open this folder as an Obsidian vault:

```text
C:\Users\Administrator\Documents\HistorySummary
```

Start from:

- [[00_Index]]

## Note Format

Use plain Markdown with YAML frontmatter and Obsidian wikilinks.

Recommended frontmatter:

```markdown
---
title: Human-readable title
created: YYYY-MM-DD
type: history-summary
tags:
  - codex/history
  - topic/example
aliases:
  - Optional alternate title
related:
  - "[[00_Index]]"
---
```

Recommended sections:

- User goal or original request
- What was done
- Key findings, decisions, and rationale
- Files, commands, URLs, or artifacts created
- Related notes with `[[WikiLinks]]`
- Open questions or follow-ups

## Linking Rules

- Link related notes and topics with `[[WikiLinks]]`.
- Update [[00_Index]] when adding important notes.
- It is acceptable to create dangling topic links; they can become concept notes later.
- Keep filenames stable and ASCII-friendly. Put human-readable names in frontmatter `title` and `aliases`.

## Skill For AI Assistants

The reusable Codex skill is included here:

```text
_skills\save-history-summary\SKILL.md
```

If another AI assistant opens this folder, it should read that file before creating or updating history notes. The installed Codex copy currently lives at:

```text
C:\Users\Administrator\.codex\skills\save-history-summary\SKILL.md
```

Both copies should be kept in sync when the note-taking workflow changes.

## Git

This vault is intended to be versioned with git. Commit meaningful batches of note changes so the knowledge base has a useful history.
