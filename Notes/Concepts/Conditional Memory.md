---
title: Conditional Memory
created: 2026-07-03
type: concept
tags:
  - concept
  - topic/conditional-memory
aliases:
  - 条件记忆
related:
  - "[[Notes/Concepts/Engram]]"
  - "[[Notes/Concepts/MoE]]"
  - "[[Notes/History/conversation_notes_2601_07372]]"
---

# Conditional Memory

Conditional Memory，中文可叫“条件记忆”，是一种稀疏建模思路：模型每个 token 只激活少量记忆项，通常通过查表完成，而不是用大量 dense computation 去重新构造静态模式。

## 和条件计算的区别

- [[Notes/Concepts/MoE|MoE]] 通过把 token 路由到不同 expert 来扩展计算容量。
- Conditional Memory 通过检索稀疏 memory slot 来扩展记忆容量。
- 比较合理的方向不是二选一，而是在 MoE 和 memory lookup 之间分配稀疏参数预算。

## 相关

- [[Notes/Concepts/Engram|Engram]]
- [[Notes/History/conversation_notes_2601_07372|arXiv 2601.07372 与 nanochat 启发]]
