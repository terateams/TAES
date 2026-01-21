# TeamsEdge 菜单结构

> 数据来源：[assets/menu-admin.json](../assets/menu-admin.json) 和 [assets/menu-opr.json](../assets/menu-opr.json)

## 管理员菜单 (menu-admin.json)

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

---

## 操作员菜单 (menu-opr.json)

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

---

## 统计概览

| 菜单类型 | 顶级菜单数 | 子菜单总数 | 适用角色 |
|---------|-----------|-----------|---------|
| Admin | 14 | 67 | super |
| Operator | 3 | 10 | opr |

## 结构分区说明

| 分区 | 菜单项 | 用途 |
|-----|--------|------|
| **业务功能区** | Player → AI Task advisor (10个) | 日常业务操作 |
| **数据管理区** | Data, System (2个) | 数据源与系统配置 |
| **平台管理区** | TeamsEdge Support, TeamsEdge System (2个) | 平台级管理功能 |
