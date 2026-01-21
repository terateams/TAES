# TeamsEdge 菜单结构（TAES 对齐版）

> **站点**: Te3.lsn189.cn | **版本**: v2.1-TAES | **更新**: 2026-01-21
>
> 数据来源：[assets/menu-admin.json](../assets/menu-admin.json) 和 [assets/menu-opr.json](../assets/menu-opr.json)

---

## TAES 菜单架构

> **口诀**：E队优先看、T营资源管、A托举连接、S飞轮转

```
┌─────────────────────────────────────────────────────────────────┐
│  TAES 菜单分区逻辑                                               │
├─────────────────────────────────────────────────────────────────┤
│  [E] EdgeTeams     →  客户是谁？团队、角色、站点               │
│  [T] TeamsCamp     →  资源在哪？合同主体、算力池               │
│  [A] Augment       →  如何连接？网络通道、AI托管               │
│  [S] Scale 飞轮    →  Mission / Foundry / Intelligence / Credits │
│  [—] 系统治理      →  Notification / System                     │
└─────────────────────────────────────────────────────────────────┘
```

### TAES 地址段规范

> **格式**: `T3.{TAES}.{L1}.{L2}` — T3=Te3站点, TAES分区=1-5, L1=菜单序号, L2=子菜单序号

| TAES 分区 | 地址段 | 说明 |
|:---------:|:------:|------|
| **[E]** EdgeTeams | `T3.1.x.x` | 价值创造方 |
| **[T]** TeamsCamp | `T3.2.x.x` | 资源持有方 |
| **[A]** Augment | `T3.3.x.x` | 托举基础设施 |
| **[S]** Scale | `T3.4.x.x` | 增长飞轮 |
| **[—]** System | `T3.5.x.x` | 系统治理 |

---

## 管理员菜单 (menu-admin.json) — TAES 重构

### 🟢 [E] EdgeTeams — 客户是谁

> **权限**: E队自助 + T营可见 | **定位**: 价值创造方 | **地址段**: `T3.1.x.x`

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | Te3.lsn189.cn (admin) |
|---------|-----------|------|:--------:|----------------------|
| **EdgeTeams** | Player 成员 | /admin/player | T3.1.1.1 | Player |
| | Team E队 | /admin/teaminfo | T3.1.1.2 | Team E队 |
| | TSG 组队 | /admin/tsg | T3.1.1.3 | TSG 组队 |
| | Edge Profiles | /admin/profiles | T3.1.1.4 | Edge Profiles |
| | Publisher 发布者 | /admin/publisher | T3.1.1.5 | Publisher |
| **TeamsIdol** | Don | /admin/don | T3.1.2.1 | TeamsIdol.Don |
| | ILYA | /admin/ilya | T3.1.2.2 | TeamsIdol.ILYA |
| | Yuki | /admin/yuki | T3.1.2.3 | TeamsIdol.Yuki |
| | Her | /admin/her | T3.1.2.4 | TeamsIdol.Her |
| | Eva | /admin/eva | T3.1.2.5 | TeamsIdol.Eva |
| | AL | /admin/al | T3.1.2.6 | TeamsIdol.AL |
| | Rommel | /admin/rommel | T3.1.2.7 | TeamsIdol.Rommel |
| | Smith | /admin/smith | T3.1.2.8 | TeamsIdol.Smith |
| | Dora | /admin/dora | T3.1.2.9 | TeamsIdol.Dora |
| | Marc | /admin/marc | T3.1.2.10 | TeamsIdol.Marc |
| | Thales | /admin/thales | T3.1.2.11 | TeamsIdol.Thales |

---

### 🔵 [T] TeamsCamp — 资源在哪

> **权限**: T营专属 | **定位**: 资源持有方 | **地址段**: `T3.2.x.x`

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | Te3.lsn189.cn (admin) |
|---------|-----------|------|:--------:|----------------------|
| **TeamsCamp** | Org 工坊 | /admin/github/org | T3.2.1.1 | Github 工坊.Org |
| | Repo 仓库 | /admin/github/repo | T3.2.1.2 | Github 工坊.Repo |
| | AI工场 Tenant | /admin/tenant | T3.2.1.3 | Team E队.AI工场 |
| | Azure Credit | /admin/billing/azure | T3.2.1.4 | Github 工坊.Azure Credit |
| | Agreements 合同 | /admin/agreement | T3.2.1.5 | TeamsEdge Support.Agreements |
| | Customers 客户 | /admin/customer | T3.2.1.6 | TeamsEdge Support.Customers |

---

### 🟡 [A] Augment — 如何连接

