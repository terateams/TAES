
# TAES Framework（pronounced “Tays”）

> **方法论全称**：TeamsCamp **A**ugments **E**dgeTeams **S**cale
> 
> **TAES 口号**：協力營托举E队——AI真干活
>
> **MAR 口号**：AI 托举执行，Mission 由你驾驭
>
> 这不是未来。这是 2026。

```
┌─────────────────────────────────────────────────────────┐
│  TAES — 组织层（谁托举谁）                               │
│  "協力營托举E队——AI真干活"                              │
├─────────────────────────────────────────────────────────┤
│  MAR — 任务层（怎么托举）                                │
│  "AI 托举执行，Mission 由你驾驭"                        │
├─────────────────────────────────────────────────────────┤
│  共享时代锚点                                           │
│  "这不是未来。这是 2026。"                              │
└─────────────────────────────────────────────────────────┘
```

> **洞见**：TAES 回答"谁托举谁"，MAR 回答"怎么托举"，两者是洞见的递进。

> 版本：v2.7 | 更新日期：2026-01-19 | 维护者：yangjun@EdgeTeams.ai

---

## 战略文件索引

| 文件 | 内容 | 读者 |
| :--- | :--- | :--- |
| [TAES-Market-2026.md](./TAES-Market-2026.md) | 2026 年 AI 企业服务格局、竞争分析、风险矩阵 | 投资人、战略决策者 |
| [TAES-Core-Insights.md](./TAES-Core-Insights.md) | TAES 核心洞见评估、护城河分析、定位修正 | 创始团队、产品经理 |
| [TAES-ChinaJapan-Strategy.md](./TAES-ChinaJapan-Strategy.md) | 中日市场策略、产品架构、客户画像、GTM 路线图 | BD、运营、教育合作 |

---

## 战略定位

### 我们解决什么问题？

**E队（客户团队）面临两个核心障碍：**

1. **到不了** — 物理/合规上无法访问全球 AI 服务
2. **用不起** — 经济/技术上无法负担顶级 AI 能力

**T营（協力營）的价值主张：**

> 通过 **托举效应**，让 E队 在有限预算内获得"原本不可及"的 AI 能力，  
> 使 **人的判断力 × AI 的执行力** 成为可能。

### 商业模式一句话

```
T营 持有基础设施 → 托举 E队 使用 AI → E队 产出 Mission 交付物 → 价值闭环
```

### TeamsEdge 是什么？

> **TeamsEdge** 是 T营 的**协力软件**——承载"T营 协力 E队"这一关系的数字化平台。

---

## 深层洞见：MAR × TAES 架构统一

> **版本**: v1.0 | **新增日期**: 2026-01-19

### 元洞见：两个公式，一个真相

```
E=MC²AI (MAR 架构公式)     ←→     TAES (组织运营公式)
    ↓                                  ↓
  "如何组织一个仓库"              "如何经营一个组织"
    ↓                                  ↓
  技术架构层面                    商业模式层面
```

**真相**：两个公式描述的是**同一个价值创造过程的两个视角**：
- E=MC²AI 回答 "**一个任务如何被完成？**"（微观）
- TAES 回答 "**一个组织如何持续运转？**"（宏观）

| 层面 | E=MC²AI 视角 | TAES 视角 |
|------|-------------|-----------|
| **主体** | Mission（任务） | EdgeTeams（团队） |
| **基础设施** | C¹ + C² | A（托举效应） |
| **产出** | E（赋能） | S（增长飞轮） |
| **持有方** | Repo 归属 | T营（協力營） |

### 结构洞见：分形架构

MAR 目录结构呈现**分形特征**——每一层都在重复相同的模式：

```
MAR 顶层          CONTEXT 二层        TAES 方法论
─────────        ────────────       ───────────
M (MISSION)      Who (Players)      Framework (方法)
C¹ (CONNECTION)  Why (Story)        Strategy (战略)
C² (CONTEXT)     When/Where (Times) TeamsEdge (系统)
AI (AI)          How (TAES)    ←→   QC (验收)
E (Teams)            ↑               ↑
                     │               │
                 3W+1H 完整结构     同构映射
```

**洞见**：CONTEXT 目录采用 **3W+1H 结构**：
- **Who**：Players（谁参与）
- **Why**：Story（为什么做）
- **When/Where**：Times（时空约束）
- **How**：TAES（怎么做）← 方法论层

### 流程洞见：双向数据流

```
┌─────────────────────────────────────────────────────────────────┐
│                      价值创造流（顺流）                          │
│  C¹ → C² → AI → M → E                                          │
│  连结 → 语境 → 智能 → 使命 → 赋能                               │
│                                                                  │
│                      能力沉淀流（逆流）                          │
│  E → Metrics → Eval → TAES → (下一个 M)                        │
│  产出 → 度量 → 验收 → 方法论 → 新任务                           │
└─────────────────────────────────────────────────────────────────┘
```

MAR 架构完整支撑这个双向流：

| 流向 | 目录路径 | 作用 |
|------|----------|------|
| **顺流** | CONNECTION → CONTEXT → AI → MISSION → Teams | 价值生产 |
| **逆流** | Teams/Metrics → AI/Eval → CONTEXT/TAES → (新 MISSION) | 能力积累 |

### 边界洞见：五层边界模型

| 边界层 | 目录 | 边界定义 | 违反后果 |
|:---:|------|----------|----------|
| **L0** | `MAR/` 根 | 一个 MAR = 一个 Mission | 多任务混杂，无法验收 |
| **L1** | `MISSION/` | 工作区，不是交付区 | 草稿污染产出 |
| **L2** | `Teams/` | 只存"已完成"的交付物 | 过程垃圾堆积 |
| **L3** | `CONNECTION/` | 基础设施，不是业务逻辑 | 架构层级混乱 |
| **L4** | `CONTEXT/` | 语境输入，不是执行输出 | AI 上下文污染 |

### 托举洞见：乘法关系的物理本质

```
托举效应 = Workplane (bit) × AITa (Token)
         = 网络可靠 × AI可用
         = 0.99 × 0.99 = 0.98  (可用)
         = 0.99 × 0.00 = 0.00  (不可用) ← 乘法陷阱！
```

**物理类比**：

| 类比 | E=MC²AI | TAES | 目录 |
|------|---------|------|------|
| 导线+电源 | C¹ (Connection) | Workplane + AITa | `CONNECTION/` |
| 负载参数 | C² (Context) | 3W+1H 语境 | `CONTEXT/` |
| 控制器 | AI (Allied AI) | 智能中枢 | `AI/` |
| 电器 | M (Mission) | 被托举的任务 | `MISSION/` |
| 输出 | E (Empower) | 价值产出 | `Teams/` |

**洞见**：这解释了为什么 CONNECTION 必须在 CONTEXT 之前——**没有导线和电源，负载参数再精确也无用**。

### 进化洞见：Allied AI 的五阶段

```
2023 (能用) → 2024 (好用) → 2025 (普惠) → 2026 (融合) → 2027 (托举)
    ↓            ↓             ↓            ↓            ↓
 听指令        快迭代        边际成本↓    主动理解    自主发现
    ↓            ↓             ↓            ↓            ↓
 写prompt      定方向        人人可用    表达意图    决策验收
```

