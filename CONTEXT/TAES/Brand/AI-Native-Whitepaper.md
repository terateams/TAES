## 2. 核心定义：什么是 AI Native（Defining AI Native）

### 2.0 定义陈述（Definition Statement）

在 2025 的技术与监管语境下，**AI Native** 不是“使用 AI 工具”，而是把 AI 变成组织的**默认执行层（default execution layer）**，并围绕它系统性重构三件事：

1. **意图（Intent / Mission）→ 可执行规格（Executable Specs）**
   将业务目标、验收口径、优先级与约束条件，表达为可机器执行/可自动验证的规格（specifications），而不仅是“口头需求”或“PRD 文档”。

2. **约束（Constraints / Boundaries）→ 可审计门禁（Policy & Guardrails & Evals）**
   将安全、隐私、合规、品牌、预算、权限与外部监管要求，编码为可执行、可追溯、可审计的门禁体系（policy-as-code、guardrails、evaluation gates），形成“允许 AI 自治的边界”。

3. **证据（Evidence）→ 运行时沉淀为治理与改进依据（Telemetry / Logs / Incident Loop）**
   将模型与智能体在运行中的输入、输出、工具调用、关键决策与异常事件，自动沉淀为遥测（telemetry）、日志（logs）与事故闭环（incident loop），用于审计、复盘、持续改进与监管应对。

这一 AI-native 的“内生化”定义与白皮书类研究的共识一致：**AI 不再是外挂组件，而是贯穿设计、部署、运行、维护的固有能力（intrinsic capability）**，并且必须以**可信性（trustworthiness）**与**数据/知识生态（data-driven & knowledge-based ecosystem）**为前提。([ericsson.com][1])

---

### 2.0.1 关键特征（Key Characteristics）

AI Native 组织通常具备以下可辨识特征（也是“是否 AI Native”的审计式判断线索）：

* **规格前置（Spec-first）**：先定义可验证的“要达成什么”，再允许 AI 产生方案与执行。
* **边界编码（Constraints-as-code）**：将“不能做什么”固化为门禁与评测，而不是依赖事后人工发现。
* **证据默认开启（Evidence-by-default）**：默认记录、默认可追溯、默认可复盘；把治理从“制度”落到“数据”。
* **生命周期治理（Lifecycle governance）**：覆盖从设计、部署到运行与维护的全生命周期机制（而非只管上线前）。([ericsson.com][1])

---

## 2.1 管理范式：从“人工过程管控”到“意图/约束/证据”治理

### 2.1.1 对比框架（Operating Paradigm Comparison）

| 维度   | 传统：Human-Process Centric          | AI Native：Intent / Constraint / Evidence Centric      |
| ---- | --------------------------------- | ----------------------------------------------------- |
| 管理对象 | 人做了什么、用了多少工时、提交了多少代码              | 使命是否清晰、边界是否可执行、证据是否可审计                                |
| 典型机制 | Daily/Standup、工单吞吐、人工 Code Review | Specs（验收可测）、Guardrails（门禁可跑）、Evals（评测可复现）、Logs（证据可追溯） |
| 质量保障 | 以“过程合规”替代“结果证明”（容易形式化）            | 以“可验证证据”证明结果与合规（可审计、可复盘）                              |
| 自治方式 | 强依赖人工监督、人工分配与人工复核                 | **授权自治（permissioned autonomy）**：边界内自动执行，越界触发门禁与升级     |

### 2.1.2 核心机制：授权自治（Permissioned Autonomy）

AI Native 的关键不是“让 AI 做更多”，而是**让 AI 在明确授权范围内自主行动，并对越界行为具备可证明的阻断与问责机制**：

* **在边界内自动执行**：允许智能体在预先定义的权限、预算、数据与风险阈值内完成任务闭环。
* **越界/高风险动作触发人类审批与升级**：当动作触及敏感数据、对外发布、关键交易、法律风险或不可逆操作时，必须进入审批链。
* **全程留痕，满足审计与问责**：高风险 AI 系统在法规层面就被要求具备日志记录与人类监督机制；例如 EU AI Act 对高风险 AI 系统提出**自动记录日志（logs）**与**人类监督（human oversight）**等要求。([EUR-Lex][2])

