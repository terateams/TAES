# [Playbook] EdgeTeam Domain Strategy (v1.8)

> **Status**: Active | **Version**: 1.8 | **Date**: 2026-01-01
> **Scope**: EdgeTeam (ET) 独立域名（如 `ilya.team`）的托管、存储与分发策略。
> **ERP Module**: TeamsEdge > Asset Management > Domain

---

## 0. 域名资产治理 (Domain Asset Governance)

> 🔐 **核心原则**: 域名账号是 EdgeTeam 的**核心数字资产**，其所有权、支付权、管理权需在合同框架下清晰界定。

### 0.0 术语规范 (Terminology)

| 中文 | 英文 | 符号 | 编号规则 | 示例 |
| :--- | :--- | :--- | :--- | :--- |
| **T营** | TeamsCamp | AITC | 编号 (1, 6, 20, 21...) | AITC1 = T1 (万联), AITC6 = T6 (ATKK) |
| **E队** | EdgeTeam | ET | 番号 (项目代码) | ET-S114 (SUIBE 项目) |
| **元枢证** | Nexus Pass | NP | NP-{T营编号}-{序号} | NP-T6-001 (ATKK Don) |
| **角色** | Role | - | 默认 Don | Don / Operator / Viewer |

### 0.0.1 元枢证 (Nexus Pass)

> ⊕ 详见独立文档: **[Nexus Pass playbook](Nexus%20Pass%20playbook.md)**
>
> **品牌叙事**: *"One account, Nexus all"* — 一个枢纽账号，全连接
>
> **核心约定**: NP 是 TeamsEdge 生态的**枢纽身份凭证**，支持双层架构：
> - **T营 NP**: `NP-T{n}-{seq}` — T营 直属，核心业务
> - **E队 NP**: `NP-ET-{番号}-{seq}` — E队 独立持有，T营 托管

| 原则 | 说明 |
| :--- | :--- |
| **NP-1** 单一账号 | 一个 NP 账号连接所有服务 |
| **NP-2** T营归属 | 每个 NP 必须归属某个 AITC，继承支付配置 |
| **NP-3** 角色锚定 | 每个 NP 对应角色 (默认 Don) |
| **NP-4** 设备绑定 | 至少绑定一台手机 (2FA) |
| **NP-5** 递归备援 | 备用访问递归至 T1 (万联) |
| **NP-6** 双层架构 | T营 可为 E队 创建独立 NP |

### 0.1 TeamsCamp 主体定义 (AITC Entities)

TeamsEdge 生态中，以下 **4 个核心 TeamsCamp (AITC)** 负责托举 EdgeTeam：

| AITC 编号 | 简称 | 实体名称 | 业务定位 | 注册地 | 主要支付方式 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `AITC1` | T1 | 万联公司 | 线下实体，硬件/服务 | 🇨🇳 中国 | 对公账户 |
| `AITC6` | T6 | ATKK 株式会社 | 东京公司，在线销售实体 | 🇯🇵 日本 | 日本信用卡 / PayPay |
| `AITC20` | T20 | 元协力营 | 在线实体，数字服务 | 🇨🇳 中国 | 企业支付宝 / 微信支付 |
| `AITC21` | T21 | LSN189 | 电信定制云产品主体 | 🇨🇳 中国 | 对公账户 / 企业支付宝 |

> **服务商对应关系**:
> - `AITC6 (T6/ATKK)` → 优先使用 **Cloudflare** (国际域名)
> - `AITC1/20/21 (T1/T20/T21)` → 优先使用 **阿里云** 或 **腾讯云** (国内域名)

### 0.2 资产主数据 (Asset Master Data)

每个域名在 TeamsEdge 系统中作为**资产实体**管理，包含以下字段：

| 字段 | 类型 | 说明 | 示例 |
| :--- | :--- | :--- | :--- |
| `domain_id` | UUID | 系统唯一标识 | `d-2026-ilya-001` |
| `domain_name` | String | 域名全称 | `ilya.team` |
| `registrar` | Enum | 注册商 | `Cloudflare` / `Aliyun` / `Tencent` |
| `owner_aitc` | Enum | 所属 TeamsCamp | `AITC1` / `AITC6` / `AITC20` / `AITC21` |
| `owner_et` | FK → EdgeTeam | 关联 EdgeTeam | `ET-S114` (SUIBE 项目) |
| `status` | Enum | 资产状态 | `Active` / `Pending` / `Transferring` / `Archived` |
| `payment_method` | FK → Payment | 支付方式 | `PM-T6-JCB-001` |
| `visibility_level` | Enum | EdgeTeam 可见级别 | `None` / `ReadOnly` / `CoManage` / `FullOwner` |
| `contract_milestone` | FK → Contract | 合同里程碑 | `Contract-2026-001.M3` |
| `independence_status` | Enum | 独立状态 | `Hosted` / `Independent` |

