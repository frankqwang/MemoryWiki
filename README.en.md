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

- [[Home]]

## Quick Start With Codex

To recreate this workflow, ask Codex:

```text
Create a MemoryWiki directory under Documents as an Obsidian-compatible personal memory wiki.

Requirements:
- Keep only project-level docs and entrypoints in the root: README.md, README.en.md, AGENTS.md, Home.md, .gitignore.
- Put concrete notes under Notes/, grouped by Concepts, History, Projects, and Skills.
- Create Indexes/ for Papers, Projects, Decisions, and Skills indexes.
- Create _templates/ with history-summary, concept, and decision templates.
- Create _skills/memory-wiki/SKILL.md and install the same skill to ~/.codex/skills/memory-wiki.
- Default ordinary note prose to Chinese; English terms may remain in titles, aliases, and links.
- Initialize git, create the first commit, and tell me how to open it as an Obsidian vault.
```

## Directory Layout

The root only keeps project-level documentation, usage instructions, indexes, and maintenance entrypoints. Concrete notes live under `Notes/`:

```text
MemoryWiki/
  README.md       Chinese project README
  README.en.md    English project README
  AGENTS.md       AI maintenance rules
  Home.md         Obsidian entry page
  Indexes/        topic index pages
  Notes/          concrete notes
  _templates/     note templates
  _skills/        reusable Codex skill copy
```

Concrete note directories:

```text
Notes/
  Concepts/   concepts, methods, terms
  History/    raw conversation or task summaries
  Projects/   project context
  Skills/     AI workflows and skill notes
```

## Note Types

`history-summary` is the raw intake layer: one conversation or task summarized into a durable note. Over time, repeated or important material should be distilled into longer-lived note types:

- `concept`: concepts, methods, terms
- `decision`: decisions and rationale
- `paper`: paper or article notes
- `project`: project context
- `skill`: reusable AI workflows

## What Are Indexes?

This vault previously used the term MOC, short for `Map of Content`. It simply means a topic index page. To reduce jargon, the folder is now called `Indexes/`.

Index pages are navigation pages, not ordinary notes:

- `Indexes/Papers.md`: paper notes
- `Indexes/Projects.md`: project notes
- `Indexes/Decisions.md`: important decisions
- `Indexes/Skills.md`: AI skills

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
  - "[[Home]]"
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
- Update [[Home]] and the relevant index pages when adding important notes.
- Dangling topic links are acceptable; they can become concept notes later.
- Keep filenames stable and ASCII-friendly. Put human-readable names in frontmatter `title` and `aliases`.

## Rules For AI Assistants

The reusable Codex skill is included here:

```text
_skills\memory-wiki\SKILL.md
```

If another AI assistant opens this folder, it should read:

- [AGENTS.md](AGENTS.md)
- [_skills/memory-wiki/SKILL.md](_skills/memory-wiki/SKILL.md)

The installed Codex copy currently lives at:

```text
C:\Users\Administrator\.codex\skills\memory-wiki\SKILL.md
```

Keep both copies synchronized when the memory-maintenance workflow changes.

## Git

This vault is versioned with Git. Commit meaningful batches of note changes so the memory wiki has a useful history.
