---
title: AI 记忆 Wiki 产品构思
created: 2026-07-05
type: note
tags:
  - notes
  - product
  - ai
  - memory-wiki
aliases:
  - mywiki 产品构思
  - AI 第二大脑产品
related:
  - "[[Home]]"
  - "[[Wiki/Projects/nanochat]]"
  - "[[Memory/Summaries/conversation_notes_pytorch_nn_basics_2026-07-05|PyTorch nn.Module 基础概念学习会话]]"
---

# AI 记忆 Wiki 产品构思

## 一句话定位

一个 **local-first、AI 驱动、自动整理** 的个人记忆 wiki 服务。把散落在各处的 AI 对话、阅读资料、想法草稿，自动沉淀为可查询、可回顾的结构化知识库。

## 要解决的问题

- AI 对话聊完就丢，没有长期记忆。
- 聊天记录、网页剪藏、读书笔记分散在多个工具里。
- 手动整理笔记太耗时，wiki 容易变成“笔记坟墓”。
- 现有笔记软件大多只是“带 AI 对话框的编辑器”，没有真正的自动化流水线。

## 目标用户

1. **AI 重度用户**：每天和多个 AI 工具对话，希望对话成果被保留。
2. **终身学习者**：阅读、学习、做项目，需要把碎片信息变成系统知识。
3. **开发者/研究者**：需要维护自己的技术知识库和项目上下文。
4. **小团队**：共享项目记忆和决策记录。

## 核心功能

### 1. 自动导入（Sources）

从多种来源自动抓取原始记忆：

- AI 对话：ChatGPT、Claude、Kimi、豆包等导出文件或 API。
- 阅读资料：Readwise、Raindrop、Hypothesis、Kindle 标注。
- 聊天记录：微信、飞书、Slack（先以导出文件为主）。
- 本地文件：PDF、Markdown、图片、录音转文字。
- 浏览器剪藏：网页快照、划线高亮。

### 2. 自动分层整理（Pipeline）

```text
原始输入
    ↓
Memory/          # 原始捕获：对话原文、网页快照
    ↓  AI 摘要
Memory/Summaries/# 会话摘要、任务摘要
    ↓  AI 提取
Notes/           # 用户手动笔记、草稿
    ↓  AI 提炼 + 人工 review
Wiki/Concepts/   # 概念、方法、术语
Wiki/Projects/   # 项目上下文
```

### 3. 自动链接与索引

- 自动识别概念、人名、项目名，生成 `[[WikiLinks]]`。
- 维护 `Home.md`、目录 README、主题 MOC。
- 可选：用 embedding 做语义检索和相似推荐。

### 4. 基于 wiki 的问答

- `mywiki chat`：基于整个 vault 内容回答用户提问。
- “我之前是怎么理解 torch.compile 的？”
- “nanochat 项目里用了哪些优化？”

### 5. Local-first + 云同步

- 核心数据存在本地 Markdown vault。
- 云端只做同步中转和对象存储。
- 用户完全拥有数据，可随时导出、Git 管理。
- Obsidian 兼容，可直接作为 Obsidian vault 打开。

## 参考架构

```text
客户端（Desktop / Mobile / Web）
  ├── 本地 Markdown vault
  ├── 本地 SQLite / 向量索引
  ├── 同步引擎（增量同步）
  └── AI Agent（本地或调用云端代理）

        ↓ 仅同步变更

服务端（极轻）
  ├── 认证（Firebase Auth / Clerk）
  ├── 同步协调（Cloudflare Workers / 函数计算）
  └── 对象存储（OSS/COS/R2）
```

## 关键设计决策

| 决策 | 选择 | 理由 |
|---|---|---|
| 存储格式 | Markdown + YAML frontmatter | 可移植、Obsidian 兼容、AI 易读写 |
| 同步策略 | Local-first，增量同步 | 成本低、体验好、用户拥有数据 |
| AI 位置 | 混合：客户端直调 + 服务端代理 | 灵活，基础功能可用用户自带 key |
| 索引方式 | 本地 embedding + 可选云端 | 隐私优先，搜索召回强 |
| 收费锚点 | AI 调用量 + 云存储 | 存储成本可忽略，AI 是核心价值 |

## 借鉴 OpenWiki 的机制

- **Init / Update / Chat 命令抽象**：初始导入、增量更新、基于 wiki 问答。
- **锚点式增量更新**：记录上次处理位置，只处理新增内容。
- **内容快照**：避免无效更新和重复 API 调用。
- **Plan-before-Write**：Agent 先写临时规划，再执行写入。
- **严格 Prompt 纪律**：禁止重复创建概念、强制链接已有笔记、更新时不乱改无关内容。

## 定价思路

| 档位 | 价格 | 内容 |
|---|---|---|
| Free | ¥0 | 100MB 存储，手动笔记，基础搜索 |
| Plus | ¥25-30/月 | 1GB 存储，AI 摘要 200 次/月，语义搜索 |
| Pro | ¥58/月 | 10GB，无限 AI（限速），团队共享 |
| Team | ¥128/人/月 | 无限，API，SSO，审计日志 |

**成本估算（1 万用户，人均 200MB）**：
- 对象存储：约 ¥240/月
- 请求/流量：约 ¥180/月
- Serverless + 认证：约 ¥100/月
- AI 成本：按调用量，为主要变量
- **人均边际成本：约 ¥0.05/月**

## 待验证问题

1. 用户是否愿意为一个“自动整理 AI 对话”的工具付费？
2. 各 AI 平台是否开放足够的导出/API 能力？
3. 自动提取的 concept 准确率能达到多少？
4. 本地 embedding 在 10 万篇笔记量级是否还流畅？
5. 多设备同步的冲突解决策略哪种最合适？

## 下一步行动

1. 做一个最小 CLI 原型：`mywiki init`、`mywiki update`、`mywiki chat`。
2. 实现 ChatGPT/Claude 导出文件的 parser。
3. 跑通“对话 → 摘要 → concept → Wiki”的第一条流水线。
4. 用真实对话数据测试整理质量和查询召回率。

## 相关

- [[Home]]
- [[Wiki/Projects/nanochat]]
- [[Memory/Summaries/conversation_notes_pytorch_nn_basics_2026-07-05|PyTorch nn.Module 基础概念学习会话]]
- [[Memory/Summaries/conversation_notes_nanochat_basics_2026-07-05|nanochat 代码基础学习会话]]