### 0.3 托举依赖关系 (Hosting Dependencies)

> ⚠️ **默认规则**: EdgeTeam (ET) 默认无法脱离 TeamsCamp (AITC) 托举，除非满足独立条件。

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                      TeamsCamp (AITC) 托举服务矩阵                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  AITC 提供的托举服务:                                                         │
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐             │
│  │ 1. M365 订阅    │  │ 2. Workplane    │  │ 3. Domain 资产  │             │
│  │    (身份/协作)  │  │    (网络/VPN)   │  │    (域名/存储)  │             │
│  └────────┬────────┘  └────────┬────────┘  └────────┬────────┘             │
│           │                    │                    │                      │
│           ▼                    ▼                    ▼                      │
│  ┌─────────────────────────────────────────────────────────────┐           │
│  │                  EdgeTeam / ET (被托举状态)                  │           │
│  │                                                             │           │
│  │  independence_status = "Hosted"                             │           │
│  │  - 使用 AITC 的 M365 账号 (@teamscamp.onmicrosoft.com)      │           │
│  │  - 使用 AITC 的 Workplane 网络                               │           │
│  │  - 域名由 AITC 注册并管理                                    │           │
│  └─────────────────────────────────────────────────────────────┘           │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 0.4 EdgeTeam 独立条件 (Independence Criteria)

| 条件编号 | 条件描述 | 验证方式 | 系统字段 |
| :--- | :--- | :--- | :--- |
| **IC-1** | 采用**独立的 M365 订阅** | ET 提供独立租户的 Admin 证明 | `m365_independent = true` |
| **IC-1.alt** | **不使用 M365 订阅** | ET 声明不需要 M365 服务 | `m365_required = false` |
| **IC-2** | **不使用 Workplane 网络托举服务** | ET 确认不接入 Workplane VPN | `workplane_required = false` |

**独立状态判定逻辑**:
```
IF (m365_independent = true OR m365_required = false)
   AND (workplane_required = false)
THEN
   independence_status = "Independent"
   → EdgeTeam 可进入 Phase 4 (完全独立)
ELSE
   independence_status = "Hosted"
   → EdgeTeam 最高只能达到 Phase 3 (共管)
```

### 0.5 所有权生命周期 (Ownership Lifecycle)

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        域名所有权生命周期                                      │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  [Phase 1: AITC孵化]    [Phase 2: ET成长]       [Phase 3: 共管]              │
│                                                                             │
│  ┌─────────────┐       ┌─────────────┐        ┌─────────────┐              │
│  │  AITC 100%  │  ──►  │  AITC 主管  │   ──►  │  共管 50:50 │              │
│  │  ET 不可见  │       │  ET 只读    │        │  双方审批   │              │
│  └─────────────┘       └─────────────┘        └─────────────┘              │
│                                                                             │
│  visibility:None       visibility:ReadOnly    visibility:CoManage          │
│  payment:AITC          payment:AITC           payment:共管                  │
│                                                                             │
│                                                        │                   │
│                                            ┌───────────┴───────────┐       │
│                                            ▼                       ▼       │
│                                   [Phase 4: 独立]          [Phase 3: 长期] │
│                                   (满足独立条件)            (保持托举)      │
│                                                                             │
│                                   ┌─────────────┐        ┌─────────────┐   │
│                                   │  ET 100%    │        │  共管维持   │   │
│                                   │  完全独立   │        │  AITC代管   │   │
│                                   └─────────────┘        └─────────────┘   │
│                                                                             │
│                                   independence:          independence:     │
│                                   Independent            Hosted            │
│                                   visibility:FullOwner   visibility:CoManage│
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 0.6 CRUD 操作权限矩阵 (Permission Matrix)

