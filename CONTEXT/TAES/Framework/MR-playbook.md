# Mission Repo (MR) Playbook

**一个任务 = 一个 Repo**

> 版本：v1.0 | 更新日期：2025-12-28 | 维护者：yangjun@EdgeTeams.ai

---

## 快速导航

| 读者 | 推荐章节 |
| :--- | :--- |
| **5 分钟上手** | 1) 什么是 MR → 6) 快速开始 |
| **深入理解** | 2) 为什么需要 MR → 3) 目录结构 → 4) 核心文件 |
| **进阶使用** | 5) 与 TAES 的关系 → 7) 最佳实践 |

---

## 1) 什么是 Mission Repo (MR)

**Mission Repo (MR)** 是一种基于 GitHub Repo 的任务组织规范：

> **一个任务 = 一个 Repo**

| 概念 | 说明 |
| :--- | :--- |
| **Mission** | 一个有明确输入、预期输出、验收标准的工作单元，其产出可被 AI 生成或辅助生成 |
| **Repo** | GitHub 仓库，作为任务的唯一载体 |
| **MR** | Mission Repo 的缩写，指遵循本规范的任务仓库 |

### Mission 的四要素

> Mission 不是任意的"任务"，而是满足以下四要素的工作单元：

| 要素 | 说明 | 示例 |
| :--- | :--- | :--- |
| **明确输入** | 有清晰的任务描述与上下文 | "为项目生成 API 文档" |
| **预期输出** | 产出物是具体的（文档/代码/数据） | Markdown 格式的 API 文档 |
| **验收标准** | Pass/Fail 可判定的条件 | "包含所有公开接口，示例代码可运行" |
| **AI 可介入** | 产出类型在 AI 能力范围内 | 文档生成 ✅ / 硬件调试 ❌ |

### MR 的核心理念

```
Intent（意图）   →  写进 MISSION.md
Constraints（约束） →  写进 copilot-instructions.md
Evidence（证据）  →  落地到 Teams/ 目录
```

### MR 与传统项目管理的区别

| 维度 | 传统项目管理 | Mission Repo |
| :--- | :--- | :--- |
| **任务载体** | Issue / 文档 / 口头沟通 | GitHub Repo |
| **执行者** | 人为主 | AI 为默认执行层，人为审核层 |
| **产出物** | 分散在各处 | 统一落地到 Repo，可审计 |
| **可复用性** | 低（依赖人的记忆） | 高（Repo 即模板） |

---

## 2) 为什么需要 Mission Repo

### 问题：AI 时代的协作困境

| 困境 | 表现 |
| :--- | :--- |
| **意图丢失** | AI 生成的内容与原始需求偏离，无法追溯"当初想要什么" |
| **约束缺失** | AI 没有边界，产出质量不稳定 |
| **证据散落** | 产出在聊天窗口、临时文件、邮件附件，无法复盘 |
| **不可复制** | 同样的任务换个人/换个时间，无法稳定复现 |

### 解法：Repo 驱动的任务管理

| MR 解决的问题 | 如何解决 |
| :--- | :--- |
| **意图可追溯** | MISSION.md 定义任务目标，版本化管理 |
| **约束可注入** | copilot-instructions.md 定义 AI 的边界与规则 |
| **证据可审计** | Teams/ 目录统一存放产出，Evidence Schema 标准化 |
| **模式可复制** | Repo 即模板，fork/clone 即可复用 |

---

## 3) MR 目录结构规范

### 标准结构

