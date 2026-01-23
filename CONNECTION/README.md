# 🔌 CONNECTION - 可达性基础设施

> **C¹ in E=MC²AI**
> 
> *"在 AI 可用之前，先确保网络可达。"*

---

## 🏗️ 定位：T营 造的"桥"

> **CONNECTION 是 T营 提供的基础设施——桥可以买，路必须自己走。**

本目录包含 TAES 中 **A (Augment)** 的**物理配置**（Workplane、AITa 等）。

框架文档已迁移至 `CONTEXT/TAES/Framework/`：

| 文档 | 位置 | 说明 |
|------|------|------|
| **Augment.md** | [Framework/Augment.md](../CONTEXT/TAES/Framework/Augment.md) | A 的组织化实现 |
| **Team-Augment.md** | [Framework/Team-Augment.md](../CONTEXT/TAES/Framework/Team-Augment.md) | 团队托举的桥与路 |

```
TAES 四字归位：
T → TeamsCamp.md (根目录)
A → CONTEXT/TAES/Framework/Augment.md ← 框架文档
    CONNECTION/*                       ← 配置实现
E → Teams/README.md
S → Teams/Metrics/
```

---

## Why — 为什么需要 CONNECTION？

> **CONNECTION 存在的唯一目的：让 E队 能够执行 MISSION。**

```
MISSION (为什么连接？)
    ↓
CONNECTION (如何让连接成为可能？)
    ↓
CONTEXT + AI (在连接之上构建智能)
    ↓
Teams (EdgeTeams 交付)
```

在中国互联网环境下，以下条件**不是默认存在的**：

| 挑战 | 影响 |
|------|------|
| OpenAI 等 LLM 默认不可达 | 无法使用主流 AI 服务 |
| Google/GitHub 账号难申请 | 缺少必要的数字身份 |
| 外汇管制 | 持续付费困难 |
| 团队分布多地 | 公司/车间/仓库/家/旅途 |

**CONNECTION 是 MR 框架的运行前提，不是可选组件。**

> 📖 深入理解 CONNECTION 的哲学基础，请阅读 [NEXUS.md](NEXUS.md)

---

## 业务承诺

通过 CONNECTION 层，MR 框架向 E队 承诺：

| 承诺 | 说明 |
|------|------|
| ✅ **网络可靠** | 工作时段内能够访问全球互联网服务 |
| ✅ **AI 可用** | LLM API 通道畅通 |
| ✅ **身份就绪** | 必要的数字护照已配置 |
| ✅ **按需弹性** | 工作时段全量，非工作时段可降级 |

> 📋 查看落地执行规范，请阅读 [_spec/](./_spec/README.md)

---

## 五层架构 (5W 模型)

| 层 | 5W | 核心问题 | 管理的稀缺性 |
|----|-----|----------|-------------|
| **Workplace** | Where | 在哪工作？ | 空间稀缺 |
| **Worktime** | When | 什么时候工作？ | 时间稀缺 |
| **Workbench** | What | 用什么设备？ | 设备稀缺 |
| **Workplane** | How | 怎么连接？(bit 可靠) | 带宽稀缺 |
| **Workpass** | Who | 以谁的身份？ | 身份稀缺 |
| **AITa** | Token | AI 如何可用？(Token 可用) | 算力稀缺 |

### 命名规范

| 层级 | 规则 | 例子 | 说明 |
|------|------|------|------|
| L0 | ALL_CAPS | `CONNECTION/` | E=MC²AI 公式变量 |
| L1 | PascalCase (单词) | `Workplace/`, `Workpass/` | 业务模块，Work + 功能词 |
| L1 | 品牌例外 | `AITa/` | 注册商标保持原样 |
| L2+ | kebab-case | `providers/` | 具体文件/子目录 |

