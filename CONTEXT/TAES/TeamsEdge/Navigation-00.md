# TeamsEdge 菜单导航设计（Menu Navigation）

> **TAES**: TeamsCamp **A**ugments **E**dgeTeams **S**cale  
> 本文档定义 TeamsEdge 的根目录菜单结构与设计意图。

---

## 1. 菜单结构总览

> 9 个 L1 顶级菜单，按 TAES 逻辑排列。

| # | L1 菜单 | 品牌名称 | TAES | 一句话定位 |
| :---: | :--- | :--- | :---: | :--- |
| 1 | **EdgeTeams** | E队 | E | 客户是谁？团队、角色、站点 |
| 2 | **TeamsCamp** | 協力營 | T | 资源在哪？合同主体、算力池 |
| 3 | **Augment** | 托举 Augment | A | 如何连接？网络通道、AI托管 |
| 4 | **Mission** | 使命 Mission | S | 做什么？MR管理、Function |
| 5 | **The Foundry** | 工坊 | S | 交付什么？CI/CD、静态页 |
| 6 | **AI Intelligence** | AITa | S | 学到什么？知识库、Eval |
| 7 | **Credits & Billing** | 支付开单 | S | 花了多少？支付、额度、发票 |
| 8 | **Notification** | 通知 | — | 系统通知、审批流、工单 |
| 9 | **System** | System | — | 操作员、配置、运维 |

### 1.1 AI 职责边界（Azure / Gemini 平行方案）

> **设计原则**：協力營 管"算力池"（供给侧），AITa 管"知识与效能"（消费侧）。

| 模块 | 职责 | Azure 场景 | Gemini 场景 |
| :--- | :--- | :--- | :--- |
| **協力營 > Azure AI** | 算力池管理 | Azure OpenAI 资源、配额、密钥 | - |
| **協力營 > Google AI** | 算力池管理 | - | Gemini API 资源、配额、密钥 |
| **AITa > LLM** | 模型路由与调度 | 调用 Azure OpenAI | 调用 Gemini API |
| **AITa > Knowledge** | 知识库管理 | RAG on Azure | RAG on Vertex AI |
| **AITa > Eval** | 效能评估 | Token 消耗、质量评估 | Token 消耗、质量评估 |

**通俗理解**：
- 協力營 = "买电"（管理 Azure/Google 订阅、额度、密钥）
- AITa = "用电"（调度模型、存储知识、评估效果）

---

## 2. 详细菜单定义

### 2.1 E队（EdgeTeams）

> **TAES 对应**：E（EdgeTeams）— 客户团队管理

| L2 子菜单 | 中文 | PM Design Intent | 关联 Issue |
| :--- | :--- | :--- | :--- |
| Player | 玩家 | 管理成员档案，Base Layer 存储地 | Menu-E队-50 |
| Teamsidol | 卡司 | 定义主角/配角角色，计算贡献度 | - |
| E队 | 番号 | 管理团队编组（如 I117），强调团队归属 | Menu-E队-50 |
| M365 | 组团 | Teams Security Group，定义协作边界 | - |
| Publisher | 出品 | 市场上架者，Partner/Developer 资质 | Menu-Publisher-90 |
| Site | 据点 | 物理或虚拟办公空间 | - |

> **注**：使命 Mission 和 Repo 已独立为 L1 菜单（见 §2.4）

### 2.2 協力營（TeamsCamp）

> **TAES 对应**：T（TeamsCamp）— 協力營资源管理（供给侧）  
> **职责边界**：管理"算力池"的订阅、配额、密钥，不涉及具体调度。

| L2 子菜单 | 中文 | PM Design Intent | 关联 Issue |
| :--- | :--- | :--- | :--- |
| Entities | 合同主体 | 服务提供方实体（元协力、Allied Tokyo） | - |
| T工场 | 租户 | M365 Tenant，全局策略与资源池边界 | - |
| Github Org | 授权 | GitHub Enterprise + Copilot 席位管理 | - |
| Azure AI | Azure 算力池 | Azure OpenAI 订阅、配额、部署、密钥 | - |
| Google AI | Google 算力池 | Gemini API 订阅、配额、密钥 | - |
| Anthropic | Claude 算力池 | Claude API 订阅、配额、密钥 | - |
| POP Site | 边缘节点 | 分布式网络接入点，跨境合规 | - |

