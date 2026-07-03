---
title: MemoryWiki 结构决策
created: 2026-07-03
type: decision
tags:
  - decision
  - topic/knowledge-management
aliases:
  - MemoryWiki structure
related:
  - "[[Home]]"
  - "[[Wiki/Concepts/Memory Wiki]]"
---

# MemoryWiki 结构决策

## 背景

早期结构使用过 `HistorySummary`、`KnowledgeVault`、`Indexes/`、`Notes/` 等命名。随着用途变清楚，`HistorySummary` 显得太窄，`KnowledgeVault` 太泛，`Indexes/` 又对当前规模有些过早抽象。

## 决策

采用两个核心内容目录：

- `Memory/`：保存原始记忆，包括对话摘要、任务记录和轻度整理的历史。
- `Wiki/`：保存加工后的知识，包括概念、项目、论文主题和决策。

根目录只保留 `README.md`、`README.en.md`、`AGENTS.md`、`Home.md`、配置和维护入口。可复用的 AI 维护流程放在 `_skills/`，不作为普通 wiki 内容页。

## 理由

- `Memory/` 和 `Wiki/` 能清楚区分“先记下来”和“沉淀成知识”。
- `History/Concepts/Projects/Skills` 全部顶层展开会让根目录变散。
- 单独 `Indexes/` 在当前规模下信息量少，`Home.md` 已经足够承担导航。
- `Wiki/Skills/` 对当前目标价值不高；skill 本身应作为工具说明放在 `_skills/`，需要沉淀的原则再进入 `Wiki/Concepts/` 或 `Wiki/Decisions/`。
- 中文用户阅读时，少用 MOC、Index 这类术语更直接。

## 影响

- 新的原始摘要默认进入 `Memory/Summaries/`。
- 稳定结论、概念、项目上下文和决策进入 `Wiki/`。
- AI 维护流程进入 `_skills/`，并与已安装的 Codex skill 保持同步。
- 需要定期把 `Memory/` 中重复出现的重要内容蒸馏到 `Wiki/`。

## 相关

- [[Home]]
- [[Wiki/Concepts/Memory Wiki|Memory Wiki]]