**当前位置**（2026 年 1 月）：**融合阶段**
- AI 主动理解 Context，补全意图
- 人只需表达"想要什么"，不需要写完美的 prompt
- **E队 = 人 + Allied AI = 新的组织单元**

### 飞轮洞见：S 的三层递进

```
┌─────────────────────────────────────────────────────────────┐
│  1️⃣ Mission 飞轮（价值层）                                  │
│     发掘 AM → 用 Repo 实现 → 加速完成 + 提升品质            │
│                                    ↓                        │
├─────────────────────────────────────────────────────────────┤
│  2️⃣ 能力飞轮（学习层）                     驱动力传递       │
│     不断尝试 → 队员 AI 能力 ↑ + E队 协同力 ↑               │
│                                    ↓                        │
├─────────────────────────────────────────────────────────────┤
│  3️⃣ 规模飞轮（扩展层）                                      │
│     能力沉淀 → 实践规模扩展 → 回归更多 AM                   │
│                       └──────────────────────┘              │
└─────────────────────────────────────────────────────────────┘
```

| 飞轮 | 驱动力 | 产出 | MAR 落地 |
| :--- | :--- | :--- | :--- |
| **Mission** | AM 完成率 | 交付物 + 客户价值 | `Teams/Artifacts/` |
| **能力** | 实践频次 | 团队成长 + 方法论 | `AI/Eval/` + `CONTEXT/` |
| **规模** | 能力复用 | 更多 E队 + 更多 AM | `Teams/Metrics/` |

### 核心结论

> **MAR 是一个"价值操作系统"**——它不仅仅是文件夹结构，而是一个**可执行的价值创造引擎**。
> 
> - **E=MC²AI** 是它的**内核公式**
> - **TAES** 是它的**运营方法论**
> - **3W+1H** 是它的**语境框架**
> - **CLEAR+ICE** 是它的**执行协议**
> - **S 飞轮** 是它的**增长引擎**

---

## 快速导航

| 读者 | 推荐章节 |
| :--- | :--- |
| **业务决策者** | §0 术语定义 → §1 一句话定义 → §7 适用场景 → §8 定位句 |
| **项目经理** | §4 落地路径 → §5 交付物清单 → §6 指标体系 |
| **AI 工程师** | §9 工程化规范 → [MR Playbook](../MR%20playbook.md)（完整规范） |
| **投资人** | §8.4 VC 视角 → 附录：理论依据 |
| **一线执行者** | §0 TAES 作业方式 → [MR Playbook](../MR%20playbook.md) |

---

## 0) 术语定义（Glossary）

> 📋 **知识产权完整定义**: 商标、方法论 IP、品牌资产等详见 [IP playbook](../Issue/IP%20playbook.md)

### 注册商标

| 术语 | 中文商标 | 英文商标 | 字体规范 | 定义 |
| :--- | :--- | :--- | :--- | :--- |
| **協力營** | 協力營 ®️ | TeamsCamp ®️ | **繁体** | 经营主体。整合资源后为 E队 提供服务的平台。 |
| **E队** | E队 ®️ | EdgeTeam ®️ | **简体** | 客户。接受協力營托举的团队单元。 |

### 公司主体

| 名称 | 域名 | 定位 |
| :--- | :--- | :--- |
| **元協力營** | EdgeTeams.ai | 協力營旗下负责 TAES 方法论研发与交付的运营实体。 |

### 核心术语

| 术语 | 中文 | 定义 | 备注 |
| :--- | :--- | :--- | :--- |
| **TAES** | — | TeamsCamp Augments EdgeTeams Scale 的缩写。一套可验收的 AI 原生增长交付方法论。 | 方法论 IP（详见 [IP playbook](../Issue/IP%20playbook.md)） |
| **Mission** | 任务 | 一个满足五要素（输入、输出、验收、AI 可介入、范围约束）的工作单元，其产出可被 AI 生成或辅助生成。Mission 是 E队 在 Scale 路径上的成长步骤。 | 详见 [Mission playbook](../Issue/Mission%20playbook.md) |
| **Mission Repo (MR)** | 任务仓库 | 一个 Mission = 一个 GitHub Repo。MR 是 TAES 的核心执行载体，定义了 Intent/Constraints/Evidence 的存放结构与协作规范。详见 [MR Playbook](../MR%20playbook.md)。 | 方法论（可独立使用） |
| **Scale** | 成长 | E队 的双维度成长：①Mission 完成质量 ②AI 协同能力成长。两者形成飞轮效应。 | 详见 §6 Layer 4 指标 |
| **Augment** | 托举 | 口语表述为 Lift。托举效应 = 网络可靠（bit）× AI可用（Token），乘法关系，缺一则归零。 | TAES 四字之 A，详见 [Augment.md](Framework/Augment.md) |
| **AITa** | AI托管 | Allied AI 托管服务。LLM 特性传承 · 常年支付稳定 · 季度能力更新。 | A 的核心组件 |
| **Workplane** | 工作平面 | 合规网络通道。IPv6/56 固定出口 · SLA 保障 · 7×24 运维。 | A 的基础设施 |

> 💡 **内部术语"装备"**: 仅限内部使用，对外统一用 Package/交付物 表述。详见 [IP playbook §5](../Issue/IP%20playbook.md)

### ICE 三要素（任务执行框架）

| 要素 | 含义 | TeamsEdge 落地 | 验证问题 |
| :---: | :--- | :--- | :--- |
| **I** | Intent（意图） | EdgeTeams > Mission > MISSION.md | "要做什么？" |
| **C** | Constraints（约束） | Augment > Workplane + AITa | "边界在哪？" |
| **E** | Evidence（证据） | Foundry > Artifacts + AI Intelligence | "怎么证明？" |

### Mission 的五要素

> 📋 **完整定义**: Mission 五要素、状态流转、ICE 框架、实战案例详见 [Mission playbook](../Issue/Mission%20playbook.md)

| # | 要素 | 说明 |
| :-- | :--- | :--- |
| 1 | **明确输入** | 有清晰的任务描述与上下文 |
| 2 | **预期输出** | 产出物是具体的（文档/代码/数据） |
| 3 | **验收标准** | Pass/Fail 可判定的条件 |
| 4 | **AI 可介入** | 产出类型在 AI 能力范围内 |
| 5 | **范围约束** | 时间/规模/依赖的明确边界 |

> **理论依据**：整合 SMART (Doran, 1981)、WBS 80-hour Rule (PMI/DoD)、INVEST (Bill Wake, 2003) 的核心原则。

### TAES 前提条件（Prerequisites）

> 不满足以下前提的场景，不适用 TAES 方法论。

| 前提 | 说明 |
| :--- | :--- |
| **Repo 驱动** | 所有任务必须以 GitHub Repo 为载体（Mission Repo） |
| **Copilot 协同** | AI 执行层默认为 GitHub Copilot（VS Code 工作台） |
| **Markdown 操作语言** | Intent/Constraints/Evidence 均以 Markdown 格式定义 |

### 品牌释义：元協力營

> **元協力營** = AI 原生时代的协同赋能团队经营平台（協力營的品牌释义）

