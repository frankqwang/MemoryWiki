---
name: memory-wiki
description: 维护用户级 Documents `MemoryWiki`，作为兼容 Obsidian 的 Markdown 记忆 wiki，用于跨会话 AI 知识。用户要求总结聊天、保存对话或任务历史、更新个人记忆、维护知识库笔记、创建互相链接的笔记、更新反向链接或 wikilinks、保留经验教训、项目上下文、论文笔记、未来会话笔记；用户用中文要求对话笔记或历史笔记；提到 MemoryWiki 或 HistorySummary；或要求不要把笔记放进当前仓库时，使用此 skill。
---

# MemoryWiki

> 中文 canonical 版本。这个文件应与已安装的 Codex skill 副本保持同步。

## 概览

从对话、已完成工作、概念、论文和项目上下文中创建并维护持久的、兼容 Obsidian 的 Markdown 笔记。笔记保存在用户的 Documents 文件夹下，以便跨仓库、跨 Codex 会话和其他 AI 工具复用。

## 目标位置

将 MemoryWiki 笔记保存到用户指定的 vault 路径。如果用户没有指定路径，使用用户主目录下的 Documents 文件夹：

- Windows: `%USERPROFILE%\Documents\MemoryWiki`
- POSIX: `$HOME/Documents/MemoryWiki`
- 简写: `~/Documents/MemoryWiki`

如果目录不存在，则创建它。除非用户明确要求仓库内产物，否则不要把这些笔记保存在当前项目仓库里。

把这个目录视为一个 Obsidian vault。优先使用普通 Markdown、YAML frontmatter、tags 和 `[[WikiLinks]]`；不要要求 Obsidian 专属插件。

## Vault 约定

维护以下文件和约定：

- `Home.md`: 顶层目录地图。如果缺失则创建；添加笔记后更新它。
- 保持 vault 根目录干净。原始捕获放在 `Memory/`；用户手动维护的个人笔记放在 `Notes/`；加工后的知识放在 `Wiki/`。
- `Memory/Summaries/` 用于原始对话和任务摘要。
- `Notes/` 用于用户手写或明确要求作为个人笔记保存的内容。除非用户要求改写，否则保留用户原话。
- `Wiki/Concepts/` 用于概念、论文和持久主题笔记。
- `Wiki/Projects/` 用于项目笔记。
- `_skills/` 只用于 AI 维护工作流、模板和 Codex skill 副本；不要把它当成普通笔记区。
- 文件名使用稳定的 ASCII；可读标题和别名放在 frontmatter 的 `title` 和 `aliases` 中。
- 使用 Obsidian wikilinks 连接相关主题和笔记，例如 `[[Wiki/Projects/nanochat]]`、`[[Wiki/Concepts/Engram]]`、`[[Memory/Summaries/conversation_notes_2601_07372|Engram paper notes]]`。
- 可以创建暂时没有目标文件的主题链接；Obsidian 会把它们显示为未来可补全的笔记。

新笔记使用这种 frontmatter 形状：

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

## 工作流

1. 从用户请求中推断笔记范围：
   - 如果用户要求记录这次聊天、我们的讨论或本次对话，则范围是当前对话。
   - 如果用户要求记录这个 issue、这个任务或刚完成的工作，则范围是当前任务。
   - 如果用户给出了明确主题，则范围是该命名主题。
2. 写入前检查现有 vault 笔记：
   - 列出 `MemoryWiki` 中已有的 Markdown 文件。
   - 链接已有笔记时，复用精确的文件名或标题。
   - 找出 2 到 6 个相关的现有笔记或主题链接。
   - 如果匹配笔记类型，复用 `_skills/memory-wiki/templates/` 中的模板。
3. 选择稳定文件名：
   - 需要时用主题短 slug 加日期。
   - 文件名优先使用小写 ASCII，例如 `conversation_notes_2601_07372.md`、`history_summary_openai_api_setup_2026-07-03.md`。
   - 避免覆盖已有笔记；必要时追加 `_2` 之类的后缀。
4. 原始摘要放在 `Memory/`；用户创作的手动笔记放在 `Notes/`；精炼笔记放在 `Wiki/` 下对应子目录。
5. 写一篇简洁的 Markdown 笔记，包含：
   - YAML frontmatter。
   - 标题。
   - 用户目标或原始请求。
   - 已完成的事情。
   - 关键发现、结论和理由。
   - 创建的文件、命令、URL 或产物。
   - 一个包含现有笔记和主题链接的 `Related` 小节。
   - 未解决问题或后续事项，如有。
6. 更新 `Home.md`：
   - 把新笔记加入 recent notes 或相关主题区域。
   - 保持链接为 Obsidian wikilinks。
   - 保留现有索引内容。
7. 如果此前误把笔记放进仓库或旧的 `HistorySummary` 目录，而用户要求使用用户级 Memory Wiki，则把它移动到 `MemoryWiki` 并删除陈旧副本。
8. 汇报已保存笔记的绝对路径，并说明该文件夹可以作为 Obsidian vault 打开。

## 风格

使用清晰的 Markdown 和短小章节。保留有用的技术细节，但不要倾倒原始日志或不必要的命令输出。语言与用户保持一致。

## 仓库卫生

维护 MemoryWiki 时，不要 stage、commit 或修改无关项目仓库文件，除非用户明确要求。如果当前项目仓库已经有未提交改动，不要碰无关改动。
