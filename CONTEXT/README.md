# TAES 体系文档索引

> **TeamsCamp Augments EdgeTeams Scale**
>  
> **TAES**：協力營托举E队——AI真干活
>
> **MAR**：AI 托举执行，Mission 由你驾驭
>
> 这不是未来。这是 2026。
>
> *TAES（组织）→ MAR（任务）→ 共享时代锚点*

---

## � 核心公式

> **E=MC²AI 与 TAES 是同一价值创造过程的两种表达。**

| 文档 | 位置 | 说明 |
|------|------|------|
| **E=MC²AI 公式解析** | [../E=MC2AI.md](../E=MC2AI.md) | MAR 架构内核，定义价值方程 |

```
E=MC²AI (MAR 架构公式)     ←→     TAES (组织运营公式)
    ↓                                  ↓
  "如何组织一个仓库"              "如何经营一个组织"
```

---

## 📁 目录结构 (v3.0 重构)

```
TAES/
├── Framework/      # 方法论核心
├── QC/             # 品控体系
├── Parties/        # 业务参与方（扁平化 + front-matter 分类）
│   ├── TeamsCamp/    # [principal] T营
│   ├── EdgeTeam/     # [principal] E队 (含 Code/Domain)
│   ├── AITC/         # [resource] 算力资产
│   ├── POP/          # [resource] 站点资产
│   ├── Site/         # [resource] 据点服务 🆕
│   └── NexusPass/    # [service] 身份凭证
├── Strategy/       # 持久战略原则
├── Intelligence/   # 商业情报 (GTM/Market)
├── Brand/          # 品牌体系
│   ├── Architecture/ # 品牌架构
│   ├── Identity/     # 视觉识别
│   ├── Voice/        # 语言规范
│   └── Legal/        # 法律合规
├── Infra/          # 基础设施
└── TeamsEdge/      # 菜单配置
```

> 📋 **重构说明**：
> - 2026-01-21: Parties/ 扁平化，移除 Principals/Resources/Services 中间层，分类改用 front-matter 标签
> - 2026-01-21: 新增 Site/ 实体（据点服务）
> - 2026-01-20: Entities/ → Parties/ (按实体组织，语义更符合"关系驱动")
> - EdgeTeam-Code/Domain 下沉到 EdgeTeam/ 内部

---

## 📚 Framework/ — 方法论核心

> **注意**：Framework 已迁移至根目录 `/Framework/`，TAES 主文档为 `/TAES.md`

| 文档 | 描述 | 位置 |
|------|------|------|
| [TAES.md](../TAES.md) | TAES 方法论主文档 | 根目录 |
| [Augment.md](../Framework/Augment.md) | 托举效应的组织化实现 | Framework/ |
| [Team-Augment.md](../Framework/Team-Augment.md) | 团队托举的桥与路 | Framework/ |
| [MR-playbook.md](../Framework/MR-playbook.md) | Mission Repo 操作手册 | Framework/ |
| [Mission-playbook.md](../Framework/Mission-playbook.md) | 任务执行手册 | Framework/ |
| [IP-playbook.md](../Framework/IP-playbook.md) | IP 管理手册 | Framework/ |

---

## ✅ QC/ — 品控体系 🆕

> **定位**：TAES 可验收承诺的兑现机制

| 文档 | 描述 | 读者 |
|------|------|------|
| [README.md](QC/README.md) | 品控体系总览 | 所有人 |
| [qc-playbook.md](QC/qc-playbook.md) | 品控操作手册（核心） | Owner/Architect/QA |
| [Acceptance/evidence-schema.md](QC/Acceptance/evidence-schema.md) | 证据规格定义 | Auditor/QA |

### QC 子目录

```
QC/
├── Checklists/      # 事前控制 - 启动检查
├── Checkpoints/     # 事中控制 - 执行门禁
├── Acceptance/      # 事后控制 - 验收标准
└── Metrics/         # 指标定义
```

---

## 📊 Strategy/ — 持久战略原则

> **定位**：变化周期 > 1年的战略定位与原则

