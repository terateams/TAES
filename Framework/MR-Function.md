# 🚀 Mission Reposite Formula (MRF)

> **Full Name**: Mission Reposite Formula (MR推力公式)
> **Version**: 1.1 (2025/12 Reasoning Era)
> **Prerequisite**: GitHub Native Environment
> **Formula**: $E = M \times C^2 \times AI$

---

## 1. The Physics of Agency (核心物理法则)

**MRF (MR推力公式)** 是构建 AI 原生团队的核心方法论。在 2025 年底的 AI 原生时代，随着 **ChatGPT 5.2 (Deep Reasoning)**、**Gemini 3.0 Pro (Infinite Context)** 和 **Claude Opus 4.5 (Nuanced Generalization)** 的出现，MRF 的内涵发生了质的飞跃。

$$ E = M \times C^2 \times AI $$

### 🧩 变量定义 (Variables V1.1)

| 符号 | 变量名 | 定义 (V1.1) | 对应 GitHub Repo 目录 | 关键动作 |
| :--- | :--- | :--- | :--- | :--- |
| **E** | **Empowerment** | **系统效能**。不仅是交付，更是**智能涌现 (Emergence)**。 | `/Teams` | **Deliver** (交付) |
| **M** | **Mission** | **任务/使命**。AI 可理解的**目标函数 (Objective Function)**。 | `/MISSION` | **Define** (定义) |
| **C¹** | **Context** | **语境/记忆**。从 RAG 进化为**全量上下文 (Full-Context)**。 | `/CONTEXT` | **Ground** (锚定) |
| **C²** | **Connection** | **连接/工具**。基于 **GitHub Copilot** 的**工具使用 (Tool Use)**。 | `/CONNECTION` | **Bridge** (连接) |
| **AI** | **Intelligence** | **推理/泛化**。从生成 (Generation) 进化为**推理 (Reasoning)**。 | `/AI` | **Reason** (推理) |

---

## 2. The Architecture (架构映射)

MRF 的前提是**GitHub Native**。为了承载 2025 年顶级模型的推理与泛化能力，我们将 **GitHub Repository** 转化为一个**认知架构 (Cognitive Architecture)**。

### 📂 `/MISSION` (The Kernel / 内核)
> **适配模型**: **ChatGPT 5.2 (System 2 Thinking)**
- **作用**: 提供高密度的逻辑约束。ChatGPT 5.2 擅长处理复杂的逻辑链条，因此 Mission 定义必须具备**数学级的严谨性**。
- **结构**:
  - `outline/`: 逻辑推演链 (Chain of Thought)。
  - `chapters/`: 核心交付物 (Product)。
  - `docs/`: 过程文档与规范。
  - `assets/`: 任务相关资产。

### 📂 `/CONTEXT` (The Memory / 记忆)
> **适配模型**: **Gemini 3.0 Pro (10M+ Token Context)**
- **作用**: 提供无限的背景信息。Gemini 3.0 可以一次性吞吐整个 `/CONTEXT` 目录，无需传统的 RAG 切片。
- **结构**:
  - `Players/`: 完整的团队心理画像与偏好。
  - `Story/`: 完整的项目历史与决策树。
  - `Times/`: 宏观环境的全量数据。
- **策略**: **Context Dumping**。直接将相关文件夹作为上下文投喂给 Gemini，获取全局视角的洞察。

### 📂 `/CONNECTION` (The Bridge / 连接)
> **适配模型**: **GitHub Copilot (Workspace Agent)**
- **作用**: 物理世界的执行手。Copilot 能够理解 `/CONNECTION` 中的 Playbook，并自动调用 VS Code 插件或终端命令。
- **结构**:
  - `Players/`: 包含团队属性、权限映射及协作规范。
  - `Workbench/`: AI 原生工作台配置 (VS Code, Edge, Kard 体系)。
  - `Workplace/`: 物理场所映射 (总部/分部/工厂/SOHO)，包含时段定义。
  - `Workplane/`: 网络工作面配置 (S服务器/N节点)，包含 XLA 品质等级约定。

### 📂 `/AI` (The Brain / 大脑)
> **适配模型**: **Claude Opus 4.5 (Nuance & Style)**
- **作用**: 定义“数字员工”的人格与风格。Claude 4.5 在风格迁移和细腻度上具有统治力。
- **结构**:
  - `Agents/`: 存储精细调整的 System Prompts (Personas)。
  - `LLM/`: **Model Routing (模型路由表)**。定义场景与模型的映射关系。
  - `Memory/`: 向量索引与短期记忆缓存。
  - `MCP/`: Model Context Protocol 配置，连接外部工具。

---

## 3. The 2025 Model Landscape (能力矩阵)

在 MRF 架构中，我们采用 **"Model Routing" (模型路由)** 策略，根据 $M, C, AI$ 的不同需求调用最强模型：

| 维度 | 核心需求 | 推荐模型 (2025/12) | 在 MRF 中的角色 |
| :--- | :--- | :--- | :--- |
| **M (Mission)** | 复杂逻辑规划、多步推理 | **ChatGPT 5.2** | **Planner (规划者)**。负责拆解任务，生成大纲。 |
| **C¹ (Context)** | 超长文本理解、跨文件关联 | **Gemini 3.0 Pro** | **Librarian (图书管理员)**。负责阅读整个 Context，回答背景问题。 |
| **AI (Style)** | 拟人化表达、文学创作、代码风格 | **Claude Opus 4.5** | **Artist (艺术家)**。负责最终内容的润色与生成。 |
| **C² (Connect)** | IDE 集成、代码补全、工具调用 | **GitHub Copilot** | **Worker (执行者)**。负责在 VS Code 中落地代码与操作。 |

---

## 4. Implementation (实施支撑)

### 4.1 核心引擎
- **GitHub Repository**: 单一事实来源 (SSOT)，MRF 的物理载体。
- **GitHub Copilot**: 统一的编排层 (Orchestrator)，负责在 IDE 内调度上述模型能力。
- **VS Code**: 包含 **V Kard** 插件的集成环境。

### 4.2 实施指南
> 具体实施细节请参考独立文档：
> 👉 **[AI Team Agency Playbook](../Players/AI%20Team%20Agency%20playbook.md)**

---

## 5. The Value (价值主张 V1.1)

**"Reasoning is the new Oil." (推理是新的石油)**

通过 MRF V1.1，我们不再仅仅是“生成”内容，而是在“推演”未来：
1.  **深度推理 (Deep Reasoning)**: 利用 GPT-5.2 解决 $M$ 中的复杂逻辑难题。
2.  **全量认知 (Full Cognition)**: 利用 Gemini 3.0 消除 $C^1$ 中的信息丢失。
3.  **细腻泛化 (Nuanced Generalization)**: 利用 Claude 4.5 提升 $E$ 的交付品质。