```
Mission-Repo/
├── MISSION.md                    # [必需] 任务宣言（Intent）
├── README.md                     # [必需] 项目说明
├── .github/
│   ├── copilot-instructions.md   # [必需] AI 约束注入
│   └── CODEOWNERS                # [可选] 代码所有者
├── MISSION/                      # [必需] 执行工位
│   ├── outline/                  #   骨骼（结构/大纲）
│   ├── chapters/                 #   血肉（正文/内容）
│   ├── docs/                     #   文档（说明/参考）
│   ├── notes/                    #   草稿（临时/备忘）
│   └── assets/                   #   资产（图片/附件）
├── CONTEXT/                      # [必需] 语境容器
│   ├── Story/                    #   背景故事/业务上下文
│   └── Players/                  #   参与者/角色定义
├── AI/                           # [可选] 智能中枢
│   ├── Agents/                   #   Agent 定义
│   ├── Memory/                   #   记忆/偏好
│   └── MCP/                      #   MCP 配置
├── Teams/                        # [必需] EdgeTeams 交付
│   ├── Artifacts/                #   产出物
│   └── Metadata/                 #   元数据/日志
│       └── logs/                 #   Evidence 日志
└── EVAL/                         # [可选] 评测目录
    ├── golden_set.json           #   Golden Set 数据
    ├── judge_prompt.md           #   LLM-as-Judge Prompt
    └── reports/                  #   评测报告
```

### 目录职责说明

