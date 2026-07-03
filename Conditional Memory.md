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
  - "[[Engram]]"
  - "[[MoE]]"
  - "[[conversation_notes_2601_07372]]"
---

# Conditional Memory

Conditional memory is a sparse modeling idea where a model activates a small number of memory entries per token, usually through lookup, instead of using dense computation to reconstruct static patterns.

## Contrast With Conditional Computation

- [[MoE]] scales computation capacity by routing tokens to experts.
- Conditional memory scales lookup capacity by retrieving sparse memory slots.
- The useful design space may be a hybrid allocation between both.

## Related

- [[Engram]]
- [[conversation_notes_2601_07372|arXiv 2601.07372 与 nanochat 启发]]