| 字 | 释义 | 英文对照 | 补充说明 |
| :--- | :--- | :--- | :--- |
| **元** | AI 原生 | AI Native | **Markdown 是 AI 原生的语言**。LLM 的训练语料、Prompt 模板、System Instructions、VS Code/Copilot 工作流均以 Markdown 为核心载体。Markdown 是 TAES 方法论的操作语言。 |
| **协** | AI 协同 | AI Collaboration | **特指 GitHub Copilot 范式**。我们选择 VS Code + Copilot 作为唯一协同路径，而非豆包/Perplexity/其他 AI 工作方式。理由见下。 |
| **力** | AI 赋能（含算力/工具/方法） | AI Empowerment | **实打实的算力配额**：協力營为每个 E隊 提供至少 3 × $150/月 Azure 订阅（合计 $450/月）。按 2025.01 市场现状，相当于一个顶级 AI 工程师的算力配额。详见下方说明。 |
| **營** | 团队经营 | Team Operations | **「營」的字面含义**：本义为"军营/营地"（Camp/Encampment），引申为"可组织化运行的作业单元/经营单元"。**落地方式**：E隊的每个 Mission 对应一个 GitHub Repo，所有 Repo 归属于该 E隊 的 GitHub Org。AI Agent 在 Repo 边界内工作，形成可审计的经营体系。详见下方说明。 |

#### Allied AI（协同 AI）定义

> **在特定 Mission 上，产出质量和效率达到或超越同岗位人类平均表现的 AI。**

| 指标 | 基线要求 | 判定方式 |
| :--- | :--- | :--- |
| **质量** | Mission 验收通过率 ≥ 人类基线 | E队 验收 |
| **效率** | 完成时间 ≤ 人类基线 × 0.5 | 时间戳记录 |

**协同分工原则：**
- 👤 **人负责**：意图定义、边界判断、验收决策
- 🤖 **AI负责**：批量执行、模式识别、草稿生成
- 🤝 **协同价值** = 人的判断力 × AI 的执行力

**季度评估机制：**
- Frontier Model 约 6 个月发布重大版本（能力提升 20%+）
- T营 每季度评估更新订阅组合，确保 E队 使用"当季最强"
- 当前参考：Claude Opus / GPT-4o / Gemini Ultra

#### 为什么选择 GitHub Copilot 范式？

> 每种 AI 工作方式都有价值，但 TAES 只选一条路——因为深耕才能形成差异化协同力。

| 路径 | 代表 | 特点 | 为什么不选 |
| :--- | :--- | :--- | :--- |
| **对话问答** | Perplexity、ChatGPT Web | 知识检索/问答导向 | 缺少"资产沉淀"与"证据链"能力 |
| **文档生成** | 豆包、Notion AI | 内容创作/文档辅助 | 缺少"代码级治理"与"Repo 驱动"能力 |
| **IDE 协同** | GitHub Copilot + VS Code | 代码/文档/执行一体化 | ✅ **我们选择这条路** |

**我们选择 GitHub Copilot 范式的理由：**

1. **Repo 驱动**：所有 Intent/Constraints/Evidence 天然落地到 GitHub Repo，可审计、可版本化、可协作。
2. **执行一体化**：VS Code 既是编辑器也是执行台，Mission → AI 生成 → Eval → 留痕在同一工作流闭环。
3. **我们的协同力**：在这条路径上，協力營能提供 **Workplane（网络托举）+ Repo 资产化（协议交付）+ Copilot 最佳实践** 的完整能力栈。

> **结论**：不是其他方式不好，而是我们选择在 Copilot 范式上深耕，形成不可替代的协同交付力。

#### "力"的量化承诺：$450/月 算力配额

> 協力營为每个 E隊 提供的不是"概念"，而是实打实的算力资源。

| 项目 | 配置 | 说明 |
| :--- | :--- | :--- |
| **Azure 订阅数量** | ≥ 3 个 | 每个 E隊 至少 3 个独立订阅 |
| **单订阅额度** | $150/月 | Azure Credit（可用于 OpenAI/Copilot/Compute） |
| **合计** | **$450/月** | 每个 E隊 的算力底座 |

**$450/月 意味着什么？（2025.01 市场参考）**

- 相当于 **一个顶级 AI 工程师的算力配额**（GPT-4/Claude API 调用 + Azure Compute）
- 足以支撑：日常 Copilot 使用 + 中等规模 LLM API 调用 + CI/CD 算力 + 小型 AI 实验
- 配合 Workplane 网络托举，确保算力资源在中国大陆可稳定访问

> **结论**："力"不是口号，而是具体的算力，是協力營对 E隊 的硬性资源承诺。

#### "營"的落地方式：Mission Repo

> 团队经营不是抽象概念，而是"一个 Mission = 一个 Repo"的具体实践。AI Agent 在 Repo 边界内协作，形成可审计的任务交付单元。

**核心规则：**

| 规则 | 说明 |
| :--- | :--- |
| **一队一 Org** | 每个 E隊 拥有自己的 GitHub Organization |
| **一任务一 Repo** | 每个 Mission 对应一个独立 Repo |
| **资产归属清晰** | 所有 Repo 归属于该 E隊 的 Org，不混放 |

**AI Agent 如何参与团队经营？**

| 层级 | 作用 | 说明 |
| :--- | :--- | :--- |
| **Repo** | Agent 的工作空间 | AI Agent（Copilot/自定义 Agent）在 Repo 内读取 Context、执行任务、输出 Evidence |
| **Org** | Agent 的边界 | E隊 的 GitHub Org 是权限与审计边界，Agent 只能在授权 Repo 内操作 |
| **Mission** | Agent 的任务单元 | 每个 Repo 是一个独立、可验收、可复制的任务交付单元 |

**Mission Repo 的典型结构：**

```
Mission-Repo/
├── MISSION.md          # 任务宣言（Intent）
├── README.md           # 架构说明
├── .github/
│   └── copilot-instructions.md  # AI 约束注入
├── MISSION/            # 执行工位
│   ├── outline/        # 骨骼
│   ├── chapters/       # 血肉
│   ├── docs/           # 文档
│   └── assets/         # 资产
├── CONTEXT/            # 语境容器
├── AI/                 # 智能中枢
└── Teams/              # EdgeTeams 交付
```

> **结论**："營"不是组织架构图，而是 **GitHub Org + Mission Repo** 的经营体系——AI Agent 有边界、可审计地为 E隊 工作。

#### 为什么 Markdown 是 AI 原生语言？

> 以下观点基于 2025 年 AI 工程实践共识。

1. **LLM 的母语**：主流 LLM（GPT-4、Claude、Gemini）的训练语料中，Markdown 占比极高（GitHub、技术文档、博客）。
2. **Prompt 工程标准格式**：System Instructions、Context 文件（如 `copilot-instructions.md`）、Spec/Mission 定义全部采用 Markdown。
3. **LLM 默认输出格式**：AI 生成内容天然使用 Markdown 结构（标题、列表、代码块、表格）。
4. **VS Code + Copilot 工作流核心**：`.md` 文件是任务定义、约束注入、证据留痕的统一载体。
5. **GitHub Repo 入口协议**：README.md 是 AI 理解项目的第一入口。

> **结论**：采用 Markdown 不是"格式偏好"，而是"与 AI 对齐的表达方式"。TAES 将 Markdown 作为操作语言，是 AI Native 方法论的必然选择。

### TAES 作业方式综述