#### AI 算力池管理（供给侧）

| 云厂商 | 管理内容 | 典型操作 |
| :--- | :--- | :--- |
| **Azure AI** | Azure OpenAI Service | 创建部署、设置 TPM 配额、轮换密钥 |
| **Google AI** | Gemini API | 启用 API、设置配额、管理 Service Account |
| **Anthropic** | Claude API | 管理 API Key、监控用量上限 |

### 2.3 托举 Augment

> **TAES 对应**：A（Augment）— 托举效应 = 网络可靠(bit) × AI可用(Token)

| L2 子菜单 | 中文 | PM Design Intent | 关联 Issue |
| :--- | :--- | :--- | :--- |
| Topology | 组网 | 业务全景、域名、IP 规划 | - |
| Workplane | 工作面 | AI 底座订阅、网络端口配置 | - |
| Link Server | 接入器 | 连接与协议转换服务 | - |
| Service Node | 服务点 | 分布式业务处理节点 | - |
| TeamsBox | T盒 | 标准化硬件/容器单元 | - |

### 2.4 使命 Mission

> **TAES 对应**：S（Scale）— Intent 层  
> **核心理念**：1 Mission = 1 MR（Mission Repo），MR 是 TAES 方法论的原子执行单元。

| L2 子菜单 | 中文 | PM Design Intent | 关联 Issue |
| :--- | :--- | :--- | :--- |
| MR List | 任务列表 | 所有 Mission Repo 的列表视图 | - |
| MR Detail | 任务详情 | 单个 MR 的 MISSION.md、结构、进度 | - |
| Function | 功能 | MR 下属的原子化业务功能 | - |
| Eval | 评估 | Function 执行效果与质量评估 | - |
| Workspace | 工位 | Workbench 中的细分执行工位 | - |

#### MR（Mission Repo）核心概念

| 概念 | 说明 |
| :--- | :--- |
| **1 E队 = 1 Mission** | 每个 E队 锚定一个核心 Mission |
| **1 Mission = 1 GitHub Repo** | Mission 以 GitHub Repo 为载体 |
| **MISSION.md** | MR 根目录的宣言文件，定义 Intent |
| **MR Template** | 标准化目录结构（MISSION/、Teams/、AI/ 等） |

### 2.5 工坊（The Foundry）

> **TAES 对应**：S（Scale）— Delivery 层

| L2 子菜单 | 中文 | PM Design Intent | 关联 Issue |
| :--- | :--- | :--- | :--- |
| Action | 流水线 | CI/CD 监控，Code Push → Deploy | - |
| Artifacts | 制品 | 交付物仓库（PDF/App/Docker Image） | - |
| Teamspage | 网页 | GitHub 推送生成的静态任务页 | - |

### 2.6 AITa（AI Intelligence）

> **TAES 对应**：S（Scale）— AI 执行与评估层（消费侧）  
> **与協力營的边界**：協力營管"买电"（算力池），AITa 管"用电"（调度与效能）。

| L2 子菜单 | 中文 | PM Design Intent | 关联 Issue |
| :--- | :--- | :--- | :--- |
| Knowledge | 知识库 | Context 模板、Prompt 库、Agent 记忆、RAG 索引 | - |
| LLM Router | 模型路由 | 多模型调度（Azure OpenAI / Gemini / Claude） | - |
| AI Workspace | 客户端 | AI 工具配置与访问入口 | - |
| Eval | 效能评估 | Token 消耗、质量评分、Golden Set 评测 | - |
| Usage | 用量分析 | 按 E队/Mission/模型 的消耗明细 | - |

#### 多云 AI 场景支持（Azure + Gemini 平行方案）