> 白皮书式落地要点：
> “自治”不是“黑盒无限权力”，而是“**可撤销、可分级、可审计**的行动授权”。

### 2.1.3 价值与风险（Benefits & Risks）

**主要价值（Pros）**

* 将管理关注点从“过程表演”转向“可验证结果”，显著提升在多智能体/高自动化条件下的可控性与交付效率。
* 将合规与安全从“培训与口号”落到“门禁与证据”，更易跨团队复制、跨地域复用。
* 更贴合监管走向：例如欧盟围绕透明度、训练数据摘要、系统性风险等为 GPAI 提供合规支持工具与治理框架。([Digital Strategy][3])

**主要风险（Cons / Control Points）**

* 若把“过程”误解为“可以不要”，会与审计、监管与客户尽调要求发生冲突；正确做法是把过程**自动化并证据化**。
* 若边界定义不完整，自治会放大错误与风险外溢；必须持续红队化测试与边界回归（regression）。
* 若证据链缺失，组织会在事故、纠纷、跨境合规与客户审计时陷入“无法证明”的被动局面。

---

## 2.2 核心公式（升级版）

### 2.2.1 公式（Whitepaper Formulation）

你原公式的精神正确，但在企业工程、合规审计与跨组织复用上，更可控的表达是：

```text
交付影响（Delivery Impact）
= (使命清晰度 Mission Clarity)
× (约束强度 Guardrails & Boundary Quality)
× (证据闭环速度 Evidence Loop Speed)
× (数据与工具就绪度 Data/Tool Readiness)
× (有效模型能力 Effective Model Capability)
```

### 2.2.2 变量释义与度量建议（Operational Definitions & Metrics）

1. **使命清晰度（Mission Clarity）**

   * 定义：目标是否可量化、可验收、可拆解为可执行规格（Specs）。
   * 度量示例：验收标准覆盖率、需求歧义率、返工率、Specs→Tests 映射完整性。

2. **约束强度（Guardrails & Boundary Quality）**

   * 定义：边界是否被编码为门禁、评测与权限控制，并能在运行时真正拦截越界。
   * 度量示例：红队通过率/阻断率、策略覆盖率、越界事件数、权限最小化达标率。

3. **证据闭环速度（Evidence Loop Speed）**

   * 定义：从异常/缺陷/事故→定位→修复→回归→上线的周期速度（组织学习速度）。
   * 度量示例：MTTD/MTTR、事故复盘完成周期、评测集更新频率、回归门禁自动化比例。

4. **数据与工具就绪度（Data/Tool Readiness）**

   * 定义：AI 是否能在合规权限下获取“做事所需”的数据与工具（系统接口、工作流编排）。
   * 度量示例：关键系统连接率、数据权限与脱敏策略覆盖率、可调用工具数、失败回退成功率。

5. **有效模型能力（Effective Model Capability）**

   * 定义：不是单看“模型智商”，而是综合能力、成本、可靠性工程与可运维性后的有效产出。
   * 可拆解：
     **有效模型能力 = 模型能力（capability） × 可用算力/成本 × 可靠性工程（SLA/回退/监控）**
   * 度量示例：任务成功率、单位任务成本、延迟分位数、SLA 达成率、漂移检测命中率。

> 合规一致性提示：
> 当系统进入“高风险”范畴时，EU AI Act 对日志记录、透明度信息、人类监督等提出明确要求，这会直接影响“证据闭环速度”与“边界质量”的实现方式。([EUR-Lex][2])

---

## 2.3 角色与资产的重定义（从“Prompt & Tests”扩展为“Specs / Evals / Policies / Data / Telemetry”）

### 2.3.1 人（Humans）：从 Coder 到 Responsible System Builder

AI Native 组织中，人从“代码撰写者（Coder）”升级为“系统责任人（Responsible System Builder）”，至少包含四类关键职责（可作为组织岗位或虚拟职责/RACI）：

1. **Mission Architect（使命架构师）**

   * 职责：将商业目标转成可验收规格（SLO/OKR/验收测试），并定义任务优先级与 ROI 约束。

2. **Boundary Owner（边界/风险负责人）**

   * 职责：把合规、安全、品牌、预算与权限要求写成可执行约束（policy-as-code），并维护边界回归机制。
   * 跨境关键点：数据跨境、客户数据用途限制、行业监管红线，需要在边界层实现“可执行合规”。

