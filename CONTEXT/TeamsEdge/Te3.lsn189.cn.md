# TeamsEdge 菜单结构（TAES 对齐版）

> **站点**: Te3.lsn189.cn | **版本**: v2.7-TAES | **更新**: 2026-01-23
>
> 数据来源：[assets/menu-admin.json](../assets/menu-admin.json) 和 [assets/menu-opr.json](../assets/menu-opr.json)

---

## 阅读提示（已抽离说明性内容）

本文只保留 **Te3.lsn189.cn 的菜单结构规划**（地址段、路由、分区、L1/L2/L3 列表）。

- MU / AC / CA / CP 等概念说明已独立到：[Te3.lsn189.cn.explainer.md](Te3.lsn189.cn.explainer.md)
- ATP/TP/AC 与 TeamsEdge × VS Code 双主场模型详见：[ATP框架.md](ATP%E6%A1%86%E6%9E%B6.md)

---

## TAES 菜单架构

> **口诀**：E队优先看、T营资源管、A托举连接、S飞轮转

```
┌─────────────────────────────────────────────────────────────────┐
│  TAES 菜单分区逻辑                                               │
├─────────────────────────────────────────────────────────────────┤
│  [E] EdgeTeams     →  客户是谁？团队、角色、站点               │
│  [T] TeamsCamp     →  资源在哪？合同主体、算力池               │
│  [A] Augment       →  如何连接？Workplane / AITa / AC          │
│  [S] Scale 飞轮    →  Mission / Foundry / Intelligence / Credits │
├───────────────────────── 分 隔 线 ──────────────────────────────┤
│  [—] 系统治理      →  Notification / System / Data             │
├───────────────────────── 分 隔 线 ──────────────────────────────┤
│  [R] 保留区        →  TeamsEdge Support / TeamsEdge System     │
└─────────────────────────────────────────────────────────────────┘
```

### TAES 地址段规范

> **格式**: `T3.{TAES}.{L2}` — T3=Te3站点, TAES分区=1-6, L2=子菜单序号
> **实例**: `T3.{TAES}.{L2}.{hash}` — 具体资源实例的唯一地址

| TAES 分区 | 地址段 | 说明 | 实例示例 |
|:---------:|:------:|------|----------|
| **[E]** EdgeTeams | `T3.1.x` | 价值创造方 | T3.1.3.suibe-org |
| **[T]** TeamsCamp | `T3.2.x` | 资源持有方 | T3.2.4.066217 |
| **[A]** Augment | `T3.3.x` | 托举基础设施 | T3.3.3.2.acc-001 |
| **[S]** Scale | `T3.4.x` | 增长飞轮 | T3.4.1.mar-001 |
| **[—]** System | `T3.5.x` | 系统治理 | T3.5.2.settings |
| **[R]** Reserved | `T3.6.x` | 保留区（平台级） | T3.6.1.support |



## 管理员菜单 (menu-admin.json) — TAES 重构

### 🟢 [E] EdgeTeams — 客户是谁

> **权限**: E队自助 + T营可见 | **定位**: 价值创造方 | **地址段**: `T3.1.x`

> **关键洞见（E 分区三件套）**：
> - **E队（EdgeTeam）**：业务主体（“这是谁的队伍”）
> - **AO（Augmented Org）**：信任边界（“用哪个 Org 承载协作”）
> - **AR（Augmented Repo）**：Mission 载体（“在哪个 Repo 里把事做完”）
>
> **推荐默认视图**：先定位 **E队** → 找到绑定的 **AO** → 在 AO 下管理 **AR**。

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | 功能说明 | 实例地址示例 |
|---------|-----------|------|:--------:|----------|----------------|
| **EdgeTeams** | E队 | /Teams/team | T3.1.1 | 以 E队番号 列出所有 E队 | T3.1.1.et-001 |
| | 队员 | /Teams/player | T3.1.2 | 以 Player ID 列出所有队员 | T3.1.2.p-zhang |
| | AO | /Teams/ao | T3.1.3 | Augmented Org（默认与 E队 1:1 绑定的信任边界） | T3.1.3.suibe-org |
| | AR | /Teams/ar | T3.1.4 | Augmented Repo（归属 AO 的 Mission 载体，默认免费创建） | T3.1.4.mar-001 |
| | M365组团 | /Teams/tsg | T3.1.5 | M365 Group Policy 中的 Security Group ID | T3.1.5.sg-sales |
| | 番号域名 | /Teams/domain | T3.1.6 | E队的域名与番号（EdgeTeam Code） | T3.1.6.et001.com |
| | Publisher | /Teams/publisher | T3.1.7 | E队软件发布者（E卡/O卡/V卡），默认个人 | T3.1.7.pub-001 |