TAES 本质是一种 **AI 原生的作业方式**：

- **工作台**：VS Code（VSC）
- **标的物**：GitHub Repo
- **执行者**：AI（Copilot 为默认执行层）
- **交付物**：可审计、可复制、可销售的协作协议资产

### TAES 四字映射总览

| 字母 | 角色 | TeamsEdge 菜单 | 核心职责 |
| :---: | :--- | :--- | :--- |
| **T** | TeamsCamp（協力營） | 2. TeamsCamp | 资源持有方：合同主体、算力池、授权分发 |
| **A** | Augment（托举） | 3. Augment | 能力放大器：网络可靠 × AI可用 |
| **E** | EdgeTeams（E队） | 1. EdgeTeams | 价值创造方：团队、角色、Mission、交付 |
| **S** | Scale（增长） | 4-7 菜单 | 增长飞轮：交付 → 认知 → 结算 → 度量 |

> **关键洞察**：T 和 E 是组织实体，A 是连接两者的能力桥梁，S 是价值度量。

---
## 1) One-line Definition（一句话定义）

**TAES is a measurable delivery methodology for AI-native scale.**
It standardizes how organizations turn **Intent** into execution, enforce **Constraints**, and retain **Evidence**—across a compliant **Workplane** and a repo-driven **VSC/GitHub execution stack**.

> 中文：TAES 是一套可验收的 AI-Native 增长交付方法论。它将“意图-约束-证据”工程化，并通过 Workplane 与 Repo/Workbench 体系形成可复制交付。

---

## 2) Why TAES（为什么需要 TAES）— 管理范式升级

### From managing “people doing work” → to managing “work execution system”

TAES 将管理对象从过程管理转向三要素治理：

* **Intent**：目标写成可执行 Specs（Repo）
* **Constraints**：红线写成可执行 Guardrails（Workplane/VSC）
* **Evidence**：运行时默认留痕 Logs（Repo）

> 结论：企业不是在“引入AI工具”，而是在“升级默认执行层”。

---

## 3) What TAES Is（TAES 是什么）— 双重托举的架构模型

### TAES Core Equation（核心公式）

**Scale = (Workplane Connectivity × Repo/Workbench Execution) ^ AI Compute**

TAES 由两大 “Augmentation” 维度构成：

### Dimension 1 — Workplane (Network Augmentation)

**A compliant, low-latency execution plane for AI access.**

* 日本原生 IP / Azure Private Link / 合规链路
* 解决：阻断、延迟、数据权限、跨域合规
* 输出：稳定可用的 AI 执行底座

### Dimension 2 — Repo/Workbench (AI-Native Augmentation)

**A repo-driven execution system where AI is the default executor.**

* GitHub：资产库（Specs / Evals / Policies / Evidence Logs）
* VS Code/Copilot：执行台（Mission → AI生成 → Eval → 留痕）
* 输出：可销售、可复制、可审计的“协作协议资产”

---

## 4) How TAES Works（如何落地）— 三大里程碑

> TAES 采用"1 月 → 1 季度 → 1 年"的渐进式落地节奏，确保 E隊 从"上手"到"普及"。

### 里程碑 1：1 个月 — 上手 · 交付

**目标**：跑通第一个 Mission，证明 TAES 可用。

| 周次 | 主题 | 交付物 | 验收标准 |
| :--- | :--- | :--- | :--- |
| **Week 1** | Intent（意图） | Mission.md + 任务分解 | 任务描述清晰，AI 可执行 |
| **Week 2** | Constraints（约束） | Workplane 可用 + 权限边界 | 网络稳定、Copilot 可访问 |
| **Week 3** | Evidence（证据） | Eval 脚本 + 运行日志 | 产出可评测、日志可追溯 |
| **Week 4** | 闭环交付 | 第一个 Mission 完成 | Intent → Evidence 全流程跑通 |

**1 个月后你得到**：
- ✅ 可用的 AI 执行底座（网络 + 算力）
- ✅ 第一个 Mission Repo（可复制模板）
- ✅ 指标基线（交付周期、通过率初始数据）

---

### 里程碑 2：1 个季度 — 会用 · 成功案例

**目标**：团队掌握 TAES 方法，产出可对外展示的成功案例。

| 月份 | 主题 | 交付物 | 验收标准 |
| :--- | :--- | :--- | :--- |
| **Month 2** | 复制与扩展 | 3+ Mission Repo | 模板复用、团队成员能独立创建 |
| **Month 3** | 质量提升 | Eval 覆盖率 ≥ 80% | 自动化评测、人工抽检机制运转 |
| **Quarter End** | 成功案例 | 1 个可对外展示的案例 | 有量化数据（效率提升 / 成本节省） |

**1 个季度后你得到**：
- ✅ 团队会用：≥ 3 人能独立使用 TAES 完成任务
- ✅ 方法固化：有标准模板、有评测机制、有复盘节奏
- ✅ 成功案例：可对外讲述的"AI 如何帮我们提效"故事

---

### 里程碑 3：1 年 — 能用 · 能普及

**目标**：TAES 成为团队默认工作方式，可向其他团队/组织输出。

| 季度 | 主题 | 交付物 | 验收标准 |
| :--- | :--- | :--- | :--- |
| **Q2** | 规模化 | 10+ Mission Repo | 覆盖团队主要业务场景 |
| **Q3** | 可审计 | 证据链完整合规 | Evidence Schema 100% 合规、可通过审计 |
| **Q4** | 可输出 | TAES 能力包 | 可培训其他团队、可对外销售/咨询 |

**1 年后你得到**：
- ✅ 能用：TAES 是团队默认工作方式，不再需要"推动"
- ✅ 能普及：有能力向其他 E隊 / 组织输出 TAES 方法论
- ✅ 可量化 ROI：有完整的效率提升 / 成本节省数据

---

### 三大里程碑总览

| 里程碑 | 时间 | 关键词 | 核心验收 |
| :--- | :--- | :--- | :--- |
| **M1** | 1 个月 | 上手 · 交付 | 第一个 Mission 跑通 |
| **M2** | 1 个季度 | 会用 · 成功案例 | 团队掌握方法 + 可展示案例 |
| **M3** | 1 年 | 能用 · 能普及 | 默认工作方式 + 可对外输出 |

---

## 5) TAES Delivery Artifacts（交付物清单）— 客户“摸得着”的验收件

> 对外统一口径：本章使用 **Package/交付物** 表述；内部口语可称“装备”（例如网络装备/执行装备/证据装备/算力装备），但不进入对外材料与客户沟通。

### A. Workplane Package（网络托举交付）

* 可用性与延迟报告（p95/p99）
* 合规路径说明（访问/路由/权限）
* 门禁与拦截策略配置证明

### B. Mission Repo Package（协议资产交付）

* **Specs**：Mission.md + 指令模板
* **Evals**：自动化评测集
* **Policies**：协作红线/权限策略/脱敏策略
* **Evidence Logs**：默认留痕与审计证据链

### C. Workbench Package（执行台交付）

* VS Code Workspace 配置
* Copilot Workspace 使用路径
* 角色化使用说明（Owner / Architect / Auditor）

---

## 6) TAES Metrics（可量化指标体系）— Scale 不是口号

### Layer 1：Workplane Connectivity

