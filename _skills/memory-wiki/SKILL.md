---
name: memory-wiki
description: Maintain the user-level Documents `MemoryWiki` as an Obsidian-compatible Markdown memory wiki for cross-session AI knowledge. Use when the user asks to summarize chats, save conversation or task history, update personal memory, maintain knowledge-base notes, create linked notes, update backlinks or wikilinks, preserve lessons learned, decisions, project context, paper notes, or notes for future sessions; asks in Chinese for conversation notes or history notes; mentions MemoryWiki or HistorySummary; or asks not to put the note in the current repo.
---

# MemoryWiki

## Overview

Create and maintain durable Obsidian-compatible Markdown notes from conversations, completed work, decisions, concepts, papers, and project context under the user's Documents folder so they are reusable across repositories, Codex sessions, and other AI tools.

## Destination

Save MemoryWiki notes under:

- Windows: `%USERPROFILE%\Documents\MemoryWiki`
- POSIX: `$HOME/Documents/MemoryWiki`

Create the directory if it does not exist. Do not save these notes inside the current repository unless the user explicitly requests a repo-local artifact.

Treat this directory as an Obsidian vault. Prefer plain Markdown, YAML frontmatter, tags, and `[[WikiLinks]]`; do not require Obsidian-specific plugins.

## Vault Conventions

Maintain these files and conventions:

- `Home.md`: top-level map of contents. Create it if missing and update it after adding notes.
- Keep the vault root clean. Raw captures belong under `Memory/`; refined knowledge belongs under `Wiki/`.
- Use `Memory/Summaries/` for raw conversation and task summaries.
- Use `Wiki/Concepts/` for concepts, papers, and durable topic notes.
- Use `Wiki/Projects/` for project notes.
- Use `Wiki/Skills/` for skill notes.
- Use `Wiki/Decisions/` for decision notes.
- Use stable ASCII filenames; use frontmatter `title` and `aliases` for human-readable names.
- Use Obsidian wikilinks for related topics and notes, e.g. `[[Wiki/Projects/nanochat]]`, `[[Wiki/Concepts/Engram]]`, `[[Memory/Summaries/conversation_notes_2601_07372|Engram paper notes]]`.
- It is acceptable to create dangling topic links; Obsidian will surface them as future notes.

Use this frontmatter shape for new notes:

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

## Workflow

1. Infer the note scope from the user's request:
   - Current conversation if they ask for notes from this chat, our discussion, or this conversation.
   - Current task if they ask for notes from this issue, this task, or the work just completed.
   - A named topic if they provide one.
2. Inspect existing vault notes before writing:
   - List existing Markdown files in `MemoryWiki`.
   - Reuse exact filenames or titles for wikilinks when linking to existing notes.
   - Identify 2-6 related existing notes or topic links.
3. Choose a stable filename:
   - Use a short slug from the topic plus date when helpful.
   - Prefer lowercase ASCII for filenames, e.g. `conversation_notes_2601_07372.md`, `history_summary_openai_api_setup_2026-07-03.md`.
   - Avoid overwriting existing notes; append a suffix such as `_2` if needed.
4. Put raw summaries under `Memory/` and refined notes under the right `Wiki/` subdirectory.
5. Write a concise Markdown note with:
   - YAML frontmatter.
   - Title.
   - User goal or original request.
   - What was done.
   - Key findings, decisions, and rationale.
   - Files, commands, URLs, or artifacts created.
   - A `Related` section containing wikilinks to existing notes and topic links.
   - Open questions or follow-ups, if any.
6. Update `Home.md`:
   - Add the new note under a recent notes or relevant topic section.
   - Keep links as Obsidian wikilinks.
   - Preserve existing index content.
7. If an earlier attempt placed the note in a repository or the old `HistorySummary` directory and the user asked for the user-level Memory Wiki, move it to `MemoryWiki` and remove the stale copy.
8. Report the absolute path to the saved note and mention that the folder can be opened as an Obsidian vault.

## Style

Use clear Markdown with short sections. Preserve useful technical specifics, but do not dump raw logs or unnecessary command output. Match the user's language.

## Repository Hygiene

Do not stage, commit, or modify unrelated project repository files while maintaining MemoryWiki unless explicitly requested. If the current project repo is already dirty, leave unrelated changes untouched.
