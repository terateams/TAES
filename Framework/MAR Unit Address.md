
# MAR 的单元地址方案

> **MAR Unit Address** — 每个 MAR Repo 拥有唯一的单元地址空间，类 TCP/IP 纯数字寻址

---

## 1. 概述

### MAR = Mission Augmented Repo

> **MAR**（Mission Augmented Repo）是本地址方案的核心前提：**Repo 与 Mission 一一对应**。

```
┌─────────────────────────────────────────────────────────────────┐
│  Mission 的两层结构                                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Mission Framework（框架层）                                     │
│      ↓ 定义方法论、协作模式、AI 托举机制                         │
│      ↓ 形成 Mission Repo（如 TAES）                             │
│                                                                 │
│  Mission Instance（实例层）                                      │
│      ↓ 部署具体软件/站点解决具体问题                             │
│      ↓ 形成 App Repo（如 TeamsEdge）                            │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Mission 的本质**：一类问题的解决过程与手段，由**团队协同 + AI 托举**完成。

| 层级 | 定义 | 产出 | 示例 |
|------|------|------|------|
| **Framework** | 方法论 + 协作模式 | Mission Repo | TAES（本仓库） |
| **Instance** | 具体问题的解决方案 | App Repo + 站点 | TeamsEdge → Te3.lsn189.cn |

### 设计目标

| 目标 | 说明 |
|------|------|
| **全数字化** | U 之后只允许数字，便于机器解析 |
| **层级清晰** | MR → Segment → L2 → ID 四级结构 |
| **可扩展** | 预留空间支持未来增长 |
| **MCP 兼容** | 支持 AI Agent 自动发现与调用 |

---

## 2. 地址规范（What）

### 2.1 地址格式

> **地址定义者**：业务主体方（如 万联 / TeamsCamp / T营）拥有地址空间的分配权

```
完整格式：U{MR}.{Seg}.{L2}.{ID}

┌─────┬─────┬─────┬──────────┬──────────┐
│  U  │ MR  │ Seg │   L2     │   ID     │
├─────┼─────┼─────┼──────────┼──────────┤
│ 前缀 │ 2位 │ 2位 │ 1-3位    │ 4位      │
│ 固定 │ 00-99│ 00-99│ 子菜单号 │ 实例编号  │
└─────┴─────┴─────┴──────────┴──────────┘

正则表达式：
  ^U(\d{1,2})\.(\d{1,2})\.(\d{1,3})(?:\.(\d{4}))?$

BNF 语法：
  <address>  ::= "U" <mr> "." <seg> "." <l2> [ "." <id> ]
  <mr>       ::= <digit> | <digit><digit>
  <seg>      ::= <digit><digit>
  <l2>       ::= <digit> | <digit><digit> | <digit><digit><digit>
  <id>       ::= <digit><digit><digit><digit>
```

| 字段 | 名称 | 范围 | 说明 |
|:----:|------|------|------|
| **U** | Unit 前缀 | 固定 | 标识为 MAR 单元地址 |
| **MR** | Mission Repo ID | 0-99 | 由业务主体分配的 Repo 编号 |
| **Seg** | Segment | 0-99 | 分区编号 |
| **L2** | Level-2 Index | 1-999 | 分区内子菜单/资源序号 |
| **ID** | 实例编号 | 0101-9999 | 4 位数字，具体资源的唯一标识 |

### 2.2 编号规则

#### MR 编号规则

| 范围 | 用途 | 说明 |
|:----:|------|------|
| **U0** | 系统保留 | 元数据、版本、路由 |
| **1-10** | 保留 | 未来探索空间 |
| **U1x** | 框架层 | Mission Repo（如 TAES=U11） |
| **U2x** | 实例层 | App Repo（如 Te3=U12） |
| **U3x+** | 扩展 | 按需分配 |

#### Segment 编号规则

> **口诀**：T1-A2-E3-S4-F5-N6-M7-R9（首位数字 × 10 + 1）

| Seg | 分区 | 说明 |
|:---:|:----:|------|
| **11** | [T] TeamsCamp | 资源在哪？合同主体、算力池 |
| **21** | [A] Augment | 如何连接？Workplane / AITa / AC |
| **31** | [E] EdgeTeams | 客户是谁？团队、角色、站点 |
| **41** | [S] Scale | 增长飞轮：Context / Invoice / Payment |
| **51** | [F] Foundry | 能力工坊：Function / Workbench |
| **61** | [N] Notify | 信息传导：Inbox / Preferences |
| **71** | [M] Management | 系统治理：System / Data |
| **91** | [R] Reserved | 保留区：Support / System |

#### ID 编号规则

> **核心原则**：MAR 地址全数字化，U 之后只允许数字

| 范围 | 用途 | 数量 |
|:----:|------|:----:|
| **0000-0100** | 系统保留 | 101 个 |
| **0101-9999** | 可分配 | 9899 个 |

```
ID 生成方式：
  ID = hash(resource_name) % 9899 + 101   # 取模后偏移到 0101+
     | sequential_id (从 0101 起)          # 顺序分配
     | custom_numeric_code                 # 自定义编码（≥0101）