| 场景 | LLM Router 行为 | 说明 |
| :--- | :--- | :--- |
| **默认路由** | Azure OpenAI (GPT-4o) | 主力模型 |
| **长文本** | Gemini 1.5 Pro | 100万 Token 上下文 |
| **代码生成** | Azure OpenAI (o1) | 推理增强 |
| **成本优化** | Gemini Flash | 高性价比场景 |
| **故障转移** | 自动切换 | Azure 不可用时切 Gemini |

### 2.7 支付开单（Credits & Billing）

> **TAES 对应**：S（Scale）— 财务与激励层

| L2 子菜单 | 中文 | PM Design Intent | 关联 Issue |
| :--- | :--- | :--- | :--- |
| Credit Card | 信用卡 | 绑定支付信用卡 | - |
| Azure Credit | 额度 | Azure 赠送/购买额度监控 | - |
| Paypal | 其他 | Paypal 及第三方支付渠道 | - |
| Invoice | 发票 | 账单、发票与财务凭证 | - |

### 2.8 通知（Notification）

> **职责**：系统通知、审批流、工单处理的统一入口。

| L2 子菜单 | 中文 | PM Design Intent | 关联 Issue |
| :--- | :--- | :--- | :--- |
| Inbox | 收件箱 | 所有通知的统一入口 | - |
| Approval | 审批流 | Mission 申请、资源申请等待审批 | - |
| Ticket | 工单 | E队 Owner 提交的问题/反馈 | - |
| Alert | 告警 | 系统告警（证书过期、配额不足等） | - |
| Broadcast | 公告 | T营 管理层发布的全局公告 | - |

#### 通知触发场景

| 场景 | 接收者 | 通知类型 |
| :--- | :--- | :--- |
| E队 Owner 申请新 Mission | T营 业务员、管理层 | Approval |
| E队 Owner 提交反馈 | T营 工程师 | Ticket |
| SSL 证书即将过期 | T营 工程师 | Alert |
| Azure 配额达 80% | T营 工程师、管理层 | Alert |
| 新 E队 创建成功 | E队 Owner | Inbox |
| 交付物已就绪 | E队 Owner | Inbox |

### 2.9 System

> **TAES 对应**：系统治理与运维

| L2 子菜单 | 中文 | PM Design Intent | 关联 Issue |
| :--- | :--- | :--- | :--- |
| Domain | 域名 | 域名配置、依赖关系、知识产权 | Menu-System-Domain |
| Operator | 操作员 | 系统操作员与权限管理 | Menu-System-70 |
| Setting | 配置 | 全局系统设置与变量（Var） | Menu-System-70 |
| Backup | 运维 | 备份、恢复等运维操作 | Menu-System-70 |

---

## 3. 设计原则

### 3.1 信息架构原则

| 原则 | 说明 |
| :--- | :--- |
| **TAES 优先** | 菜单排列按 T-A-E-S 逻辑，让用户理解"谁托举谁" |
| **角色导向** | E队 相关放最前，T营 运维放中间，系统管理放最后 |
| **任务闭环** | Mission → Foundry → AI Intelligence 形成"意图 → 交付 → 评估"闭环 |
| **操作 vs 治理** | 高频操作默认展示，低频治理折叠/详情 |

### 3.2 UX 建议

| 建议 | 说明 |
| :--- | :--- |
| **首页仪表盘** | 展示 E队 状态、Mission 进度、算力消耗、证书/域名健康度 |
| **快捷入口** | "新增 E队""新增 Mission""查看 Artifacts"作为首页快捷按钮 |
| **搜索优先** | 支持全局搜索（E队名/Mission名/域名/Player名） |
| **权限分层** | E队 Owner 只看到自己团队；T营 Operator 看到全局 |

---

## 4. 技术建议

### 4.1 与 TAES 工程化规范对齐

| TAES 规范 | TeamsEdge 实现建议 |
| :--- | :--- |
| **Eval 机制** | AI Intelligence > Eval 应支持 Golden Set + LLM-as-Judge |
| **Agent Permission** | System > Operator 应支持 L0-L4 权限层级 |
| **Evidence Schema** | Foundry > Artifacts 应生成符合 Schema 的 Evidence JSON |

