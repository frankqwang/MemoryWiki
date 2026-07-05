---
title: PyTorch nn.Module 基础概念学习会话
created: 2026-07-05
type: history-summary
tags:
  - codex/history
  - topic/pytorch
  - topic/llm
aliases:
  - PyTorch layer basics
  - nn.Module 学习 2026-07-05
related:
  - "[[Home]]"
---

# PyTorch nn.Module 基础概念学习会话

## 背景

用户在阅读 LLM 训练/模型代码的过程中，对 PyTorch 最基础的几类层、张量形状缩写、层参数含义、以及 token ID 的来源产生了一系列疑问。本次会话从零开始把这些概念串起来，为后续理解具体模型代码做准备。

## 学习目标

1. 理解 `nn.Module` 是什么，以及常见层（`Linear`、`Embedding`、`LayerNorm`、`MultiheadAttention`）的作用和参数。
2. 理解张量形状注释里 `B`、`L`、`D`、`C`、`H`、`W` 等缩写的含义。
3. 理解语言模型 `forward(idx, targets=None, kv_cache=None, ...)` 中各参数的含义。
4. 理解 token ID 的本质、tokenizer 的作用，以及 token 频率的 Zipf 分布。
5. 把 MemoryWiki 的维护 skill 安装到 kimi-code，并按 skill 流程记录本次会话。

---

## 关键讨论点

### 1. `nn.Module` 是 PyTorch 层的“基类”

几乎所有 PyTorch 层都继承自 `nn.Module`。继承它之后，自动获得：

- 参数管理（`parameters()`、`state_dict()`）
- 设备转移（`to("cuda")`）
- 训练/评估模式切换（`train()` / `eval()`）
- 前向调用约定（`forward()`）
- 子模块嵌套能力

### 2. 常见层及其参数

| 层 | 核心参数 | 作用 |
|---|---|---|
| `nn.Linear(in, out, bias)` | `in_features`, `out_features` | 线性变换 `y = xW^T + b` |
| `nn.Embedding(n, dim)` | `num_embeddings`, `embedding_dim` | 把整数 token ID 查表为向量 |
| `nn.LayerNorm(shape)` | `normalized_shape`, `eps`, `elementwise_affine` | 对特征维度做归一化 |
| `nn.MultiheadAttention(d, heads)` | `embed_dim`, `num_heads`, `batch_first` | 多头自注意力 |
| `nn.Conv2d(...)` | `in_channels`, `out_channels`, `kernel_size`, `stride`, `padding` | 图像局部特征提取 |
| `nn.LSTM(...)` | `input_size`, `hidden_size`, `num_layers`, `bidirectional` | 序列建模 |
| `nn.Dropout(p)` | `p` | 随机失活，防止过拟合 |

### 3. 形状缩写 `(B, T, D)` 等

| 缩写 | 含义 |
|---|---|
| `B` | Batch size |
| `T` / `L` | Time steps / Sequence length |
| `D` | Feature / hidden dimension |
| `C` | Channels |
| `H` / `W` | Height / Width |
| `V` | Vocabulary size |

例如 `idx` 的形状 `(B, T)` 表示：一批文本，每条文本有 `T` 个 token，每个位置是整数 token ID。

### 4. `forward(idx, targets=None, kv_cache=None, ...)`

- `idx`: 输入 token IDs，形状 `(B, T)`。
- `targets`: 目标 token IDs，训练时用；为 `None` 表示推理/生成模式。
- `kv_cache`: 推理时缓存之前的 Key/Value，避免重复计算，加速自回归生成。
- `loss_reduction`: loss 聚合方式，如 `'mean'`、`'sum'`。

训练时 `targets` 是 `idx` 整体右移一位，让模型预测下一个 token。

### 5. token ID 不是算出来的，是查出来的

- token ID 是 token 在词表（vocabulary）中的索引。
- 怎么切分文本成 token，由 **tokenizer** 决定。
- 常见分词策略：字符级、词级、子词级（BPE、WordPiece、Unigram、SentencePiece）。
- token ID 本身没有语义；相邻 ID 不代表语义相近。
- 真实语料中 token 频率通常服从 **Zipf 定律**：少数高频 token 占大多数出现次数。

---

## 产物

1. 安装 `memory-wiki` skill 到 `kimi-code/.agents/skills/memory-wiki/SKILL.md`。
2. 创建本历史摘要：`Memory/Summaries/conversation_notes_pytorch_nn_basics_2026-07-05.md`。

## 相关

- [[Home]]
- [[Wiki/Projects/nanochat]]
- [[Memory/Summaries/conversation_notes_nanochat_basics_2026-07-05|nanochat 代码基础学习会话]]

## 后续可深入

1. 继续阅读 nanochat 中 `GPT.forward` 的具体实现，把 `idx`、`targets`、`kv_cache` 和实际代码对应起来。
2. 了解 BPE/SentencePiece 的训练过程，理解子词 token 如何形成。
3. 动手写一个最小的 `nn.Module` 子类，自定义一层并观察 `parameters()` 和 `state_dict()`。