3. **Evaluation Engineer（评测工程师）**

   * 职责：把“质量”写成可持续的 evals/test harness（不仅是单元测试），并推动评测集与红队集常态化更新。

4. **AI Ops / LLMOps（运行负责人）**

   * 职责：监控、回退、漂移检测、事故响应、日志与证据链自动化，保障生产级可靠性与可审计性。

该组织化治理取向与 **ISO/IEC 42001** 所强调的“组织层 AI 管理体系（AIMS）”一致：通过政策、目标与过程（PDCA）实现可治理与持续改进，而不是只把系统“做出来”。([ISO][4])

---

### 2.3.2 资产（Assets）：从“源码中心”转向“规格—门禁—证据”资产组合

AI Native 的核心资产建议表述为一个组合，而不是只押注 Prompt：

1. **Executable Specs（可执行规格库）**：任务定义、验收口径、SLO、业务约束
2. **Evals & Tests（评测与测试库）**：功能、鲁棒性、偏差、隐私、提示注入、合规检查
3. **Policy & Guardrails（政策与护栏）**：权限、内容安全、数据边界、可解释/可追溯要求
4. **Data/Knowledge Fabric（数据/知识底座）**：RAG 知识、主数据、血缘、权限与脱敏策略
5. **Telemetry & Audit Trail（遥测与审计链）**：日志、版本、事故库、证据自动生成
6. **Tooling & Connectors（工具与连接器）**：让 AI “可行动”的关键（系统调用、流程编排、变更控制）

这样写的好处是：兼容“Prompt/Tests”的实践价值，但把可持续护城河放在更稳定、可审计、可跨团队复用的工程资产上。

---

### 2.3.3 执行（Execution）：可审计闭环（Auditable Closed Loop）

AI Native 的执行闭环建议以“可审计闭环”表述：

**Plan（生成方案）→ Act（受控执行）→ Verify（自动评测/门禁）→ Log（证据留存）→ Learn（迭代）**

* 对高风险动作默认“人类在环（human-in-the-loop）”，并通过权限与日志实现可问责。([EUR-Lex][2])
* 日本总务省/经产省在《AI事業者ガイドライン（第1.1版）》中强调：应以**风险ベースアプローチ（risk-based approach）**决定对策强度，并将指南作为 **Living Document** 在多方参与下、参考**アジャイル・ガバナンス（agile governance）**持续更新；这与“持续门禁 + 持续评测 + 持续改进”的 AI Native 运行方式高度一致。

---

### 2.3.4 价值与风险（Benefits & Risks）

**主要价值（Pros）**

* 组织级可复制：把“优秀工程师的经验”沉淀为 Specs/Evals/Policies/Telemetry 的系统资产。
* 合规可对接：日志、透明度信息与监督机制更易匹配欧盟、日本等市场的监管与客户审计诉求。([EUR-Lex][2])
* 迭代更快：证据闭环形成后，优化是“工程问题”而不是“玄学问题”。

**主要风险（Cons / Control Points）**

* 若缺少统一的评测与证据标准，组织会陷入“各团队各自为政”的评估噪声，导致治理失效。
* 若工具连接器权限设计粗放，智能体会把“自动化”变成“自动化事故”；必须坚持最小权限与可撤销授权。
* 若忽视数据/知识底座治理，AI 会在关键业务上表现为“高幻觉率、高不一致性”，反而拉低交付影响。

---

如你希望下一步把该定义直接落成白皮书可用的“可评估标准（AI Native Maturity Rubric）”，我可以在不改变上述定义框架的前提下，补齐：分级成熟度（L1–L5）、每级必备控制点、以及面向中/日/欧/港/美的差异化合规映射清单。

[1]: https://www.ericsson.com/en/reports-and-papers/white-papers/ai-native "A detailed study of the AI Native concept - Ericsson"
[2]: https://eur-lex.europa.eu/eli/reg/2024/1689/oj/eng "Regulation - EU - 2024/1689 - EN - EUR-Lex"
[3]: https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai "AI Act | Shaping Europe’s digital future"
[4]: https://www.iso.org/standard/42001 "ISO/IEC 42001:2023 - AI management systems"
