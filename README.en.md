# MemoryWiki

[中文](README.md)

MemoryWiki is a portable, Obsidian-compatible personal memory wiki for durable AI conversation notes, task summaries, decisions, concepts, paper notes, skills, and reusable project context.

It intentionally lives under `Documents` instead of a single tool's private config directory, so Codex, other AI assistants, Obsidian, editors, and Git can all work with the same notes.

## How To Use

Open this folder as an Obsidian vault:

```text
C:\Users\Administrator\Documents\MemoryWiki
```

Start from:

- [[00_Index]]

## Note Types

`history-summary` is the raw intake layer: one conversation or task summarized into a durable note. Over time, repeated or important material should be distilled into longer-lived note types:

- `concept`: concepts, methods, terms
- `decision`: decisions and rationale
- `paper`: paper or article notes
- `project`: project context
- `skill`: reusable AI workflows

## Note Format

Use plain Markdown with YAML frontmatter and Obsidian `[[WikiLinks]]`.

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
- Update [[00_Index]] and the relevant MOC pages when adding important notes.
- Dangling topic links are acceptable; they can become concept notes later.
- Keep filenames stable and ASCII-friendly. Put human-readable names in frontmatter `title` and `aliases`.

## Rules For AI Assistants

The reusable Codex skill is included here:

```text
_skills\save-history-summary\SKILL.md
```

If another AI assistant opens this folder, it should read:

- [AGENTS.md](AGENTS.md)
- [_skills/save-history-summary/SKILL.md](_skills/save-history-summary/SKILL.md)

The installed Codex copy currently lives at:

```text
C:\Users\Administrator\.codex\skills\save-history-summary\SKILL.md
```

Keep both copies synchronized when the memory-maintenance workflow changes.

## Git

This vault is versioned with Git. Commit meaningful batches of note changes so the memory wiki has a useful history.