| 操作 | Phase 1 (孵化) | Phase 2 (成长) | Phase 3 (共管) | Phase 4 (独立) |
| :--- | :--- | :--- | :--- | :--- |
| **Create** (注册新域名) | AITC ✅ | AITC ✅ | 双方审批 ✅ | ET ✅ |
| **Read** (查看账号信息) | AITC ✅ / ET ❌ | AITC ✅ / ET 👁️ | 双方 ✅ | ET ✅ |
| **Update** (修改DNS/配置) | AITC ✅ | AITC ✅ / ET 申请 | 双方 ✅ | ET ✅ |
| **Delete** (注销/转移域名) | AITC ✅ (需审批) | AITC ✅ (需审批) | 双方审批 ✅ | ET ✅ |
| **Payment** (续费/付款) | AITC ✅ | AITC ✅ | 按合同约定 | ET ✅ |

> 👁️ = 只读权限 (ReadOnly)
> 
> ⚠️ **Phase 4 准入条件**: 必须满足 0.4 节的独立条件 (IC-1 或 IC-1.alt) + IC-2

### 0.7 合同里程碑触发器 (Contract Milestone Triggers)

| 里程碑 | 触发条件 | 系统动作 |
| :--- | :--- | :--- |
| **M1: 域名注册** | AITC 完成域名注册 | 创建资产记录，`visibility=None`, `independence=Hosted` |
| **M2: ET入驻** | EdgeTeam 签署合作协议 | `visibility=ReadOnly`，ET 可查看基本信息 |
| **M3: 首次营收** | EdgeTeam 产生首笔营收 | ET 可查看账号详情（不含密码） |
| **M4: 共管解锁** | 累计营收达到约定金额 / 合作满 1 年 | `visibility=CoManage`，开启双方审批流程 |
| **M5: 独立申请** | ET 申请独立 + 满足独立条件 | 验证 IC-1/IC-2，通过则 `visibility=FullOwner`, `independence=Independent` |

### 0.8 支付管理 (Payment Management)

| 阶段 | 支付主体 | AITC 对应实体 | 支付方式 | 发票归属 |
| :--- | :--- | :--- | :--- | :--- |
| **Phase 1-2** | AITC | T1 万联 / T6 ATKK / T20 元协力 / T21 LSN189 | AITC 绑定支付 | AITC 公司 |
| **Phase 3** | 按合同约定 | - | AITC 或 ET 支付 | 按支付方 |
| **Phase 4** | ET | - | EdgeTeam 独立支付 | ET 公司/个人 |

### 0.9 TeamsEdge 系统操作入口

```
TeamsEdge
├── TeamsCamp Management (AITC 管理)
│   ├── [T1] AITC1 - 万联公司 (线下实体)
│   ├── [T6] AITC6 - ATKK (东京在线销售)
│   ├── [T20] AITC20 - 元协力营 (在线实体)
│   └── [T21] AITC21 - LSN189 (电信定制云)
│
├── Asset Management (资产管理)
│   ├── Domain (域名)
│   │   ├── [List] 域名列表 (按 AITC/ET 筛选)
│   │   ├── [Create] 注册新域名 (触发 M1)
│   │   │   └── 选择 AITC 主体 → 自动关联支付方式
│   │   ├── [Detail] 域名详情
│   │   │   ├── 基本信息 (注册商、到期时间、状态)
│   │   │   ├── 所属 AITC (T1/T6/T20/T21)
│   │   │   ├── 关联 ET (如 ET-S114)
│   │   │   ├── 权限配置 (当前 Phase、可见级别)
│   │   │   ├── 独立状态 (Hosted/Independent)
│   │   │   ├── 托举依赖 (M365/Workplane 状态)
│   │   │   ├── 支付记录 (续费历史、发票)
│   │   │   └── 操作日志 (审计追踪)
│   │   ├── [Update] 变更配置 (需审批流)
│   │   ├── [Independence] 独立申请 (验证 IC-1 + IC-2)
│   │   └── [Transfer] 移交申请 (触发 M5)
│   │
│   └── Storage (存储)
│       └── ... (R2/OSS/COS 资产)
│
├── EdgeTeam Management (ET 管理)
│   ├── [List] EdgeTeam 列表 (按番号筛选，如 ET-S114)
│   ├── [Detail] EdgeTeam 详情
│   │   ├── ET 番号 (如 S114 = SUIBE 项目)
│   │   ├── 托举 AITC (所属 TeamsCamp)
│   │   ├── M365 状态 (托举/独立/无需)
│   │   ├── Workplane 状态 (托举/独立/无需)
│   │   └── 独立条件检查 (IC-1, IC-2)
│   └── [Independence Check] 独立条件验证
│
└── Contract Management (合同管理)
    └── Milestone Tracking (里程碑追踪)
```