| 文档 | 描述 | 场景 |
|------|------|------|
| [README.md](Strategy/README.md) | 战略模块说明 | 导航 |
| [Core-Insights.md](Strategy/Core-Insights.md) | TAES 核心洞见 | 持久原则 |

---

## 🔍 Intelligence/ — 商业情报 🆕

> **定位**：变化周期 < 1年的市场分析与 GTM 策略

| 子目录 | 描述 | 更新周期 |
|--------|------|----------|
| [GTM/](Intelligence/GTM/) | 市场进入策略 | 季度 |
| [Market/](Intelligence/Market/) | 市场分析 | 年度 |

### GTM 策略

| 文档 | 描述 | 地区 |
|------|------|------|
| [China-GTM.md](Intelligence/GTM/China-GTM.md) | 🇨🇳 中国市场 GTM | 国内 |
| [Japan-GTM.md](Intelligence/GTM/Japan-GTM.md) | 🇯🇵 日本市場 GTM | 出海 |
| [ChinaJapan-GTM.md](Intelligence/GTM/ChinaJapan-GTM.md) | 中日协同策略 | 双市场 |

### 市场分析

| 文档 | 描述 | 周期 |
|------|------|------|
| [Market-2026.md](Intelligence/Market/Market-2026.md) | 2026 AI 市场趋势 | 年度 |

---

## 🛠️ Parties/ — 业务参与方

> **定位**：原 Entities/，按实体扁平化组织，分类用 YAML front-matter `type` 字段表达

| 实体 | 路径 | 类型 | 说明 |
|------|------|------|------|
| **T营** | [Parties/TeamsCamp/](Parties/TeamsCamp/README.md) | principal | 业务主体，持有资源 |
| **E队** | [Parties/EdgeTeam/](Parties/EdgeTeam/README.md) | principal | 操作单元，执行 Mission |
| └ 番号 | [Parties/EdgeTeam/Code.md](Parties/EdgeTeam/Code.md) | — | ET Code 唯一标识 |
| └ 域名 | [Parties/EdgeTeam/Domain.md](Parties/EdgeTeam/Domain.md) | — | 入口与证书 |
| **AITC** | [Parties/AITC/](Parties/AITC/README.md) | resource | 算力资产 |
| **POP** | [Parties/POP/](Parties/POP/README.md) | resource | 站点资产 |
| **Site** | [Parties/Site/](Parties/Site/README.md) | resource | 据点服务 🆕 |
| **NexusPass** | [Parties/NexusPass/](Parties/NexusPass/README.md) | service | 身份凭证 |

---

## 🎨 Brand/ — 品牌体系 ✏️

> **定位**：重组为四层结构 (Architecture/Identity/Voice/Legal)

| 子目录 | 描述 | 内容 |
|--------|------|------|
| [Architecture/](Brand/Architecture/) | 品牌架构 | 品牌层级、关系 |
| [Identity/](Brand/Identity/) | 视觉识别 | Logo、色彩、字体 |
| [Voice/](Brand/Voice/) | 语言规范 | 语调、术语 |
| [Legal/](Brand/Legal/) | 法律合规 | 商标、版权 |

### Identity/ 视觉资产

| 品牌 | 位置 | 内容 |
|------|------|------|
| Allied AI | [Identity/AlliedAI/](Brand/Identity/AlliedAI/) | Logo、品牌说明 |
| TeamsCamp | [Identity/TeamsCamp/](Brand/Identity/TeamsCamp/) | TC1/TC20 签章 |

> ⚠️ **迁移说明**：AI-Native-Statement.md 建议迁移至 Framework/

---

## ⚙️ Infra/ — 基础设施

| 文档 | 服务商 |
|------|--------|
| [CDN-Aliyun.md](Infra/CDN-Aliyun.md) | 阿里云 CDN |
| [CDN-Cloudflare.md](Infra/CDN-Cloudflare.md) | Cloudflare CDN |
| [CDN-Tencent.md](Infra/CDN-Tencent.md) | 腾讯云 CDN |
| [Cloudflare/](Infra/Cloudflare/) | Cloudflare 详细配置 |

---

