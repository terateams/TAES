# [Playbook] AITC 祘力资产 (v1.4)

> **Status**: Active | **Version**: 1.4 | **Date**: 2026-01-02
> **Scope**: AI Integrated Tenant Compute (AITC) 祘力资产管理
> **ERP Module**: TeamsEdge > TeamsCamp Management > AITC Assets
> **Parent**: [TeamsCamp playbook](TeamsCamp%20playbook.md) §5.4

---

## 0. 概述 (Overview)

> 🌟 **AITC** = AI Integrated Tenant Compute (AI集成租户算力)，专指基于微软订阅体系的托举型全球AI算力资产。
>
> 📢 **口语**: AITC祘力

### 0.1 祘力定义

**祘力** 是 TeamsEdge 生态的特殊用语，指基于微软订阅体系的全球 AI 算力资源：

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         祘力 (Computing Power) 三层架构                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  祘力 = 基于微软订阅的全球 AI 算力                                           │
│                                                                             │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                                                                     │   │
│  │  ┌─────────────────────────────────────────────────────────────┐   │   │
│  │  │           开发者祘力 (Developer AI)                          │   │   │
│  │  ├─────────────────────────────────────────────────────────────┤   │   │
│  │  │  GitHub Copilot          │  Azure AI Services               │   │   │
│  │  │  ─────────────────────── │  ───────────────────────────     │   │   │
│  │  │  • Individual/Business   │  • Speech, Vision, Language      │   │   │
│  │  │  • Enterprise            │  • Document Intelligence         │   │   │
│  │  │  • Workspace/Agent       │  • Custom Models                 │   │   │
│  │  └─────────────────────────────────────────────────────────────┘   │   │
│  │                                                                     │   │
│  │  ┌─────────────────────────────────────────────────────────────┐   │   │
│  │  │           用户祘力 (Productivity AI)                         │   │   │
│  │  ├─────────────────────────────────────────────────────────────┤   │   │
│  │  │  M365 Copilot            │  Copilot Studio                  │   │   │
│  │  │  ─────────────────────── │  ───────────────────────────     │   │   │
│  │  │  • Word/Excel/PPT AI     │  • 低代码 AI Agent               │   │   │
│  │  │  • Teams AI              │  • 自定义 Copilot                │   │   │
│  │  │  • Outlook AI            │  • Power Platform 集成           │   │   │
│  │  └─────────────────────────────────────────────────────────────┘   │   │
│  │                                                                     │   │
│  │  ┌─────────────────────────────────────────────────────────────┐   │   │
│  │  │           推理祘力 (Model AI)                                │   │   │
│  │  ├─────────────────────────────────────────────────────────────┤   │   │
│  │  │  Azure OpenAI Service    │  Model Catalog                   │   │   │
│  │  │  ─────────────────────── │  ───────────────────────────     │   │   │
│  │  │  • GPT-4o / GPT-4 Turbo  │  • Gemini (via Foundry)          │   │   │
│  │  │  • o1 / o1-mini          │  • Llama / Mistral               │   │   │
│  │  │  • DALL-E / Whisper      │  • Phi / 其他开源模型            │   │   │
│  │  └─────────────────────────────────────────────────────────────┘   │   │
│  │                                                                     │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
│  祘力最小集合 (AI Ready 门槛):                                              │
│  • GitHub Copilot (开发者祘力入门)                                          │
│  • Azure OpenAI Service 访问权限 (推理祘力入门)                             │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 0.2 AITC 架构位置