---

## 1. 核心策略 (Core Strategy)

### 1.1 基础架构
- **域名**: 基于 Brand 的独立域名（如 `ilya.team`）。
- **服务商**: 严格控制在 **Cloudflare** (国际标配)、**阿里云** (国内合规)、**腾讯云** (国内合规) 三家之内。
- **Name.com** 仅作为注册商，DNS 解析转交 Cloudflare。

### 1.2 统一 CDN 策略 (Unified CDN)
采用 **领域驱动设计 (DDD)** 命名法，将 URL 路径直接映射为业务术语，实现"所见即所得"的认知一致性。

| 资源视角 (User View) | 统一域名 | 路径映射 | 场景说明 | 示例 URL |
| :--- | :--- | :--- | :--- | :--- |
| **Image** (影像) | `cdn.ilya.team` | `/image/` | 文档插图、Logo、设计素材 | `cdn.ilya.team/image/2025/logo.png` |
| **Mission** (任务) | `cdn.ilya.team` | `/mission/` | 任务看板、静态演示站 | `cdn.ilya.team/mission/01/index.html` |
| **Download** (交付) | `cdn.ilya.team` | `/download/` | 软件安装包、大文件交付 | `cdn.ilya.team/download/app-v1.zip` |

### 1.3 方案决策树 (Decision Tree)

```
┌─ 域名是否需要 ICP 备案？
│
├─ 否 (国际域名: .team, .ai, .dev, .io)
│   └─ ✅ 方案 A: Cloudflare
│
└─ 是 (中国域名: .cn, .com.cn, 或需国内访问的 .com)
    │
    ├─ 已有腾讯云资源/微信生态？
    │   ├─ 是 → ✅ 方案 C: 腾讯云
    │   └─ 否 → ✅ 方案 B: 阿里云 (默认)
    │
    └─ 特殊需求？
        ├─ 需要零出口费 → 仅 Cloudflare 支持
        └─ 需要国内极速 → 阿里云/腾讯云
```

### 1.4 成本估算 (Cost Comparison)

> 以下为典型 EdgeTeam (ET) 月度使用量估算：存储 10GB，流量 50GB，请求 100万次。

| 服务商 | 存储费 | 流量费 | 请求费 | 月度总计 | 备注 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Cloudflare** | $0.015/GB | **$0** | $0.36/百万 | **~$0.50** | R2 零出口费 |
| **阿里云** | ¥0.12/GB | ¥0.24/GB | ¥0.01/万次 | **~¥13** | 国内标准 |
| **腾讯云** | ¥0.099/GB | ¥0.21/GB | ¥0.01/万次 | **~¥12** | 国内标准 |

> ⚠️ 以上为 2026 年 1 月参考价格，实际以官方定价为准。Cloudflare 在流量成本上具有绝对优势。

---

## 2. 存储与分发架构 (Storage & CDN)

采用 **"一域一源"** 原则：域名、DNS、存储均由同一服务商提供，确保合规边界清晰。

### 2.1 主方案 (Primary Plans)

以下三个方案为标准执行流程，**必须从中选择一个**：

#### 方案 A: Cloudflare (国际首选)
| 环节 | 服务 | 说明 |
| :--- | :--- | :--- |
| **域名注册** | Name.com / Cloudflare Registrar | 推荐 `.team`, `.ai`, `.dev` 等国际后缀 |
| **DNS 解析** | Cloudflare DNS | 免费，自带 DDoS 防护 |
| **对象存储** | Cloudflare R2 | 零出口费 (Zero Egress)，S3 兼容 |
| **CDN 加速** | Cloudflare CDN | 全球 300+ 节点，免费 HTTPS |
| **适用场景** | 无 ICP 要求、面向全球用户 | |