* Uptime（可用性）
* Latency（p95/p99）
* Block Rate（阻断率）
* Compliance Events（合规事件）

### Layer 2：AI Execution Quality

* Spec Quality（规范质量评分）
* Eval Coverage（评测覆盖率）
* AI Adoption Rate（采纳率）
* Evidence Completeness（证据完整率）

### Layer 3：Business Scale Outcomes

* Lead Time Reduction（交付周期缩短）
* Success Rate（任务成功率）
* Boundary Interception Rate（越界拦截率）
* ROI（节省工时/减少返工/产出提升）

### Layer 4：AI Contribution（AI 贡献度）— 核心

> **核心问题**：AI 在 Mission 中贡献了什么？

| 指标 | 定义 | 目标 | 说明 |
| :--- | :--- | :--- | :--- |
| **AI Contribution Rate** | AI 生成内容占最终交付物的比例 | ≥ 60% | 可通过 Git diff 分析 |
| **First-Pass Acceptance** | 首次提交即通过验收的比例 | ≥ 70% | 衡量 AI 产出的精准度 |
| **Iteration Rounds** | 从首次产出到验收通过的平均迭代轮次 | ≤ 3 | 越少 = AI 理解越准确 |
| **Human Intervention Rate** | 需要人工处理的环节 / 总环节 | ≤ 30% | 越低 = AI 自主能力越强 |

**为什么 Layer 4 是核心？**

- Layer 1-3 衡量的是"任务是否完成"、"效果如何"
- Layer 4 衡量的是"AI 贡献了什么"——这是 TAES 区别于传统方法论的核心
- **如果 AI Contribution Rate 很低，说明 E隊 还在用传统方式工作，TAES 没有真正落地**

### E隊 双维度 Scale 飞轮

> E隊 的 Scale 有两个维度同时发展：Mission 完成质量 + AI 协同能力成长。

```
┌─────────────────────────────────────────────────────┐
│                    E隊 Scale 飞轮                    │
│                                                     │
│   ┌─────────────────┐       ┌───────────────────┐   │
│   │ Mission 完成质量 │ ────→ │ AI 协同经验积累    │   │
│   │ (Layer 3 指标)   │       │ (模板/最佳实践)   │   │
│   └─────────────────┘       └───────────────────┘   │
│          ↑                          │               │
│          │                          ↓               │
│   ┌──────┴──────────────────────────────────────┐   │
│   │        AI 贡献度持续提升 (Layer 4)           │   │
│   │        → 更高 First-Pass Acceptance          │   │
│   │        → 更低 Iteration Rounds               │   │
│   └─────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────┘
```

**飞轮效应**：完成 Mission → 积累经验 → AI 贡献度提升 → 更快完成下一个 Mission → 循环

---

## 7) Where TAES Fits（适用场景）— 客户为何会买

TAES 适合以下类型组织：

* **跨区域/跨境 AI 访问受限**（需要稳定合规 Workplane）
* **AI 从 POC 走向生产**（需要可审计证据链与约束）
* **研发/运营效率瓶颈明显**（需要可复制的协作协议）
* **合规/安全要求高**（金融、制造、跨国集团、研发密集型）

---

## 8) TAES Positioning（定位句）— 推荐你对外统一使用

> **TAES (pronounced "Tays") is TeamsCamp's measurable AI-native operating methodology — delivering compliant connectivity, repo-based protocols, and audit-ready evidence to scale EdgeTeams through three milestones: 1 month to onboard, 1 quarter to succeed, 1 year to scale.**

> 中文：**TAES 是協力營的可验收 AI 原生运营方法论——通过合规网络、Repo 协议资产与审计证据链，助力 E隊 在三大里程碑（1 月上手、1 季度成功、1 年普及）中实现增长。**

### 8.1 顶级产品经理怎么看（Moat 视角）

你这句内部小结：**“T營托举 E隊，AI 原生协同算力”**，在顶级产品经理语境里，通常会被拆成下面 5 个问题来审视：

**1) 你到底在卖什么？（核心价值主张）**

- 不是“买一个工具/买一个模型”，而是买一套 **默认执行层（Execution System）**：
  - **Workplane** 解决“能稳定合规地用”（连接性与访问）
  - **Repo/Workbench + VS Code/Copilot** 解决“能规模化交付”（把意图变成可执行资产）
  - **Evidence** 解决“能被管理与审计”（可追溯、可复用、可评测）

**2) 你的差异化是什么？（Why you, why now）**

- 市面上“AI”常见卖法是：模型能力、对话体验、单点提效。
- TAES 的卖法更像“企业级操作系统/作业方式”：把 **网络托举（Workplane）+ 协同范式（Copilot）+ 资产化（Repo）+ 量化验收（Eval/Evidence）** 打包成一个闭环。
- 这也解释了“托举”的双重含义：
  - **网络托举**：跨域/跨境可用且合规
  - **交付托举**：订阅/工作流/模板/协议让团队产出可复制

**3) 护城河在哪里？（Defensibility / Moat）**

- 顶级 PM 会希望你的护城河不是“我们更懂某个模型”，而是“复利资产 + 切换成本 + 运营飞轮”。TAES 的可讲护城河通常是：
  - **协议资产复利**：Mission 模板、Constraints、Eval Prompt、Golden Set、Evidence Schema 会越用越厚
  - **组织级切换成本**：一旦团队把工作拆成 Mission Repo，并形成评测与证据链，迁移到别的范式成本很高
  - **执行一致性**：同一套 VS Code/Copilot 工作流与规则，跨人/跨任务稳定复用
  - **底座绑定**：Workplane + 算力配额把“不确定可用性”变成“确定性供给”（对企业尤其关键）

**4) 你最脆弱的点是什么？（Risks）**

- **平台依赖风险**：Copilot/模型供应侧策略变化（价格、能力、配额、合规条款）
- **被误解为“外包/IT 资源”**：如果只讲网络和订阅，容易被压价；必须持续强调“可验收方法论 + 资产化交付”
- **行为改变成本**：从“聊天式 AI”迁移到“Repo 驱动执行系统”，需要训练与教练式落地

**5) 如何证明你不是口号？（Proof / Metrics）**

- 顶级 PM 会追问：你能不能用一套指标证明“托举”真的发生？
- 你在第 6 章的指标体系就是答案：Workplane 可用性/延迟、Eval 覆盖与通过率、Evidence 完整率、Lead Time/ROI 等。

> 一句话总结（PM 视角）：**TAES 的 moat 在于把“可用的 AI”做成“可管理的默认执行层”——连接性与算力是地基，Repo 协议资产与证据链是复利。**

### 8.2 对外产品化表述（可直接复制）

> 目标：把“協力營托举 E隊，AI 原生协同算力”翻译成客户/投资人/业务负责人能秒懂的说法。

**Slogan（中文）**

> **让 AI 变成团队的默认执行层，而不是聊天工具。**

**Slogan（英文）**

> **Turn AI into the default execution layer — not a chat tool.**

**30 秒电梯稿（中文）**

> TAES 不是卖模型，也不是做一次性顾问，而是把“网络可用性、协同范式、资产化交付、审计证据链”打包成可验收的执行系统。
> 我们用 Workplane 解决跨域/跨境 AI 的稳定合规访问，用 VS Code/Copilot + Repo 把任务变成协议资产，用 Eval/Evidence 让产出可评测、可追溯、可复制。
> 结果是：1 个月跑通交付，1 个季度形成成功案例，1 年把这套作业方式变成团队默认。

