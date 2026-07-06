---
title: MemoryWiki 首页
created: 2026-07-03
type: index
tags:
  - index
aliases:
  - MemoryWiki
  - 首页
related: []
---

# MemoryWiki 首页

这是一个给人和 AI 共同维护的长期记忆 wiki。`Memory/` 保存原始摘要和任务记录，`Notes/` 保存手动笔记，`Wiki/` 保存加工后的概念、项目和决策。

## 从这里开始

- [[README|项目说明]]
- [[AGENTS|AI 维护规则]]

## Memory

- [[Memory/Summaries/conversation_notes_pytorch_nn_basics_2026-07-05|PyTorch nn.Module 基础概念学习会话]]
- [[Memory/Summaries/memorywiki_maintenance_update_2026-07-03|MemoryWiki 维护流程更新]]
- [[Memory/Summaries/conversation_notes_2601_07372|arXiv 2601.07372 与 nanochat 启发]]
- [[Memory/Summaries/conversation_notes_nanochat_basics_2026-07-05|nanochat 代码基础学习会话]]
- [[Memory/Summaries/transcript_nanochat_basics_2026-07-05|nanochat 代码基础学习会话 — 原文逐字记录]]

## Notes

- [[Notes/README|手动笔记说明]]
- [[Notes/ai_memory_wiki_product|AI 记忆 Wiki 产品构思]]

## Wiki

### Concepts

- [[Wiki/Concepts/Conditional Memory|Conditional Memory]]
- [[Wiki/Concepts/Engram|Engram]]
- [[Wiki/Concepts/MoE|MoE]]
- [[Wiki/Concepts/Memory Wiki|Memory Wiki]]
- [[Wiki/Concepts/Torch Compile|torch.compile]]
- [[Wiki/Concepts/Meta Device|Meta Device]]
- [[Wiki/Concepts/ReLU Squared|ReLU²]]
- [[Wiki/Concepts/Bias in Neural Networks|Bias in Neural Networks]]

### Projects

- [[Wiki/Projects/nanochat|nanochat]]

### Maintenance

- [_skills/memory-wiki/SKILL.md](_skills/memory-wiki/SKILL.md)

### Decisions

- [[Wiki/Decisions/MemoryWiki Structure|MemoryWiki 结构决策]]

## 约定

- 新笔记使用 YAML frontmatter。
- 相关内容用 `[[WikiLinks]]` 互相连接。
- 原始记录放在 `Memory/`，手动笔记放在 `Notes/`，加工后的资料放在 `Wiki/`。
- AI 助手创建或更新笔记前，应阅读 `_skills/memory-wiki/SKILL.md`。