> **Publisher 说明**：
> - **E卡**：Microsoft Edge Extension（edge://extensions）
> - **O卡**：Microsoft Windows Apps（Microsoft Store）
> - **V卡**：VS Code Marketplace（marketplace.visualstudio.com）
> - 默认采用**个人**作为 Publisher，E队场景下可共享发布者身份

> **队员属性**：TeamsIdol 角色作为队员的属性列

| Player 属性 | TeamsIdol 角色 | 说明 | Te3.lsn189.cn (admin) |
|:-----------:|:---------------|------|----------------------|
| idol=Don | Don | 战略导师 | TeamsIdol.Don |
| idol=ILYA | ILYA | AI研究员 | TeamsIdol.ILYA |
| idol=Yuki | Yuki | 产品设计 | TeamsIdol.Yuki |
| idol=Her | Her | 情感连接 | TeamsIdol.Her |
| idol=Eva | Eva | 执行官 | TeamsIdol.Eva |
| idol=AL | AL | 算法专家 | TeamsIdol.AL |
| idol=Rommel | Rommel | 战术指挥 | TeamsIdol.Rommel |
| idol=Smith | Smith | 系统架构 | TeamsIdol.Smith |
| idol=Dora | Dora | 探索者 | TeamsIdol.Dora |
| idol=Marc | Marc | 市场专家 | TeamsIdol.Marc |
| idol=Thales | Thales | 哲学顾问 | TeamsIdol.Thales |

---

### 🔵 [T] TeamsCamp — 资源在哪

> **权限**: T营专属 | **定位**: 资源持有方 | **地址段**: `T3.2.x`

> **阅读提示**：以下仅保留 **T3.2.x 菜单清单**。与 [T] 相关的说明（洞见/依赖链/归属模型/双线汇聚）已抽离至 [Te3.lsn189.cn.T.explainer.md](Te3.lsn189.cn.T.explainer.md)。

#### T3.2.x 菜单清单

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | 功能说明 | 实例地址示例 |
|---------|-----------|------|:--------:|----------|----------------|
| **TeamsCamp** | AITC | /admin/teamscamp/aitc | T3.2.1 | Allied Intelligent Tenant Contract 协同租户 | T3.2.1.alliedai |
| | BAS | /admin/teamscamp/bas | T3.2.2 | Benefit Azure Subscription 赢力订阅 | T3.2.2.sub-001 |
| | AGA | /admin/teamscamp/aga | T3.2.3 | Augmented GitHub Account 托举账号 | T3.2.3.teamscamp |
| | Teamsbox | /admin/teamscamp/teamsbox | T3.2.4 | CPE 边缘设备（L层，账单确权） | T3.2.4.066217 |
| | Link Server | /admin/teamscamp/linkserver | T3.2.5 | VPN/Proxy 隧道服务器（S层，订阅确权） | T3.2.5.CN-SH-01 |
| | Service Node | /admin/teamscamp/servicenode | T3.2.6 | Apps Gateway 出口节点（N层，用量确权） | T3.2.6.HK-RES |

> **说明**：`T3.2.x` 的“双线汇聚（AITa × Workplane）/L-S-N/AGA/依赖链/确权与归属/分工边界”等解释，见 [Te3.lsn189.cn.T.explainer.md](Te3.lsn189.cn.T.explainer.md)。

---

### 🟡 [A] Augment — 如何连接

> **权限**: T营运维 + E队只读 | **定位**: 托举基础设施 | **地址段**: `T3.3.x`

> **阅读提示**：以下仅保留 **A 的菜单清单/路由/地址段与页面结构**。与 [A] 相关的说明（Augment 三支柱、AC/CA/ACD/ACC、Context Protocol、AR/MU 关系与洞见）已合并到 [Te3.lsn189.cn.explainer.md](Te3.lsn189.cn.explainer.md) 的 🟡 [A] 小节。

---
#### [A] Augment 子分区（精简版 v2.4）

> **精简原则**：用户操作 MU，不需要看到运维细节。每支柱 1-2 个核心入口。