| 目录 | 必需性 | 职责 |
| :--- | :--- | :--- |
| **MISSION.md** | 必需 | 定义任务目标、范围、验收标准（Intent） |
| **README.md** | 必需 | 项目入口，AI 理解任务的第一入口 |
| **.github/** | 必需 | GitHub 配置，含 copilot-instructions.md |
| **MISSION/** | 必需 | 任务执行的主工作区 |
| **CONTEXT/** | 必需 | 任务相关的背景信息与语境 |
| **AI/** | 可选 | Agent 配置、记忆、MCP 等 AI 相关设置 |
| **Teams/** | 必需 | EdgeTeams 交付物与 Evidence 日志 |
| **EVAL/** | 可选 | 评测相关（Golden Set、Judge、报告） |

---

## 4) 核心文件定义

### 4.1 MISSION.md — 任务宣言

**职责**：定义任务的 Intent（意图），是整个 MR 的"宪法"。

**最小模板**：

```markdown
# Mission: [任务名称]

## 目标（Objective）

[一句话描述任务目标]

## 范围（Scope）

- 包含：[列出包含的内容]
- 不包含：[列出明确排除的内容]

## 验收标准（Acceptance Criteria）

- [ ] [标准 1]
- [ ] [标准 2]
- [ ] [标准 3]

## 约束（Constraints）

- [约束 1]
- [约束 2]

## 参考资料（References）

- [链接 1]
- [链接 2]
```

### 4.2 copilot-instructions.md — AI 约束注入

**职责**：定义 AI（Copilot）在此 Repo 内的行为边界与规则。

**存放位置**：`.github/copilot-instructions.md`

**最小模板**：

```markdown
# Copilot Instructions

## 角色定义

你是 [角色描述]，负责 [职责描述]。

## 行为规则

1. [规则 1]
2. [规则 2]
3. [规则 3]

## 输出规范

- 语言：[中文/英文/双语]
- 格式：[Markdown/JSON/其他]
- 风格：[正式/口语/技术]

## 禁止事项

- 不要 [禁止事项 1]
- 不要 [禁止事项 2]

## 参考上下文

- 优先阅读 MISSION.md 理解任务目标
- 参考 CONTEXT/ 目录了解背景信息
- 产出物存放到 Teams/ 目录
```

### 4.3 Evidence Schema — 证据链规范

**职责**：定义 Teams/Metadata/logs/ 目录下 Evidence 的标准格式。

**最小字段集**：

```json
{
  "evidence_id": "uuid-v4",
  "type": "execution_log | eval_report | change_record | approval_record",
  "timestamp": "ISO 8601 格式",
  "actor": "执行者（人/Agent）",
  "content_hash": "SHA-256（内容哈希，防篡改）",
  "payload": {
    // 类型相关的具体内容
  },
  "metadata": {
    "repo": "org/repo-name",
    "mission": "Mission 名称",
    "commit_sha": "关联的 Git Commit"
  }
}
```

---

## 5) 工程化规范

> 本章定义 MR 的技术实现规范，供 AI 工程师参考。

### 5.1 Eval 机制（评测规范）

> **核心问题**：如何证明 Mission 已完成，而非"AI 碰巧产出了东西"？

#### Eval 的本质：验证 Mission 是否达成

```
MISSION.md
    │
    ├── 验收标准（Acceptance Criteria）
    │       ↓
    │   Golden Set（从验收标准推导）
    │       ↓
    │   Eval = 验证 Mission 是否完成
    │       ↓
    └── Evidence（评测报告）
```

**关键原则**：
- **Golden Set 来源** = MISSION.md 的验收标准，不是凭空设计
- **Pass/Fail 判定** = 验收标准是否满足，不是"产出看起来对不对"
- **Eval 服务于 Mission**，不是独立的质量管控流程

#### 从 MISSION.md 到 Golden Set 的推导

| MISSION.md 中的验收标准 | 对应的 Golden Case |
| :--- | :--- |
| `[ ] 生成的文档包含目录结构` | `input`: 任务描述 → `expected`: 包含 `##` 标题的 Markdown |
| `[ ] 代码通过单元测试` | `input`: 功能需求 → `expected`: 测试覆盖率 ≥ 80% |
| `[ ] 翻译准确率 ≥ 95%` | `input`: 源文本 → `expected`: 参考译文 + 误差容忍度 |

#### 最小评测流程（Mission-Oriented Eval）

```
MISSION.md 验收标准 → 推导 Golden Set → AI 执行 → LLM-as-Judge → 人工抽检 → 评测报告
```

| 环节 | 说明 | 与 Mission 的关系 |
| :--- | :--- | :--- |
| **Golden Set** | 预定义的标准输入输出对 | **必须从 MISSION.md 验收标准推导** |
| **LLM-as-Judge** | 用 LLM 判断产出与 Golden Set 的一致性 | Judge Prompt 需引用验收标准原文 |
| **人工抽检** | 随机抽取产出进行人工复核 | 复核依据 = MISSION.md 验收标准 |
| **评测报告** | 输出可量化结论 | **结论 = Mission 是否可验收** |

#### Eval 指标定义

| 指标 | 公式 | 业务含义 |
| :--- | :--- | :--- |
| **Acceptance Coverage** | `已验证验收标准数 / 总验收标准数 × 100%` | 验收标准覆盖率 |
| **Mission Pass Rate** | `通过验收标准数 / 已验证验收标准数 × 100%` | Mission 完成度 |
| **Human Agreement** | `人工复核与 Judge 一致数 / 人工复核总数 × 100%` | Judge 可信度 |

#### Eval 的双重职责

> Eval 不仅验证"Mission 是否完成"，还要评估"AI 贡献了什么"。

| 职责 | 评测问题 | 指标 |
| :--- | :--- | :--- |
| **Mission 验收** | 验收标准是否满足？ | Acceptance Coverage + Mission Pass Rate |
| **AI 贡献评估** | AI 贡献了什么？ | AI Contribution Rate + Iteration Rounds |

**AI 贡献度指标**：

| 指标 | 定义 | 目标 | 测量方法 |
| :--- | :--- | :--- | :--- |
| **AI Contribution Rate** | AI 生成内容占最终交付物的比例 | ≥ 60% | Git diff 分析 |
| **First-Pass Acceptance** | 首次提交即通过验收的比例 | ≥ 70% | 统计首次 Eval 结果 |
| **Iteration Rounds** | 从首次产出到验收通过的迭代轮次 | ≤ 3 | 统计修改次数 |
| **Human Intervention Rate** | 需人工处理的环节 / 总环节 | ≤ 30% | 检查点统计 |

**为什么要评估 AI 贡献度？**

- 如果 Mission 完成了，但 AI Contribution Rate 很低 → E队 还在用传统方式工作
- 如果 Iteration Rounds 很高 → AI 理解需求不准，需要优化 Prompt/Context
- **AI 贡献度指标帮助 E队 持续提升 AI 协同能力**

#### Golden Set 模板（Mission 导向）

```json
{
  "mission": "Mission 名称（与 MISSION.md 一致）",
  "version": "1.0",
  "acceptance_criteria_ref": "MISSION.md#验收标准",
  "cases": [
    {
      "id": "AC_001",
      "acceptance_criteria": "生成的文档包含目录结构",
      "input": "请为项目生成 README",
      "expected_output": "包含 ## 开头的多级标题",
      "evaluation_method": "regex_match",
      "tags": ["文档", "结构"]
    }
  ]
}
```

#### Eval 文件存放位置

```
Mission-Repo/
├── MISSION.md                # 验收标准的源头
├── EVAL/
│   ├── golden_set.json       # 从 MISSION.md 验收标准推导
│   ├── judge_prompt.md       # Judge Prompt（需引用验收标准）
│   ├── eval_runner.py        # 自动化评测脚本
│   └── reports/              # 评测报告（结论 = Mission 是否验收）
```

#### 常见错误 ❌

| 错误做法 | 正确做法 |
| :--- | :--- |
| Golden Set 凭感觉设计 | Golden Set 从 MISSION.md 验收标准推导 |
| Pass/Fail = "看起来对" | Pass/Fail = "验收标准是否满足" |
| Eval 报告只说"通过率 90%" | Eval 报告说"5/6 验收标准通过，未通过项：XXX" |

---

### 5.2 Agent 权限模型

> **核心问题**：AI Agent 能做什么？不能做什么？边界在哪里？

#### 权限层级定义

| Level | 名称 | 能力范围 | 典型场景 |
| :--- | :--- | :--- | :--- |
| **L0** | Read-Only | 只读 Repo 内容（代码/文档/Context） | 信息检索、文档问答 |
| **L1** | Write-Scoped | 可写入指定目录（如 `Teams/`、`MISSION/chapters/`） | 内容生成、草稿输出 |
| **L2** | Execute-Local | 可执行本地脚本（如 `eval_runner.py`）、运行测试 | 自动化评测、CI 预检 |
| **L3** | Execute-External | 可调用外部 API（如 LLM API、第三方服务） | 需显式授权 + 调用日志 |
| **L4** | Admin | 可修改 `.github/`、权限配置、Org 设置 | 仅限 Owner 手动触发 |

#### 默认权限策略

| Agent 类型 | 默认 Level | 说明 |
| :--- | :--- | :--- |
| **Copilot Chat** | L1 | 可生成内容，写入受限目录 |
| **Copilot Agent (Workspace)** | L2 | 可执行本地脚本 |
| **Custom Agent (MCP)** | L1 | 默认受限，需显式提权 |
| **CI/CD Bot (GitHub Actions)** | L2-L3 | 按 Workflow 配置授权 |

#### 权限配置示例

```yaml
# .github/agent-permissions.yaml
default_level: L1
agents:
  copilot-chat:
    level: L1
    write_paths:
      - Teams/
      - MISSION/chapters/
      - MISSION/notes/
  copilot-workspace:
    level: L2
    execute_scripts:
      - EVAL/eval_runner.py
      - scripts/*.sh
  custom-agent:
    level: L1
    requires_approval: true
```

#### 越权行为处理

- **静默拒绝**：Agent 尝试越权操作时，系统不执行并记录日志
- **告警通知**：连续 3 次越权尝试触发 Owner 告警
- **审计留痕**：所有越权尝试记录到 `Teams/Metadata/logs/agent_violations.log`

---

### 5.3 Evidence Schema（证据链规范）

> **核心问题**：Evidence 能被篡改吗？如何确保可审计？

#### 证据类型定义

| 类型 | 说明 | 必填字段 |
| :--- | :--- | :--- |
| **execution_log** | AI 执行记录（输入/输出/时间戳） | `timestamp`, `agent`, `input_hash`, `output_hash` |
| **eval_report** | 评测报告 | `timestamp`, `golden_set_version`, `pass_rate`, `reviewer` |
| **change_record** | 变更记录（谁改了什么） | `timestamp`, `actor`, `file_path`, `diff_hash` |
| **approval_record** | 审批记录（谁批准了什么） | `timestamp`, `approver`, `decision`, `reason` |

#### Evidence JSON Schema（完整字段）

```json
{
  "evidence_id": "uuid-v4",
  "type": "execution_log | eval_report | change_record | approval_record",
  "timestamp": "ISO 8601 格式",
  "actor": "执行者（人/Agent）",
  "content_hash": "SHA-256（内容哈希，防篡改）",
  "signature": "可选，数字签名",
  "payload": {
    // 类型相关的具体内容
  },
  "metadata": {
    "repo": "org/repo-name",
    "mission": "Mission 名称",
    "commit_sha": "关联的 Git Commit"
  }
}
```

#### 存储与保留策略

| 项目 | 规范 |
| :--- | :--- |
| **存储位置** | `Teams/Metadata/logs/` 目录 |
| **文件命名** | `{type}_{date}_{sequence}.json`（如 `execution_log_20260101_001.json`） |
| **保留周期** | 默认 365 天；合规要求高的 Mission 可延长至 7 年 |
| **不可变性** | 日志文件一旦写入，禁止修改（只允许追加新记录） |
| **备份策略** | 每日自动备份到独立存储（Azure Blob / S3） |

#### 防篡改机制

1. **内容哈希**：每条 Evidence 计算 `SHA-256` 哈希，写入 `content_hash` 字段
2. **链式哈希**：每条新 Evidence 包含前一条的 `evidence_id`，形成链式结构
3. **Git Commit 绑定**：Evidence 与对应的 Git Commit SHA 关联，可交叉验证
4. **可选数字签名**：高安全要求场景可启用 GPG/X.509 签名

#### CLI 命令参考

```bash
# 按时间范围查询
mr evidence list --from 2026-01-01 --to 2026-01-31

# 按类型查询
mr evidence list --type eval_report

# 验证完整性
mr evidence verify --file execution_log_20260101_001.json
```

---

### 5.4 MR 成熟度模型

> E隊 可按以下模型评估自身 MR 成熟度。

| Level | 名称 | Eval | Agent Scope | Evidence |
| :--- | :--- | :--- | :--- | :--- |
| **L1** | 起步 | 无 | 未定义 | 无 |
| **L2** | 规范 | 有 Golden Set | L1 默认 | 有日志，无 Schema |
| **L3** | 可审计 | LLM-as-Judge + 人工抽检 | 权限配置文件存在 | Schema 合规 + 哈希校验 |
| **L4** | 可复制 | Eval 自动化 ≥ 80% | 越权告警已启用 | 链式哈希 + 备份策略 |
| **L5** | 卓越 | 全量 Eval + 回归测试 | 数字签名 | 7 年归档 + 审计接口 |

---

## 6) 与 TAES 的关系

### 层级关系

```
┌─────────────────────────────────────────┐
│           TAES Framework                │  ← 方法论层（业务）
│  (落地节奏 + 指标体系 + 资源承诺)         │
├─────────────────────────────────────────┤
│           Mission Repo (MR)             │  ← 执行载体层（技术）
│  (目录结构 + 核心文件 + 工程化规范)       │
├─────────────────────────────────────────┤
│           GitHub + VS Code + Copilot    │  ← 基础设施层
│  (Repo + 工作台 + AI 执行)               │
└─────────────────────────────────────────┘
```

### 依赖关系

| 关系 | 说明 |
| :--- | :--- |
| **MR 可独立使用** | 即使不采用 TAES 方法论，也可以使用 MR 规范组织任务 |
| **TAES 依赖 MR** | TAES 的"Intent-Constraints-Evidence"三要素需要 MR 作为执行载体 |
| **MR 是 TAES 的基础设施** | 类比：Git 是 GitFlow 的基础设施 |

### 选择指南

| 场景 | 推荐 |
| :--- | :--- |
| 只想用 Repo 管理 AI 任务，不需要完整方法论 | **只用 MR** |
| 需要完整的落地节奏、指标体系、资源承诺 | **MR + TAES** |
| 团队刚开始尝试 AI 协作 | **先 MR，再逐步引入 TAES** |

---

## 7) 快速开始（5 分钟上手）

### 方式 1：手动创建

```bash
# 1. 创建 Repo
mkdir my-mission && cd my-mission
git init

# 2. 创建核心目录
mkdir -p .github MISSION/{outline,chapters,docs,notes,assets} CONTEXT Teams/Metadata/logs

# 3. 创建核心文件
touch MISSION.md README.md .github/copilot-instructions.md

# 4. 编辑 MISSION.md 定义任务目标
# 5. 编辑 copilot-instructions.md 定义 AI 规则
# 6. 推送到 GitHub
git add . && git commit -m "init: mission repo" && git push
```

### 方式 2：使用模板（推荐）

```bash
# 从 GitHub Template 创建
# 访问 https://github.com/EdgeTeams/mission-repo-template
# 点击 "Use this template" → "Create a new repository"
```

### 方式 3：CLI 工具（规划中）

```bash
# 初始化一个新的 Mission Repo
npx create-mission-repo my-project

# 或者
mr init my-project --template=default
```

---

## 8) 最佳实践与 FAQ

### 最佳实践

| 实践 | 说明 |
| :--- | :--- |
| **MISSION.md 先行** | 在写任何代码/内容之前，先把 MISSION.md 写清楚 |
| **copilot-instructions.md 要具体** | 不要写"请帮我完成任务"，要写具体的角色、规则、禁止事项 |
| **Evidence 默认留痕** | 所有 AI 产出都应该有 Evidence 记录，便于复盘 |
| **Repo 即文档** | 不要在外部维护文档，所有信息都应该在 Repo 内可查 |
| **定期归档** | 任务完成后，把 Repo 归档（Archive），保留证据链 |

### FAQ

**Q1：MR 只能用于 AI 相关任务吗？**

不是。MR 是一种通用的任务组织规范，适用于任何"可定义、可执行、可验收"的任务。AI 只是默认的执行层，人也可以是执行者。

**Q2：一个 Org 下可以有多少个 MR？**

没有限制。建议按"一个任务 = 一个 Repo"的原则创建，任务完成后归档。

**Q3：MR 和普通 GitHub Repo 有什么区别？**

MR 是一种"带约定的 Repo"：有固定的目录结构、核心文件、Evidence 规范。普通 Repo 没有这些约定。

**Q4：如何判断一个任务是否适合用 MR？**

满足以下条件即可：
- 有明确的目标（可写 MISSION.md）
- 有可定义的约束（可写 copilot-instructions.md）
- 有可交付的产出（可落地到 Teams/）

**Q5：MR 可以嵌套吗？**

不建议。保持"一个任务 = 一个 Repo"的扁平结构。如果任务过大，应该拆分成多个独立的 MR。

---

## 附录：术语表

| 术语 | 定义 |
| :--- | :--- |
| **Mission** | 一个可定义、可执行、可验收的任务单元 |
| **MR** | Mission Repo 的缩写 |
| **Intent** | 任务意图，定义在 MISSION.md |
| **Constraints** | 任务约束，定义在 copilot-instructions.md |
| **Evidence** | 任务证据，落地到 Teams/Metadata/logs/ |
| **TAES** | TeamsCamp Augments EdgeTeams Scale，依赖 MR 的上层方法论 |

---

## 版本历史

| 版本 | 日期 | 变更 |
| :--- | :--- | :--- |
| v1.0 | 2025-12-28 | 初版发布 |

---

**Mission Repo：让每个任务都有迹可循。**
