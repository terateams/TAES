# TeamsPlane Controller (TPC) 架构设计书

> **Version**: 1.0 | **Status**: Active | **Date**: 2026-01-02  
> **Scope**: TeamsCamp 托举能力的网络编排组件  
> **Owner**: EdgeTeam Architecture Group  
> **Related**: [TeamsCamp playbook](TeamsCamp-playbook.md) | [NexusPass playbook](NexusPass-playbook.md) | [Workplane](../../../CONNECTION/Workplane/README.md)

---

## 0. 概述 (Overview)

> 🛫 **核心定位**: TPC 是 **TeamsCamp 托举能力** 的网络编排组件，不是独立产品。
> 它为 E队 提供"网络即服务"的底层能力，但对外不暴露 TPC 概念。

**TeamsPlane Controller** 是 T营 实现"网络托举"承诺的技术内核。它将 E队 的业务意图 (Mission) 自动转化为网络配置 (Policy)，确保 Player 在任何 Workplace 都能获得稳定的 AI/Cloud 连接体验。

### 0.1 客户场景 (Jobs-to-be-Done)

| 角色 | 场景 | TPC 价值 |
|------|------|----------|
| **E队 Don** | "我的团队需要稳定访问 GitHub Copilot" | TPC 自动配置最优路径，无需 Don 理解网络 |
| **Player** | "在家办公时 AI 响应变慢了" | TPC 检测到质量下降，自动切换备用线路 |
| **T营 运维** | "新开通一个 E队，要配网络" | TPC 根据 E队 Profile 自动生成配置 |

---

## 1. 核心理念：双平面架构 (Dual-Plane Architecture)

在 TAES 体系中，我们将协作基础设施抽象为两个平行的“平面”。TPC 的核心职责，就是实现这两个平面的**动态映射与对齐**。

### 1.1 Workplace (工作台) - 需求侧
> *Player 的主观视角*

*   **定义**：Player 执行 Mission 的操作环境。
*   **构成**：
    *   **VS Code**: AI 深度集成工作台 (Copilot Chat, Agent Mode)。
    *   **Edge Browser**: 入门级使用 (Web Copilot, SaaS Apps)。
    *   **AI Token**: 所有 Workplace 均配置 AI Token，作为托举服务凭证。
    *   **NexusPass**: Player 身份锚定，策略跟随用户移动。
*   **特征**：动态、业务导向、意图驱动 (Intent-Based)。

### 1.2 Workplane (网络托举平面) - 供给侧
> *参见 [Workplane README](../../../CONNECTION/Workplane/README.md)*

*   **定义**：承载 Workplace 与 AI/Cloud 之间数据流动的网络基础设施。
*   **XLA 承诺** (Experience Level Agreement)：
    *   Latency < 99ms (Copilot 实时感)
    *   Packet Loss < 1% (会议不卡顿)
    *   Bandwidth > 10 Mbps (模型下载)

### 1.3 TeamsPlane (团队平面) - 编排层
> *E队 专属的逻辑网络视图*

*   **定义**：Workplane 之上，为每个 E-Team 定制的逻辑网络切片。
*   **构成**：
    *   **Nodes**: CPE (MikroTik), Cloud GW, Server。
    *   **Paths**: 经过编排的、具有特定 SLA 的网络链路。
    *   **Policies**: 路由策略、QoS、ACL。
*   **特征**：多租户隔离、策略可编程、自动化部署。

---

## 2. TeamsPlane Controller (TPC) 系统定位

> ⚠️ **内部组件声明**: TPC 是 TeamsCamp 的内部能力，对 E队/Player **不直接暴露**。
> 对外统一使用"网络托举"或"Workplane 服务"表述。

**TPC 是连接 Workplace (意图) 与 Workplane (设施) 的桥梁。**

它不仅仅是一个网络控制器 (SDN Controller)，更是一个**业务感知的编排器**。它将 Player 的 "Mission Requirements" 翻译为 TeamsPlane 上的 "Network States"。

### 2.1 核心价值主张 (对 T营 运维)
*   **Orchestration (编排)**: 自动化构建 E队 专属网络，减少人工配置。
*   **Control (控制)**: 实时调整路径质量，自动故障切换。
*   **Visibility (可视)**: 让网络状态可观测、可审计、可追溯。

### 2.2 对外价值传递 (对 E队/Player)
| 内部能力 | 对外表述 | 客户感知 |
|----------|----------|----------|
| TPC Orchestration | "网络自动开通" | 签约即用，无需配置 |
| TPC Control | "智能线路优化" | AI 响应快，会议不卡 |
| TPC Visibility | "网络健康报告" | 月度报告，透明可信 |

---

## 3. 架构组件 (The Four Pillars)

作为顶级架构设计，我们将 TPC 解构为四个核心支柱，形成闭环控制系统。

### 3.1 Source of Truth (事实源) - NetBox
> *The Map (地图)*

*   **角色**：定义 TeamsPlane 的“应有状态 (Desired State)”。
*   **职责**：
    *   **资产管理**：记录所有 CPE、线路、IP、VLAN。
    *   **拓扑定义**：定义站点间连接关系、Overlay 隧道配置。
    *   **配置模板**：作为自动化配置生成的唯一数据源。