**AITC** 是 T营 持有的祘力订阅资产，相比 E队 直接采购具有明显的**托举效应**：

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      AITC 在 TeamsEdge 架构中的位置                          │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────┐         ┌─────────────┐         ┌─────────────┐           │
│  │     TC      │         │    AITC     │         │     ET      │           │
│  │   业务主体   │──持有──►│  祘力订阅   │──分配──►│    E队      │           │
│  │  (T营)      │         │ (AI算力)    │         │  (操作单元)  │           │
│  └─────────────┘         └─────────────┘         └─────────────┘           │
│                                                                             │
│  三层架构: TC (Business Entity) → AITC (AI祘力) → ET (EdgeTeam)            │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 0.3 AITC 词源解析

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      AITC 词源解析 (Etymology)                               │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  A  │  AI           │  人工智能        │  核心能力定位                       │
│  I  │  Integrated   │  集成的          │  与微软订阅体系深度整合              │
│  T  │  Tenant       │  租户            │  微软核心概念: M365/Azure Tenant    │
│  C  │  Compute      │  算力 (祘力)     │  TeamsEdge 特有用语                 │
│                                                                             │
│  ─────────────────────────────────────────────────────────────────────────  │
│                                                                             │
│  为什么选 "Integrated":                                                     │
│  • 体现托举效应 —— 通过整合 SPD/Startup/EDU 等资质获得优势                   │
│  • 区别于直接采购 —— 不是简单的订阅，而是整合后的托举资产                     │
│  • 与微软术语风格一致 —— Azure Integrated, M365 Integrated                  │
│                                                                             │
│  为什么选 "Tenant":                                                         │
│  • 微软订阅的核心载体 —— 所有权益挂载在 Tenant 上                            │
│  • 管理边界清晰 —— 一个 AITC 实例 = 一个 Tenant                             │
│  • 与 E队 分配对应 —— Tenant 是资源分配的物理单位                            │
│                                                                             │
│  为什么选 "Compute" (祘力):                                                  │
│  • TeamsEdge 生态特有概念 —— 祘力 = 基于订阅的 AI 算力                       │
│  • 与传统算力区分 —— 不是 GPU/CPU，而是 AI 服务能力                         │
│  • 简洁有力 —— 四字母对四汉字，便于口语传播                                  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 1. 术语规范 (Terminology)

| 中文 | 英文 | 符号 | 说明 |
| :--- | :--- | :--- | :--- |
| **祘力** | Compute | - | 基于微软订阅的全球 AI 算力 (TeamsEdge 特有用语) |
| **开发者祘力** | Developer AI | - | GitHub Copilot + Azure AI Services |
| **用户祘力** | Productivity AI | - | M365 Copilot + Copilot Studio |
| **推理祘力** | Model AI | - | Azure OpenAI + Model Catalog |
| **AITC** | AI Integrated Tenant Compute | AITC | AI集成租户算力 —— 基于微软订阅的托举型全球AI算力资产 |
| **AITC祘力** | - | (口语) | AITC 的日常简称，用于内部沟通 |
| **托举效应** | Hosting Effect | - | SPD资质 + Startup补贴 + EDU/NGO套利 + 统一运维 |
| **订阅类型** | Subscription Type | - | EDU / NGO / BIZ / Startup / Partner |
| **席位** | License / Seat | - | 订阅中的用户许可证数量 |
| **租户** | Tenant | - | M365 租户 (xxx.onmicrosoft.com) |
| **MAICPP** | MS AI Cloud Partner Program | - | 微软 AI 云合作伙伴计划 (原 MPN) |
| **SPD** | Solution Partner Designation | - | 解决方案合作伙伴资质 (6大领域) |
| **IUR** | Internal Use Rights | - | 内部使用权益 (合作伙伴专属) |
| **Founders Hub** | Microsoft for Startups | - | 微软创业扶持计划门户 |

---

## 2. 托举效应 (Hosting Effect)

### 2.1 AITC 托举来源

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      AITC 托举效应来源 (2024+ 体系)                          │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────────────────────────────────────────────────────────┐   │
│  │                    托举效应采购方式                                   │   │
│  ├─────────────────────────────────────────────────────────────────────┤   │
│  │                                                                     │   │
│  │  1. MAICPP 合作伙伴 (MS AI Cloud Partner Program)                   │   │
│  │     ┌─────────────────────────────────────────────────────────┐    │   │
│  │     │  SPD 六大领域 (Solution Partner Designation)             │    │   │
│  │     │  • Data & AI          • Digital & App Innovation        │    │   │
│  │     │  • Infrastructure     • Modern Work                     │    │   │
│  │     │  • Security           • Business Applications           │    │   │
│  │     └─────────────────────────────────────────────────────────┘    │   │
│  │     • IUR 内部使用权益 (M365/Azure/Dynamics)                        │   │
│  │     • Action Pack (入门级权益)                                      │   │
│  │     • Azure Partner Credits                                         │   │
│  │                                                                     │   │
│  │  2. Founders Hub (Microsoft for Startups)                           │   │
│  │     • Azure 免费额度: $1K (入门) → $25K → $150K (高级)              │   │
│  │     • OpenAI API 额度 (Azure OpenAI 通道)                           │   │
│  │     • GitHub Enterprise 免费席位                                    │   │
│  │     • M365 Business 免费席位                                        │   │
│  │     • 技术支持和导师资源                                            │   │
│  │                                                                     │   │
│  │  3. 教育/NGO 资质 (Qualification-based)                             │   │
│  │     • M365 Education A1/A3/A5 (教育机构认证)                        │   │
│  │     • M365 Nonprofit (TechSoup / 直接认证)                          │   │
│  │     • Azure for Education / Azure Sponsorship                       │   │
│  │                                                                     │   │
│  │  4. 批量许可 (Volume Licensing)                                     │   │
│  │     • EA (Enterprise Agreement) - 大企业                            │   │
│  │     • CSP (Cloud Solution Provider) - 中小企业                      │   │
│  │     • MOSP (Microsoft Online Subscription) - 在线直购               │   │
│  │                                                                     │   │
│  └─────────────────────────────────────────────────────────────────────┘   │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 2.2 托举效应对比矩阵