| 子分区 | 地址段 | 核心菜单 | 状态 | 说明 |
|:------:|:------:|----------|:----:|------|
| **Workplane** | `T3.3.1.x` | Dashboard + Teamsbox | ✅ 现有 | 网络通路（bit 可靠） |
| **AITa** | `T3.3.2.x` | Dashboard | 🔄 规划 | 算力接入（Token 可用） |
| **AC** | `T3.3.3.x` | Dashboard + CA Registry | 🔄 规划 | 语境托举（Context 可懂） |

---
#### A1. Workplane — 网络通路 (T3.3.1)

| L2 子菜单 | 路由 | TAES地址 | 状态 | 功能说明 |
|-----------|------|:--------:|:----:|----------|
| **Workplane Dashboard** | /admin/workplane | T3.3.1.1 | ✅ | 网络通路总览（含 L-S-N 拓扑） |
| **Teamsbox** | /admin/teamsbox | T3.3.1.2 | ✅ | CPE 边缘设备管理 |

<details>
<summary>📁 Workplane Dashboard 内含子页面（原 T3.3.1.2-5）</summary>

| 子页面 | 原路由 | 说明 |
|--------|--------|------|
| Link Server | /admin/link_server | VPN/Proxy 隧道服务器 |
| Service Node | /admin/service_node | Apps Gateway 出口节点 |
| POP 站点 | /admin/pop_site | 边缘节点地理分布 |

</details>

<details>
<summary>📁 已归入 [R] Reserved 的运维菜单（原 T3.3.1.6-10）</summary>

| 菜单 | 路由 | 新地址 |
|------|------|:------:|
| Proxy Server | /admin/teamsedge/server | T3.6.1.6 |
| Proxy Limiter | /admin/teamsedge/limiter | T3.6.1.7 |
| Proxy Address | /admin/teamsedge/address | T3.6.1.8 |
| Proxy Rule | /admin/teamsedge/rule | T3.6.1.9 |
| Proxy Sessions | /admin/teamsedge/session | T3.6.1.10 |

</details>

---

#### A2. AITa — 算力接入 (T3.3.2)

| L2 子菜单 | 路由 | TAES地址 | 状态 | 功能说明 |
|-----------|------|:--------:|:----:|----------|
| **AITa Dashboard** | /admin/aita | T3.3.2.1 | 🔄 规划 | 算力管理总览 |

<details>
<summary>📁 AITa Dashboard 内含 Tab（v2.5 实现）</summary>

| Tab | 功能 |
|-----|------|
| Models | 可用模型清单 |
| Quota | 配额分配与监控 |
| Usage | 用量分析与预警 |

</details>

---

#### A3. AC — 语境托举 (T3.3.3)
##### AC 菜单清单

| L2 子菜单 | 路由 | TAES地址 | 状态 | 功能说明 |
|-----------|------|:--------:|:----:|----------|
| **AC Dashboard** | /admin/ac | T3.3.3.1 | 🔄 规划 | 语境管理总览 |
| **CA Registry** | /admin/ac/address | T3.3.3.2 | 🔄 规划 | 语境地址注册表 |

<details>
<summary>📁 AC Dashboard 内含 Tab（v2.5 实现）</summary>

| Tab | 功能 |
|-----|------|
| ACC Cards | 语境卡片管理 |
| ACD Data | 语境数据管理 |
| Templates | 语境模板（原 Context Template） |

</details>

---

### 🟣 [S] Scale 飞轮 — Mission / Foundry / Intelligence / Credits

> **权限**: E队自助 + T营审计 | **定位**: 增长引擎 | **地址段**: `T3.4.x.x`

#### S1. Mission — 做什么

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | Te3.lsn189.cn (admin) |
|---------|-----------|------|:--------:|----------------------|
| **Mission** | EdgeTeam ET卡 | /admin/addons_new | T3.4.1.1 | EdgeTeam Kard.ET卡 |
| | EdgeTeam VSC Kard | /admin/vsckard | T3.4.1.2 | EdgeTeam Kard.VSC Kard |
| | EdgeTeam OS Kard | /admin/oskard | T3.4.1.3 | EdgeTeam Kard.OS Kard |
| | Context Template | /admin/markdown/template | T3.4.1.4 | Data.Context Template |

