---
title: Mixture of Experts
created: 2026-07-03
type: concept
tags:
  - concept
  - topic/llm-architecture
aliases:
  - MoE
  - Mixture-of-Experts
related:
  - "[[Wiki/Concepts/Conditional Memory]]"
  - "[[Wiki/Concepts/Engram]]"
---

# Mixture of Experts

Mixture of Experts，简称 MoE，是一种稀疏神经网络结构。它把 token 路由到一部分 expert network，从而增加总参数量，但每个 token 不需要激活全部参数。

## 在这个 wiki 里的作用

这里主要把 MoE 作为 [[Wiki/Concepts/Conditional Memory|Conditional Memory]] 和 [[Wiki/Concepts/Engram|Engram]] 的对照：MoE 扩展条件计算，Engram 扩展条件记忆。

## 相关

- [[Wiki/Concepts/Engram|Engram]]
- [[Wiki/Concepts/Conditional Memory|Conditional Memory]]
- [[Memory/Summaries/conversation_notes_2601_07372|Engram 论文笔记]]