| 托举来源 | 开发者祘力 | 用户祘力 | 推理祘力 | 托举等级 |
| :--- | :--- | :--- | :--- | :--- |
| **SPD (Data & AI)** | GitHub Ent (IUR) | M365 E5 (IUR) | Azure Credits | ⭐⭐⭐ |
| **Founders Hub** | GitHub Ent (免费) | M365 Biz (免费) | $150K Azure | ⭐⭐⭐ |
| **EDU (A3/A5)** | GitHub Education | M365 Copilot (折扣) | Azure EDU | ⭐⭐ |
| **NGO** | - | M365 E3 (75% off) | Azure NGO | ⭐⭐ |
| **EA/CSP** | 批量折扣 | 批量折扣 | 承诺折扣 | ⭐ |

### 2.3 E队 直接采购 vs AITC 托举

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      AITC 托举效应对比                                       │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  E队 直接采购祘力                    AITC 托举效应                           │
│  ───────────────────────────────────────────────────────────────────────── │
│                                                                             │
│  开发者祘力:                         开发者祘力:                             │
│  • GitHub Copilot $19/用户/月       • SPD-IUR: 免费 ⭐⭐⭐                   │
│  • GitHub Enterprise $21/用户/月    • Founders Hub: 免费 ⭐⭐⭐              │
│                                     • EDU: GitHub Education ⭐⭐            │
│                                                                             │
│  用户祘力:                           用户祘力:                               │
│  • M365 Copilot $30/用户/月         • SPD-IUR: M365 E5 含 Copilot ⭐⭐⭐    │
│  • M365 E5 $57/用户/月              • EDU A5: 低价 ⭐⭐                      │
│                                     • NGO: 75% off ⭐⭐                      │
│                                                                             │
│  推理祘力:                           推理祘力:                               │
│  • Azure OpenAI 按 Token            • Founders Hub: $150K 额度 ⭐⭐⭐        │
│  • 无预付折扣                        • SPD: Azure Credits ⭐⭐               │
│                                     • EA: 承诺折扣 ⭐                        │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 2.4 托举效应五维度

| 维度 | 说明 | 效果 |
| :--- | :--- | :--- |
| **SPD 资质** | MAICPP 合作伙伴资质，获得 IUR 权益 | ⭐⭐⭐ 内部免费 |
| **Startup 补贴** | Founders Hub 创业扶持，获得免费额度 | ⭐⭐⭐ 高额免费 |
| **资质套利** | 教育/NGO 资质，T营 持有 E队 共享 | ⭐⭐ 免费/折扣 |
| **统一运维** | 专业团队管理订阅生命周期 | 降低运维成本 |
| **合规保障** | T营 承担合规责任，E队 专注业务 | 风险转移 |

---

## 3. AITC 资产主表 (Master List)

### 3.1 开发者祘力 (Developer Computing)