#### S2. The Foundry — 交付什么

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | Te3.lsn189.cn (admin) |
|---------|-----------|------|:--------:|----------------------|
| **The Foundry** | Workplace | /admin/task/workplace | T3.4.2.1 | Task.Workplace |
| | Workbench | /admin/task/workbench | T3.4.2.2 | Task.Workbench |
| | Functions | /admin/task/functions | T3.4.2.3 | Task.Functions |
| **WorkSpace** | Azure VM | /admin/teamsedge/vm | T3.4.3.1 | WorkSpace.Azure VM |
| | WFM TeamsBox | /admin/workspace/teamsbox | T3.4.3.2 | WorkSpace.WFM TeamsBox |
| | RD Remote Desktop | /admin/workspace/rd | T3.4.3.3 | WorkSpace.RD |
| | Windows OS | /admin/workspace/windows | T3.4.3.4 | WorkSpace.Windows |
| | Mac OS | /admin/workspace/mac | T3.4.3.5 | WorkSpace.Mac |
| | iPhone/iPad | /admin/workspace/ios | T3.4.3.6 | WorkSpace.iOS |
| | Android | /admin/workspace/android | T3.4.3.7 | WorkSpace.Android |

#### S3. AI Intelligence — 学到什么

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | Te3.lsn189.cn (admin) |
|---------|-----------|------|:--------:|----------------------|
| **AI Intelligence** | Context Prompt | /admin/ai/prompt | T3.4.4.1 | AI Task advisor.Context Prompt |
| | Teams Ta | /admin/teamsbot | T3.4.4.2 | AI Task advisor.Teams Ta |
| | Teams Ta Rag | /admin/teamsbot/ragfiles | T3.4.4.3 | AI Task advisor.Teams Ta Rag |
| | Azure AI | /admin/ai/azure | T3.4.4.4 | AI Task advisor.Azure AI |
| | Globe AI | /admin/ai/globe | T3.4.4.5 | AI Task advisor.Globe AI |
| | China AI | /admin/ai/china | T3.4.4.6 | AI Task advisor.China AI |
| | AI Appreciate | /admin/teamsedge/apps | T3.4.4.7 | AI Task advisor.AI Appreciate |
| | Tester Endpoints | /admin/teamsedge/tester | T3.4.4.8 | TeamsEdge Support.Tester |
| | insight Eggs | /admin/insightimg | T3.4.4.9 | TeamsEdge Support.insight |

#### S4. Credits & Billing — 花了多少

> **定位（关键治理）**：Billing 的“真相层”在 **[T]**，**[S]** 只做“投影视图”。
>
> - **[T] 写**：会改变 *能不能用/额度多少/是否到期* 的操作（如发票登记/付款确认/权益生成与撤销/额度调整）属于资产结算与分发。
> - **[S] 看**：S4 只提供用量、权益、发票的只读看板与分析（趋势/预测/告警），用于驱动增长飞轮，而不是做结算真相。
>
> **对齐实现**：本分区对应「Invoice → Entitlement（最小商业闭环）」的数据与接口规范：
> - 数据结构：[CONNECTION/_spec/schema.yaml](../_spec/schema.yaml)
> - 接口规范：[CONNECTION/_spec/api.md](../_spec/api.md)
> - 工作流与边界（不存敏感信息）：[CONNECTION/WorkPass/billing.md](../WorkPass/billing.md)

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | Te3.lsn189.cn (admin) |
|---------|-----------|------|:--------:|----------------------|
| **Credits & Billing** | Tickets 工单 | /admin/ticket | T3.4.5.1 | TeamsEdge Support.Tickets |
| | Usage 用量 | /admin/billing/usage | T3.4.5.2 | (新增) |
| | Entitlements 权益 | /admin/billing/entitlements | T3.4.5.3 | (新增) |
| | Invoices 发票 | /admin/billing/invoices | T3.4.5.4 | (新增) |

---

### ⚪ [—] 系统治理 — Notification / System / Data

> **权限**: T营专属 | **定位**: 平台运维 | **地址段**: `T3.5.x.x`

#### Notification — 通知

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | Te3.lsn189.cn (admin) |
|---------|-----------|------|:--------:|----------------------|
| **Notification** | Users 用户通知 | /admin/users | T3.5.1.1 | TeamsEdge Support.Users |
| | Operation Log | /admin/oplog | T3.5.1.2 | TeamsEdge System.Operation Log |