**三条卖点（对外版）**

1. **确定性可用**：Workplane 把“能不能用 AI”从不确定变成 SLA 级确定性。
2. **确定性交付**：Repo 驱动的协议资产（Intent/Constraints/Evidence）让协作可复制、可审计。
3. **确定性验收**：Eval 指标体系把“好不好用”变成可量化的通过率、覆盖率与 ROI。

**一句话差异化（对比式）**

- 别人交付“AI 能力演示/对话提效”，TAES 交付“组织级执行系统 + 可复利的协议资产”。

**一句话解释‘双重托举’（不讲黑话版）**

- 我们同时托举两件事：**让团队稳定合规地用上 AI（连接性）**，以及 **让团队稳定可复制地交付结果（协作协议 + 验收）**。

### 8.3 顶级 PM 会预判的质疑与回答（Objections）

**质疑 1：这不就是卖网络 + 卖订阅吗？**

- 回答要点：网络与订阅是“地基”，但客户真正买的是“上面的楼”——**Repo 协议资产 + Eval/Evidence 的验收体系 + 落地节奏**。
- 建议说法：我们承诺的不止是可用性，更是 **可复用的交付协议** 与 **可审计的证据链**。

**质疑 2：你们依赖 Copilot/模型平台，护城河不稳。**

- 回答要点：我们不把 moat 放在“某个模型”，而放在 **作业方式与资产复利**（模板/约束/评测/证据）。模型可替换，但协议资产与组织工作流沉淀带来切换成本。

**质疑 3：为什么必须 Repo 驱动？聊天式 AI 也能提效。**

- 回答要点：聊天式提效很难规模化管理（不可审计、不可复盘、不可复用）。Repo 驱动把“意图/约束/证据”固化成组织资产，才能跨人复制、跨任务复用。

**质疑 4：你怎么证明 ROI？**

- 回答要点：用第 6 章指标做基线与对照（Lead Time、Success Rate、Eval Coverage/Pass Rate、Evidence Completeness、ROI），并用 Mission Repo 的 Evidence 形成可抽检的证据链。

---

### 8.4 顶级 VC 视角：投资判断（Investment Thesis）

> 以下以 a]6z / Sequoia / Benchmark 等顶级 VC 的投资决策框架审视 TAES。

#### 投资备忘录摘要

| 维度 | 判断 | 信号 |
| :--- | :--- | :--- |
| **市场规模（TAM）** | ⚠️ 需验证 | AI 企业服务市场 $100B+，但"AI 原生作业方式"细分尚未明确定义 |
| **时机（Timing）** | ✅ 正确 | 2025-2026 是企业从"AI POC"转向"AI 生产"的关键窗口 |
| **差异化（Differentiation）** | ✅ 清晰 | 不卖模型/不卖工具，卖"执行系统 + 资产复利" |
| **商业模式（Business Model）** | ⚠️ 待打磨 | $450/月 算力 + 方法论，需验证 LTV/CAC |
| **护城河（Moat）** | ⚠️ 早期 | 切换成本可建立，但需要规模验证 |
| **团队（Team）** | — | 未在文档中呈现 |

#### 一、这个市场存在吗？（Problem-Solution Fit）

**✅ 问题真实存在：**

| 痛点 | 客户现状 | TAES 解法 |
| :--- | :--- | :--- |
| AI 访问不稳定/不合规 | 自建 VPN、灰色通道、担心审计 | Workplane：合规网络 + SLA 承诺 |
| AI 产出无法管理 | 聊天记录散落、无法复盘、无法复用 | Repo 驱动：Intent/Constraints/Evidence 固化 |
| AI 效果无法衡量 | "感觉提效了"但没数据 | Eval + Metrics：量化验收体系 |
| AI 落地推不动 | 培训完就忘、没有持续节奏 | 三大里程碑：渐进式落地路径 |

**⚠️ 风险信号：**
- 市场教育成本可能较高（"为什么必须 Repo 驱动"需要反复解释）
- 潜在竞争：GitHub 自身可能推出类似方法论服务

#### 二、商业模式能 Scale 吗？（Unit Economics）

**当前模型分析：**

| 项目 | 数据/假设 | 评估 |
| :--- | :--- | :--- |
| **ARPU** | $450/月/E队（算力底座） + 方法论服务费（未明确） | 偏低，需增值服务层 |
| **成本结构** | Azure $450 过账 + 人力（落地支持） | 毛利率取决于服务杠杆 |
| **LTV** | 12 个月留存 × ARPU？ | 未见留存数据 |
| **CAC** | 未明确 | 企业销售通常 $5K-$50K |

**VC 会追问的问题：**

1. **算力过账是不是低毛利生意？** —— 需要证明方法论/模板/培训的增值空间
2. **服务能否产品化？** —— 1:1 落地支持不可规模化，需要看 CLI/模板/自助化程度
3. **续约率预期？** —— 切换成本理论上存在，但需要实际数据验证

**建议优化方向：**

```
当前：$450/月算力 + 方法论咨询（服务导向）
未来：$450/月算力 + $X/月 SaaS 订阅（TAES Dashboard/Eval 平台）+ 认证培训
```

#### 三、护城河够深吗？（Defensibility）

| 护城河类型 | TAES 现状 | 评估 |
| :--- | :--- | :--- |
| **网络效应** | ❌ 暂无 | E队 之间无直接网络效应 |
| **规模经济** | ⚠️ 有限 | Azure 采购量可能带来折扣，但非独占 |
| **切换成本** | ✅ 可建立 | Repo 结构 + 模板 + 证据链 一旦沉淀，迁移成本高 |
| **品牌/信任** | ⚠️ 待建立 | 需要标杆客户背书 |
| **数据资产** | ⚠️ 潜在 | Golden Set / Eval 数据可能形成复利，但需要规模 |

**核心护城河判断：**
> TAES 的护城河不在"技术"而在"资产复利 + 组织切换成本"。这是 **ToB 企业服务的典型护城河模式**（类似 Salesforce/Workday），但需要规模验证。

#### 四、最大风险是什么？（Key Risks）

| 风险等级 | 风险描述 | 缓解措施 |
| :--- | :--- | :--- |
| 🔴 **高** | GitHub/Microsoft 推出官方"AI 原生工作流"服务，直接竞争 | 深耕中国/日本市场差异化（合规网络）；积累协议资产形成先发优势 |
| 🟡 **中** | 企业 AI 预算收缩，"方法论"被视为可选而非必需 | 强化 ROI 证据链，证明"不用 TAES = 隐性成本" |
| 🟡 **中** | 服务交付过重，毛利率低于预期 | 投资 CLI/自动化工具，减少人力依赖 |
| 🟢 **低** | Copilot 定价大幅上涨 | 算力配额可调整，核心价值在方法论 |

#### 五、投资决策建议

**结论：⚠️ 有条件的 Watchlist / 种子轮可考虑**