| AITC ID | 产品 | 说明 | 持有 TC | 托举来源 | 托举效应 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **AITC-DEV-GHC-IUR** | GitHub Copilot | IUR 内部权益 | TC6 | SPD | ⭐⭐⭐ 免费 |
| **AITC-DEV-GHC-STARTUP** | GitHub Copilot | Founders Hub | TC6 | Startup | ⭐⭐⭐ 免费 |
| **AITC-DEV-GHC-EDU** | GitHub Copilot | Education | TC20 | EDU | ⭐⭐ 免费 |
| **AITC-DEV-GHE** | GitHub Enterprise | 企业版 | TC6 | SPD/Startup | ⭐⭐⭐ 免费 |
| **AITC-DEV-ACTIONS** | GitHub Actions | CI/CD 算力 | TC6 | 含于 GHE | ⭐⭐ 含于订阅 |

### 3.2 用户祘力 (End-User Computing)

#### 3.2.1 M365 订阅

| AITC ID | SKU | 说明 | 持有 TC | 托举来源 | 托举效应 | 席位上限 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **AITC-M365-E5-IUR** | E5 | IUR 内部权益 | TC6 | SPD | ⭐⭐⭐ 免费 | 25 |
| **AITC-M365-EDU-A1** | A1 | Education 免费版 | TC20 | EDU | ⭐⭐⭐ 免费 | 无限制 |
| **AITC-M365-EDU-A3** | A3 | Education 标准版 | TC20 | EDU | ⭐⭐ 低价 | 按采购 |
| **AITC-M365-EDU-A5** | A5 | Education 高级版 | TC20 | EDU | ⭐⭐ 低价 | 按采购 |
| **AITC-M365-NGO-E3** | E3 | Nonprofit | TC1 | NGO | ⭐⭐ 75% off | 按采购 |
| **AITC-M365-NGO-E5** | E5 | Nonprofit | TC1 | NGO | ⭐⭐ 75% off | 按采购 |
| **AITC-M365-BIZ-BP** | Business Premium | 商业版 | TC6/TC20 | EA/CSP | ⭐ 批量 | 300 |
| **AITC-M365-BIZ-E3** | E3 | 企业版 | TC1/TC6 | EA/CSP | ⭐ 批量 | 无限制 |

#### 3.2.2 M365 Copilot 附加

| AITC ID | SKU | 说明 | 持有 TC | 托举来源 | 托举效应 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **AITC-CPL-M365-IUR** | M365 Copilot | IUR (含于 E5) | TC6 | SPD | ⭐⭐⭐ 免费 |
| **AITC-CPL-M365-EDU** | M365 Copilot | Education 附加 | TC20 | EDU | ⭐⭐ 折扣 |
| **AITC-CPL-M365-BIZ** | M365 Copilot | 商业附加 | TC6 | EA/CSP | ⭐ 批量 |

#### 3.2.3 Copilot Studio & Power Platform

| AITC ID | SKU | 说明 | 持有 TC | 托举来源 | 托举效应 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **AITC-CPL-STUDIO** | Copilot Studio | 低代码 AI Agent | TC6 | SPD/EA | ⭐⭐ |
| **AITC-PWR-AIBUILDER** | AI Builder | Power Platform AI | TC6 | 含于 E5 | ⭐⭐ 含于订阅 |

### 3.3 推理祘力 (Inference Computing)

| AITC ID | 产品 | 说明 | 持有 TC | 托举来源 | 托举效应 | 额度 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **AITC-AZ-STARTUP** | Azure Credits | Founders Hub | TC6 | Startup | ⭐⭐⭐ | $1K~$150K |
| **AITC-AZ-SPD** | Azure Credits | Partner Credits | TC6 | SPD | ⭐⭐⭐ | 按资质 |
| **AITC-AZ-EDU** | Azure | Education Sponsorship | TC20 | EDU | ⭐⭐ | 按申请 |
| **AITC-AZ-NGO** | Azure | Nonprofit Grant | TC1 | NGO | ⭐⭐ | $3.5K/年 |
| **AITC-AOAI** | Azure OpenAI | GPT-4o/o1 访问 | TC6 | 审批 | ⭐⭐ | 按配额 |

### 3.4 托举来源要求总览

| 托举来源 | 资质要求 | 维护周期 | 主要权益 |
| :--- | :--- | :--- | :--- |
| **SPD** | MAICPP 注册 + 6大领域达标 | 年度 | IUR + Azure Credits |
| **Founders Hub** | 创业公司认证 | 2年 | Azure $150K + GitHub + M365 |
| **EDU** | 教育机构认证 | 年度 | M365 A1 免费 + Azure EDU |
| **NGO** | 非营利认证 (TechSoup) | 年度 | M365 75% off + Azure $3.5K |