#### System — 系统

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | Te3.lsn189.cn (admin) |
|---------|-----------|------|:--------:|----------------------|
| **System** | Settings | /admin/settings | T3.5.2.1 | System.Settings |
| | Variable | /admin/variable | T3.5.2.2 | System.Variable |
| | Operator | /admin/opr | T3.5.2.3 | System.Operator |
| | API | /swagger/index.html | T3.5.2.4 | System.API |
| | Logging | /admin/logging | T3.5.2.5 | System.Logging |
| **Data** | Table Dynamic | /admin/pgdata | T3.5.3.1 | Data.Table Dynamic |
| | JSON Static | /admin/datasource | T3.5.3.2 | Data.JSON Static |

---

### 🔴 [R] 保留区 — TeamsEdge Support / TeamsEdge System

> **权限**: T营专属 | **定位**: 平台级功能（V1 兼容） | **地址段**: `T3.6.x.x`

#### TeamsEdge Support — 平台支持

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | Te3.lsn189.cn (admin) |
|---------|-----------|------|:--------:|----------------------|
| **TeamsEdge Support** | Customers | /admin/customer | T3.6.1.1 | TeamsEdge Support.Customers |
| | Users | /admin/users | T3.6.1.2 | TeamsEdge Support.Users |
| | Agreements | /admin/agreement | T3.6.1.3 | TeamsEdge Support.Agreements |
| | Workplane | /admin/workplane | T3.6.1.4 | TeamsEdge Support.Workplane |
| | Tickets | /admin/ticket | T3.6.1.5 | TeamsEdge Support.Tickets |
| | Proxy Server | /admin/teamsedge/server | T3.6.1.6 | TeamsEdge Support.Proxy Server |
| | Proxy Limiter | /admin/teamsedge/limiter | T3.6.1.7 | TeamsEdge Support.Proxy Limiter |
| | Proxy Address | /admin/teamsedge/address | T3.6.1.8 | TeamsEdge Support.Proxy Address |
| | Proxy Rule | /admin/teamsedge/rule | T3.6.1.9 | TeamsEdge Support.Proxy Rule |
| | Proxy Sessions | /admin/teamsedge/session | T3.6.1.10 | TeamsEdge Support.Proxy Sessions |
| | Tester Endpoints | /admin/teamsedge/tester | T3.6.1.11 | TeamsEdge Support.Tester |
| | insight Eggs | /admin/insightimg | T3.6.1.12 | TeamsEdge Support.insight |

#### TeamsEdge System — 平台系统

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | Te3.lsn189.cn (admin) |
|---------|-----------|------|:--------:|----------------------|
| **TeamsEdge System** | Api Token | /admin/apitoken | T3.6.2.1 | TeamsEdge System.Api Token |
| | Backup Data | /admin/backup | T3.6.2.2 | TeamsEdge System.Backup |
| | Translate | /admin/translate | T3.6.2.3 | TeamsEdge System.Translate |
| | Operation Log | /admin/oplog | T3.6.2.4 | TeamsEdge System.Operation Log |
| | File Manager | /admin/filemanager | T3.6.2.5 | TeamsEdge System.File Manager |
| | DB Manager | /admin/tools/sqlexec | T3.6.2.6 | TeamsEdge System.DB Manager |
| | System Status | /admin/sysstatus | T3.6.2.7 | TeamsEdge System.System Status |

---

## 操作员菜单 (menu-opr.json) — TAES 对齐

| TAES | L1 菜单 | L2 子菜单 | 路由 | TAES地址 |
|:---:|---------|-----------|------|:--------:|
| **E** | **Players** | - | /admin/user | T3.1.2 |
| **S** | **Knowledge** | Knowledge Base | /admin/knowledge | T3.4.10 |
| | | Index Document | /admin/idocument | T3.4.4.11 |
| | | Search Document | /admin/knowledge/docsearch | T3.4.4.12 |
| **—** | **System** | Settings | /admin/settings | T3.5.2.1 |
| | | Operator | /admin/opr | T3.5.2.3 |
| | | Translate | /admin/translate | T3.5.4.3 |
| | | Operation Log | /admin/oplog | T3.5.1.2 |
| | | File Manager | /admin/filemanager | T3.5.4.4 |
| | | DB Manager | /admin/tools/sqlexec | T3.5.4.5 |
| | | System Status | /admin/sysstatus | T3.5.4.6 |

---

## 统计概览

| 菜单类型 | TAES L1 数 | L2 子菜单总数 | 适用角色 |
|---------|:----------:|:------------:|---------|
| Admin | **10** | 70 | super |
| Operator | **3** | 10 | opr |

---

## TAES 地址索引

