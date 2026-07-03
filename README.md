# MemoryWiki

[English](README.en.md)

MemoryWiki 是一个可移植、兼容 Obsidian 的个人记忆 wiki，用来保存 AI 对话摘要、任务记录，以及进一步加工后的概念、决策、论文笔记、技能和项目上下文。

它放在 `Documents` 下，而不是某个工具的私有配置目录里，这样 Codex、其他 AI 助手、Obsidian、编辑器和 Git 都能读写同一套资料。

## 使用方式

把这个文件夹作为 Obsidian vault 打开：

```text
C:\Users\Administrator\Documents\MemoryWiki
```

入口：

- [[Home]]

## 核心结构

这个库只有两个主要内容目录：

```text
MemoryWiki/
  Memory/      原始记忆：对话摘要、任务记录、未经深度整理的历史
  Wiki/        加工知识：概念、项目、技能、决策、论文等整理后的内容
  Home.md      首页和导航
  README.md    中文说明
  README.en.md 英文说明
  AGENTS.md    给 AI 助手看的维护规则
  _templates/  新笔记模板
  _skills/     Codex skill 副本
```

当前约定：

```text
Memory/
  Summaries/   原始对话摘要和任务摘要

Wiki/
  Concepts/    概念、方法、术语、论文主题
  Projects/    项目上下文
  Skills/      AI 工作流和 skill 说明
  Decisions/   重要决策
```

## Memory 和 Wiki 的区别

- `Memory/`：先记下来，保留上下文。适合放“这次对话讲了什么”“这次任务做了什么”。
- `Wiki/`：整理后的知识。适合放“稳定结论是什么”“以后应该怎么做”“这个概念是什么”。

也就是说，`Memory/` 是原材料，`Wiki/` 是加工后的资料。

## 用 Codex 快速搭建

别人想复刻这个流程时，可以让 Codex 在自己的 `Documents` 下创建同样结构。可直接复制这段给 Codex：

```text
请帮我在 Documents 下建立一个 MemoryWiki 目录，作为 Obsidian-compatible 的个人记忆 wiki。

要求：
- 根目录只保留 README.md、README.en.md、AGENTS.md、Home.md、.gitignore 等项目级说明和入口。
- 建立 Memory/Summaries/，用来保存原始对话摘要和任务摘要。
- 建立 Wiki/Concepts/、Wiki/Projects/、Wiki/Skills/、Wiki/Decisions/，用来保存加工后的知识。
- 建立 _templates/ 目录，放 history-summary、concept、decision 模板。
- 建立 _skills/memory-wiki/SKILL.md，并把同一份 skill 安装到 ~/.codex/skills/memory-wiki。
- 普通笔记默认中文正文，英文术语可以保留在标题、别名和链接里。
- 用 git 初始化仓库，首次提交，并告诉我如何打开 Obsidian vault。
```

## 笔记类型

- `history-summary`：一次对话或任务的原始摘要，放在 `Memory/Summaries/`。
- `concept`：概念、方法、术语，放在 `Wiki/Concepts/`。
- `decision`：决策和理由，放在 `Wiki/Decisions/`。
- `paper`：论文或文章笔记，可放在 `Wiki/Concepts/` 或之后单独扩展。
- `project`：项目上下文，放在 `Wiki/Projects/`。
- `skill`：可复用的 AI 工作流，放在 `Wiki/Skills/`。

## 笔记格式

使用普通 Markdown、YAML frontmatter 和 Obsidian `[[WikiLinks]]`。

推荐 frontmatter：

```markdown
---
title: 可读标题
created: YYYY-MM-DD
type: history-summary
tags:
  - codex/history
aliases:
  - 可选别名
related:
  - "[[Home]]"
---
```

## 链接规则

- 用 `[[WikiLinks]]` 连接相关笔记和主题。
- 新增重要笔记时更新 [[Home]]。
- 可以创建暂时不存在的主题链接；之后可以补成概念页。
- 文件名尽量稳定、ASCII 友好；可读标题放在 frontmatter 的 `title` 和 `aliases` 里。

## 给 AI 助手的规则

其他 AI 助手打开这个目录时，应先阅读：

- [AGENTS.md](AGENTS.md)
- [_skills/memory-wiki/SKILL.md](_skills/memory-wiki/SKILL.md)

已安装的 Codex skill 位于：

```text
C:\Users\Administrator\.codex\skills\memory-wiki\SKILL.md
```

如果记忆维护流程发生变化，需要同步更新 vault 内副本和已安装副本。

## Git

这个 vault 用 Git 做版本管理。建议按有意义的批次提交笔记变化，让个人记忆库本身也有清晰历史。
