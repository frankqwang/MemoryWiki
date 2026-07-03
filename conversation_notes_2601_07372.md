---
title: 对话笔记：arXiv 2601.07372 与 nanochat 启发
created: 2026-07-03
type: history-summary
tags:
  - codex/history
  - papers/llm
  - topic/nanochat
  - topic/conditional-memory
aliases:
  - Engram 论文与 nanochat 启发
  - Conditional Memory via Scalable Lookup 笔记
related:
  - "[[00_Index]]"
  - "[[Engram]]"
  - "[[Conditional Memory]]"
  - "[[nanochat]]"
---

# 对话笔记：arXiv 2601.07372 与 nanochat 启发

日期：2026-07-03  
论文：Conditional Memory via Scalable Lookup: A New Axis of Sparsity for Large Language Models  
链接：https://arxiv.org/abs/2601.07372

## 这次对话做了什么

用户给出 arXiv 链接，希望讲解论文。按照本地 `read-arxiv-paper` 技能流程，我下载了 arXiv TeX 源码，而不是只看摘要或 PDF。

源码被解压到本地缓存：

- `C:\Users\Administrator\.cache\nanochat\knowledge\2601.07372`

主要阅读文件：

- `main.tex`
- `sections/intro.tex`
- `sections/arch.tex`
- `sections/scaling_law_exp.tex`
- `sections/large_scale_exp.tex`
- `sections/long_context_exp.tex`
- `sections/analysis.tex`
- `tabs/appendix_detailed_arch.tex`

随后结合 nanochat 仓库中的模型实现和开发日志，整理了论文与 nanochat 的关系。

## 论文一句话总结

DeepSeek 提出 **conditional memory**：在 MoE 的“条件计算”之外，引入一种“条件记忆”机制，用哈希 N-gram 查表来存储和调用静态语言模式，例如实体、固定短语、局部搭配，从而减少 Transformer 早层浪费在静态模式重构上的计算。

## 核心概念

论文把语言建模拆成两类任务：

1. **动态计算**：推理、代码、数学、多步组合。
2. **静态查找**：实体名、惯用短语、公式化表达、局部 N-gram 模式。

MoE 擅长扩展动态计算容量；Engram 擅长扩展静态记忆容量。两者应该互补，而不是把所有稀疏参数都投给 MoE experts。

## Engram 怎么工作

Engram 是一个插入 Transformer 中间层的条件记忆模块：

- 从当前位置构造 suffix N-gram，例如 2-gram、3-gram。
- 对 token 做 tokenizer compression，把大小写、空格、unicode 变体等归一到更少的 canonical ID。
- 用多个 hash head 把 N-gram 映射到巨大 embedding table。
- 查出 memory embedding。
- 用当前 hidden state 做 query，对 memory embedding 做 context-aware gating。
- 通过 residual connection 把 memory 输出加回主干。

大模型配置里，Engram-27B 使用：

- N-gram：`[2, 3]`
- 插入层：`[2, 15]`
- Engram 参数：5.7B
- 总参数：26.7B
- 激活参数：3.8B

## 最重要的实验结论

论文提出 **Sparsity Allocation** 问题：在固定总参数和固定激活参数/FLOPs 下，稀疏容量应该分给多少 MoE，多少 Engram？

结果是 U 型曲线：

- 纯 MoE 不最优。
- 纯/过多 Engram 也不最优。
- 最优点大约是 **75-80% 稀疏容量给 MoE，20-25% 给 Engram**。

这说明 lookup memory 和 neural computation 是两种不同能力，不能互相完全替代。

## 大规模结果

Engram-27B 相比 iso-parameter、iso-FLOPs 的 MoE-27B：

- MMLU：57.4 -> 60.4
- CMMLU：57.9 -> 61.9
- BBH：50.9 -> 55.9
- ARC-Challenge：70.1 -> 73.8
- DROP：55.7 -> 59.0
- HumanEval：37.8 -> 40.8
- GSM8K：58.4 -> 60.6
- MATH：28.3 -> 30.7