```

### 2.3 保留空间

| 层级 | 保留范围 | 用途 |
|------|:--------:|------|
| **MR** | U0, 1-10 | 系统元数据、未来扩展 |
| **Seg** | 0-10, 80-90 | 系统配置、未来扩展 |
| **ID** | 0000-0100 | 系统保留 |

---

## 3. 注册实例（Where）

### 3.1 MR 注册表

> **当前业务主体**：万联（Terateams）

| MR ID | MR Name | GitHub Repo | Context |
|:-----:|---------|-------------|---------|
| **U0** | **System** | — | 系统保留（元数据、版本） |
| 1-10 | 保留 | — | 未来探索空间 |
| **U11** | **TAES** | `/Terateams/TAES` | 本仓库（协力营托举E队方法论） |
| **U12** | **Te3.lsn189.cn** | `/Terateams/TeamsEdge` | TAES 的实践站点 |
| **U21** | **EdgeTeam** | `/Terateams/EdgeTeam` | E队 协作平台 |
| **U22** | **T189.terateams.com** | `/Terateams/T189` | T营 管理控制台 |
| **U23** | **i117.ilya.team** | `/Terateams/ILYA` | AI 研究员工作站 |
| U3x+ | ... | ... | 按需分配 |

### 3.2 Segment 注册表

> **标准分区**（每个 MR 可选用）

| Seg 范围 | 分区 | 说明 |
|:--------:|:----:|------|
| **0** | 系统元数据 | `U{MR}.0.x` = Repo 级配置、版本 |
| **1-10** | 保留 | 未来扩展 |
| **11-19** | [T] TeamsCamp | 资源持有方 |
| **21-29** | [A] Augment | 托举基础设施 |
| **31-39** | [E] EdgeTeams | 价值创造方 |
| **41-49** | [S] Scale | 增长飞轮 |
| **51-59** | [F] Foundry | 能力工坊 |
| **61-69** | [N] Notify | 信息传导 |
| **71-79** | [M] Management | 系统治理 |
| **80-90** | 保留 | 未来扩展 |
| **91-99** | [R] Reserved | 保留区 |

### 3.3 ID 注册表示例

> **每个 L2 下维护独立的 ID 注册表**

| ID | 资源名称 | 说明 |
|:--:|----------|------|
| 0000-0100 | — | 系统保留 |
| 0101 | alliedai | 首个租户 |
| 0114 | suibe-org | 上海对外经贸 |
| 1024 | p-zhang | 用户张 |

---

## 4. 实现机制（How）

### 4.1 MCP 协议兼容

> **MCP**（Model Context Protocol）是 AI Agent 发现和调用工具的标准协议。
> MAR 地址方案通过 `/.well-known/mar-registry.json` 实现 MCP 兼容。

```
站点部署位置：
  https://{site}/.well-known/mar-registry.json

示例：
  https://te3.lsn189.cn/.well-known/mar-registry.json
```

### 4.2 mar-registry.json 规范

```json
{
  "schema_version": "1.0",
  "mr_id": "U12",
  "mr_name": "Te3.lsn189.cn",
  "github_repo": "Terateams/TeamsEdge",
  "segments": [
    {
      "seg": 11,
      "code": "T",
      "name": "TeamsCamp",
      "description": "资源持有方",
      "endpoints": [
        { "l2": 1, "path": "/admin/teamscamp/aitc", "name": "AITC" },
        { "l2": 2, "path": "/admin/teamscamp/bas", "name": "BAS" }
      ]
    },
    {
      "seg": 31,
      "code": "E",
      "name": "EdgeTeams",
      "description": "价值创造方",
      "endpoints": [
        { "l2": 1, "path": "/Teams/team", "name": "E队" },
        { "l2": 2, "path": "/Teams/player", "name": "队员" }
      ]
    }
  ],
  "mcp_tools": [
    {
      "name": "resolve_address",
      "description": "解析 MAR 地址为可访问的 URL",
      "input_schema": {
        "type": "object",
        "properties": {
          "address": { "type": "string", "pattern": "^U\\d+\\.\\d+\\.\\d+" }
        }
      }
    },
    {
      "name": "list_resources",
      "description": "列出指定 Segment 下的所有资源",
      "input_schema": {
        "type": "object",
        "properties": {
          "mr_id": { "type": "string" },
          "segment": { "type": "integer" }
        }
      }
    }
  ]
}
```

### 4.3 AI Agent 调用示例

```
Agent 请求：解析地址 U12.31.1.0114

MCP 调用：
  POST /.well-known/mar-registry.json/resolve
  { "address": "U12.31.1.0114" }