| 优点 | 风险 |
| :--- | :--- |
| ✅ 问题真实、时机正确 | ⚠️ 商业模式需打磨（毛利率/产品化） |
| ✅ 差异化清晰（执行系统 vs 工具） | ⚠️ 平台依赖风险（GitHub/Microsoft） |
| ✅ 方法论扎实（理论依据完整） | ⚠️ 缺少客户验证数据（LTV/留存） |
| ✅ 切换成本护城河可建立 | ⚠️ 市场教育成本可能较高 |

**下一轮融资前需要验证的关键假设（Key Milestones）：**

| 假设 | 验证标准 | 时间 |
| :--- | :--- | :--- |
| **Problem-Solution Fit** | ≥ 3 个付费 E队，续约率 ≥ 80% | 6 个月 |
| **单位经济学** | 毛利率 ≥ 50%（含服务） | 12 个月 |
| **产品化程度** | CLI + 模板覆盖 ≥ 80% 常见场景 | 12 个月 |
| **标杆客户** | 1 个可公开引用的案例 | 6 个月 |

**VC 可能的投资条款建议：**
- 种子轮 $500K-$1M，估值 $3M-$5M pre
- 里程碑触发：3 个付费客户 + 1 个标杆案例 = 解锁 A 轮权利
- 创始人 Lockup + 业绩对赌（ARR $500K @ 24 个月）

#### 六、给创始人的建议（Founder Feedback）

**做得好的地方：**
1. **方法论深度**：Mission 五要素有理论依据，不是空洞的概念
2. **差异化定位**：避开"模型能力"红海，切入"执行系统"蓝海
3. **验收导向**：Eval + Evidence 体系让"AI 好不好用"可衡量
4. **落地节奏**：三大里程碑让客户有明确预期

**需要补强的地方：**
1. **商业模式清晰度**：$450/月之外的增值服务定价需要明确
2. **客户证据**：需要 1-2 个付费客户的 ROI 数据
3. **团队介绍**：Playbook 中缺少团队背景（VC 投人重于投事）
4. **竞争分析**：需要明确 vs GitHub Actions / Azure DevOps / 国内竞品的差异

> **一句话总结（VC 视角）**：TAES 的核心洞见是正确的——企业需要的不是"更好的 AI 工具"，而是"AI 能为组织工作的系统"。但从 idea 到 investable business，还需要验证单位经济学与客户留存。

---

## 9) 工程化规范（摘要）