---

## 4. AITC 资产实例表 (Instances)

> 📋 **说明**: 以下为 AITC 资产的实际实例，每个实例对应一个 M365 租户。

### 4.1 当前实例清单

| 实例 ID | AITC 类型 | 租户域名 | 持有 TC | 席位总数 | 已分配 | 状态 |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `AITC-EDU-A1-001` | AITC-EDU-A1 | `suibe.onmicrosoft.com` | TC20 | 500 | 320 | ✅ Active |
| `AITC-EDU-A1-002` | AITC-EDU-A1 | `t189edu.onmicrosoft.com` | TC20 | 200 | 85 | ✅ Active |
| `AITC-BIZ-BP-001` | AITC-BIZ-BP | `teamsedge.onmicrosoft.com` | TC6 | 50 | 23 | ✅ Active |
| `AITC-NGO-E3-001` | AITC-NGO-E3 | `wanlian-ngo.onmicrosoft.com` | TC1 | 100 | 45 | ⏳ Pending |

### 4.2 实例与 E队 分配关系

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      AITC 实例 ↔ E队 分配                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  AITC-EDU-A1-001 (suibe.onmicrosoft.com)                                    │
│  ├── S114 (SUIBE)        : 200 席位                                         │
│  ├── S115 (SUIBE-Lab)    :  50 席位                                         │
│  └── (预留)              :  70 席位                                         │
│                                                                             │
│  AITC-EDU-A1-002 (t189edu.onmicrosoft.com)                                  │
│  ├── T189 (EdgeTeam)     :  50 席位                                         │
│  ├── T190 (Partner)      :  20 席位                                         │
│  └── (预留)              :  15 席位                                         │
│                                                                             │
│  AITC-BIZ-BP-001 (teamsedge.onmicrosoft.com)                                │
│  ├── 核心运营            :  15 席位                                         │
│  ├── Don Team            :   8 席位                                         │
│  └── (预留)              :   0 席位                                         │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 5. AITC 数据结构 (Data Schema)

### 5.1 AITC 类型表 (aitc_types)

| 字段 | 类型 | 说明 | 示例 |
| :--- | :--- | :--- | :--- |
| `aitc_type_id` | PK, String | 类型唯一标识 | `AITC-EDU-A1` |
| `category` | Enum | 订阅类别 | `EDU` / `NGO` / `BIZ` |
| `sku` | String | M365 SKU | `A1`, `A3`, `E3`, `BP` |
| `description` | String | 说明 | `M365 Education A1` |
| `qualification` | String | 资质要求 | `教育机构认证` |
| `hosting_effect` | Enum | 托举效应等级 | `HIGH` / `MEDIUM` / `LOW` |
| `seat_limit` | Int | 席位上限 | `0` = 无限制 |
| `eligible_tcs` | Array[FK → TC] | 可持有的 T营 | `[TC20]` |

### 5.2 AITC 实例表 (aitc_instances)

| 字段 | 类型 | 说明 | 示例 |
| :--- | :--- | :--- | :--- |
| `instance_id` | PK, String | 实例唯一标识 | `AITC-EDU-A1-001` |
| `aitc_type_id` | FK → aitc_types | 类型引用 | `AITC-EDU-A1` |
| `owner_tc` | FK → TC | 持有 T营 | `TC20` |
| `tenant_id` | String | M365 租户 ID | `xxx.onmicrosoft.com` |
| `tenant_name` | String | 租户显示名 | `SUIBE Education` |
| `license_count` | Int | 许可证总数 | `500` |
| `license_used` | Int | 已分配数量 | `320` |
| `license_available` | Computed | 可用数量 | `180` |
| `renewal_date` | Date | 续费日期 | `2027-01-01` |
| `created_date` | Date | 创建日期 | `2024-09-01` |
| `status` | Enum | 状态 | `Active` / `Expiring` / `Suspended` |
| `admin_np` | FK → NP | 管理员 NP | `NP-T20-001` |

### 5.3 AITC 分配表 (aitc_allocations)