#### 方案 B: 阿里云 (中国首选)
| 环节 | 服务 | 说明 |
| :--- | :--- | :--- |
| **域名注册** | 阿里云万网 | `.cn`, `.com.cn` 或已备案的 `.com` |
| **DNS 解析** | 阿里云 DNS | 需完成 ICP 备案 |
| **对象存储** | 阿里云 OSS | 国内访问稳定，按量计费 |
| **CDN 加速** | 阿里云 CDN | 国内节点覆盖广，需备案 |
| **适用场景** | 面向中国大陆用户、需 ICP 备案 | |

#### 方案 C: 腾讯云 (中国备选)
| 环节 | 服务 | 说明 |
| :--- | :--- | :--- |
| **域名注册** | 腾讯云 DNSPod | `.cn`, `.com.cn` 或已备案的 `.com` |
| **DNS 解析** | DNSPod | 需完成 ICP 备案 |
| **对象存储** | 腾讯云 COS | 国内访问稳定，按量计费 |
| **CDN 加速** | 腾讯云 CDN | 国内节点覆盖广，需备案 |
| **适用场景** | 面向中国大陆用户、已有腾讯云资源 | |

### 2.2 例外处理 (Exceptions)

> ⚠️ **警告**: 以下情况属于例外，应**尽量避免**。如确需使用，必须经技术负责人审批。

| 例外情况 | 风险 | 处理方式 |
| :--- | :--- | :--- |
| **跨供应商组合** (如 Name.com 域名 + 阿里云存储) | 路由复杂、故障排查困难 | 迁移至主方案 |
| **小众云服务商** (如 DigitalOcean, Vultr) | 缺乏长期支持、运维成本高 | 评估后迁移至主方案 |
| **自建存储** (如 MinIO) | 运维负担重、合规风险 | 仅限特殊安全场景 |

### 2.3 原则说明

1. **一域一源**: 一个域名对应一个服务商的完整技术栈，避免跨供应商的复杂路由。
2. **合规优先**: 域名的合规性决定了服务商选择，存储与 CDN 随之绑定。
3. **流程执行**: 主方案按标准流程执行，例外需审批。

---

## 3. 关键配置规范 (Critical Configurations)

### 3.1 缓存策略 (Cache Rules)
必须在 CDN 层配置基于路径的精细化缓存规则，以解决单域名下的缓存冲突。

- **Rule A (Image/Download)**: 
    - **匹配路径**: `/image/*`, `/download/*`
    - **策略**: `Browser Cache TTL: 1 year`, `Edge Cache TTL: 1 year` (Immutable)
    - **目的**: 极致加速，节省流量。

- **Rule B (Mission)**: 
    - **匹配路径**: `/mission/*`
    - **策略**: `Browser Cache TTL: 0`, `Cache Level: Standard` (Respect Origin Headers)
    - **目的**: 确保看板内容的实时性，避免看到旧版本。

### 3.2 部署流程 (Deployment)
Mission Repo 的 CI/CD 脚本需调整，将构建产物分别上传至 Object Storage 的对应目录：
- `/image/`: 图片资源
- `/mission/`: 静态网站产物
- `/download/`: 交付文件

---

## 4. 设计哲学 (Design Philosophy)

> "将路径从通用的 `/files`、`/board` 修改为业务强相关的 `/download`、`/mission`，这看似是微小的改动，实则是**领域驱动设计 (DDD)** 在基础设施层的体现。它消除了'技术实现'与'业务概念'之间的翻译成本。现在，URL 本身就是文档。" —— *Top Architect*

### 核心价值
1.  **极简运维**: 单一域名 (`cdn`)、单一证书、单一 CORS 配置。
2.  **合规闭环**: 保持 Cloudflare/Aliyun 双供应商策略，底座稳固。
3.  **认知一致**: URL 结构直接反映业务领域模型。

---

## 5. 实施手册 (Implementation Playbooks)

根据所选方案，参阅对应的实施手册：

| 方案 | 实施手册 | 适用场景 |
| :--- | :--- | :--- |
| **方案 A** | [cdn@Cloudflare playbook](cdn@Cloudflare%20playbook.md) | 国际域名，免费起步 |
| **方案 B** | [cdn@Aliyun playbook](cdn@Aliyun%20playbook.md) | 中国域名，阿里云生态 |
| **方案 C** | [cdn@Tencent playbook](cdn@Tencent%20playbook.md) | 中国域名，腾讯云生态 |