> 快速定位：根据 TAES 地址查找菜单功能

| 地址段 | 范围 | 功能域 |
|:------:|:----:|--------|
| `T3.1.1-7` | 1-7 | EdgeTeams 团队管理（E队/队员/AO/AR/M365/域名/Publisher） |
| `T3.2.1-6` | 1-6 | TeamsCamp 付费资产（AITC/BAS/AGA/Teamsbox/LinkServer/ServiceNode） |
| `T3.3.1-10` | 1-10 | Augment 托举设施（技术运维） |
| `T3.4.1.x` | 1-4 | Mission 任务定义 |
| `T3.4.2.x` | 1-3 | The Foundry 工坊 |
| `T3.4.3.x` | 1-7 | WorkSpace 工位 |
| `T3.4.4.x` | 1-12 | AI Intelligence 认知 |
| `T3.4.5.x` | 1-4 | Credits & Billing 权益 |
| `T3.5.1.x` | 1-2 | Notification 通知 |
| `T3.5.2.x` | 1-5 | System 系统设置 |
| `T3.5.3.x` | 1-2 | Data 数据管理 |
| `T3.6.1.x` | 1-12 | TeamsEdge Support 平台支持 |
| `T3.6.2.x` | 1-7 | TeamsEdge System 平台系统 |

---

## TAES 权限矩阵

| TAES 分区 | L1 菜单 | T营 (super) | E队 (member) | 操作员 (opr) |
|:--------:|---------|:-----------:|:------------:|:------------:|
| **E** | EdgeTeams (含 TeamsIdol) | ✅ 可见 | ✅ 自助 | ❌ |
| **T** | TeamsCamp | ✅ 专属 | ❌ | ❌ |
| **A** | Augment | ✅ 运维 | 👁️ 只读 | ❌ |
| **S** | Mission | ✅ 审计 | ✅ 自助 | ❌ |
| **S** | The Foundry | ✅ 审计 | ✅ 自助 | ❌ |
| **S** | AI Intelligence | ✅ 审计 | ✅ 自助 | ✅ Knowledge |
| **S** | Credits & Billing（S=只读投影；写在T：Invoice/Entitlement；看在S：Usage） | ✅ 管理 | 👁️ 只读 | ❌ |
| **—** | Notification | ✅ 管理 | 👁️ 只读 | ✅ 只读 |
| **—** | System | ✅ 专属 | ❌ | ✅ 受限 |
| **—** | Data | ✅ 专属 | ❌ | ❌ |
| **R** | TeamsEdge Support | ✅ 专属 | ❌ | ❌ |
| **R** | TeamsEdge System | ✅ 专属 | ❌ | ✅ 受限 |

---

## 迁移映射表

> 从 14 个旧顶级菜单到 9 个 TAES L1 的映射关系

| 旧菜单 (v1) | → | 新 L1 (v2-TAES) | TAES |
|-------------|:-:|-----------------|:----:|
| Player | → | EdgeTeams | E |
| TeamsIdol | → | TeamsIdol (保留) | E |
| Team E队 | → | EdgeTeams + TeamsCamp | E+T |
| WorkPlane | → | Augment | A |
| Task | → | The Foundry | S |
| Github 工坊 | → | TeamsCamp | T |
| EdgeTeam Kard | → | Mission | S |
| WorkSpace | → | The Foundry.WorkSpace | S |
| AI Task advisor | → | AI Intelligence | S |
| Data | → | System.Data | — |
| System | → | System | — |
| TeamsEdge Support | → | (拆分到 T/A/S/—) | 混合 |
| TeamsEdge System | → | System.TeamsEdge | — |

---

## 附录：存量菜单原始结构

<details>
<summary>📋 点击展开 v1 原始菜单（归档）</summary>

### 管理员菜单 (menu-admin.json) — v1 原始