> **权限**: T营运维 + E队只读 | **定位**: 托举基础设施 | **地址段**: `T3.3.x.x`

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | Te3.lsn189.cn (admin) |
|---------|-----------|------|:--------:|----------------------|
| **Augment** | Workplane 工做面 | /admin/workplane | T3.3.1.1 | WorkPlane.Workplane |
| | Link Server | /admin/link_server | T3.3.1.2 | WorkPlane.Link Server |
| | Service Node | /admin/service_node | T3.3.1.3 | WorkPlane.Service Node |
| | POP 站点 | /admin/pop_site | T3.3.1.4 | WorkPlane.POP 站点 |
| | Teamsbox | /admin/teamsbox | T3.3.1.5 | WorkPlane.Teamsbox |
| | Proxy Server | /admin/teamsedge/server | T3.3.1.6 | TeamsEdge Support.Proxy Server |
| | Proxy Limiter | /admin/teamsedge/limiter | T3.3.1.7 | TeamsEdge Support.Proxy Limiter |
| | Proxy Address | /admin/teamsedge/address | T3.3.1.8 | TeamsEdge Support.Proxy Address |
| | Proxy Rule | /admin/teamsedge/rule | T3.3.1.9 | TeamsEdge Support.Proxy Rule |
| | Proxy Sessions | /admin/teamsedge/session | T3.3.1.10 | TeamsEdge Support.Proxy Sessions |

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

| L1 菜单 | L2 子菜单 | 路由 | TAES地址 | Te3.lsn189.cn (admin) |
|---------|-----------|------|:--------:|----------------------|
| **Credits & Billing** | Tickets 工单 | /admin/ticket | T3.4.5.1 | TeamsEdge Support.Tickets |
| | Usage 用量 | /admin/billing/usage | T3.4.5.2 | (新增) |

---

### ⚪ [—] 系统治理 — Notification / System

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
| **TeamsEdge System** | Api Token | /admin/apitoken | T3.5.4.1 | TeamsEdge System.Api Token |
| | Backup Data | /admin/backup | T3.5.4.2 | TeamsEdge System.Backup |
| | Translate | /admin/translate | T3.5.4.3 | TeamsEdge System.Translate |
| | File Manager | /admin/filemanager | T3.5.4.4 | TeamsEdge System.File Manager |
| | DB Manager | /admin/tools/sqlexec | T3.5.4.5 | TeamsEdge System.DB Manager |
| | System Status | /admin/sysstatus | T3.5.4.6 | TeamsEdge System.System Status |

---

## 操作员菜单 (menu-opr.json) — TAES 对齐

| TAES | L1 菜单 | L2 子菜单 | 路由 | TAES地址 |
|:---:|---------|-----------|------|:--------:|
| **E** | **Users** | - | /admin/user | T3.1.1.1 |
| **S** | **Knowledge** | Knowledge Base | /admin/knowledge | T3.4.4.10 |
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
| Admin | **9** | 62 | super |
| Operator | **3** | 10 | opr |

---

## TAES 地址索引

> 快速定位：根据 TAES 地址查找菜单功能

| 地址段 | 范围 | 功能域 |
|:------:|:----:|--------|
| `T3.1.1.x` | 1-5 | EdgeTeams 团队管理 |
| `T3.1.2.x` | 1-11 | TeamsIdol AI角色 |
| `T3.2.1.x` | 1-6 | TeamsCamp 资源管理 |
| `T3.3.1.x` | 1-10 | Augment 托举设施 |
| `T3.4.1.x` | 1-4 | Mission 任务定义 |
| `T3.4.2.x` | 1-3 | The Foundry 工坊 |
| `T3.4.3.x` | 1-7 | WorkSpace 工位 |
| `T3.4.4.x` | 1-12 | AI Intelligence 认知 |
| `T3.4.5.x` | 1-2 | Credits & Billing 权益 |
| `T3.5.1.x` | 1-2 | Notification 通知 |
| `T3.5.2.x` | 1-5 | System 系统设置 |
| `T3.5.3.x` | 1-2 | Data 数据管理 |
| `T3.5.4.x` | 1-6 | TeamsEdge System 平台 |

---

## TAES 权限矩阵

| TAES 分区 | L1 菜单 | T营 (super) | E队 (member) | 操作员 (opr) |
|:--------:|---------|:-----------:|:------------:|:------------:|
| **E** | EdgeTeams | ✅ 可见 | ✅ 自助 | ❌ |
| **E** | TeamsIdol | ✅ 管理 | ✅ 只读 | ❌ |
| **T** | TeamsCamp | ✅ 专属 | ❌ | ❌ |
| **A** | Augment | ✅ 运维 | 👁️ 只读 | ❌ |
| **S** | Mission | ✅ 审计 | ✅ 自助 | ❌ |
| **S** | The Foundry | ✅ 审计 | ✅ 自助 | ❌ |
| **S** | AI Intelligence | ✅ 审计 | ✅ 自助 | ✅ Knowledge |
| **S** | Credits & Billing | ✅ 管理 | 👁️ 只读 | ❌ |
| **—** | Notification | ✅ 管理 | 👁️ 只读 | ✅ 只读 |
| **—** | System | ✅ 专属 | ❌ | ✅ 受限 |

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
