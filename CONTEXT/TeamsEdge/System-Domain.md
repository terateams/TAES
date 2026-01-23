# [Issue] System Menu 新增 Domain 菜单

> 基于 TAES 方法论，为 TeamsEdge 软件的 System Menu 新增 Domain 配置管理功能。

---

## 1. 背景与定位

### TeamsEdge 是什么？

**TeamsEdge 是 TAES 方法论的AI托举系统。**

| TAES 要素 | TeamsEdge 对应能力 |
| :--- | :--- |
| **T (TeamsCamp)** | 管理协力营的资源池、合同主体、授权分发 |
| **A (Augment)** | 提供 Workplane（网络托举）+ 算力配额管理 |
| **E (EdgeTeams)** | 管理 E队 的组织、角色、Mission、Repo |
| **S (Scale)** | 度量增长指标、交付物审计、证据链管理 |

### 为什么需要 Domain 菜单？

Domain 是 TeamsEdge 系统运行的**基础锚点**：
- 所有 E队、T营、Workplane 都需要域名作为访问入口
- 网络托举（Augment）的 IP 规划需要与 Domain 绑定
- 知识产权（商标、域名）需要统一管理与展示
- 依赖关系需要可视化，便于运维与审计

---

## 2. 目标用户（谁在用）

> Domain 菜单服务于三类角色，各有不同的使用场景与关注点。

### 2.1 用户角色定义

| 角色 | 中文 | 典型身份 | 核心关注点 |
| :--- | :--- | :--- | :--- |
| **Operator** | 操作员 | 系统管理员、DevOps 工程师 | 域名解析、证书状态、IP 规划、故障排查 |
| **Business User** | 业务人员 | 产品经理、E队 Owner、商务负责人 | 域名清单、知识产权状态、服务入口一览 |
| **Support Staff** | 支撑人员 | 客服、运维支持、合规审计员 | 依赖关系、证书到期提醒、审计日志 |

### 2.2 使用场景（Jobs-to-be-done）

| 角色 | 场景 | 期望操作 | 期望结果 |
| :--- | :--- | :--- | :--- |
| **Operator** | 新增 E队 专属入口 | 配置 `*.workplane.lsn189.cn` 子域名 | 域名解析生效、证书自动签发 |
| **Operator** | 证书即将到期 | 查看到期提醒、触发续期 | 证书续期成功、无服务中断 |
| **Operator** | 故障定位 | 查看 IP 规划、依赖关系图 | 快速定位问题服务/网络段 |
| **Business User** | 汇报资产清单 | 导出域名/知识产权列表 | 生成 Excel/PDF 报告 |
| **Business User** | 确认服务入口 | 查看各软件域名 | 获取正确的访问地址 |
| **Business User** | 商标/域名续费 | 查看知识产权到期时间 | 提前安排续费预算 |
| **Support Staff** | 客户咨询服务入口 | 查询域名/入口地址 | 快速响应客户 |
| **Support Staff** | 合规审计 | 查看依赖关系、审计日志 | 生成合规证明 |
| **Support Staff** | 变更追溯 | 查看配置变更历史 | 定位变更责任人与时间 |

### 2.3 权限建议（RBAC）

| 角色 | 查看基本属性 | 查看扩展属性 | 新增/编辑 | 删除 | 导出 | 审计日志 |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Operator** | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| **Business User** | ✅ | ✅ | ❌ | ❌ | ✅ | ❌ |
| **Support Staff** | ✅ | ✅ | ❌ | ❌ | ✅ | ✅ |

### 2.4 顶级顾问建议（UX & Governance）

> 基于 2025 年企业 IT 治理与 UX 最佳实践，以下建议供参考：

#### 信息架构建议

1. **按角色分层展示**：默认首页展示"概览仪表盘"，Operator 可深入编辑，Business/Support 仅查看与导出。
2. **关键指标前置**：证书到期天数、域名健康状态应在仪表盘首屏显示，避免"埋在表格里"。
3. **依赖关系可视化**：提供 Topology 视图，让 Operator 一眼看清"谁依赖谁"。