| 字段 | 类型 | 说明 | 示例 |
| :--- | :--- | :--- | :--- |
| `allocation_id` | PK, String | 分配唯一标识 | `ALLOC-001` |
| `instance_id` | FK → aitc_instances | 实例引用 | `AITC-EDU-A1-001` |
| `target_type` | Enum | 分配目标类型 | `ET` / `TC` / `Reserve` |
| `target_id` | String | 分配目标 ID | `S114` |
| `seat_count` | Int | 分配席位数 | `200` |
| `purpose` | String | 用途说明 | `SUIBE 本科教学` |
| `start_date` | Date | 开始日期 | `2024-09-01` |
| `end_date` | Date | 结束日期 (可空) | `null` |
| `status` | Enum | 状态 | `Active` / `Revoked` |

---

## 6. AITC 生命周期管理 (Lifecycle)

### 6.1 生命周期阶段

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      AITC 生命周期                                           │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐    ┌─────────┐  │
│  │ 规划    │───►│ 申请    │───►│ 激活    │───►│ 运营    │───►│ 续期    │  │
│  │ Plan    │    │ Apply   │    │ Activate│    │ Operate │    │ Renew   │  │
│  └─────────┘    └─────────┘    └─────────┘    └─────────┘    └─────────┘  │
│       │              │              │              │              │         │
│       ▼              ▼              ▼              ▼              ▼         │
│   需求评估       资质准备       租户配置       席位分配       续费/升级     │
│   TC选择        认证提交       安全策略       监控使用       或 退出       │
│                                                                             │
│                                         ┌─────────┐                         │
│                                         │ 退出    │                         │
│                                         │ Retire  │                         │
│                                         └─────────┘                         │
│                                              │                              │
│                                              ▼                              │
│                                          数据迁移                           │
│                                          席位回收                           │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 6.2 各阶段检查清单

| 阶段 | 检查项 | 责任方 |
| :--- | :--- | :--- |
| **规划** | 确定 AITC 类型、评估席位需求、选择持有 TC | TC Don |
| **申请** | 准备资质材料、提交认证申请、等待审批 | TC 运维 |
| **激活** | 创建租户、配置安全策略、设置管理员 | TC 运维 |
| **运营** | 分配席位、监控使用率、处理用户请求 | TC 运维 |
| **续期** | 跟踪到期日、评估续费/升级、执行续费 | TC Don |
| **退出** | 数据迁移、席位回收、租户关闭 | TC Don + 运维 |

---

## 7. AITC 运维要求 (Operations)

### 7.1 日常维护清单

| 维护项 | 频率 | 说明 | 责任方 |
| :--- | :--- | :--- | :--- |
| **席位使用监控** | 每周 | 检查使用率，识别闲置席位 | TC 运维 |
| **安全事件检查** | 每周 | 审查安全中心警报 | TC 运维 |
| **用户访问审计** | 每月 | 检查异常登录、权限变更 | TC 运维 |
| **合规性检查** | 每季 | 确保使用符合订阅条款 | TC Don |
| **资质有效性验证** | 每年 | 确认 EDU/NGO 资质仍有效 | TC Don |

### 7.2 续费管理

| 时间节点 | 动作 | 责任方 |
| :--- | :--- | :--- |
| **T-90 天** | 发送续费提醒，启动评估 | TC 运维 |
| **T-60 天** | 确定续费/升级/退出决策 | TC Don |
| **T-30 天** | 执行续费流程 | TC 运维 |
| **T-7 天** | 最终确认，处理异常 | TC Don |
| **T-0** | 续费完成或服务中断 | - |

### 7.3 异常处理

| 异常场景 | 处理方式 | 升级路径 |
| :--- | :--- | :--- |
| 席位不足 | 评估扩容或回收闲置 | TC 运维 → TC Don |
| 资质过期 | 立即重新认证 | TC Don → T1 备援 |
| 安全事件 | 隔离账户，调查根因 | TC 运维 → TC Don |
| 续费失败 | 紧急联系供应商 | TC 运维 → TC Don → NP 备援链 |

---

## 8. AITC 与 E队 毕业 (Graduation)

