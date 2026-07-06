# MemoryWiki

MemoryWiki 是一个可移植、兼容 Obsidian 的个人记忆 wiki，用来保存 AI 对话摘要、任务记录、手动笔记，以及进一步加工后的概念、论文笔记和项目上下文。

它放在 `Documents` 下，而不是某个工具的私有配置目录里，这样 Codex、其他 AI 助手、Obsidian、编辑器和 Git 都能读写同一套资料。

## 使用方式

默认把这个文件夹作为 Obsidian vault 打开：

```text
~/Documents/MemoryWiki
```

在当前这台机器上，实际路径是：

```text
C:\Users\Administrator\Documents\MemoryWiki
```

入口：

- [[Home]]

## 核心结构

这个库有三个主要内容目录：

```text
MemoryWiki/
  Memory/      原始记忆：对话摘要、任务记录、未经深度整理的历史
  Notes/       手动笔记：用户自己维护的想法、草稿和观察
  Wiki/        加工知识：概念、项目、论文等整理后的内容
  Home.md      首页和导航
  README.md    中文说明
  AGENTS.md    给 AI 助手看的维护规则
  _skills/     AI 维护流程和 Codex skill 副本，不作为普通笔记区
```

当前约定：

```text
Memory/
  Summaries/   原始对话摘要和任务摘要

Notes/
  README.md    手动笔记区说明

Wiki/
  Concepts/    概念、方法、术语、论文主题
  Projects/    项目上下文
```

## Memory、Notes 和 Wiki 的区别

- `Memory/`：先记下来，保留上下文。适合放“这次对话讲了什么”“这次任务做了什么”。
- `Notes/`：你自己手动维护的笔记。适合放临时想法、草稿、个人观察和待整理材料。
- `Wiki/`：整理后的知识。适合放“稳定结论是什么”“以后应该怎么做”“这个概念是什么”。

也就是说，`Memory/` 是原始记录，`Notes/` 是个人手写区，`Wiki/` 是加工后的资料。

## 用 Codex 快速搭建

别人想复刻这个流程时，可以让 Codex 在自己的 `Documents` 下创建同样结构。可直接复制这段给 Codex：

```text
请帮我在 Documents 下建立一个 MemoryWiki 目录，作为 Obsidian-compatible 的个人记忆 wiki。

要求：
- 根目录只保留 README.md、AGENTS.md、Home.md、.gitignore 等项目级说明和入口。
- 建立 Memory/Summaries/，用来保存原始对话摘要和任务摘要。
- 建立 Notes/，用来保存用户手动更新的个人笔记。
- 建立 Wiki/Concepts/、Wiki/Projects/，用来保存加工后的知识。
- 建立 _skills/memory-wiki/SKILL.md，并把 history-summary、concept、note 等模板放到 _skills/memory-wiki/templates/。
- 把同一份 skill 安装到 ~/.codex/skills/memory-wiki。
- 普通笔记默认中文正文，英文术语可以保留在标题、别名和链接里。
- 用 git 初始化仓库，首次提交，并告诉我如何打开 Obsidian vault。
```

## 笔记类型

- `history-summary`：一次对话或任务的原始摘要，放在 `Memory/Summaries/`。
- `note`：用户手动维护的个人笔记，放在 `Notes/`。
- `concept`：概念、方法、术语，放在 `Wiki/Concepts/`。
- `paper`：论文或文章笔记，可放在 `Wiki/Concepts/` 或之后单独扩展。
- `project`：项目上下文，放在 `Wiki/Projects/`。

可复用的 AI 维护流程和模板不作为普通 wiki 笔记保存；当前放在 `_skills/memory-wiki/`，并同步到 Codex 的已安装 skill 目录。

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

### 同步 skill 副本

vault 内的 `_skills/memory-wiki/` 是 canonical 版本。修改后，运行同步脚本把更新推到已安装的 agent 目录：

```bash
bash _skills/memory-wiki/sync.sh
```

默认会同步到：

- `~/.codex/skills/memory-wiki/`（Codex）
- `~/temp/kimi-code/.agents/skills/memory-wiki/`（kimi-code）

如果需要同步到其他位置，可以传参数：

```bash
bash _skills/memory-wiki/sync.sh /path/to/another/skill/copy
```

### 自动同步（git hook）

安装 post-commit hook 后，每次提交如果改动了 `_skills/memory-wiki/` 下的文件，会自动运行 `sync.sh`：

```bash
cp _skills/memory-wiki/hooks/post-commit .git/hooks/post-commit
chmod +x .git/hooks/post-commit
```

验证：

```bash
# 修改 skill 后提交
vim _skills/memory-wiki/SKILL.md
git add _skills/memory-wiki/
git commit -m "update skill"
# 提交后会自动打印 sync 日志
```

> 注意：`.git/hooks/` 不会被 Git 跟踪，新 clone 的仓库需要重新安装。版本化的 hook 示例保存在 `_skills/memory-wiki/hooks/post-commit`。

### skill 版本

`SKILL.md` frontmatter 中维护 `version` 和 `last_updated`，方便检查各 agent 的 skill 是否过期。

## Git

这个 vault 用 Git 做版本管理。建议按有意义的批次提交笔记变化，让个人记忆库本身也有清晰历史。