#### 操作效率建议

4. **批量操作**：支持批量导入/导出域名配置（CSV/YAML），减少手工录入。
5. **自动化钩子**：证书到期前 30/7/1 天自动通知 Operator；支持自动续期（如 Let's Encrypt）。
6. **快速搜索**：支持按域名、IP、软件名称模糊搜索，快速定位。

#### 治理与合规建议

7. **变更审计强制留痕**：任何配置变更必须记录操作人、时间、变更内容、变更原因。
8. **知识产权提醒**：商标/域名到期前 90 天通知 Business User，便于预算与续费。
9. **权限最小化**：Business/Support 默认只读，避免误操作影响生产。

#### 与 TAES 方法论对齐

10. **Evidence 留痕**：Domain 配置变更应纳入 Evidence Schema，便于审计追溯。
11. **Repo 驱动**：可考虑将 Domain 配置以 YAML 形式存入 Mission Repo，实现"配置即代码"。

---

## 3. 基本属性：TeamsEdge 作为 TAES 支撑系统应具备的属性

> 以下属性定义 TeamsEdge 的核心 Domain 配置，是系统运行的基础。

### 3.1 核心域名配置

| 属性 | 值 | 说明 |
| :--- | :--- | :--- |
| **主域名** | `teamsedge.lsn189.cn` | TeamsEdge 系统主入口 |
| **API 域名** | `api.teamsedge.lsn189.cn` | 后端 API 服务入口 |
| **CDN 域名** | `cdn.lsn189.cn` | 静态资源分发 |
| **DNS 域名** | `dns.teamsedge.lsn189.cn` | 静态资源分发 |
| **Workplane 域名** | `*.workplane.lsn189.cn` | 网络托举服务（通配符） |

### 3.2 系统身份属性

| 属性 | 值 | TAES 对应 |
| :--- | :--- | :--- |
| **系统名称** | TeamsEdge | TAES 支撑系统 |
| **版本** | v1.0 | 当前发布版本 |
| **运营主体** | 元协力营 | TeamsCamp |
| **服务对象** | E队 | EdgeTeams |
| **核心能力** | 托举 + 增长 | Augment + Scale |

### 3.3 合规属性

| 属性 | 值 | 说明 |
| :--- | :--- | :--- |
| **数据存储区域** | 日本 / 中国 | 分区合规存储 |
| **隐私政策** | `privacy.teamsedge.lsn189.cn` | 隐私声明链接 |
| **服务条款** | `terms.teamsedge.lsn189.cn` | 服务协议链接 |
| **安全认证** | ISO 27001 (规划中) | 安全合规标准 |

---

## 4. 扩展属性：依赖关系表

> 以下表格定义 TeamsEdge Domain 的完整依赖关系，便于运维、审计与扩展。

### 4.1 依赖的软件

| 软件名称 | 类型 | 域名/入口 | 依赖说明 | 状态 |
| :--- | :--- | :--- | :--- | :--- |
| **TeamsEdge** | 托举系统 | `teamsedge.lsn189.cn` | TAES 核心支撑系统主入口 | 生产 |
| **Teams Acs** | 通信服务 | `teamsacs.lsn189.cn` | Azure Communication Services，提供实时通信能力 | 生产 |
| **TeamsDisplay** | 展示服务 | `ct3.lsn189.cn` | E队 任务看板与数据可视化 | 生产 |
| **TeamsBox** | 硬件网关 | `box.lsn189.cn` | 边缘设备管理与配置下发 | 规划中 |
| **Workplane** | 网络托举 | `*.workplane.lsn189.cn` | E队 专属网络托举入口 | 生产 |
| **GitHub API** | 代码托管 | `api.github.com` | Mission Repo 管理与 CI/CD | 生产 |
| **Azure OpenAI** | AI 服务 | `*.openai.azure.com` | LLM 算力提供 | 生产 |