*   **关键原则**：**"If it's not in NetBox, it doesn't exist."** (非标即非法)。

### 3.2 Observability (可观测性) - TeamsDisplay
> *The Radar (雷达)*

*   **角色**：感知 TeamsPlane 的“实际状态 (Actual State)”。
*   **原型**：基于 **Cacti 最新版**，扩展了 **MD Context** 能力。
*   **层级**：在 **Tree** (树)、**Leaf** (叶)、**Device** (设备) 三个层面进行描述。
*   **观测范围**：
    0.  **ROS Netwatch**: 基础连通性监控。
    1.  **TeamsDNS**: Doc 方式的 DNS 功能组件监控。
    2.  **Service Check**: Doc 方式的服务可用性检查。
    3.  **IP Quality**: Doc 方式的 IP 质量监测组件。

### 3.3 Business Support (业务支撑) - TeamsEdge
> *The OSS (运营支撑)*

*   **角色**：核心 **OSS 业务支撑系统**，管理所有业务单元。
*   **职责**：
    *   **Resource Management**: 对 TeamsCamp, E-Teams, Workplane, GitHub Workshop 等进行 CRUD 操作。
    *   **Configuration**: 由业务人员操作，为 E-Teams 和 Player 配置资源与策略。
    *   **AI Capability**: *AI Copilot 能力规划中 (Pending Implementation)*，未来将辅助意图理解与自动化 ("我要开个高质量视频会") 转化为技术参数 ("保障 UDP/443, 优先级 High, 路径 A")。
    *   **Root Cause Analysis**：结合 AI 分析 TeamsDisplay 数据，解释网络异常。
    *   **Change Management**：生成变更计划，评估风险。

### 3.4 Orchestration Core (编排核心) - PathPilot
> *The Autopilot (自动驾驶仪)*

*   **角色**：执行控制循环 (Control Loop)。
*   **职责**：
    *   **Diff Calculation**：对比 Desired State (NetBox) 与 Actual State (TeamsDisplay)。
    *   **Policy Push**：通过 API/SSH 向 MikroTik 下发路由、QoS、防火墙策略。
    *   **Self-Healing**：检测到链路劣化时，自动切换路径 (Traffic Engineering)。

---

## 4. 运行逻辑：从 Mission 到 Packet

1.  **Trigger (触发)**: Player 在 Workplace 启动一个 Mission (e.g., "开始代码评审")。
2.  **Intent (意图)**: TeamsEdge 识别该 Mission 需要 "低延迟访问 GitHub" 和 "高带宽访问视频服务器"。
3.  **Plan (规划)**: TPC 查询 NetBox，计算最佳路径组合 (Path A for Git, Path B for Video)。
4.  **Deploy (部署)**: PathPilot 向相关 CPE 下发策略 (PBR, QoS Queue)。
5.  **Monitor (监控)**: TeamsDisplay 持续监测路径质量。
6.  **Feedback (反馈)**: 如果 Path B 拥塞，TeamsDisplay 告警，PathPilot 自动切换至 Path C。

---

## 5. 生态集成 (Ecosystem Integration)

### 5.1 Identity Layer - NexusPass 集成
> *参见 [NexusPass playbook](NexusPass-playbook.md)*

**已集成能力**：
*   **User-Centric Policy**: 当 Player 登录 Workplace 时，TPC 通过 NexusPass 获知 `NP <-> IP` 映射。
*   **策略跟随**: 网络策略跟随用户移动，而非绑定物理端口。
*   **权限继承**: E队 的网络权限从 T营 托举关系继承。

### 5.2 Control Protocol (南向接口)
| 协议 | 用途 | 设备要求 |
|------|------|----------|
| **REST API** | 配置变更 | MikroTik RouterOS v7+ |
| **SSH/Script** | 复杂指令/旧版兼容 | 全版本 |
| **SNMP v3** | 性能采集 | 全版本 |

### 5.3 Data Model - Mission Network Profile (MNP)

定义 Mission 对网络的需求，由 TeamsEdge 生成，TPC 执行：

```yaml
# MNP Schema (Draft)
mission_id: "MR-2026-001"
e_team: "T189"
requirements:
  - function: "github_copilot"
    priority: high
    latency_max_ms: 100
    bandwidth_min_mbps: 5
  - function: "video_meeting"
    priority: medium
    jitter_max_ms: 30
```

---

## 6. 实施路线图 (Roadmap)

| 阶段 | 里程碑 | 交付物 | 状态 |
|------|--------|--------|------|
| **P0** | NetBox 资产录入 | 全量 CPE/线路入库 |  Done |
| **P1** | TeamsDisplay 部署 | Cacti fork + MD Context |  Done |
| **P2** | PathPilot MVP | 手动策略下发 |  In Progress |
| **P3** | NexusPass 联动 | User-Centric Policy |  Planned |
| **P4** | MNP 自动化 | Intent  Policy 闭环 |  Planned |

---

*Last Updated: 2026-01-02 by EdgeTeam Architecture Group*