| 顶级菜单 | 图标 | 子菜单 | 路由 |
|---------|------|--------|------|
| **Player** | mdi-account | - | /admin/player |
| **TeamsIdol** | mdi-account | Don | /admin/don |
| | | ILYA | /admin/ilya |
| | | Yuki | /admin/yuki |
| | | Her | /admin/her |
| | | Eva | /admin/eva |
| | | AL | /admin/al |
| | | Rommel | /admin/rommel |
| | | Smith | /admin/smith |
| | | Dora | /admin/dora |
| | | Marc | /admin/marc |
| | | Thales | /admin/thales |
| **Team E队** | mdi-account-group | Team E队 | /admin/teaminfo |
| | | TSG 组队 | /admin/default |
| | | AI工场 | /admin/tenant |
| | | Publisher | /admin/publisher |
| | | Edge Profiles | /admin/default |
| **WorkPlane** | mdi-network | Workplane工做面 | /admin/workplane |
| | | Link Server | /admin/link_server |
| | | Service Node | /admin/service_node |
| | | POP 站点 | /admin/pop_site |
| | | Teamsbox | /admin/teamsbox |
| **Task** | mdi-function | Workplace | /admin/task/workplace |
| | | Workbench | /admin/task/workbench |
| | | Functions | /admin/task/functions |
| **Github 工坊** | mdi-github | Org 工坊 | /admin/github/org |
| | | Azure Credit 支付 | /admin/default |
| | | Repo 仓库 | /admin/github/repo |
| **EdgeTeam Kard** | mdi-puzzle | EdgeTeam ET卡 | /admin/addons_new |
| | | EdgeTeam VSC Kard | /admin/vsckard |
| | | EdgeTeam OS Kard | /admin/oskard |
| **WorkSpace** | mdi-card-account-details | Azure VM | /admin/teamsedge/vm |
| | | WFM TeamsBox | /admin/markdown |
| | | RD Remote Desktop | /admin/markdown |
| | | Windows OS | /admin/markdown |
| | | Mac OS | /admin/markdown |
| | | iPhone/iPad | /admin/markdown |
| | | Android | /admin/markdown |
| **AI Task advisor** | mdi-tent | Context Prompt | /admin/default |
| | | Teams Ta | /admin/teamsbot |
| | | Teams Ta Rag | /admin/teamsbot/ragfiles |
| | | Azure AI | /admin/default |
| | | Globe AI | /admin/default |
| | | China AI | /admin/default |
| | | AI Appreciate | /admin/teamsedge/apps |
| ── **分割线** ── | | | |
| **Data** | mdi-database | Table Dynamic | /admin/pgdata |
| | | JSON Static | /admin/datasource |
| | | Context Template | /admin/markdown/template |
| **System** | mdi-cogs | Settings | /admin/settings |
| | | Variable | /admin/variable |
| | | Operator | /admin/opr |
| | | API | /swagger/index.html |
| | | Logging | /admin/logging |
| ── **分割线** ── | | | |
| **TeamsEdge Support** | mdi-apps | Customers | /admin/customer |
| | | Users | /admin/users |
| | | Agreements | /admin/agreement |
| | | Workplane | /admin/workplane |
| | | Tickets | /admin/ticket |
| | | Proxy Server | /admin/teamsedge/server |
| | | Proxy Limiter | /admin/teamsedge/limiter |
| | | Proxy Address | /admin/teamsedge/address |
| | | Proxy Rule | /admin/teamsedge/rule |
| | | Proxy Sessions | /admin/teamsedge/session |
| | | Tester Endpoints | /admin/teamsedge/tester |
| | | insight Eggs | /admin/insightimg |
| **TeamsEdge System** | mdi-cogs | Api Token | /admin/apitoken |
| | | Backup Data | /admin/backup |
| | | Translate | /admin/translate |
| | | Operation Log | /admin/oplog |
| | | File Manager | /admin/filemanager |
| | | DB Manager | /admin/tools/sqlexec |
| | | System Status | /admin/sysstatus |

### 操作员菜单 (menu-opr.json) — v1 原始

| 顶级菜单 | 图标 | 子菜单 | 路由 |
|---------|------|--------|------|
| **Users** | mdi-account | - | /admin/user |
| **Knowledge** | mdi-switch | Knowledge Base | /admin/knowledge |
| | | Index Document | /admin/idocument |
| | | Search Document | /admin/knowledge/docsearch |
| **TeamsEdge System** | mdi-cogs | Settings | /admin/settings |
| | | Operator | /admin/opr |
| | | Translate | /admin/translate |
| | | Operation Log | /admin/oplog |
| | | File Manager | /admin/filemanager |
| | | DB Manager | /admin/tools/sqlexec |
| | | System Status | /admin/sysstatus |

### 统计概览 — v1

| 菜单类型 | 顶级菜单数 | 子菜单总数 | 适用角色 |
|---------|-----------|-----------|---------|
| Admin | 14 | 67 | super |
| Operator | 3 | 10 | opr |

</details>
