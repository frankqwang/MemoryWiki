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
  - "[[Conditional Memory]]"
  - "[[conversation_notes_2601_07372]]"
  - "[[01_MOCs/Papers|Papers]]"
---

# Engram

Engram is DeepSeek's conditional memory module for language models. It retrieves trainable N-gram memory through deterministic hash lookups and fuses the retrieved vectors into the Transformer residual stream.

## Key Points

- Designed as a sparse memory axis complementary to [[MoE]] conditional computation.
- Uses tokenizer compression, multi-head hashing, context-aware gating, and selected layer insertion.
- The main paper argues that Engram offloads static local pattern reconstruction from early Transformer layers.

## Related

- [[Conditional Memory]]
- [[conversation_notes_2601_07372|arXiv 2601.07372 与 nanochat 启发]]
- [[nanochat]]
