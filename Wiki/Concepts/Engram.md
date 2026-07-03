---
title: Engram
created: 2026-07-03
type: concept
tags:
  - concept
  - papers/llm
  - topic/conditional-memory
aliases:
  - DeepSeek Engram
related:
  - "[[Wiki/Concepts/Conditional Memory]]"
  - "[[Memory/Summaries/conversation_notes_2601_07372]]"
  - "[[Home|论文]]"
---

# Engram

Engram 是 DeepSeek 提出的 conditional memory 模块。它用确定性的 N-gram 哈希查表检索可训练记忆向量，再把这些向量融合回 Transformer residual stream。

## 关键点

- Engram 是 [[Wiki/Concepts/MoE|MoE]] 条件计算之外的一条稀疏记忆轴。
- 它包含 tokenizer compression、multi-head hashing、context-aware gating 和选择性层插入。
- 论文认为 Engram 能把静态局部模式的重构工作从 Transformer 早层卸载出去，让主干网络把更多有效深度用于复杂推理。

## 相关

- [[Wiki/Concepts/Conditional Memory|Conditional Memory]]
- [[Memory/Summaries/conversation_notes_2601_07372|arXiv 2601.07372 与 nanochat 启发]]
- [[Wiki/Projects/nanochat|nanochat]]