一个关键点是：收益不只来自知识记忆任务，也出现在推理、代码、数学和阅读理解上。论文解释为：Engram 接管了部分静态局部模式，主干网络的有效深度和注意力容量就能更多用于复杂推理。

## 长上下文结果

论文认为 Engram 对长上下文有帮助，因为局部依赖不再完全占用 attention，attention 可以更多处理全局关系。

RULER 32k 上的例子：

- Multi-Query NIAH：84.2 -> 97.0
- Variable Tracking：77.0 -> 89.0
- Frequent Words Extraction：73.0 -> 99.3

## 机制分析

论文用 LogitLens 和 CKA 分析解释 Engram 的作用：

- LogitLens 显示 Engram 模型早层预测更快接近最终分布。
- CKA 显示 Engram 的浅层表示类似 MoE baseline 的更深层表示。
- 例如 Engram 的第 5 层可能更像 MoE 的第 12 层。

论文的解释是：Engram 相当于让模型不用花早层去拼实体/短语，所以“有效深度”变大。

## 系统角度

Engram 的 lookup 地址只依赖 token ID 和 N-gram，所以是 deterministic 的。这和 MoE routing 不同，MoE routing 依赖 hidden state。

因此 Engram 可以提前算出要读哪些 memory rows，并从 CPU host memory 异步 prefetch 到 GPU。论文实验里，把 100B 参数 Engram table 放在 host memory，吞吐下降不到 3%。

## 和 nanochat 的关系

nanochat 当前模型在 `nanochat/gpt.py` 里已经有一些低 FLOPs、高参数容量的记忆类路径：

- token embedding `wte`
- untied `lm_head`
- alternating value embeddings
- smear：把前一个 token embedding 混入当前 token
- residual / x0 mixing

`dev/LOG.md` 里已经记录过一次相关实验：

- 2026-01-27：Bigram Hash Embeddings / Engram-lite
- 2026-01-28：该实验被回滚

当时结论：

- full Engram 风格 context-aware gating 对 nanochat 尺度没有明显收益。
- early-only injection 反而伤害性能。
- trigrams 不如 bigrams。
- 简单 bigram hash embedding + per-layer lambda 一开始有效。
- 但在更大 d25 规模下收益很小，墙钟时间优势消失，还增加 VRAM，因此被移除。

## 对 nanochat 的实践启发

这篇论文对 nanochat 的最大价值不是“直接照搬 Engram”，而是提供了一个容量分配视角：

- 不同参数应该区分为计算型参数和记忆型参数。
- 评估 memory module 时不能只看 loss，还必须看 wall-clock、CORE、tok/s、MFU、VRAM。
- nanochat 已经重视 wall-clock-to-GPT-2，所以任何 Engram 类改动都必须在这个指标上获胜。

如果未来重试，建议从最小版本开始：

- 只做 2-gram。
- table size sweep：`vocab_size * {1, 2, 5}`。
- 用 per-layer scalar 注入 residual。
- 和 value embeddings 做公平对比。
- 记录 `val_bpb`、CORE、tok/s、MFU、VRAM、wall-clock-to-GPT-2。
- 如果只提升 loss 但拖慢训练，不应该合入。

## 本次对话产出的文件

完整论文长摘要：

- `D:\dev\demos\nanochat\knowledge\summary_engram_conditional_memory.md`

本对话笔记：

- `C:\Users\Administrator\Documents\MemoryWiki\conversation_notes_2601_07372.md`

## Related

- [[00_Index|MemoryWiki Index]]
- [[Engram]]
- [[Conditional Memory]]
- [[nanochat]]
- [[MoE]]
- [[Memory Wiki]]

## 最后结论

Engram 证明了一个重要方向：下一代稀疏模型可能不应该只有 MoE 式条件计算，还应该有可扩展的条件记忆。  

但对 nanochat 来说，结论更保守：这个思想值得跟踪和小规模重试，不过当前仓库历史已经说明，简单 Engram-lite 在 nanochat 的目标尺度和墙钟约束下没有稳定赢过现有设计。
