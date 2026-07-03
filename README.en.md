# MemoryWiki

[中文](README.md)

MemoryWiki is a portable, Obsidian-compatible personal memory wiki for raw AI conversation/task memory and refined concepts, decisions, paper notes, and project context.

It intentionally lives under `Documents` instead of a single tool's private config directory, so Codex, other AI assistants, Obsidian, editors, and Git can all work with the same notes.

## How To Use

Open this folder as an Obsidian vault:

```text
C:\Users\Administrator\Documents\MemoryWiki
```

Start from:

- [[Home]]

## Core Layout

The vault has two main content areas:

```text
MemoryWiki/
  Memory/      raw memory: conversation summaries, task logs, lightly processed history
  Wiki/        refined knowledge: concepts, projects, decisions, papers
  Home.md      home and navigation
  README.md    Chinese README
  README.en.md English README
  AGENTS.md    AI maintenance rules
  _templates/  note templates
  _skills/     AI maintenance workflow and Codex skill copy, not ordinary notes
```

Current convention:

```text
Memory/
  Summaries/   raw conversation and task summaries

Wiki/
  Concepts/    concepts, methods, terms, paper topics
  Projects/    project context
  Decisions/   important decisions
```

## Memory vs Wiki

- `Memory/`: capture first, preserve context. Use it for "what happened in this conversation/task".
- `Wiki/`: refined knowledge. Use it for stable conclusions, reusable processes, concepts, and decisions.

In short, `Memory/` is raw material; `Wiki/` is distilled knowledge.

## Quick Start With Codex

To recreate this workflow, ask Codex:

```text
Create a MemoryWiki directory under Documents as an Obsidian-compatible personal memory wiki.

Requirements:
- Keep only project-level docs and entrypoints in the root: README.md, README.en.md, AGENTS.md, Home.md, .gitignore.
- Create Memory/Summaries/ for raw conversation and task summaries.
- Create Wiki/Concepts/, Wiki/Projects/, and Wiki/Decisions/ for refined knowledge.
- Create _templates/ with history-summary, concept, and decision templates.
- Create _skills/memory-wiki/SKILL.md and install the same skill to ~/.codex/skills/memory-wiki.
- Default ordinary note prose to Chinese; English terms may remain in titles, aliases, and links.
- Initialize git, create the first commit, and tell me how to open it as an Obsidian vault.
```

## Note Types

- `history-summary`: raw conversation or task summary, stored in `Memory/Summaries/`.
- `concept`: concepts, methods, terms, stored in `Wiki/Concepts/`.
- `decision`: decisions and rationale, stored in `Wiki/Decisions/`.
- `paper`: paper or article notes, usually stored in `Wiki/Concepts/` unless the vault grows.
- `project`: project context, stored in `Wiki/Projects/`.

Reusable AI maintenance workflows are not ordinary wiki notes. The current workflow lives in `_skills/memory-wiki/SKILL.md` and is synchronized with the installed Codex skill directory.

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
aliases:
  - Optional alternate title
related:
  - "[[Home]]"
---
```

## Linking Rules

- Link related notes and topics with `[[WikiLinks]]`.
- Update [[Home]] when adding important notes.
- Dangling topic links are acceptable; they can become concept notes later.
- Keep filenames stable and ASCII-friendly. Put human-readable names in frontmatter `title` and `aliases`.

## Rules For AI Assistants

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