### 4.2 配置即代码

| 菜单 | 建议 |
| :--- | :--- |
| **System > Domain** | 支持导出/导入 YAML 配置，可存入 Repo |
| **System > Setting** | 全局变量支持 Git 版本化（审计友好） |
| **托举 Augment > Topology** | 网络拓扑支持 Mermaid/D2 可视化 |

### 4.3 API 优先

| 菜单 | API 建议 |
| :--- | :--- |
| **E队** | `/api/v1/teams`, `/api/v1/missions` |
| **工坊** | `/api/v1/artifacts`, `/api/v1/actions` |
| **AITa** | `/api/v1/knowledge`, `/api/v1/eval` |

---

## 5. 关联 Issue 索引

| Issue 文件 | 覆盖菜单 | 状态 |
| :--- | :--- | :--- |
| [EdgeTeam-50.md](EdgeTeam-50.md) | E队 > E队, Player | 📋 草稿 |
| [Publisher-90.md](Publisher-90.md) | E队 > Publisher | 📋 草稿 |
| [System-70.md](System-70.md) | System > Operator, Setting, Backup | ✅ 完成 |
| [System-Domain.md](System-Domain.md) | System > Domain | ✅ 完成 |

---

## 6. 验收标准

- [ ] 9 个 L1 菜单全部可访问
- [ ] 菜单排列与 TAES 方法论对齐
- [ ] E队 Owner 只能看到自己团队的数据
- [ ] 協力營 Operator 可看到全局数据
- [ ] 首页仪表盘展示关键指标
- [ ] 全局搜索功能可用
- [ ] 关联 Issue 的功能均已实现

---

## 7. 决策记录

### 已决策

- [x] **使命 Mission 独立为 L1**：用 MR（Mission Repo）构成，1 Mission = 1 GitHub Repo
- [x] **AITa vs 協力營 边界**：協力營管"买电"（算力池订阅/配额），AITa 管"用电"（模型路由/知识库/效能评估）
- [x] **通知 独立为 L1**：统一管理通知、审批流、工单、告警

### 开放问题

- [ ] Gemini 作为 Azure 的故障转移方案，SLA 如何定义？
- [ ] E队 Owner 的"申请新 Mission"审批流是否需要多级审批？
- [ ] Alert 告警是否需要对接外部系统（企业微信/钉钉/Slack）？

---
---

## ⚠️ 以下是存量菜单，不删除

---

## 附录：Schema 定义（数据模型参考）

### A. E队 Schema

| 实体 | Type | 说明 | 关系 |
| :--- | :--- | :--- | :--- |
| Player | Entity | Agent 成员档案 | Belongs to 1 E队；Guest 可加入多个 |
| Teamsidol | Role | 主角/配角角色 | 用于计算贡献度 |
| E队 | Identifier | 团队番号（如 I117） | 强调团队归属 |
| M365 | Boundary | Security Group | 定义协作边界 |
| Publisher | Legal Entity | 市场上架者 | 需 Partner/Developer 资质 |
| Site | Location | 物理/虚拟办公空间 | 1 E队 : N Site |
| Mission | Objective | 核心使命 | 1 E队 = 1 Mission |
| Repo | Asset | Mission Repo | 1 Mission = 1 GitHub Repo (Private) |

### B. 協力營 Schema

| 实体 | Type | 说明 | 功能 |
| :--- | :--- | :--- | :--- |
| Entities | Provider | 合同主体 | 法律与商业载体 |
| Tenancy | Container | M365 Tenant | 全局策略与资源池边界 |
| Licenses | Authorization | GitHub Enterprise + Copilot | 席位分发与权限控制 |
| AI Pool | Compute | Azure Foundry | AI 模型与算力调度 |
| Ext. Subs | External | 第三方 AI 订阅 | 异构 AI 能力补充 |
| Edge Nodes | Network | POP 节点 | 跨境合规与访问优化 |

---

> **版本**：v2.1 | **最后更新**：2026-01-12 | **对齐**：TAES v1.0