### 4.2 依赖的 IP 规划

| IP 段 | 用途 | 区域 | 说明 |
| :--- | :--- | :--- | :--- |
| `10.0.0.0/16` | 内部服务网络 | 全局 | TeamsEdge 核心服务内网 |
| `10.1.0.0/16` | Workplane 网络 | 日本 | 网络托举出口 IP 池 |
| `10.2.0.0/16` | E队 VPN 网络 | 全局 | E队 远程接入 IP 池 |
| `公网 IP 池 A` | API 服务 | 日本 | 对外 API 入口 IP |
| `公网 IP 池 B` | CDN 边缘 | 全球 | 静态资源分发节点 |

### 4.3 依赖的 Domain 配置

| 域名 | 类型 | 解析目标 | 用途 | 证书状态 |
| :--- | :--- | :--- | :--- | :--- |
| `lsn189.cn` | A | 负载均衡 IP | 主域名入口 | ✅ 有效 |
| `teamsedge.lsn189.cn` | A | TeamsEdge IP | TeamsEdge 系统主入口 | ✅ 有效 |
| `api.teamsedge.lsn189.cn` | A | API 网关 IP | 后端 API 服务 | ✅ 有效 |
| `cdn.lsn189.cn` | CNAME | CDN | 静态资源分发 | ✅ 有效 |
| `dns.teamsedge.lsn189.cn` | A | DNS 服务 IP | DNS 解析服务 | ✅ 有效 |
| `teamsacs.lsn189.cn` | A | ACS IP | 通信服务入口 | ✅ 有效 |
| `ct3.lsn189.cn` | A | Display IP | TeamsDisplay 展示服务 | ✅ 有效 |
| `box.lsn189.cn` | A | Box IP | TeamsBox 管理入口 | 📋 规划中 |
| `*.workplane.lsn189.cn` | CNAME | Workplane | E队 专属网络托举入口 | ✅ 有效 |
| `privacy.teamsedge.lsn189.cn` | CNAME | 静态页 | 隐私政策页面 | ✅ 有效 |
| `terms.teamsedge.lsn189.cn` | CNAME | 静态页 | 服务条款页面 | ✅ 有效 |

### 4.4 依赖的知识产权

| IP 类型 | 名称 | 注册状态 | 持有主体 | 有效期 |
| :--- | :--- | :--- | :--- | :--- |
| **商标** | TeamsCamp / 协力营 | ®️ 已注册 | 元协力营 | 2025-2035 |
| **商标** | EdgeTeam / E队 | ®️ 已注册 | 元协力营 | 2025-2035 |
| **商标** | TAES | ®️ 已注册 | 元协力营 | 2025-2035 |
| **域名** | lsn189.cn | 已注册 | 元协力营 | 2025-2030 |
| **域名** | teamsedge.lsn189.cn | 子域名 | 元协力营 | 随主域名 |
| **域名** | workplane.lsn189.cn | 子域名 | 元协力营 | 随主域名 |
| **软件著作权** | TeamsEdge 系统 | 待申请 | 元协力营 | - |

### 4.5 其它依赖关系

| 依赖类型 | 依赖对象 | 说明 | 影响范围 |
| :--- | :--- | :--- | :--- |
| **云服务商** | Microsoft Azure | 主要 IaaS/PaaS 提供商 | 全系统 |
| **云服务商** | Cloudflare | CDN + DNS + 安全防护 | 网络层 |
| **支付渠道** | Stripe / PayPal | 账单与支付处理 | Billing 模块 |
| **认证服务** | Azure AD / Entra ID | 身份认证与 SSO | 用户系统 |
| **监控服务** | Azure Monitor | 系统监控与告警 | 运维 |
| **日志服务** | Azure Log Analytics | 日志采集与分析 | 审计 |

### 4.6 Context（上下文依赖）