## 📋 TeamsEdge UI/ — 菜单配置

| 文档 | 用途 |
|------|------|
| [Main.md](TeamsEdge%20UI/Main.md) | 主菜单 |
| [EdgeTeam-50.md](TeamsEdge%20UI/EdgeTeam-50.md) | EdgeTeam 菜单 (50系) |
| [Publisher-90.md](TeamsEdge%20UI/Publisher-90.md) | Publisher 菜单 (90系) |
| [System-70.md](TeamsEdge%20UI/System-70.md) | 系统菜单 (70系) |
| [System-Domain.md](TeamsEdge%20UI/System-Domain.md) | 域名系统菜单 |

---

## 🏗️ 产品架构 (v2.6)

```
┌─────────────────────────────────────────────────────────────┐
│  Layer 2: TeamsCamp Cloud (SaaS 订阅)                       │
│  - GitHub Organization 管理                                  │
│  - 多团队协作                                                │
│  - 企业级 AI Agent 定制                                      │
├─────────────────────────────────────────────────────────────┤
│  Layer 1: EdgeTeam Starter (免费入门)                       │
│  - GitHub 个人账号                                          │
│  - Mission Repo 模板                                        │
│  - Copilot Chat 基础交互                                    │
└─────────────────────────────────────────────────────────────┘
```

---

## 🎯 目标客户画像

| 层级 | 画像 | 规模 | 特点 |
|------|------|------|------|
| **S** | 出海创业小队 | 5-15人 | 技术敏感度高，成本敏感 |
| **M** | 企业创新小组 | 15-50人 | 有预算，需合规 |
| **EDU** | 教育机构 | 按课程 | 以课程为入口，培养用户习惯 |

---

## 📋 迁移检查清单

> 2026-01-03 架构重构，以下文件待物理迁移

### Products/ → Entities/ 迁移

| 原文件 | 目标位置 | 状态 |
|--------|----------|------|
| TeamsCamp-playbook.md | Entities/Principals/TeamsCamp.md | 🔜 待迁移 |
| EdgeTeam-playbook.md | Entities/Principals/EdgeTeam.md | 🔜 待迁移 |
| AITC-playbook.md | Entities/Assets/AITC.md | 🔜 待迁移 |
| POP-playbook.md | Entities/Assets/POP.md | 🔜 待迁移 |
| NexusPass-playbook.md | Entities/Capabilities/NexusPass.md | 🔜 待迁移 |
| EdgeTeam-Code-playbook.md | Entities/Capabilities/EdgeTeam-Code.md | 🔜 待迁移 |
| EdgeTeam-Domain-playbook.md | Entities/Capabilities/EdgeTeam-Domain.md | 🔜 待迁移 |

### Strategy/ → Intelligence/ 迁移

| 原文件 | 目标位置 | 状态 |
|--------|----------|------|
| China-GTM.md | Intelligence/GTM/China-GTM.md | 🔜 待迁移 |
| Japan-GTM.md | Intelligence/GTM/Japan-GTM.md | 🔜 待迁移 |
| ChinaJapan-GTM.md | Intelligence/GTM/ChinaJapan-GTM.md | 🔜 待迁移 |
| Market-2026.md | Intelligence/Market/Market-2026.md | 🔜 待迁移 |

### Brand/ 内部重组

| 原文件 | 目标位置 | 状态 |
|--------|----------|------|
| AlliedAI.md | Brand/Identity/AlliedAI/AlliedAI.md | 🔜 待迁移 |
| AlliedAI-Logo.md | Brand/Identity/AlliedAI/Logo.md | 🔜 待迁移 |
| TC1-*.md | Brand/Identity/TeamsCamp/TC1/ | 🔜 待迁移 |
| TC20-*.md | Brand/Identity/TeamsCamp/TC20/ | 🔜 待迁移 |
| AI-Native-Statement.md | → Framework/AI-Native.md | 🔜 待迁移 |
| AI-Native-Whitepaper.md | → Teams/Artifacts/Text/ | 🔜 待迁移 |

---

*Last Updated: 2026-01-03 (架构重构)*