### 8.1 AITC 在毕业中的角色

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      E队 毕业与 AITC 关系                                    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  孵化期                成长期                 毕业                           │
│  ───────────────────────────────────────────────────────────────────────── │
│  依赖 AITC 托举        部分自建能力           自有订阅 或 脱离               │
│                                                                             │
│  AITC 提供:            AITC + 自建:           选项:                         │
│  • 免费/低价席位       • 核心用 AITC          • 自购 M365 商业版            │
│  • 零运维成本          • 扩展用自建           • 继续 AITC (校友价)          │
│  • 快速启动            • 培养运维能力         • 迁移到其他平台              │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 8.2 AITC 毕业清单

| 毕业条件 | AITC 相关动作 | 备注 |
| :--- | :--- | :--- |
| **AI Ready** | 确认 E队 能独立使用 AI 工具 | Copilot 等功能需特定 SKU |
| **Network Ready** | 迁移域名、配置自有租户 | 数据迁移支持 |
| **AITC 脱离** | 回收席位、结束分配 | 90 天过渡期 |

---

## 9. 报表与监控 (Reporting)

### 9.1 AITC 仪表板指标

| 指标 | 计算方式 | 目标值 |
| :--- | :--- | :--- |
| **席位使用率** | 已分配 / 总席位 | > 70% |
| **闲置席位数** | 总席位 - 已分配 | < 20% |
| **续费覆盖率** | 已续费 / 即将到期 | 100% |
| **托举 E队 数** | 分配记录中的唯一 ET | - |
| **成本节省估算** | (商业价 - 实际价) × 席位 | - |

### 9.2 月度报表模板

```markdown
## AITC 月度报表 - 2026年1月

### 1. 资产概览
| 类型 | 实例数 | 总席位 | 已分配 | 使用率 |
| :--- | :--- | :--- | :--- | :--- |
| EDU | 2 | 700 | 405 | 57.9% |
| NGO | 1 | 100 | 45 | 45.0% |
| BIZ | 1 | 50 | 23 | 46.0% |

### 2. E队 分配统计
- 托举 E队 数: 4
- 新增分配: 1 (T190 +20席位)
- 回收席位: 0

### 3. 续费预警
- AITC-EDU-A1-001: 2027-01-01 (剩余 365 天) ✅
- AITC-BIZ-BP-001: 2026-04-01 (剩余 90 天) ⚠️

### 4. 成本节省估算
- EDU 免费席位价值: ￥405 × 150 × 12 = ￥729,000/年
- NGO 折扣节省: ￥45 × 112 × 12 = ￥60,480/年
```

---

## 10. 许可证合规 (License Compliance)

> ⚠️ **重要**: 许可证合规是 AITC 运营的核心风险点，违规使用可能导致资质撤销。

### 10.1 合规风险矩阵

| 许可证类型 | 合规要求 | 违规风险 | 审计频率 |
| :--- | :--- | :--- | :--- |
| **IUR (内部使用)** | 仅限内部员工，不可服务外部客户 | 资质撤销 | 年度 |
| **EDU (教育)** | 仅限教育目的，不可商业使用 | 资质撤销 + 追缴 | 年度 |
| **NGO (非营利)** | 仅限非营利活动，需年度重认证 | 资质撤销 + 追缴 | 年度 |
| **Startup** | 限定公司使用，2年有效期 | 权益终止 | 按期限 |

### 10.2 IUR 内部使用权益限制

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      IUR (Internal Use Rights) 合规边界                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ✅ 允许的使用:                      ❌ 禁止的使用:                          │
│  ───────────────────────────────────────────────────────────────────────── │
│  • 内部员工日常办公                  • 为客户提供托管服务                    │
│  • 内部开发和测试                    • 转售或再许可                          │
│  • 内部培训和演示                    • 外部用户直接使用                      │
│  • 内部 PoC 项目                     • 生产环境服务外部客户                  │
│                                                                             │
│  灰色地带 (需评估):                                                          │
│  • 合作伙伴联合开发 → 需单独许可                                             │
│  • 客户演示 → 短期可接受，长期需客户自有许可                                  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 10.3 教育许可证合规

| 使用场景 | 合规性 | 说明 |
| :--- | :--- | :--- |
| 学生/教师教学 | ✅ 完全合规 | 核心用途 |
| 学术研究 | ✅ 完全合规 | 核心用途 |
| 校内行政办公 | ✅ 合规 | 教育机构运营 |
| 校企合作项目 | ⚠️ 需评估 | 商业成分需单独许可 |
| 对外商业服务 | ❌ 违规 | 需商业许可 |