返回：
  {
    "url": "https://te3.lsn189.cn/Teams/team/0114",
    "segment": "EdgeTeams",
    "resource": "E队",
    "instance_id": "0114",
    "instance_name": "suibe-org"
  }
```

---

## 5. 案例（Proof）

### 5.1 Te3.lsn189.cn（U12）

> **U12** = Te3.lsn189.cn，TAES 框架的实践站点

```
┌─────────────────────────────────────────────────────────────────┐
│  Te3.lsn189.cn 导航栏分区逻辑（U12）                             │
├─────────────────────────────────────────────────────────────────┤
│  [T] TeamsCamp   →  资源在哪？合同主体、算力池                  │
│  [A] Augment     →  如何连接？Workplane / AITa / AC             │
│  [E] EdgeTeams   →  客户是谁？团队、角色、站点                  │
│  [S] Scale       →  增长飞轮：Context / Invoice / Payment / SPD │
│  [F] Foundry     →  能力工坊：Function / Workbench              │
│  [N] Notify      →  信息传导：Inbox / Preferences               │
│  [M] Management  →  系统治理：System / Data                     │
├───────────────────────── 分 隔 线 ──────────────────────────────┤
│  [R] Reserved    →  保留区：TeamsEdge Support / System          │
└─────────────────────────────────────────────────────────────────┘
```

#### Te3 地址映射表

| Segment | 地址段 | 说明 | 实例示例 |
|:-------:|:------:|------|----------|
| **[T]** TeamsCamp | `U12.11.x` | 资源持有方 | U12.11.1.0101 |
| **[A]** Augment | `U12.21.x` | 托举基础设施 | U12.21.2.0102 |
| **[E]** EdgeTeams | `U12.31.x` | 价值创造方 | U12.31.1.0114 |
| **[S]** Scale | `U12.41.x` | 增长飞轮 | U12.41.1.0101 |
| **[F]** Foundry | `U12.51.x` | 能力工坊 | U12.51.2.0103 |
| **[N]** Notify | `U12.61.x` | 信息传导 | U12.61.1.0101 |
| **[M]** Management | `U12.71.x` | 系统治理 | U12.71.1.0101 |
| **[R]** Reserved | `U12.91.x` | 保留区 | U12.91.1.0101 |

### 5.2 TAES 管理菜单（U11）

> **U11** = TAES，本仓库的管理菜单地址映射

#### [E] EdgeTeams（U11.31.x）

| L2 | 子菜单 | 路由 | 地址 | 实例示例 |
|:--:|--------|------|:----:|----------|
| 1 | E队 | /Teams/team | U11.31.1 | U11.31.1.0101 |
| 2 | 队员 | /Teams/player | U11.31.2 | U11.31.2.1024 |
| 3 | AO | /Teams/ao | U11.31.3 | U11.31.3.0114 |
| 4 | AR | /Teams/ar | U11.31.4 | U11.31.4.0101 |
| 5 | M365组团 | /Teams/tsg | U11.31.5 | U11.31.5.0101 |
| 6 | 番号域名 | /Teams/domain | U11.31.6 | U11.31.6.0101 |
| 7 | Publisher | /Teams/publisher | U11.31.7 | U11.31.7.0101 |

#### [T] TeamsCamp（U11.11.x）

| L2 | 子菜单 | 路由 | 地址 | 实例示例 |
|:--:|--------|------|:----:|----------|
| 1 | AITC | /admin/teamscamp/aitc | U11.11.1 | U11.11.1.0101 |
| 2 | BAS | /admin/teamscamp/bas | U11.11.2 | U11.11.2.0101 |
| 3 | AGA | /admin/teamscamp/aga | U11.11.3 | U11.11.3.0101 |
| 4 | Teamsbox | /admin/teamscamp/teamsbox | U11.11.4 | U11.11.4.6217 |
| 5 | Link Server | /admin/teamscamp/linkserver | U11.11.5 | U11.11.5.0101 |
| 6 | Service Node | /admin/teamscamp/servicenode | U11.11.6 | U11.11.6.0101 |

> **说明**：更多分区详解见 [Te3.lsn189.cn.T.explainer.md](Te3.lsn189.cn.T.explainer.md)

---

## 附录

### A. 快速参考

```
地址格式：U{MR}.{Seg}.{L2}.{ID}
正则：    ^U(\d{1,2})\.(\d{1,2})\.(\d{1,3})(?:\.(\d{4}))?$

Segment 口诀：T1-A2-E3-S4-F5-N6-M7-R9
ID 起始：0101（0000-0100 保留）

示例：U12.31.1.0114 = Te3 / EdgeTeams / E队 / suibe-org
```

### B. 版本历史

| 版本 | 日期 | 说明 |
|:----:|:----:|------|
| v1.0 | 2026-01-25 | 初版发布 |

---