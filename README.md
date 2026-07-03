# MemoryWiki

[English](README.en.md)

MemoryWiki 是一个可移植、兼容 Obsidian 的个人记忆 wiki，用来保存 AI 对话笔记、任务总结、决策、概念、论文笔记、技能和可复用的项目上下文。

它放在 `Documents` 下，而不是某个工具的私有配置目录里，这样 Codex、其他 AI 助手、Obsidian、编辑器和 Git 都能读写同一套资料。

## 使用方式

把这个文件夹作为 Obsidian vault 打开：

```text
C:\Users\Administrator\Documents\MemoryWiki
```

入口：

- [[00_Index]]

## 目录结构

根目录只保留项目介绍、使用说明、索引和维护入口。具体笔记放在 `Notes/` 下：

```text
Notes/
  Concepts/   概念、方法、术语
  History/    对话或任务原始摘要
  Projects/   项目上下文
  Skills/     AI 工作流和 skill 说明
```

## 笔记类型

`history-summary` 是原始摄取层：把一次对话或一次任务总结成稳定笔记。随着内容积累，重复或重要的信息应该进一步沉淀成更长期的笔记类型：

- `concept`：概念、方法、术语
- `decision`：决策和理由
- `paper`：论文或文章笔记
- `project`：项目上下文
- `skill`：可复用的 AI 工作流

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
  - topic/example
aliases:
  - 可选别名
related:
  - "[[00_Index]]"
---
```

推荐章节：

- 用户目标或原始请求
- 做了什么
- 关键发现、决策和理由
- 创建或使用过的文件、命令、URL、产物
- 相关笔记，使用 `[[WikiLinks]]`
- 未解决问题或后续事项

## 链接规则

- 用 `[[WikiLinks]]` 连接相关笔记和主题。
- 新增重要笔记时更新 [[00_Index]] 和相关 MOC。
- 可以创建暂时不存在的主题链接；之后可以补成概念页。
- 文件名尽量稳定、ASCII 友好；可读标题放在 frontmatter 的 `title` 和 `aliases` 里。

## 给 AI 助手的规则

可复用的 Codex skill 放在：

```text
_skills\memory-wiki\SKILL.md
```

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