| Context 类型 | 路径 / 来源 | 说明 |
| :--- | :--- | :--- |
| **TAES 方法论** | `TAES.md` | 指导系统设计的核心方法论 |
| **Menu 导航定义** | `CONNECTION/Workplane/TeamsEdge/Task/Menu.md` | 菜单结构与 PM Intent |
| **Mission Repo 模板** | GitHub Template Repo | E队 Repo 初始化模板 |
| **Copilot Instructions** | `.github/copilot-instructions.md` | AI 协同约束注入 |
| **Evidence Schema** | `Teams/Metadata/logs/` | 证据链存储规范 |

---

## 5. UI 设计建议

### 5.1 页面结构

```
System > Domain
├── 概览（Dashboard）
│   ├── 核心域名状态卡片
│   ├── 证书到期提醒
│   └── 依赖关系健康度
├── 基本属性（Basic）
│   ├── 核心域名配置表
│   ├── 系统身份信息
│   └── 合规属性
├── 扩展属性（Extended）
│   ├── 依赖软件表
│   ├── IP 规划表
│   ├── Domain 配置表
│   ├── 知识产权表
│   ├── 其它依赖表
│   └── Context 表
└── 操作
    ├── 新增域名
    ├── 编辑配置
    ├── 导出配置
    └── 审计日志
```

### 5.2 默认展示 vs 折叠

| 区域 | 默认展示 | 折叠/详情 |
| :--- | :--- | :--- |
| **概览** | 核心域名状态、证书到期提醒 | 历史变更记录 |
| **基本属性** | 核心域名、系统身份 | 合规属性详情 |
| **扩展属性** | 依赖软件、Domain 配置 | IP 规划、知识产权、Context |

---

## 6. 数据字段建议（用于实现）

### 6.1 Domain 主表

| 字段 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| domain_id | UUID | Y | 主键 |
| domain_name | VARCHAR(255) | Y | 域名（如 teamsedge.lsn189.cn） |
| domain_type | ENUM | Y | 主域名/子域名/通配符 |
| resolve_type | ENUM | Y | A/CNAME/MX/TXT |
| resolve_target | VARCHAR(255) | Y | 解析目标 |
| ssl_status | ENUM | Y | 有效/即将过期/已过期 |
| ssl_expire_at | DATETIME | N | 证书到期时间 |
| owner | VARCHAR(100) | Y | 持有主体 |
| created_at | DATETIME | Y | 创建时间 |
| updated_at | DATETIME | Y | 更新时间 |
| updated_by | VARCHAR(100) | Y | 最后修改人 |

### 6.2 依赖关系表

| 字段 | 类型 | 必填 | 说明 |
| :--- | :--- | :--- | :--- |
| dependency_id | UUID | Y | 主键 |
| domain_id | UUID | Y | 关联域名 |
| dependency_type | ENUM | Y | 软件/IP/Domain/IP权/其它/Context |
| dependency_name | VARCHAR(255) | Y | 依赖对象名称 |
| dependency_value | TEXT | N | 依赖对象值/配置 |
| status | ENUM | Y | 生产/规划中/已废弃 |
| notes | TEXT | N | 备注 |

---

## 7. 验收标准

- [ ] System 菜单下新增 Domain 子菜单入口
- [ ] 基本属性页面完整展示核心域名、系统身份、合规属性
- [ ] 扩展属性表格支持 6 类依赖关系的查看与编辑
- [ ] 新增/编辑域名配置功能可用
- [ ] 配置变更自动记录审计日志
- [ ] 支持导出配置为 JSON/YAML 格式
- [ ] ATP 测试项全部通过

---

## 8. 开放问题

- [ ] 证书自动续期是否集成到 Domain 菜单？还是独立的运维任务？
- [ ] 知识产权（商标/域名）的到期提醒是否需要系统通知？
- [ ] IP 规划表是否需要与 Infrastructure > Topology 联动？
