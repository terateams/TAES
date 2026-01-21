# 🤖 Agents: AI 角色库

> **E队 = 人 + Allied AI**
> 
> Allied AI 可以扮演不同角色，按需召唤。

---

## 📋 Agent 索引

本目录是 **Agent 角色的人类可读索引**。实际的 Agent 定义文件位于 `.github/` 下，供 GitHub Copilot 识别。

```
Agent 架构：
├── AI/Agents/           # 📚 人类可读索引（你在这里）
│   ├── README.md        #    Agent 总览
│   └── registry.md      #    完整角色清单
│
└── .github/             # 🤖 Copilot 识别（机器可读）
    ├── agents/          #    Agent 定义（Chat Agent）
    │   ├── taes.md      #    @taes TAES 教练
    │   └── issue-atp.md #    Issue ATP 模板
    └── skills/          #    Skill 定义
        └── Taes/        #    TAES 技能包
```

---

## 🎭 角色分类

### 核心角色

| 角色 | 代号 | 定位 | 场景 | 定义位置 |
|------|------|------|------|----------|
| 🎯 TAES 教练 | `@taes` | 框架守护者 | TAES 审查、CLEAR 验证、ICE 追踪 | `.github/agents/taes.md` |
| 🧑‍🏫 企业导师 | `@mentor` | 资深管理者 | 职业发展、战略思考 | (内置角色) |
| 👥 同学 | `@classmate` | 学习伙伴 | 头脑风暴、互相监督 | (内置角色) |

### 创作团队 (Story Team)

| 角色 | 代号 | 定位 | 场景 |
|------|------|------|------|
| ✍️ 编剧 | `@screenwriter` | 创意写作专家 | 故事大纲、章节撰写、对白设计 |
| 🎬 导演 | `@director` | 视觉与叙事统筹 | 场景构建、节奏把控、分镜描述 |
| 🧐 批评家 | `@critic` | 文学评论家 | 逻辑漏洞检查、文风评估 |
| 📚 档案员 | `@archivist` | 设定集管理者 | 角色小传、世界观一致性 |

### 技术团队

| 角色 | 代号 | 定位 | 场景 |
|------|------|------|------|
| 👨‍💻 技术专家 | `@tech` | 技术大牛 | 架构设计、代码审查 |
| 📋 项目经理 | `@pm` | 规划协调 | 项目规划、进度管理 |
| 📦 产品经理 | `@product` | 需求分析 | 功能设计、用户体验 |
| 🎨 设计师 | `@design` | UI/UX 专家 | 界面设计、视觉优化 |
| 🧪 测试工程师 | `@qa` | 质量保障 | 测试用例、Bug 分析 |

### 职能支持

| 角色 | 代号 | 定位 | 场景 |
|------|------|------|------|
| 📈 运营专家 | `@ops` | 增长运营 | 用户增长、活动策划 |
| 👔 HR专家 | `@hr` | 人力资源 | 招聘、绩效、团队建设 |
| 💰 财务顾问 | `@finance` | 财务分析 | 预算、成本、投资回报 |
| ⚖️ 法务顾问 | `@legal` | 法律合规 | 合同审查、法律风险 |

---

## 🚀 使用方式

### 方式一：直接召唤（推荐）

在 Copilot Chat 中直接使用 `@agent` 语法：

```
@taes 请检查这个功能应该放在哪个菜单下
```

### 方式二：角色扮演

描述问题时指定角色：

```
请以企业导师的身份，帮我分析这个问题：...
请以产品经理的身份，帮我梳理这个需求：...
```

---

## 📐 Agent 定义规范

### 已定义 Agent

| Agent | 定义文件 | Skill 文件 | 状态 |
|-------|----------|------------|:---:|
| @taes | `.github/agents/taes.md` | `.github/skills/MAR/SKILL.md` | ✅ |
| @issue-atp | `.github/agents/issue-atp.md` | - | ✅ |

### 新增 Agent 流程

1. **创建定义文件**：`.github/agents/{agent-name}.md`
2. **（可选）创建 Skill**：`.github/skills/{AgentName}/SKILL.md`
3. **更新索引**：本目录 `registry.md`
4. **更新说明**：`.github/copilot-instructions.md`

---

## 🔗 相关资源

| 资源 | 位置 | 说明 |
|------|------|------|
| Agent 完整清单 | [registry.md](registry.md) | 所有 Agent 的详细配置 |
| Copilot 全局指令 | [.github/copilot-instructions.md](../../.github/copilot-instructions.md) | 项目级 Copilot 配置 |
| TAES Agent 详情 | [.github/agents/taes.md](../../.github/agents/taes.md) | TAES 教练完整定义 |
| MAR Skill | [.github/skills/MAR/SKILL.md](../../.github/skills/MAR/SKILL.md) | MAR 协作技能包 |
| CLEAR Skill | [.github/skills/CLEAR/SKILL.md](../../.github/skills/CLEAR/SKILL.md) | AM 五要素定义框架 |
| ICE Skill | [.github/skills/ICE/SKILL.md](../../.github/skills/ICE/SKILL.md) | 执行追踪三要素框架 |

---

*更新时间: 2026-01-19*
