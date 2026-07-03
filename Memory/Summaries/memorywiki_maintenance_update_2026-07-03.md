---
title: MemoryWiki 维护流程更新
created: 2026-07-03
type: history-summary
tags:
  - codex/history
  - topic/knowledge-management
  - project/memorywiki
aliases:
  - MemoryWiki maintenance update
related:
  - "[[Home]]"
  - "[[Wiki/Concepts/Memory Wiki]]"
  - "[[Wiki/Decisions/MemoryWiki Structure]]"
  - "[[Notes/README]]"
---

# MemoryWiki 维护流程更新

## 用户目标

围绕 `MemoryWiki` 的实际使用方式继续收敛结构：路径不要写死到单台机器，补上用户手动笔记区，把模板从根目录移走，并确认后续如何导入对话历史、如何生成网页展示。

## 做了什么

- 将 MemoryWiki 的默认位置规则改为“用户指定优先；未指定时使用 `~/Documents/MemoryWiki`”。
- 保留当前机器路径 `C:\Users\Administrator\Documents\MemoryWiki` 作为本机解析示例，而不是通用规则。
- 新增 `Notes/`，作为用户自己手动更新的个人笔记区。
- 将原来的 `_templates/` 移到 `_skills/memory-wiki/templates/`，因为模板属于维护流程配套资产，不属于普通内容目录。
- 新增 `note.md` 模板，适配 `Notes/`。
- 更新 `README.md`、`README.en.md`、`AGENTS.md`、`Home.md`、`Wiki/Decisions/MemoryWiki Structure.md` 和 `memory-wiki` skill。
- 同步 vault 内 skill 与已安装 Codex skill，并校验通过。

## 关键发现

- `Memory/`、`Notes/`、`Wiki/` 三层更符合当前用途：
  - `Memory/` 保存 AI 对话、任务记录和原始摘要。
  - `Notes/` 保存用户手写笔记、草稿、观察和待整理材料。
  - `Wiki/` 保存加工后的概念、项目、论文主题和决策。
- `_skills/` 不应该被当成普通知识内容区；它是给 AI 和 Codex 使用的维护流程目录。
- 对话历史不能由当前 Codex 自动跨平台读取；ChatGPT、Claude、其他 Codex 会话需要通过导出文件、复制内容或可访问的本地日志导入。
- 如果要把这些 Markdown 展示成网页，当前倾向是保留 Markdown + Git 作为底座，使用 Quartz 这类静态站点工具生成带搜索、反链和图谱的网页。

## 决策

- `Notes/` 保留为一级内容目录。
- `_templates/` 不保留在根目录，模板统一放到 `_skills/memory-wiki/templates/`。
- 后续更新 MemoryWiki 时，优先按用户意图选择位置：
  - “总结这次对话/任务”进入 `Memory/Summaries/`。
  - “作为我的笔记保存”进入 `Notes/`。
  - “沉淀成概念/项目/决策”进入 `Wiki/`。
- 后续跨工具导入需要用户提供导出包或文本内容；不能假设 AI 自动拥有外部平台历史访问权限。

## 产物

- `Notes/README.md`
- `_skills/memory-wiki/templates/note.md`
- `_skills/memory-wiki/templates/history-summary.md`
- `_skills/memory-wiki/templates/concept.md`
- `_skills/memory-wiki/templates/decision.md`
- 已安装 Codex skill：`C:\Users\Administrator\.codex\skills\memory-wiki\SKILL.md`
- GitHub repo：`https://github.com/frankqwang/MemoryWiki`

## 相关

- [[Home]]
- [[Wiki/Concepts/Memory Wiki]]
- [[Wiki/Decisions/MemoryWiki Structure]]
- [[Notes/README]]

## 后续事项

- 如果需要网页展示层，优先评估 Quartz；如果更像正式技术文档，再考虑 MkDocs Material。
- 如果要一次性导入 ChatGPT/Claude 历史，先准备平台导出的 JSON/HTML/Markdown/TXT 文件，再按批次导入 `Memory/`。
