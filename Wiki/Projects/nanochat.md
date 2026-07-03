---
title: nanochat
created: 2026-07-03
type: project
tags:
  - project/nanochat
  - topic/llm
aliases:
  - nanochat project
related:
  - "[[Wiki/Concepts/Engram]]"
  - "[[Wiki/Concepts/Conditional Memory]]"
  - "[[Home|项目]]"
---

# nanochat

nanochat 是本地用于 LLM 训练和实验的仓库。在 Engram 论文讨论中，它是评估“conditional memory 是否值得引入”的具体项目背景。

## 长期上下文

- nanochat 重视 wall-clock efficiency，也重视代码简单、可 hack。
- 仓库的 `dev/LOG.md` 里记录过 Engram-lite / bigram hash embedding 实验。
- 对 nanochat 来说，memory module 不能只看 validation loss，还要看 wall-clock-to-target、CORE、tok/s、MFU 和 VRAM。

## 相关

- [[Memory/Summaries/conversation_notes_2601_07372|arXiv 2601.07372 与 nanochat 启发]]
- [[Wiki/Concepts/Engram|Engram]]
- [[Wiki/Concepts/Conditional Memory|Conditional Memory]]