```
┌─────────────────────────────────────────────────────────────┐
│                    CONNECTION 五层架构                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────┐                                            │
│  │  Workplace  │  Where：在哪工作？                         │
│  │  (工作场所)  │  办公室/车间/仓库/家/旅途                   │
│  └──────┬──────┘                                            │
│         │                                                   │
│         ▼                                                   │
│  ┌─────────────┐                                            │
│  │  Worktime   │  When：什么时候需要连接？                   │
│  │  (工作时间)  │  ACTIVE/STANDBY/OFFLINE                    │
│  └──────┬──────┘                                            │
│         │                                                   │
│         ▼                                                   │
│  ┌─────────────┐                                            │
│  │  Workbench  │  What：用什么设备？                        │
│  │  (工作台)    │  电脑/平板/手机                            │
│  └──────┬──────┘                                            │
│         │                                                   │
│         ▼                                                   │
│  ┌─────────────┐                                            │
│  │  Workplane  │  How：数据包如何到达？                     │
│  │  (网络面)    │  代理/VPN/API通道                          │
│  └──────┬──────┘                                            │
│         │                                                   │
│         ▼                                                   │
│  ┌─────────────┐                                            │
│  │  Workpass   │  Who：用谁的身份？                         │
│  │  ⊕ 元枢证   │  账号/认证/付费                            │
│  └─────────────┘                                            │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

---

## 目录结构

```
CONNECTION/
├── README.md               # 本文件 - 操作总览
├── NEXUS.md                # 哲学基础与架构原理
│
├── Workplace/              # Where: 场所层
│   ├── README.md           # 据点总览
│   ├── office.md           # 🏢 办公室配置
│   ├── workshop.md         # 🏭 车间配置
│   ├── warehouse.md        # 📦 仓库配置
│   ├── home.md             # 🏠 居家配置
│   └── mobile.md           # 🚀 移动办公配置
│
├── Worktime/               # When: 时间层
│   ├── README.md           # 状态机定义
│   ├── schedule.md         # 排班表与时段定义
│   └── policies.md         # 状态切换与降级策略
│
├── Workbench/              # What: 设备层
│   ├── README.md           # 设备要求与工具链
│   ├── Manual/             # 新手入职手册 (7个文件)
│   └── tools/              # 基础设施脚本
│
├── Workplane/              # How: 网络层 (bit 可靠)
│   └── README.md           # 路由策略与通道配置
│
├── Workpass/               # Who: 身份层 (⊕ 元枢证)
│   ├── README.md           # "One account, Nexus all"
│   ├── billing.md           # 🆕 账务与权益（Invoice → Entitlement）
│   ├── providers/          # 供应商实现
│   │   ├── google.md       # Google Account
│   │   ├── github.md       # GitHub 账号
│   │   └── payment.md      # 支付通道
│   └── registry.md         # 持有者登记
│
└── AITa/                   # 🆕 Token: AI托管层 (Token 可用)
    ├── README.md           # AITa 总览
    ├── Microsoft.md        # 微软体系 (Copilot + M365)
    ├── Google.md           # Google 体系 (Gemini)
    ├── _models.md          # 模型层追踪
    ├── _template.md        # 新增 AITa 模板
    └── _meta.yaml          # 结构化元数据 (AI 可读)
```

> 💡 **托举效应 = Workplane (bit 可靠) × AITa (Token 可用)**
> 
> 两者共同构成 TAES 中 **A (Augment)** 的基础设施层。

---

## 成本模型

```
┌────────────────────────────────────────────────────────────┐
│                  CONNECTION 成本模型                       │
├────────────────────────────────────────────────────────────┤
│                                                            │
│  传统模式 (专线)                                            │
│  ════════════════                                          │
│  24h × 固定带宽 × 人数 = 高固定成本，低利用率               │
│                                                            │
│  MR 模式 (按需)                                             │
│  ════════════════                                          │
│  Σ(Workplace × Worktime × 实际需求) = 弹性成本             │
│                                                            │
│  ┌─────────┬─────────┬─────────┐                           │
│  │  ACTIVE │ STANDBY │ OFFLINE │                           │
│  │  工作中  │  待机   │  离线   │                           │
│  ├─────────┼─────────┼─────────┤                           │
│  │ 全量带宽 │ 基本带宽 │ 无消耗  │                           │
│  │ ¥¥¥     │ ¥       │ ¥0      │                           │
│  └─────────┴─────────┴─────────┘                           │
│                                                            │
│  典型节省：40-60%                                           │
│                                                            │
└────────────────────────────────────────────────────────────┘
```

---

## 启动前检查清单

在开始任何 Mission 之前，确认以下条件：

- [ ] **Workplace**: 确认当前工作地点，加载对应配置
- [ ] **Worktime**: 确认当前时段状态（ACTIVE/STANDBY）
- [ ] **Workbench**: 设备已就绪，VS Code/编辑器可用
- [ ] **Workplane**: 网络通道畅通，能访问 github.com
- [ ] **Workpass**: 至少一个有效账号，API Key 可用

---

## 与公式的关系

```
E=MC²AI

执行顺序：
1. CONNECTION (C¹) ← 先确保可达性 ★ 你在这里
   └─ Workplace → Worktime → Workbench → Workplane → Workpass
2. CONTEXT (C²)    ← 然后建立语境
3. AI              ← AI 才能工作
4. MISSION         ← 任务得以执行
5. E               ← EdgeTeams 交付
```

**C¹ 是 C² 的前提。没有 CONNECTION，后续一切都无法生效。**

---

> *CONNECTION 不是在描述"连接是什么"，而是在声明"我们如何让连接成为可能"。*

---

## 与公式的关系

```
E=MC²AI

执行顺序：
1. CONNECTION (C¹) ← 先确保可达性 ★ 你在这里
2. CONTEXT (C²)    ← 然后建立语境
3. AI              ← AI 才能工作
4. MISSION         ← 任务得以执行
5. E               ← EdgeTeams 交付
```

**C¹ 是 C² 的前提。没有 CONNECTION，后续一切都无法生效。**

---

> *CONNECTION 不是在描述"连接是什么"，而是在声明"我们如何让连接成为可能"。*