### 10.4 合规检查清单

| 检查项 | 频率 | 责任方 | 记录要求 |
| :--- | :--- | :--- | :--- |
| IUR 使用范围审查 | 每季 | TC Don | 使用报告 |
| EDU 资质有效性 | 每年 | TC 运维 | 认证截图 |
| NGO 资质重认证 | 每年 | TC Don | TechSoup 确认 |
| Startup 期限跟踪 | 每季 | TC 运维 | Founders Hub 状态 |
| 席位分配审计 | 每月 | TC 运维 | 分配记录 |

---

## 11. 附录 (Appendix)

### 11.1 M365 SKU 对照表

| SKU | 产品名称 | 主要功能 | 适用场景 |
| :--- | :--- | :--- | :--- |
| A1 | Education A1 | 基础协作 (Web版) | 教育入门 |
| A3 | Education A3 | 完整 Office + 基础安全 | 教育标准 |
| A5 | Education A5 | A3 + 高级安全 + 分析 + Copilot可选 | 教育高级 |
| BP | Business Premium | SMB 完整方案 | 小型商业 |
| E3 | Enterprise E3 | 企业标准 | 中大型企业 |
| E5 | Enterprise E5 | E3 + 高级安全 + Copilot可选 | 大型企业 |

### 11.2 MAICPP 合作伙伴资质指南

| SPD 领域 | 核心要求 | 关联权益 |
| :--- | :--- | :--- |
| **Data & AI** | Azure AI 部署能力 | Azure Credits + IUR |
| **Digital & App Innovation** | 应用开发能力 | GitHub Enterprise IUR |
| **Infrastructure** | Azure 基础设施能力 | Azure Credits |
| **Modern Work** | M365 部署能力 | M365 E5 IUR |
| **Security** | 安全解决方案能力 | Security IUR |
| **Business Applications** | Dynamics 能力 | Dynamics IUR |

### 11.3 资质申请指南

| 资质类型 | 申请渠道 | 所需材料 | 预计周期 |
| :--- | :--- | :--- | :--- |
| **MAICPP 注册** | Partner Center | 公司信息 + MPN ID | 1 周 |
| **SPD 达标** | Partner Center | 客户成功案例 + 认证 | 3-6 月 |
| **Founders Hub** | startups.microsoft.com | 公司注册 + 产品介绍 | 1-2 周 |
| **教育认证** | Microsoft 教育验证 | 教育机构证明 | 1-2 周 |
| **NGO 认证** | TechSoup 或直接申请 | 非营利证明 | 2-4 周 |

---

## 12. 关联文档 (Related Documents)

| 文档 | 说明 |
| :--- | :--- |
| [TeamsCamp playbook](TeamsCamp%20playbook.md) | T营 业务主体定义 (父文档) |
| [EdgeTeam playbook](EdgeTeam%20playbook.md) | E队 操作单元定义 (消费方) |
| [POP playbook](POP%20playbook.md) | POP 站点资产 (姊妹文档) |
| [Nexus Pass playbook](Nexus%20Pass%20playbook.md) | NP 身份凭证体系 |
| [EdgeTeam Code playbook](EdgeTeam%20Code%20playbook.md) | E队 番号体系 |

---

## Changelog

| 版本 | 日期 | 变更说明 |
| :--- | :--- | :--- |
| v1.4 | 2026-01-02 | 架构师全文审查: 中文定义改为"AI集成租户算力"，新增§0.3词源解析，祘力三层架构英文名优化(Developer AI/Productivity AI/Model AI) |
| v1.3 | 2026-01-02 | 术语优化: AITC = AI Integrated Tenant Compute，添加口语用法 "AITC祘力"，强调 Tenant 概念 |
| v1.2 | 2026-01-02 | 架构师审查更新: 祘力三层架构 (开发者/用户/推理)，MAICPP 2024+体系，新增开发者祘力/推理祘力资产，许可证合规章节 |
| v1.1 | 2026-01-02 | 重构核心定义: AITC = AI祘力订阅，添加祘力最小集合，托举来源增加 SPD/Startup |
| v1.0 | 2026-01-01 | 初始版本，从 TeamsCamp playbook §5.4 独立，扩展为完整资产管理规范 |