> **完整技术规范请参阅 [MR Playbook §5 工程化规范](../MR%20playbook.md#5-工程化规范)**。
> 
> 本章仅提供面向业务决策者的摘要。

TAES 的工程化落地依赖三项关键规范：

| 规范 | 核心问题 | 业务价值 | 详见 |
| :--- | :--- | :--- | :--- |
| **Eval 机制** | Mission 如何证明"已完成"而非"碰巧产出"？ | 验收可量化、可追溯 | MR Playbook §5.1 |
| **Agent 权限模型** | AI Agent 能做什么？边界在哪？ | 风险可控、合规可审计 | MR Playbook §5.2 |
| **Evidence Schema** | 证据能被篡改吗？如何确保可审计？ | 可追溯、可复盘、可对外展示 | MR Playbook §5.3 |

### Eval 的核心原则（Mission 导向）

> Eval 不是"AI 产出好不好"，而是"Mission 是否达成"。

```
MISSION.md 验收标准 → 推导 Golden Set → Eval 验证 → Mission 验收
```

| 要点 | 说明 |
| :--- | :--- |
| **Golden Set 来源** | 必须从 MISSION.md 的验收标准推导，不是凭空设计 |
| **Pass/Fail 判定** | 验收标准是否满足，不是"产出看起来对不对" |
| **评测报告结论** | "5/6 验收标准通过"，而非"通过率 90%" |

### 工程化规范的业务意义

| 规范 | 对业务决策者的意义 |
| :--- | :--- |
| **Eval** | 不是"感觉 AI 好用"，而是"数据证明 AI 好用"（Pass Rate ≥ 90%） |
| **Agent 权限** | AI 不会乱动关键文件，出问题可追责 |
| **Evidence** | 审计时能拿出证据链，合规无忧 |

---

## 10) TAES 成熟度模型（简版）

> **完整成熟度评估标准请参阅 [MR Playbook §5.4 成熟度模型](../MR%20playbook.md#54-mr-成熟度模型)**。

| Level | 名称 | 特征 | 业务标志 |
| :--- | :--- | :--- | :--- |
| **L1** | 起步 | 有 Repo，有 Copilot | 开始用了 |
| **L2** | 规范 | Mission Repo 结构完整 | 团队知道怎么用 |
| **L3** | 可审计 | 证据链完整 | 能通过内审 |
| **L4** | 可复制 | 可输出给其他团队复用 | 能培训别人 |
| **L5** | 卓越 | 可对外销售/认证 | 能对外卖方法论 |

---

## 11) FAQ（常见问题）

### Q1：TAES 和其他 AI 方法论（如 LangChain/AutoGPT）有什么区别？

| 维度 | LangChain/AutoGPT | TAES |
| :--- | :--- | :--- |
| **定位** | 技术框架/工具库 | 交付方法论 + 资源承诺 |
| **关注点** | 如何调用 LLM | 如何让 AI 产出可验收、可审计、可复制 |
| **交付物** | 代码/Agent | Repo 资产 + 证据链 + 网络底座 |
| **服务模式** | 自建/开源 | 協力營提供托举（算力 + 网络 + 方法论） |

### Q2：我们团队没有 AI 工程师，能用 TAES 吗？

可以。TAES 的核心是**让 AI 成为默认执行者**，而非培养 AI 工程师。
- **1 个月**：協力營协助搭建 Repo 结构与 Workplane，团队上手
- **1 个季度**：团队掌握方法，产出成功案例
- **1 年**：TAES 成为默认工作方式，可向其他团队普及

### Q3：三大里程碑分别能得到什么？

| 里程碑 | 时间 | 你得到什么 |
| :--- | :--- | :--- |
| **M1 上手 · 交付** | 1 个月 | 第一个 Mission 跑通、AI 执行底座可用、指标基线 |
| **M2 会用 · 成功案例** | 1 个季度 | ≥ 3 人掌握方法、≥ 3 个 Mission Repo、1 个可展示案例 |
| **M3 能用 · 能普及** | 1 年 | 默认工作方式、合规审计通过、可输出给其他团队 |

### Q4：TAES 的"三要素"和敏捷/Scrum 有什么关系？

TAES 不替代敏捷，而是**给敏捷加一层 AI 执行底座**：
- **Intent**（意图）≈ User Story，但用 Markdown 写成 AI 可执行的 Spec
- **Constraints**（约束）≈ Definition of Done，但写成 AI 的 Guardrails
- **Evidence**（证据）≈ Acceptance Criteria，但由系统自动留痕

---

## 12) 结语：TAES 的本质

> **TAES 不是"教你用 AI"，而是"帮你建一个 AI 能为你工作的系统"。**

| 传统做法 | TAES 做法 |
| :--- | :--- |
| 人学会用 AI 工具 | 系统让 AI 成为默认执行者 |
| AI 是"助手" | AI 是"可审计的执行层" |
| 产出在聊天窗口 | 产出在 Repo，可追溯、可复制、可销售 |
| 自己搞定网络和算力 | 協力營托举：$450/月算力 + 合规网络 |

**協力營托举 E隊 增长，TAES 是我们的方法论，也是我们的承诺。**

---

## 11) 参考实现 (Reference Implementation)

> 理论结合实践，我们提供了一个标准的 Mission Repo 供参考。

### EdgeTeam-Story (Golden Sample)

本仓库 `EdgeTeam-Story` 是 TAES 方法论的**标准参考实现**，展示了如何利用 TeamsEdge v2.0 体系进行内容创作。

| 维度 | 实现方式 | 对应文件/目录 |
| :--- | :--- | :--- |
| **Mission (Intent)** | 定义小说创作的意图与大纲 | `MISSION.md`, `MISSION/outline/` |
| **Context (语境)** | 角色小传、世界观设定 | `CONTEXT/Players/`, `MISSION/outline/characters/` |
| **Evidence (证据)** | 章节草稿、最终成稿、多媒体素材 | `MISSION/chapters/`, `Teams/Artifacts/` |
| **Eval (评估)** | 剧情连贯性检查、文风评估 | `AI/Agents/` (Critic Agent) |
| **Agent (智能)** | 编剧、导演、批评家等专用角色 | `.github/copilot-instructions.md` |

**访问路径**：
- **GitHub**: `EdgeTeam/EdgeTeam-Story`
- **TeamsEdge**: `Mission > MR Detail`

---

## 11) 参考实现 (Reference Implementation)

> 理论结合实践，我们提供了一个标准的 Mission Repo 供参考。

### EdgeTeam-Story (Golden Sample)

本仓库 `EdgeTeam-Story` 是 TAES 方法论的**标准参考实现**，展示了如何利用 TeamsEdge v2.0 体系进行内容创作。

| 维度 | 实现方式 | 对应文件/目录 |
| :--- | :--- | :--- |
| **Mission (Intent)** | 定义小说创作的意图与大纲 | `MISSION.md`, `MISSION/outline/` |
| **Context (语境)** | 角色小传、世界观设定 | `CONTEXT/Players/`, `MISSION/outline/characters/` |
| **Evidence (证据)** | 章节草稿、最终成稿、多媒体素材 | `MISSION/chapters/`, `Teams/Artifacts/` |
| **Eval (评估)** | 剧情连贯性检查、文风评估 | `AI/Agents/` (Critic Agent) |
| **Agent (智能)** | 编剧、导演、批评家等专用角色 | `.github/copilot-instructions.md` |

**访问路径**：
- **GitHub**: `EdgeTeam/EdgeTeam-Story`
- **TeamsEdge**: `Mission > MR Detail`

---

## 附录：知识产权保护策略

> 本节为内部参考，用于规划 TAES 及相关资产的知识产权保护路径。

### A. 可保护资产清单

| 资产类型 | 具体内容 | 保护方式建议 |
| :--- | :--- | :--- |
| **注册商标** | 協力營 ®️ / TeamsCamp ®️ / E隊 ®️ / EdgeTeam ®️ | 已注册，持续维护 |
| **方法论** | TAES Framework / Mission Repo (MR) 规范 | 商业秘密 + 评估发明专利可行性 |
| **代码资产** | eval_runner.py / taes CLI / Evidence 校验脚本 | 软件著作权登记 |
| **模板资产** | Golden Set / Judge Prompt / copilot-instructions 模板 | 商业秘密（不公开全文） |
| **文档资产** | TAES Playbook 完整版 | 商业秘密（对外只讲框架） |

### B. 保护路径建议

| 路径 | 周期 | 说明 |
| :--- | :--- | :--- |
| **软件著作权** | 1-2 个月 | 门槛低、周期短；优先登记 taes CLI 与 eval 相关代码 |
| **商业秘密** | 即时 | 把 Playbook 完整版、核心 Prompt 模板、Golden Set 定为内部机密 |
| **发明专利** | 6-18 个月 | 找专利代理评估"一种基于 Repo 的 AI 原生任务交付系统及方法"的可行性；需包装成技术方案而非纯管理流程 |

### C. 专利可行性初步分析

| 维度 | 评估 | 说明 |
| :--- | :--- | :--- |
| **新颖性** | ⚠️ 需论证 | 需证明"Repo 驱动 + Intent/Constraints/Evidence 三要素 + Eval 机制 + Evidence 防篡改"的组合在现有技术中不存在 |
| **创造性** | ⚠️ 需包装 | 纯方法论/管理流程难获批；需强调技术实现（如 Evidence Schema、链式哈希、Agent 权限模型） |
| **实用性** | ✅ 可论证 | 有明确的商业场景与可量化指标 |

> **建议**：短期先登记软著 + 商业秘密保护；中期委托专利代理做正式检索与撰写评估。

---

## 附录：Mission 五要素的理论依据

> 本节列出 Mission 五要素所引用的经典框架与学术来源。

### 引用框架一览

| 框架 | 作者/来源 | 年份 | 核心贡献 | 对 Mission 的影响 |
| :--- | :--- | :--- | :--- | :--- |
| **SMART Goals** | George T. Doran | 1981 | Specific, Measurable, Assignable, Realistic, Time-related | 输入(S)、验收(M)、AI可介入(A)、范围约束(T) |
| **WBS** | DoD MIL-STD-881 / PMI PMBOK | 1968/1987 | 100% Rule, 80-hour Rule, Deliverable-oriented | 输出(Deliverable)、范围约束(80h) |
| **User Story** | Kent Beck / Mike Cohn | 1997/2004 | "A promise for a conversation", Acceptance Criteria | 验收标准 |
| **INVEST** | Bill Wake | 2003 | Independent, Negotiable, Valuable, Estimable, Small, Testable | 范围约束(S)、验收(T)、依赖(I) |
| **Definition of Done** | Scrum Guide (Schwaber & Sutherland) | 2009+ | Checklist of what needs to be completed | 验收标准 |
| **JTBD** | Clayton Christensen | 2003 | Outcome-focused task definition | 输出导向思维 |

### SMART 原始定义 (Doran, 1981)

> "There's a S.M.A.R.T. way to write management's goals and objectives."
> — George T. Doran, *Management Review*, Nov 1981

| 字母 | 原始定义 | Mission 对应 |
| :--- | :--- | :--- |
| S | Specific | 明确输入 |
| M | Measurable | 验收标准 |
| A | Assignable | AI 可介入 |
| R | Realistic | （隐含在范围约束中） |
| T | Time-related | 范围约束 |

### INVEST 原始定义 (Bill Wake, 2003)

> "A good PBI is Independent, Negotiable, Valuable, Estimable, Small, and Testable."
> — Bill Wake, *XP123.com*

| 字母 | 定义 | Mission 对应 |
| :--- | :--- | :--- |
| I | Independent - self-contained | 范围约束（依赖约束） |
| N | Negotiable | （协商性，非 Mission 强制） |
| V | Valuable | 预期输出 |
| E | Estimable | （可估算，隐含） |
| S | Small - fits in iteration | 范围约束（规模/时间） |
| T | Testable | 验收标准 |

### WBS 80-hour Rule (PMI)

> "No single activity or group of activities at the lowest level of detail should be more than 80 hours of effort."
> — PMI Practice Standard for WBS

**Mission 应用**：单个 Mission 的时间约束不应超过 80 人时（约 2 周），超过则需拆分。

---