# TE3-GEN: TeamsEdge 3.0 Generative UI 架构方案

> **"2026 年了，为什么还用 2020 年的组件化思维？"**

本方案基于 **2026年1月** 技术生态视角，探索 **Generative UI** 范式下的 TeamsEdge 架构转型。以 **"Network Reliable, AI Native"** 为核心指导原则，实现从"AI 辅助开发"到"AI 原生界面"的范式跃迁。

---

**文档版本：** v2.0 (路径 C 探索)  
**日期：** 2026年1月14日  
**目标：** 构建 LLM-Native 的 BOSS 系统，VSC + Web 双端统一  
**核心原则：** 开源 (MIT/Apache)、Agent 原生、对话式 CRUD、Tool-First

---

## 范式跃迁：为什么需要 TE3-GEN？

TE2（即 v1.0 方案，见[附录 A](#附录-a-v10-原始方案)）的核心假设是：**让 AI 帮人类写代码**。

经过顶级 AI 工程师评审（见[附录 B](#附录-b-顶级-ai-工程师评审记录)），我们识别出一个根本性问题：

> *"v1.0 是为 Copilot（人在回路）设计的，但没有为 Agent 自主执行预留架构位。"*

**TE3-GEN (路径 C)** 提出更激进但更符合长期趋势的方向：

| 维度 | TE2 (组件化) | TE3-GEN (LLM-Native) |
|------|---------------|-------------------|
| **UI 本质** | 固定界面 + 数据填充 | 用户意图 + AI 实时渲染 |
| **开发模式** | AI 辅助写组件代码 | AI 直接生成界面响应 |
| **CRUD 实现** | TanStack Table 组件 | Agent Tool Call → 动态 UI |
| **交互范式** | 点击按钮、填写表单 | 自然语言对话 + 结构化确认 |
| **VSC 集成** | 复刻 Web 组件到 Webview | 统一 Chat Panel 入口 |

---

## 1. 核心选型总览 (The Stack 2026 - Generative)

在 2026 年的背景下，前端开发正在从"组件组装"转向"意图驱动生成"。为了让 Agent 能直接生成界面而非代码，我们需要选择 **Generative UI** 原生支持的技术栈。

### 1.1 技术栈全景图

| 层级 | 模块 | 推荐选型 | 版本 | License | 选型理由 & AI 协同性分析 | 核查源 |
|------|------|----------|------|---------|--------------------------|--------|
| **AI 层** | AI SDK | **Vercel AI SDK** | 4.x | Apache 2.0 | 业界领先的 Generative UI 框架。支持 `streamUI()` 流式渲染、Tool Calling、多模型热切换。2026 年已成为 AI 应用开发事实标准。 | [ai npm](https://www.npmjs.com/package/ai) |
| **AI 层** | LLM Provider | **OpenAI / Anthropic** | gpt-4o / claude-3.5 | Commercial | 通过 AI SDK 统一接入，支持运行时切换。OpenAI 用于常规任务，Claude 用于长上下文分析。 | [OpenAI](https://platform.openai.com) |
| **AI 层** | Agent 框架 | **LangGraph.js** | 0.2.x | MIT | 复杂工作流编排，支持条件分支、循环、人工确认节点。比 LangChain 更轻量，TypeScript 原生。 | [LangGraph](https://langchain-ai.github.io/langgraphjs/) |
| **运行时** | 框架 | **Next.js** | 15.x | MIT | App Router + Server Components + Server Actions。AI 响应直接在服务端生成，减少客户端复杂度。 | [Next.js](https://nextjs.org) |
| **运行时** | 运行环境 | **Node.js** | 22 LTS | MIT | 2026 年 LTS 版本，原生支持 ESM、fetch API、Web Streams。 | [Node.js](https://nodejs.org) |
| **类型层** | 语言 | **TypeScript** | 5.x | Apache 2.0 | Tool Schema 即类型定义，AI 输出经过编译时验证。 | [TypeScript](https://github.com/microsoft/TypeScript) |
| **类型层** | 校验 | **Zod** | 3.x | MIT | Tool 参数 Schema 定义，运行时验证 AI 输出结构。与 AI SDK 深度集成。 | [Zod](https://zod.dev) |
| **UI 层** | 组件库 | **shadcn/ui** | latest | MIT | Agent 生成的 UI 仍需原子组件。非 npm 包，代码直接复制到项目，完全可控。 | [shadcn/ui](https://ui.shadcn.com) |
| **UI 层** | 样式 | **Tailwind CSS** | 4.x | MIT | 2026 年已是事实标准。v4 支持 CSS 变量原生集成，性能大幅提升。 | [Tailwind](https://tailwindcss.com) |
| **UI 层** | 图标 | **Lucide React** | latest | ISC | 轻量、tree-shakable、与 shadcn/ui 配套。 | [Lucide](https://lucide.dev) |
| **数据层** | ORM | **Prisma** | 6.x | Apache 2.0 | TypeScript 原生 ORM，Schema 即文档。AI 可直接从 `schema.prisma` 推断业务模型。 | [Prisma](https://prisma.io) |
| **数据层** | 数据库 | **PostgreSQL** | 16+ | PostgreSQL | 企业级稳定性。支持 pgvector 扩展实现向量检索。 | [PostgreSQL](https://postgresql.org) |
| **数据层** | 向量存储 | **pgvector** | 0.7+ | PostgreSQL | 业务上下文嵌入，支持语义查询。与现有 PG 实例共用，无需额外运维。 | [pgvector](https://github.com/pgvector/pgvector) |
| **数据层** | 缓存 | **Redis** | 7.x | BSD-3 | Tool 结果缓存、Session 管理、Rate Limiting。 | [Redis](https://redis.io) |
| **构建层** | 构建工具 | **Turbopack** | (Next.js 内置) | MIT | Next.js 15 默认构建器，Rust 编写，增量编译速度极快。 | [Turbopack](https://turbo.build/pack) |
| **构建层** | 包管理 | **pnpm** | 9.x | MIT | Monorepo 原生支持，磁盘空间高效，依赖隔离严格。 | [pnpm](https://pnpm.io) |
| **VSC 层** | 插件 SDK | **@vscode/webview-ui-toolkit** | 1.x | MIT | VSC 官方 Webview 组件库，确保 IDE 内样式一致性。 | [VSC Toolkit](https://github.com/microsoft/vscode-webview-ui-toolkit) |

### 1.2 依赖关系图

```
┌─────────────────────────────────────────────────────────────────────────┐
│                        TE3-GEN 依赖关系                                  │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌─────────────┐     ┌─────────────┐     ┌─────────────┐               │
│  │   OpenAI    │     │  Anthropic  │     │  Local LLM  │  ← LLM 可切换  │
│  └──────┬──────┘     └──────┬──────┘     └──────┬──────┘               │
│         │                   │                   │                       │
│         └───────────────────┼───────────────────┘                       │
│                             ▼                                           │
│                    ┌────────────────┐                                   │
│                    │  Vercel AI SDK │  ← 统一 AI 接口层                  │
│                    │  (ai@4.x)      │                                   │
│                    └────────┬───────┘                                   │
│                             │                                           │
│              ┌──────────────┼──────────────┐                            │
│              ▼              ▼              ▼                            │
│     ┌──────────────┐ ┌────────────┐ ┌────────────┐                     │
│     │  streamUI()  │ │  tools()   │ │ generateText│                    │
│     │  流式渲染     │ │  工具调用   │ │  文本生成   │                     │
│     └──────┬───────┘ └─────┬──────┘ └─────┬──────┘                     │
│            │               │              │                             │
│            └───────────────┼──────────────┘                             │
│                            ▼                                            │
│                    ┌────────────────┐                                   │
│                    │   Next.js 15   │  ← 运行时框架                      │
│                    │   App Router   │                                   │
│                    └────────┬───────┘                                   │
│                             │                                           │
│         ┌───────────────────┼───────────────────┐                       │
│         ▼                   ▼                   ▼                       │
│  ┌────────────┐     ┌────────────┐      ┌────────────┐                 │
│  │  React 19  │     │ TypeScript │      │   Zod 3    │                 │
│  │  RSC/Actions│    │    5.x     │      │  Schema    │                 │
│  └──────┬─────┘     └─────┬──────┘      └─────┬──────┘                 │
│         │                 │                   │                         │
│         └─────────────────┼───────────────────┘                         │
│                           ▼                                             │
│                  ┌─────────────────┐                                    │
│                  │   shadcn/ui     │  ← UI 原语层                        │
│                  │   + Tailwind    │                                    │
│                  └─────────────────┘                                    │
│                           │                                             │
│         ┌─────────────────┼─────────────────┐                           │
│         ▼                 ▼                 ▼                           │
│  ┌────────────┐    ┌────────────┐    ┌────────────┐                    │
│  │  Web App   │    │ VSC Plugin │    │  Mobile    │  ← 多端输出         │
│  │  (Browser) │    │ (Webview)  │    │  (Future)  │                    │
│  └────────────┘    └────────────┘    └────────────┘                    │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

### 1.3 package.json 核心依赖

```json
{
  "name": "teamsedge-gen",
  "version": "3.0.0",
  "private": true,
  "engines": {
    "node": ">=22.0.0",
    "pnpm": ">=9.0.0"
  },
  "dependencies": {
    // AI 层
    "ai": "^4.0.0",
    "@ai-sdk/openai": "^1.0.0",
    "@ai-sdk/anthropic": "^1.0.0",
    "@langchain/langgraph": "^0.2.0",
    
    // 运行时
    "next": "^15.0.0",
    "react": "^19.0.0",
    "react-dom": "^19.0.0",
    
    // 类型与校验
    "zod": "^3.23.0",
    
    // UI
    "tailwindcss": "^4.0.0",
    "lucide-react": "^0.400.0",
    "class-variance-authority": "^0.7.0",
    "clsx": "^2.1.0",
    "tailwind-merge": "^2.3.0",
    
    // 数据层
    "@prisma/client": "^6.0.0",
    "ioredis": "^5.4.0",
    
    // 工具
    "date-fns": "^3.6.0",
    "nanoid": "^5.0.0"
  },
  "devDependencies": {
    "typescript": "^5.5.0",
    "prisma": "^6.0.0",
    "@types/node": "^22.0.0",
    "@types/react": "^19.0.0",
    "eslint": "^9.0.0",
    "prettier": "^3.3.0"
  }
}
```

---

## 2. 架构深度解析：Generative UI 工作原理

### 2.1 什么是 LLM-Native UI？

**传统 BOSS 系统：**
```
用户 → 点击菜单 → 渲染固定页面 → 填写表单 → 提交
```

**LLM-Native 系统：**
```
用户 → 描述意图 → Agent 理解 → 动态生成界面 → 确认执行
```

**TE3-GEN 的界面不是"写好的"，而是"生成的"。**

### 2.2 Generative UI 请求流程

```
┌─────────────────────────────────────────────────────────────────┐
│                    TE3-GEN 请求流程                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  用户输入: "显示本月销售额超过10万的客户，按回款率排序"              │
│                           ↓                                     │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │ Intent Parser (意图解析层)                               │   │
│  │ - 识别实体: Customer, Sales, Payment                     │   │
│  │ - 识别操作: Query + Filter + Sort                        │   │
│  │ - 识别约束: date >= 2026-01-01, amount > 100000          │   │
│  └─────────────────────────────────────────────────────────┘   │
│                           ↓                                     │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │ Tool Executor (工具执行层)                               │   │
│  │ - 调用 DB Query Tool → 获取结构化数据                     │   │
│  │ - 调用 Permission Tool → 检查用户权限                     │   │
│  │ - 调用 Audit Tool → 记录操作日志                          │   │
│  └─────────────────────────────────────────────────────────┘   │
│                           ↓                                     │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │ UI Generator (界面生成层)                                │   │
│  │ - 选择最优展示组件: <DataTable /> or <Chart />            │   │
│  │ - 流式渲染 React Server Component                        │   │
│  │ - 附加操作建议: "是否导出 Excel？" "是否创建定期报表？"     │   │
│  └─────────────────────────────────────────────────────────┘   │
│                           ↓                                     │
│  用户看到: 动态生成的数据表格 + 智能操作建议                      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### 2.3 核心 API：streamUI()

Vercel AI SDK 的 `streamUI()` 是 Generative UI 的核心：

```typescript
// app/api/chat/route.ts
import { streamUI } from 'ai/rsc';
import { openai } from '@ai-sdk/openai';
import { z } from 'zod';

export async function POST(req: Request) {
  const { messages } = await req.json();

  const result = await streamUI({
    model: openai('gpt-4o'),
    system: `你是 TeamsEdge BOSS 系统助手。根据用户意图选择合适的工具执行操作。
             所有数据变更操作必须返回确认界面，等待用户确认后执行。`,
    messages,
    tools: {
      queryCustomers,      // 查询客户
      createCustomer,      // 创建客户
      updateCustomer,      // 更新客户
      exportToExcel,       // 导出 Excel
      generateReport,      // 生成报表
    },
    // 流式输出文本
    text: ({ content, done }) => {
      return <AssistantMessage content={content} isStreaming={!done} />;
    },
    // 工具调用结果 → 动态 UI
    toolCall: async ({ toolName, args, result }) => {
      return renderToolResult(toolName, args, result);
    },
  });

  return result.toDataStreamResponse();
}
```

---

## 3. BOSS 系统的 LLM-Native 重构

### 3.1 从 CRUD 到 Conversational CRUD

传统 BOSS 的核心是 **Create / Read / Update / Delete** 四个固定操作。

LLM-Native 的核心是 **Intent → Action → Confirmation** 循环：

```typescript
// 传统方式：用户必须知道"新建客户"按钮在哪
<Button onClick={() => navigate('/customer/create')}>新建客户</Button>

// LLM-Native 方式：用户直接说
// "帮我录入一个新客户，张三，手机 138xxxx，深圳南山区"
// Agent 自动：
// 1. 解析意图 → CreateCustomer
// 2. 提取实体 → { name: "张三", phone: "138xxxx", address: "深圳南山区" }
// 3. 生成确认界面 → <CustomerConfirmCard data={...} onConfirm={...} />
// 4. 用户确认后执行 → INSERT INTO customers ...
```

### 3.2 Tool 定义规范

每个 CRUD 操作对应一个 Tool。Tool 是 Agent 与系统交互的原子单位。

#### 3.2.1 Tool 结构模板

```typescript
// lib/tools/template.ts
import { z } from 'zod';
import { tool } from 'ai';

export const toolTemplate = tool({
  // 1. 描述：LLM 据此判断何时调用
  description: '清晰描述 Tool 的用途和适用场景',
  
  // 2. 参数 Schema：Zod 定义，自动生成 JSON Schema 给 LLM
  parameters: z.object({
    // 每个参数都要有 .describe() 说明
    param1: z.string().describe('参数1的含义和格式'),
    param2: z.number().optional().describe('可选参数2'),
  }),
  
  // 3. 执行函数：实际业务逻辑
  execute: async (params) => {
    // 权限检查
    // 数据校验
    // 数据库操作
    // 返回结构化结果
    return { success: true, data: {}, message: '' };
  },
});
```

#### 3.2.2 完整 Tool 示例：客户管理

```typescript
// lib/tools/customer.ts
import { z } from 'zod';
import { tool } from 'ai';
import { db } from '@/lib/db';
import { requirePermission } from '@/lib/auth';

// 查询客户 Tool
export const queryCustomers = tool({
  description: `查询客户列表。支持以下筛选条件：
    - 客户名称（模糊匹配）
    - 销售额范围（最小/最大）
    - 所属区域
    - 时间范围
    支持按任意字段排序和分页。`,
  parameters: z.object({
    filters: z.object({
      name: z.string().optional().describe('客户名称，支持模糊匹配'),
      salesMin: z.number().optional().describe('最小销售额（元）'),
      salesMax: z.number().optional().describe('最大销售额（元）'),
      region: z.string().optional().describe('所属区域，如：华南、华东'),
      dateFrom: z.string().optional().describe('开始日期 YYYY-MM-DD'),
      dateTo: z.string().optional().describe('结束日期 YYYY-MM-DD'),
      tags: z.array(z.string()).optional().describe('客户标签，如：VIP、潜力客户'),
    }).optional(),
    sort: z.object({
      field: z.enum(['name', 'sales', 'paymentRate', 'createdAt', 'lastContactAt']),
      order: z.enum(['asc', 'desc']),
    }).optional().describe('排序方式'),
    pagination: z.object({
      page: z.number().default(1).describe('页码，从 1 开始'),
      pageSize: z.number().default(20).describe('每页条数，默认 20'),
    }).optional(),
  }),
  execute: async ({ filters, sort, pagination }) => {
    await requirePermission('customer:read');
    
    const where = buildWhereClause(filters);
    const orderBy = sort ? { [sort.field]: sort.order } : { createdAt: 'desc' };
    const { page = 1, pageSize = 20 } = pagination || {};
    
    const [data, total] = await Promise.all([
      db.customer.findMany({
        where,
        orderBy,
        skip: (page - 1) * pageSize,
        take: pageSize,
        include: { contacts: true, orders: { take: 5 } },
      }),
      db.customer.count({ where }),
    ]);
    
    return {
      success: true,
      data,
      pagination: { page, pageSize, total, totalPages: Math.ceil(total / pageSize) },
      // 返回生成的 SQL 供调试
      _debug: { generatedQuery: where },
    };
  },
});

// 创建客户 Tool
export const createCustomer = tool({
  description: `创建新客户记录。必填字段：客户名称。
    创建前会检查是否存在同名客户，如有重复会返回警告。
    创建成功后返回客户 ID 和确认信息。`,
  parameters: z.object({
    name: z.string().min(2).max(100).describe('客户名称，2-100 字符'),
    phone: z.string().optional().describe('联系电话'),
    email: z.string().email().optional().describe('邮箱地址'),
    address: z.string().optional().describe('详细地址'),
    region: z.string().optional().describe('所属区域'),
    tags: z.array(z.string()).optional().describe('客户标签'),
    source: z.string().optional().describe('客户来源，如：官网、展会、转介绍'),
    assignedTo: z.string().optional().describe('负责销售的用户 ID'),
  }),
  execute: async (data) => {
    await requirePermission('customer:create');
    
    // 检查重复
    const existing = await db.customer.findFirst({ where: { name: data.name } });
    if (existing) {
      return {
        success: false,
        warning: true,
        message: `已存在同名客户「${data.name}」(ID: ${existing.id})，是否仍要创建？`,
        existingCustomer: existing,
      };
    }
    
    const customer = await db.customer.create({
      data: {
        ...data,
        createdAt: new Date(),
        updatedAt: new Date(),
      },
    });
    
    // 记录审计日志
    await db.auditLog.create({
      data: {
        action: 'customer:create',
        entityType: 'customer',
        entityId: customer.id,
        payload: data,
      },
    });
    
    return {
      success: true,
      customerId: customer.id,
      message: `客户「${data.name}」创建成功`,
      customer,
    };
  },
});

// 更新客户 Tool
export const updateCustomer = tool({
  description: `更新客户信息。必须提供客户 ID。
    只会更新提供的字段，未提供的字段保持不变。
    更新前会返回变更预览，需要用户确认后执行。`,
  parameters: z.object({
    id: z.string().describe('客户 ID'),
    updates: z.object({
      name: z.string().optional().describe('新的客户名称'),
      phone: z.string().optional().describe('新的联系电话'),
      email: z.string().email().optional().describe('新的邮箱'),
      address: z.string().optional().describe('新的地址'),
      region: z.string().optional().describe('新的区域'),
      tags: z.array(z.string()).optional().describe('新的标签列表（会覆盖原有标签）'),
      status: z.enum(['active', 'inactive', 'churned']).optional().describe('客户状态'),
    }).describe('要更新的字段'),
    confirmed: z.boolean().default(false).describe('是否已确认执行'),
  }),
  execute: async ({ id, updates, confirmed }) => {
    await requirePermission('customer:update');
    
    const customer = await db.customer.findUnique({ where: { id } });
    if (!customer) {
      return { success: false, error: `客户 ID ${id} 不存在` };
    }
    
    // 生成变更预览
    const changes = Object.entries(updates)
      .filter(([key, value]) => value !== undefined && customer[key] !== value)
      .map(([key, value]) => ({ field: key, from: customer[key], to: value }));
    
    if (!confirmed) {
      return {
        success: true,
        requireConfirmation: true,
        message: '请确认以下变更：',
        changes,
        customer,
      };
    }
    
    // 执行更新
    const updated = await db.customer.update({
      where: { id },
      data: { ...updates, updatedAt: new Date() },
    });
    
    await db.auditLog.create({
      data: {
        action: 'customer:update',
        entityType: 'customer',
        entityId: id,
        payload: { changes },
      },
    });
    
    return {
      success: true,
      message: `客户「${updated.name}」更新成功`,
      customer: updated,
    };
  },
});

// 删除客户 Tool
export const deleteCustomer = tool({
  description: `删除客户记录。这是危险操作，会同时删除关联的联系人和跟进记录。
    删除前必须用户确认。支持批量删除。`,
  parameters: z.object({
    ids: z.array(z.string()).min(1).describe('要删除的客户 ID 列表'),
    confirmed: z.boolean().default(false).describe('是否已确认执行'),
  }),
  execute: async ({ ids, confirmed }) => {
    await requirePermission('customer:delete');
    
    const customers = await db.customer.findMany({
      where: { id: { in: ids } },
      include: { _count: { select: { contacts: true, orders: true } } },
    });
    
    if (customers.length === 0) {
      return { success: false, error: '未找到指定客户' };
    }
    
    const impact = customers.map(c => ({
      id: c.id,
      name: c.name,
      contactsCount: c._count.contacts,
      ordersCount: c._count.orders,
    }));
    
    if (!confirmed) {
      return {
        success: true,
        requireConfirmation: true,
        message: `即将删除 ${customers.length} 个客户及其关联数据：`,
        impact,
        warning: '此操作不可撤销！',
      };
    }
    
    // 执行删除
    await db.customer.deleteMany({ where: { id: { in: ids } } });
    
    await db.auditLog.create({
      data: {
        action: 'customer:delete',
        entityType: 'customer',
        entityId: ids.join(','),
        payload: { deletedCustomers: impact },
      },
    });
    
    return {
      success: true,
      message: `已删除 ${customers.length} 个客户`,
      deletedIds: ids,
    };
  },
});
```

### 3.3 Generative UI 组件渲染

根据 Tool 返回结果，动态选择 UI 组件：

```tsx
// lib/ui/renderToolResult.tsx
import { DataTable } from '@/components/ui/data-table';
import { ConfirmCard } from '@/components/ui/confirm-card';
import { SuccessCard } from '@/components/ui/success-card';
import { ErrorCard } from '@/components/ui/error-card';
import { ChangePreview } from '@/components/ui/change-preview';

export function renderToolResult(
  toolName: string,
  args: unknown,
  result: unknown
) {
  // 错误处理
  if (!result.success && result.error) {
    return <ErrorCard message={result.error} />;
  }
  
  // 需要确认的操作
  if (result.requireConfirmation) {
    return (
      <ConfirmCard
        title={result.message}
        warning={result.warning}
        onConfirm={() => rerunTool(toolName, { ...args, confirmed: true })}
        onCancel={() => {}}
      >
        {result.changes && <ChangePreview changes={result.changes} />}
        {result.impact && <ImpactPreview impact={result.impact} />}
      </ConfirmCard>
    );
  }
  
  // 根据 Tool 类型渲染
  switch (toolName) {
    case 'queryCustomers':
      return (
        <DataTable
          columns={customerColumns}
          data={result.data}
          pagination={result.pagination}
          onRowClick={(row) => showCustomerDetail(row.id)}
          actions={[
            { label: '导出 Excel', action: 'exportToExcel' },
            { label: '生成报表', action: 'generateReport' },
          ]}
        />
      );
      
    case 'createCustomer':
    case 'updateCustomer':
      return (
        <SuccessCard
          title={result.message}
          actions={[
            { label: '查看详情', href: `/customer/${result.customerId}` },
            { label: '继续添加', action: 'createAnother' },
          ]}
        />
      );
      
    case 'deleteCustomer':
      return (
        <SuccessCard
          title={result.message}
          variant="warning"
        />
      );
      
    default:
      return <GenericResult data={result} />;
  }
}
```

---

## 4. 双端架构：VSC + Web 的统一

### 4.1 架构全景图

```
┌────────────────────────────────────────────────────────────────────────┐
│                         TE3-GEN Architecture                            │
├────────────────────────────────────────────────────────────────────────┤
│                                                                        │
│    ┌──────────────┐                          ┌──────────────┐          │
│    │  VSC Plugin  │                          │  Web Portal  │          │
│    │  (Webview)   │                          │  (Browser)   │          │
│    └──────┬───────┘                          └──────┬───────┘          │
│           │                                         │                  │
│           │        ┌─────────────────────┐          │                  │
│           └───────→│   Chat Interface    │←─────────┘                  │
│                    │  (Unified Entry)    │                             │
│                    └──────────┬──────────┘                             │
│                               │                                        │
│                    ┌──────────▼──────────┐                             │
│                    │   AI Gateway        │                             │
│                    │  (Next.js API)      │                             │
│                    └──────────┬──────────┘                             │
│                               │                                        │
│          ┌────────────────────┼────────────────────┐                   │
│          │                    │                    │                   │
│   ┌──────▼──────┐     ┌───────▼───────┐    ┌──────▼──────┐            │
│   │ Tool: Query │     │ Tool: Mutate  │    │ Tool: Export│            │
│   │ (Read Ops)  │     │ (Write Ops)   │    │ (File Gen)  │            │
│   └──────┬──────┘     └───────┬───────┘    └──────┬──────┘            │
│          │                    │                    │                   │
│          └────────────────────┼────────────────────┘                   │
│                               │                                        │
│                    ┌──────────▼──────────┐                             │
│                    │   PostgreSQL + RAG  │                             │
│                    │  (Data + Context)   │                             │
│                    └─────────────────────┘                             │
│                                                                        │
└────────────────────────────────────────────────────────────────────────┘
```

### 4.2 项目目录结构

```text
/teamsedge-gen
├── /apps
│   ├── /web                          # Next.js 15 Web 应用
│   │   ├── /app
│   │   │   ├── /(auth)               # 认证相关页面
│   │   │   ├── /(dashboard)          # 主界面布局
│   │   │   │   ├── /chat             # 对话界面（主入口）
│   │   │   │   ├── /customers        # 传统 CRUD 备用入口
│   │   │   │   └── /settings         # 系统设置
│   │   │   ├── /api
│   │   │   │   ├── /chat             # AI 对话 API
│   │   │   │   └── /tools            # Tool 执行 API
│   │   │   └── layout.tsx
│   │   ├── /components
│   │   │   ├── /ui                   # shadcn/ui 组件（复制到项目）
│   │   │   ├── /chat                 # 对话相关组件
│   │   │   └── /generative           # Generative UI 组件
│   │   └── next.config.ts
│   │
│   └── /vsc-extension                # VS Code 插件
│       ├── /src
│       │   ├── extension.ts          # 插件入口
│       │   ├── chatPanel.ts          # Chat Webview Provider
│       │   └── contextProvider.ts    # 工作区上下文提取
│       ├── /webview                  # Webview 前端代码
│       │   └── chat.tsx
│       └── package.json
│
├── /packages
│   ├── /tools                        # 共享 Tool 定义
│   │   ├── /customer                 # 客户管理 Tools
│   │   ├── /order                    # 订单管理 Tools
│   │   ├── /report                   # 报表生成 Tools
│   │   └── index.ts
│   │
│   ├── /db                           # 数据库层
│   │   ├── /prisma
│   │   │   └── schema.prisma         # Prisma Schema
│   │   ├── /migrations               # 数据库迁移
│   │   └── client.ts                 # Prisma Client 单例
│   │
│   ├── /ui                           # 共享 UI 组件
│   │   ├── /primitives               # 基础原语
│   │   └── /generative               # Generative 专用组件
│   │
│   └── /types                        # 共享类型定义
│       ├── customer.ts
│       ├── order.ts
│       └── index.ts
│
├── /infra                            # 基础设施配置
│   ├── /docker
│   │   ├── docker-compose.yml        # 本地开发环境
│   │   └── Dockerfile.web
│   └── /k8s                          # Kubernetes 部署配置
│
├── pnpm-workspace.yaml               # pnpm Monorepo 配置
├── turbo.json                        # Turborepo 构建配置
└── package.json                      # 根 package.json
```

### 4.3 VSC 插件实现

**TE2 的挑战：** 需要在 VSC Webview 中复刻完整的 Web 组件库。

**TE3-GEN 的简化：** VSC 插件只需要一个 **Chat Panel**，所有业务逻辑在服务端。

```typescript
// apps/vsc-extension/src/chatPanel.ts
import * as vscode from 'vscode';

export class TeamsEdgeChatPanel implements vscode.WebviewViewProvider {
  private _view?: vscode.WebviewView;
  
  constructor(
    private readonly _extensionUri: vscode.Uri,
    private readonly _apiEndpoint: string
  ) {}

  resolveWebviewView(webviewView: vscode.WebviewView) {
    this._view = webviewView;
    
    webviewView.webview.options = {
      enableScripts: true,
      localResourceRoots: [this._extensionUri],
    };
    
    webviewView.webview.html = this._getHtmlContent();
    
    // 处理来自 Webview 的消息
    webviewView.webview.onDidReceiveMessage(async (message) => {
      switch (message.type) {
        case 'chat':
          await this._handleChat(message.content);
          break;
        case 'confirm':
          await this._handleConfirm(message.toolCall, message.confirmed);
          break;
      }
    });
  }

  private async _handleChat(content: string) {
    // 获取工作区上下文
    const context = await this._getWorkspaceContext();
    
    // 调用 AI Gateway
    const response = await fetch(`${this._apiEndpoint}/api/chat`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        messages: [{ role: 'user', content }],
        context,
      }),
    });
    
    // 流式渲染响应
    const reader = response.body!.getReader();
    const decoder = new TextDecoder();
    
    while (true) {
      const { done, value } = await reader.read();
      if (done) break;
      
      const chunk = decoder.decode(value);
      this._view?.webview.postMessage({
        type: 'stream',
        content: chunk,
      });
    }
  }

  private async _getWorkspaceContext() {
    const editor = vscode.window.activeTextEditor;
    return {
      // 当前文件路径
      currentFile: editor?.document.uri.fsPath,
      // 选中的代码
      selection: editor?.document.getText(editor.selection),
      // 工作区根目录
      workspaceRoot: vscode.workspace.workspaceFolders?.[0]?.uri.fsPath,
      // Git 分支
      gitBranch: await this._getGitBranch(),
    };
  }

  private _getHtmlContent(): string {
    return `<!DOCTYPE html>
    <html lang="zh-CN">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>TeamsEdge Chat</title>
      <style>
        /* 使用 VSC 主题变量 */
        body { 
          font-family: var(--vscode-font-family);
          background: var(--vscode-editor-background);
          color: var(--vscode-editor-foreground);
          padding: 12px;
        }
        .chat-container { display: flex; flex-direction: column; height: 100vh; }
        .messages { flex: 1; overflow-y: auto; }
        .input-area { display: flex; gap: 8px; padding-top: 12px; }
        .input-area input { 
          flex: 1; 
          padding: 8px; 
          border: 1px solid var(--vscode-input-border);
          background: var(--vscode-input-background);
          color: var(--vscode-input-foreground);
        }
        .input-area button {
          padding: 8px 16px;
          background: var(--vscode-button-background);
          color: var(--vscode-button-foreground);
          border: none;
          cursor: pointer;
        }
      </style>
    </head>
    <body>
      <div class="chat-container">
        <div class="messages" id="messages"></div>
        <div class="input-area">
          <input type="text" id="input" placeholder="输入你的问题..." />
          <button onclick="sendMessage()">发送</button>
        </div>
      </div>
      <script>
        const vscode = acquireVsCodeApi();
        
        function sendMessage() {
          const input = document.getElementById('input');
          const content = input.value.trim();
          if (!content) return;
          
          vscode.postMessage({ type: 'chat', content });
          appendMessage('user', content);
          input.value = '';
        }
        
        function appendMessage(role, content) {
          const messages = document.getElementById('messages');
          const div = document.createElement('div');
          div.className = 'message ' + role;
          div.innerHTML = content;
          messages.appendChild(div);
          messages.scrollTop = messages.scrollHeight;
        }
        
        window.addEventListener('message', event => {
          const message = event.data;
          if (message.type === 'stream') {
            // 处理流式响应
            appendMessage('assistant', message.content);
          }
        });
        
        document.getElementById('input').addEventListener('keypress', (e) => {
          if (e.key === 'Enter') sendMessage();
        });
      </script>
    </body>
    </html>`;
  }
}
```

### 4.4 VSC 插件 package.json

```json
{
  "name": "teamsedge-vsc",
  "displayName": "TeamsEdge",
  "description": "TeamsEdge BOSS 系统 VS Code 集成",
  "version": "3.0.0",
  "publisher": "teamsedge",
  "engines": {
    "vscode": "^1.85.0"
  },
  "categories": ["Other"],
  "activationEvents": [
    "onView:teamsedge.chat"
  ],
  "main": "./dist/extension.js",
  "contributes": {
    "viewsContainers": {
      "activitybar": [
        {
          "id": "teamsedge",
          "title": "TeamsEdge",
          "icon": "resources/icon.svg"
        }
      ]
    },
    "views": {
      "teamsedge": [
        {
          "type": "webview",
          "id": "teamsedge.chat",
          "name": "Chat"
        }
      ]
    },
    "configuration": {
      "title": "TeamsEdge",
      "properties": {
        "teamsedge.apiEndpoint": {
          "type": "string",
          "default": "https://api.teamsedge.local",
          "description": "TeamsEdge API 服务地址"
        }
      }
    }
  },
  "scripts": {
    "vscode:prepublish": "pnpm build",
    "build": "esbuild ./src/extension.ts --bundle --outfile=dist/extension.js --external:vscode --format=cjs --platform=node"
  },
  "devDependencies": {
    "@types/vscode": "^1.85.0",
    "esbuild": "^0.20.0",
    "typescript": "^5.5.0"
  }
}
```

---

## 5. "Network Reliable" 的 LLM-Native 实现

### 5.1 网络可靠性架构

```
┌─────────────────────────────────────────────────────────────────────┐
│                    Network Reliability Layer                         │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐             │
│  │   Client    │───→│   Cache     │───→│   Server    │             │
│  │   (Browser) │    │   (Redis)   │    │   (API)     │             │
│  └─────────────┘    └─────────────┘    └─────────────┘             │
│         │                  │                  │                     │
│         ▼                  ▼                  ▼                     │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐             │
│  │ LocalStorage│    │ Idempotency │    │   Retry     │             │
│  │ Fallback    │    │   Keys      │    │   Queue     │             │
│  └─────────────┘    └─────────────┘    └─────────────┘             │
│                                                                     │
│  策略：                                                              │
│  1. 读操作：Cache First → Server → LocalStorage Fallback            │
│  2. 写操作：Server → Idempotency Check → Retry with Backoff         │
│  3. 离线：LocalStorage Queue → Online Sync                          │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 5.2 离线优先 + 增量同步

```typescript
// lib/hooks/useReliableQuery.ts
import { useState, useEffect, useCallback } from 'react';
import { useLocalStorage } from '@/lib/hooks/useLocalStorage';

interface QueryResult<T> {
  data: T | null;
  source: 'live' | 'cache' | 'local';
  stale: boolean;
  error: Error | null;
}

export function useReliableQuery<T>(
  intent: string,
  options: {
    cacheKey?: string;
    cacheTTL?: number;    // 缓存有效期（秒）
    retryCount?: number;  // 重试次数
    retryDelay?: number;  // 重试间隔（毫秒）
  } = {}
) {
  const {
    cacheKey = `query:${intent}`,
    cacheTTL = 300,
    retryCount = 3,
    retryDelay = 1000,
  } = options;

  const [localCache, setLocalCache] = useLocalStorage<{
    data: T;
    timestamp: number;
  }>(cacheKey);
  
  const [isOnline, setIsOnline] = useState(
    typeof navigator !== 'undefined' ? navigator.onLine : true
  );
  const [isLoading, setIsLoading] = useState(false);
  const [result, setResult] = useState<QueryResult<T>>({
    data: null,
    source: 'local',
    stale: true,
    error: null,
  });

  // 监听网络状态
  useEffect(() => {
    const handleOnline = () => setIsOnline(true);
    const handleOffline = () => setIsOnline(false);
    
    window.addEventListener('online', handleOnline);
    window.addEventListener('offline', handleOffline);
    
    return () => {
      window.removeEventListener('online', handleOnline);
      window.removeEventListener('offline', handleOffline);
    };
  }, []);

  const query = useCallback(async (): Promise<QueryResult<T>> => {
    setIsLoading(true);

    // 1. 检查本地缓存
    if (localCache) {
      const age = (Date.now() - localCache.timestamp) / 1000;
      if (age < cacheTTL) {
        setResult({
          data: localCache.data,
          source: 'cache',
          stale: false,
          error: null,
        });
        // 后台刷新
        refreshInBackground();
        setIsLoading(false);
        return { data: localCache.data, source: 'cache', stale: false, error: null };
      }
    }

    // 2. 离线时使用过期缓存
    if (!isOnline && localCache) {
      setIsLoading(false);
      return {
        data: localCache.data,
        source: 'local',
        stale: true,
        error: null,
      };
    }

    // 3. 在线请求（带重试）
    let lastError: Error | null = null;
    for (let attempt = 0; attempt < retryCount; attempt++) {
      try {
        const response = await fetch('/api/chat', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ intent }),
        });

        if (!response.ok) {
          throw new Error(`HTTP ${response.status}`);
        }

        const data = await response.json();
        
        // 更新缓存
        setLocalCache({ data, timestamp: Date.now() });
        setResult({ data, source: 'live', stale: false, error: null });
        setIsLoading(false);
        
        return { data, source: 'live', stale: false, error: null };
      } catch (error) {
        lastError = error as Error;
        // 指数退避
        await new Promise(r => setTimeout(r, retryDelay * Math.pow(2, attempt)));
      }
    }

    // 4. 所有重试失败，降级到缓存
    setIsLoading(false);
    if (localCache) {
      return {
        data: localCache.data,
        source: 'local',
        stale: true,
        error: lastError,
      };
    }

    return { data: null, source: 'local', stale: true, error: lastError };
  }, [intent, localCache, isOnline, cacheTTL, retryCount, retryDelay]);

  return { query, result, isLoading, isOnline, hasCache: !!localCache };
}
```

### 5.3 幂等性与事务保障

```typescript
// lib/tools/safeExecutor.ts
import { db } from '@/packages/db';
import { nanoid } from 'nanoid';

interface ExecuteOptions<T> {
  idempotencyKey?: string;
  maxRetries?: number;
  retryDelay?: number;
  rollback?: () => Promise<void>;
  onProgress?: (status: string) => void;
}

interface ExecuteResult<T> {
  success: boolean;
  data?: T;
  error?: string;
  idempotencyKey: string;
  wasReplay: boolean;
}

export async function safeExecute<T>(
  operation: () => Promise<T>,
  options: ExecuteOptions<T> = {}
): Promise<ExecuteResult<T>> {
  const {
    idempotencyKey = nanoid(),
    maxRetries = 3,
    retryDelay = 1000,
    rollback,
    onProgress,
  } = options;

  // 1. 检查是否已执行过
  const existing = await db.idempotencyLog.findUnique({
    where: { key: idempotencyKey },
  });

  if (existing) {
    if (existing.status === 'completed') {
      return {
        success: true,
        data: existing.result as T,
        idempotencyKey,
        wasReplay: true,
      };
    }
    if (existing.status === 'failed') {
      return {
        success: false,
        error: existing.error || 'Previous execution failed',
        idempotencyKey,
        wasReplay: true,
      };
    }
    // status === 'pending'，等待或超时
    if (Date.now() - existing.createdAt.getTime() < 30000) {
      throw new Error('Operation in progress');
    }
  }

  // 2. 记录开始执行
  await db.idempotencyLog.upsert({
    where: { key: idempotencyKey },
    create: {
      key: idempotencyKey,
      status: 'pending',
      createdAt: new Date(),
    },
    update: {
      status: 'pending',
      updatedAt: new Date(),
    },
  });

  // 3. 执行操作（带重试）
  let lastError: Error | null = null;
  for (let attempt = 0; attempt < maxRetries; attempt++) {
    try {
      onProgress?.(`尝试执行 (${attempt + 1}/${maxRetries})...`);
      
      const result = await operation();

      // 4. 记录成功
      await db.idempotencyLog.update({
        where: { key: idempotencyKey },
        data: {
          status: 'completed',
          result: result as any,
          completedAt: new Date(),
        },
      });

      return {
        success: true,
        data: result,
        idempotencyKey,
        wasReplay: false,
      };
    } catch (error) {
      lastError = error as Error;
      onProgress?.(`执行失败: ${lastError.message}，等待重试...`);
      
      if (attempt < maxRetries - 1) {
        await new Promise(r => setTimeout(r, retryDelay * Math.pow(2, attempt)));
      }
    }
  }

  // 5. 所有重试失败
  onProgress?.('所有重试失败，执行回滚...');
  
  if (rollback) {
    try {
      await rollback();
    } catch (rollbackError) {
      console.error('Rollback failed:', rollbackError);
    }
  }

  // 6. 记录失败
  await db.idempotencyLog.update({
    where: { key: idempotencyKey },
    data: {
      status: 'failed',
      error: lastError?.message,
      failedAt: new Date(),
    },
  });

  return {
    success: false,
    error: lastError?.message,
    idempotencyKey,
    wasReplay: false,
  };
}
```

### 5.4 Prisma Schema：幂等性日志

```prisma
// packages/db/prisma/schema.prisma

model IdempotencyLog {
  id          String   @id @default(cuid())
  key         String   @unique
  status      String   // 'pending' | 'completed' | 'failed'
  result      Json?
  error       String?
  createdAt   DateTime @default(now())
  updatedAt   DateTime @updatedAt
  completedAt DateTime?
  failedAt    DateTime?

  @@index([status])
  @@index([createdAt])
}

model AuditLog {
  id          String   @id @default(cuid())
  userId      String
  action      String   // 'customer:create', 'customer:update', etc.
  entityType  String   // 'customer', 'order', etc.
  entityId    String
  payload     Json
  ipAddress   String?
  userAgent   String?
  createdAt   DateTime @default(now())

  @@index([userId])
  @@index([entityType, entityId])
  @@index([action])
  @@index([createdAt])
}
```

---

## 6. 迁移路径 (Action Plan)

### 6.1 阶段总览

```
┌─────────────────────────────────────────────────────────────────────┐
│                    TE3-GEN 实施路线图                                │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  Week 1-2          Week 3-4          Week 5-6          Week 7-8    │
│  ┌────────┐        ┌────────┐        ┌────────┐        ┌────────┐  │
│  │  POC   │───────→│  VSC   │───────→│ 权限与 │───────→│ 生产化 │  │
│  │ 验证   │        │ 集成   │        │ 审计   │        │ 部署   │  │
│  └────────┘        └────────┘        └────────┘        └────────┘  │
│                                                                     │
│  交付物：           交付物：           交付物：           交付物：    │
│  - AI Gateway      - VSC 插件        - RBAC 系统       - K8s 部署  │
│  - 核心 Tools      - 上下文注入      - 审计日志        - 监控告警  │
│  - Chat UI         - 流式渲染        - Token 监控      - 文档培训  │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### 6.2 第一阶段：Proof of Concept (Week 1-2)

**目标：** 验证 Generative UI 核心流程可行

#### 6.2.1 技术任务

| 任务 | 优先级 | 预估工时 | 依赖 |
|------|--------|----------|------|
| 初始化 pnpm Monorepo | P0 | 2h | - |
| 部署 Next.js 15 项目骨架 | P0 | 4h | Monorepo |
| 配置 Vercel AI SDK | P0 | 4h | Next.js |
| 接入 OpenAI API（gpt-4o） | P0 | 2h | AI SDK |
| 实现基础 Chat API | P0 | 8h | AI SDK |
| 定义 Customer Tools（CRUD） | P0 | 16h | Chat API |
| 连接现有 PostgreSQL | P0 | 4h | Prisma |
| 实现 DataTable 组件渲染 | P1 | 8h | Tools |
| 实现 ConfirmCard 组件 | P1 | 4h | Tools |
| 编写 Tool 单元测试 | P1 | 8h | Tools |

#### 6.2.2 验收标准

- [ ] 用户输入 "显示所有客户" → 返回动态表格
- [ ] 用户输入 "新建客户张三" → 返回确认卡片 → 确认后插入数据库
- [ ] 用户输入 "删除客户 xxx" → 返回影响预览 → 确认后执行
- [ ] Tool 执行错误时，返回友好错误提示
- [ ] 响应时间 < 3s（首字节）

#### 6.2.3 初始化命令

```bash
# 1. 创建 Monorepo
mkdir teamsedge-gen && cd teamsedge-gen
pnpm init
cat > pnpm-workspace.yaml << EOF
packages:
  - 'apps/*'
  - 'packages/*'
EOF

# 2. 创建 Next.js 应用
pnpm create next-app@latest apps/web --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"

# 3. 安装核心依赖
cd apps/web
pnpm add ai @ai-sdk/openai zod
pnpm add -D prisma

# 4. 初始化 Prisma
pnpm prisma init

# 5. 创建 packages
mkdir -p ../../packages/{tools,db,types,ui}

# 6. 配置 shadcn/ui
pnpm dlx shadcn@latest init
pnpm dlx shadcn@latest add button card table input dialog
```

### 6.3 第二阶段：VSC 集成 (Week 3-4)

**目标：** 实现 VS Code 插件，统一双端入口

#### 6.3.1 技术任务

| 任务 | 优先级 | 预估工时 | 依赖 |
|------|--------|----------|------|
| 创建 VSC 插件项目骨架 | P0 | 4h | - |
| 实现 Chat Panel Provider | P0 | 8h | 插件骨架 |
| 实现 Webview HTML/CSS | P0 | 8h | Panel Provider |
| 对接 AI Gateway API | P0 | 4h | POC 完成 |
| 实现流式响应渲染 | P0 | 8h | API 对接 |
| 提取工作区上下文 | P1 | 8h | 流式渲染 |
| 实现确认操作交互 | P1 | 4h | 流式渲染 |
| 插件打包与本地测试 | P1 | 4h | 全部 |

#### 6.3.2 验收标准

- [ ] VSC 侧边栏显示 TeamsEdge Chat 面板
- [ ] 在 Chat 中输入查询，流式显示响应
- [ ] 支持点击确认/取消按钮
- [ ] 上下文包含当前文件路径和选中代码
- [ ] 插件大小 < 1MB

### 6.4 第三阶段：权限与审计 (Week 5-6)

**目标：** 实现企业级安全控制

#### 6.4.1 技术任务

| 任务 | 优先级 | 预估工时 | 依赖 |
|------|--------|----------|------|
| 设计 RBAC 权限模型 | P0 | 8h | - |
| 实现 requirePermission() | P0 | 8h | RBAC 模型 |
| Tool 级别权限检查 | P0 | 8h | requirePermission |
| 实现审计日志记录 | P0 | 8h | Tools |
| 审计日志查询界面 | P1 | 16h | 审计日志 |
| Token 使用量监控 | P1 | 8h | AI SDK |
| 实现 Rate Limiting | P1 | 4h | Redis |

#### 6.4.2 RBAC 模型设计

```typescript
// lib/auth/rbac.ts

// 权限定义
const PERMISSIONS = {
  'customer:read': '查看客户',
  'customer:create': '创建客户',
  'customer:update': '更新客户',
  'customer:delete': '删除客户',
  'order:read': '查看订单',
  'order:create': '创建订单',
  'report:generate': '生成报表',
  'report:export': '导出报表',
  'admin:users': '用户管理',
  'admin:audit': '审计日志',
} as const;

// 角色定义
const ROLES = {
  admin: Object.keys(PERMISSIONS),
  manager: [
    'customer:read', 'customer:create', 'customer:update',
    'order:read', 'order:create',
    'report:generate', 'report:export',
  ],
  sales: [
    'customer:read', 'customer:create', 'customer:update',
    'order:read', 'order:create',
  ],
  viewer: [
    'customer:read',
    'order:read',
  ],
} as const;

// 权限检查函数
export async function requirePermission(
  permission: keyof typeof PERMISSIONS
): Promise<void> {
  const session = await getSession();
  if (!session) {
    throw new Error('未登录');
  }

  const userPermissions = ROLES[session.user.role] || [];
  if (!userPermissions.includes(permission)) {
    throw new Error(`权限不足: 需要 ${PERMISSIONS[permission]} 权限`);
  }
}
```

### 6.5 第四阶段：生产化 (Week 7-8)

**目标：** 生产环境部署与运维准备

#### 6.5.1 技术任务

| 任务 | 优先级 | 预估工时 | 依赖 |
|------|--------|----------|------|
| 编写 Dockerfile | P0 | 4h | - |
| 编写 K8s 部署配置 | P0 | 8h | Dockerfile |
| 配置 CI/CD Pipeline | P0 | 8h | K8s |
| 实现健康检查端点 | P0 | 2h | - |
| 配置日志收集（Loki） | P1 | 4h | K8s |
| 配置指标监控（Prometheus） | P1 | 4h | K8s |
| 配置告警规则 | P1 | 4h | Prometheus |
| 编写运维文档 | P1 | 8h | 全部 |
| 用户培训材料 | P1 | 8h | 全部 |
| 渐进式迁移脚本 | P2 | 8h | 全部 |

#### 6.5.2 Docker 配置

```dockerfile
# apps/web/Dockerfile
FROM node:22-alpine AS base

# 安装依赖阶段
FROM base AS deps
WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN corepack enable pnpm && pnpm install --frozen-lockfile

# 构建阶段
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN corepack enable pnpm && pnpm build

# 运行阶段
FROM base AS runner
WORKDIR /app
ENV NODE_ENV=production

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs
EXPOSE 3000
ENV PORT=3000
ENV HOSTNAME="0.0.0.0"

CMD ["node", "server.js"]
```

#### 6.5.3 环境变量配置

```bash
# .env.production

# AI 配置
OPENAI_API_KEY=sk-xxx
ANTHROPIC_API_KEY=sk-ant-xxx
AI_MODEL_DEFAULT=gpt-4o
AI_MODEL_FALLBACK=claude-3-5-sonnet

# 数据库
DATABASE_URL=postgresql://user:pass@host:5432/teamsedge?schema=public

# Redis
REDIS_URL=redis://host:6379

# 认证
NEXTAUTH_URL=https://app.teamsedge.com
NEXTAUTH_SECRET=xxx

# 监控
SENTRY_DSN=https://xxx@sentry.io/xxx

# 特性开关
FEATURE_GENERATIVE_UI=true
FEATURE_LEGACY_CRUD=true  # 保留传统入口
```

---

## 7. 风险评估与缓解

### 7.1 风险矩阵

| 风险 | 可能性 | 影响 | 风险等级 | 缓解措施 | 负责人 |
|------|--------|------|----------|----------|--------|
| LLM 幻觉导致错误操作 | 中 | 高 | 🔴 高 | 所有写操作必须人工确认；Tool 输出经 Zod 严格校验；关键操作二次确认 | 后端 |
| 响应延迟影响体验 | 高 | 中 | 🟡 中 | 流式渲染首字节 <1s；本地缓存；乐观更新；骨架屏 | 前端 |
| OpenAI API 成本不可控 | 中 | 中 | 🟡 中 | Token 监控告警；缓存高频查询；降级到本地模型（Ollama） | DevOps |
| OpenAI 服务中断 | 低 | 高 | 🟡 中 | 多模型备份（Claude）；离线缓存；人工降级入口 | DevOps |
| 用户学习成本 | 中 | 低 | 🟢 低 | 保留传统 CRUD 入口；渐进式引导；FAQ 预置问题；培训 | 产品 |
| 数据安全合规 | 低 | 高 | 🟡 中 | 敏感数据脱敏后再传给 LLM；审计日志；RBAC | 安全 |
| VSC 插件兼容性 | 中 | 低 | 🟢 低 | 支持 VSC 1.85+；Webview 降级方案 | 前端 |

### 7.2 降级策略

```typescript
// lib/fallback.ts

// 1. 模型降级链
const MODEL_CHAIN = [
  { provider: 'openai', model: 'gpt-4o' },
  { provider: 'anthropic', model: 'claude-3-5-sonnet' },
  { provider: 'openai', model: 'gpt-4o-mini' },
  { provider: 'local', model: 'ollama/llama3' },
];

// 2. UI 降级
const UI_FALLBACK_MODES = {
  // 完全 Generative
  full: 'generative',
  // 混合模式：查询用 Generative，编辑用传统表单
  hybrid: 'hybrid',
  // 完全传统
  legacy: 'legacy',
};

// 3. 特性开关
export const FEATURE_FLAGS = {
  generativeUI: process.env.FEATURE_GENERATIVE_UI === 'true',
  legacyCRUD: process.env.FEATURE_LEGACY_CRUD === 'true',
  offlineMode: process.env.FEATURE_OFFLINE_MODE === 'true',
};
```

### 7.3 监控指标

| 指标 | 阈值 | 告警级别 |
|------|------|----------|
| API 响应时间 P99 | > 5s | Warning |
| API 响应时间 P99 | > 10s | Critical |
| Tool 执行失败率 | > 5% | Warning |
| Tool 执行失败率 | > 10% | Critical |
| Token 使用量（日） | > 100K | Info |
| Token 使用量（日） | > 500K | Warning |
| 缓存命中率 | < 60% | Warning |
| 用户确认取消率 | > 30% | Info |

---

## 8. 成本估算

### 8.1 API 成本

| 模型 | 输入价格 | 输出价格 | 预估月用量 | 月成本 |
|------|----------|----------|------------|--------|
| gpt-4o | $2.5/1M tokens | $10/1M tokens | 10M in / 2M out | ~$45 |
| claude-3-5-sonnet | $3/1M tokens | $15/1M tokens | 备用 | - |
| gpt-4o-mini | $0.15/1M tokens | $0.6/1M tokens | 降级 | - |

**假设：** 50 用户，每人每天 20 次对话，每次对话平均 2000 tokens。

### 8.2 基础设施成本

| 资源 | 规格 | 数量 | 月成本（估） |
|------|------|------|--------------|
| 应用服务器 | 4C8G | 2 | ¥800 |
| PostgreSQL | 4C8G | 1 | ¥600 |
| Redis | 2C4G | 1 | ¥300 |
| 对象存储 | 100GB | 1 | ¥50 |
| CDN 流量 | 500GB | - | ¥100 |
| **总计** | - | - | **¥1,850/月** |

### 8.3 开发成本

| 阶段 | 工时（人天） | 人员配置 |
|------|-------------|----------|
| POC (Week 1-2) | 10 | 1 全栈 |
| VSC 集成 (Week 3-4) | 10 | 1 全栈 |
| 权限与审计 (Week 5-6) | 10 | 1 全栈 |
| 生产化 (Week 7-8) | 10 | 1 全栈 + 0.5 DevOps |
| **总计** | **40 人天** | **~2 个月** |

---

## 9. 讨论议题

以下议题需要进一步讨论和决策：

### 9.1 技术选型讨论

| 议题 | 选项 | 考量 |
|------|------|------|
| **主力 LLM 选型** | OpenAI vs Anthropic vs 混合 | 成本、性能、数据隐私 |
| **是否自建 LLM** | 云 API vs 本地部署 Ollama | 成本、延迟、数据合规 |
| **向量数据库** | pgvector vs Pinecone vs Qdrant | 复杂度、成本、性能 |
| **认证方案** | NextAuth vs Auth0 vs 自建 | 成本、功能、集成度 |

### 9.2 产品策略讨论

| 议题 | 问题 |
|------|------|
| **迁移策略** | 是否保留完整传统 CRUD？多长时间过渡？ |
| **用户培训** | 如何帮助用户从菜单导航转向自然语言？ |
| **功能边界** | 哪些操作适合 Generative，哪些保留传统？ |
| **错误处理** | LLM 无法理解时如何优雅降级？ |

### 9.3 运营策略讨论

| 议题 | 问题 |
|------|------|
| **成本分摊** | Token 成本如何分摊到部门/用户？ |
| **SLA 承诺** | Generative UI 的可用性目标？ |
| **数据隐私** | 哪些数据可以发送给 OpenAI？ |

---

## 10. 结论：从 "AI Usable" 到 "AI Native"

### 10.1 核心价值对比

| 指标 | TE2 (v1.0) | TE3-GEN (v2.0) |
|------|------------|----------------|
| **开发效率** | AI 帮写 70% 代码 | AI 直接生成 90% 界面 |
| **维护成本** | 需要维护组件库 | 只需维护 Tool 定义 |
| **用户体验** | 学习固定菜单 | 自然语言直达 |
| **扩展性** | 每个新功能需写组件 | 每个新功能只需定义 Tool |
| **双端一致性** | 需要同步两套代码 | 统一 Chat 入口，自动适配 |

### 10.2 TE3-GEN 的核心价值

**把 BOSS 系统从"功能的集合"变成"Agent 的能力边界"。**

用户不再需要学习"客户管理在哪个菜单"，他们只需要说出想做的事。

### 10.3 下一步行动

1. **本周：** 评审本方案，确定技术选型疑问
2. **下周：** 启动 POC，验证核心流程
3. **月底：** POC 演示，决定是否全面推进

---

# 附录 A：TE2 (v1.0) 原始方案

> 以下为 2026年1月11日 的原始方案记录，作为演进参考。  
> 完整版本见 [RT3.md](./RT3.md)

---

## A.1 核心选型总览 (The Stack 2026 v1)

| 模块 | 推荐选型 | License | 2026 选型理由 & AI 协同性分析 | 原始出处/核查源 |
| --- | --- | --- | --- | --- |
| **核心框架** | **React 19+** | MIT | **双端通用的基石。** VSC 插件视图本质是 Webview，React 拥有最完善的 VSC UI Toolkit 适配。AI 对 React 组件的理解和生成能力远超 Vue/Svelte。 | [React GitHub](https://github.com/facebook/react) |
| **开发语言** | **TypeScript 5.x** | Apache 2.0 | **"网络可靠"的保障。** 它是 AI 理解业务逻辑的"母语"。类型定义（Type Definitions）即文档，能大幅减少 AI 幻觉。 | [TypeScript GitHub](https://github.com/microsoft/TypeScript) |
| **UI 系统** | **Tailwind CSS v4 + shadcn/ui** | MIT | **AI 时代的 UI 标准。** 放弃 Webix 这种黑盒封装库。Shadcn 允许 AI 直接修改组件源码（Copy-paste 模式），而非查阅文档去配置复杂的 Props。 | [shadcn/ui](https://ui.shadcn.com/) |
| **CRUD/表格** | **TanStack Table v8+** | MIT | **Webix Grid 的完美替代。** "Headless"（无头）架构。逻辑层（排序/筛选）与 UI 层分离，完美适配 VSC 狭窄侧栏和 Web 宽屏的不同渲染需求。 | [TanStack Table](https://tanstack.com/table) |
| **状态/缓存** | **TanStack Query** | MIT | **"网络可靠"的核心。** 自动处理重试、缓存、后台更新。让前端不再手写 fetch useEffect，极大降低代码复杂度。 | [TanStack Query](https://tanstack.com/query) |
| **构建工具** | **Vite (Rolldown)** | MIT | **极速开发。** 2026年 Vite 底层已切换至 Rust 编写的 Rolldown，构建速度极快，且完美支持 Monorepo。 | [Vite GitHub](https://github.com/vitejs/vite) |

## A.2 架构深度解析

### A.2.1 抛弃 Webix，拥抱 "Glass Box" (透明盒) 模式

* **Webix (Black Box):** 你通过 JSON 配置界面。AI 很难微调内部样式，因为它是封装好的 JS 对象。
* **shadcn/ui (Glass Box):** 这不是一个 npm 包，而是一套代码生成器。
* **2026 场景:** 你告诉 AI："把 TeamsEdge 的主表格行高改小，增加斑马纹，选中时变蓝"。AI 会直接修改你项目里的 `table.tsx` 和 Tailwind 类名。
* **优势:** **完全掌控代码**。没有厂商锁定，没有 License 陷阱，所有代码都在你自己的仓库里。

### A.2.2 双工作台模式的实现策略 (The Dual-Workbench Strategy)

**推荐目录结构：**

```text
/teams-edge-monorepo
├── /packages
│   ├── /ui              # 共享组件库 (基于 shadcn/ui, 按钮, 输入框, 卡片)
│   ├── /business-logic  # 共享业务逻辑 (Hooks, API Client, Zod Schemas)
│   └── /types           # 共享 TypeScript 类型定义 (数据库 Model 映射)
├── /apps
│   ├── /web-portal      # TeamsEdge Web 端 (Vite + React Router)
│   └── /vsc-extension   # VSC 插件端 (Vite Build -> Webview)
```

### A.2.3 解决 BOSS 系统的 CRUD 挑战

1. **逻辑层:** **TanStack Table** 处理分页、排序、过滤、行选。
2. **数据层:** **Zod** (数据校验) + **React Hook Form** (表单管理)。
3. **交互层:** AI 辅助生成针对性的 CRUD 界面。

## A.3 迁移与启动建议 (Action Plan v1)

### 第一阶段：基础设施搭建 (Week 1-2)
1. 初始化 **pnpm Monorepo**。
2. 配置 Tailwind CSS v4 和 Shadcn/ui 到 `/packages/ui`。
3. 定义标准化的 "Data Grid" 组件。

### 第二阶段：AI 辅助开发流 (Week 3-4)
1. **Prompt Engineering:** 建立团队内部的 Cursor/Copilot 提示词库。
2. 验证 VSC 插件端的数据连通性。

### 第三阶段：双端同步 (Week 5+)
1. 开发 VSC 插件的侧边栏视图 (Sidebar Provider)。
2. 将 Web 端的核心 CRUD 模块通过 iframe 或 Webview 嵌入 VSC。

---

# 附录 B：顶级 AI 工程师评审记录

> 评审日期：2026年1月14日  
> 评审视角：来自 OpenAI、Anthropic、Google DeepMind 等机构的顶级工程师

---

## B.1 对 v1.0 方案的核心认可

### B.1.1 "AI 可编程性" 优先的架构宣言

> *"他们真正理解了 AI 辅助开发的本质——不是让 AI 读文档，而是让 AI 直接操作代码。"*

方案的核心洞察：
- **Webix = 配置驱动 (Config-Driven)**：AI 只能生成 JSON，无法触及渲染逻辑
- **Shadcn/ui = 代码驱动 (Code-Driven)**：AI 可以直接修改 `table.tsx`，实现真正的结对编程

这与 OpenAI 内部推动的 **"Agent-Friendly Architecture"** 理念高度契合。

### B.1.2 TypeScript 作为 "类型即文档" 的 AI 锚点

方案中提到 *"类型定义即文档，能大幅减少 AI 幻觉"*——这一点深刻理解了：

```
Token Efficiency = Grounding Quality × Context Compression
```

TypeScript 的类型系统是 **自然语言与机器语言之间的桥接层**。

### B.1.3 架构的"可组合性"与 Agent 工作流的契合

Monorepo + Headless UI + TanStack 的组合，构建了一个 **模块化的 AI 操作界面**：

| 层级 | 职责 | AI Agent 的操作空间 |
|------|------|---------------------|
| `/packages/types` | 数据契约 | Agent 可从 Schema 推断业务语义 |
| `/packages/ui` | 原子组件 | Agent 可复用、组合、修改源码 |
| `/packages/business-logic` | 业务钩子 | Agent 可理解数据流、生成测试 |
| `/apps/*` | 应用壳 | Agent 可按需组装完整页面 |

---

## B.2 识别的隐含风险与盲区

### B.2.1 "AI Usable" ≠ "AI Autonomous"

> *"这份方案是为 Copilot（人在回路）设计的，但没有为 Devin/Claude Agent（自主循环）预留架构位。"*

**盲点：**
- Agent 如何发起 PR？
- Agent 如何理解业务上下文（不只是类型）？
- Agent 犯错时，如何回滚？

### B.2.2 过度依赖 "AI 语料丰富度" 作为选型理由

> *"当 AI 训练数据包含大量 2023 年的 React Class Component 时，你的 Agent 可能生成过时代码。"*

语料丰富 ≠ 语料质量。React 19 的 Server Components、Actions 等新范式，在 2026 年的 AI 训练集中可能仍是少数派。

### B.2.3 "双端同步" 的复杂度被低估

VSC Webview 和 Web Portal 的"统一组件"实际挑战：
- **渲染上下文不同**：Webview 有安全沙箱限制
- **状态同步复杂**：VSC extension host 与 Webview 通信是异步 message passing
- **构建流程分叉**：一个面向浏览器，一个面向 VSC 打包

> *"周 5+ 的时间表过于乐观。双端同步是独立的工程挑战，不是 Monorepo 能自动解决的。"*

---

## B.3 提出的替代路径

### 路径 A：Server-Centric Architecture（服务端渲染优先）

> *"与其让 AI 生成前端组件，不如让它生成 API 和数据库查询。"*

**思路：**
- 前端极度精简（Remix / Next.js Server Components）
- 大部分逻辑在服务端
- AI Agent 主要操作 **Prisma Schema + tRPC Router**

### 路径 B：Schema-First + Code Generation

> *"不要让 AI 实时写代码，让它操作元数据，然后确定性生成代码。"*

**思路：**
- 定义业务实体 DSL（如 YAML/JSON Schema）
- 使用代码生成器从 Schema 生成 CRUD
- AI 只需要修改 Schema，而非直接改代码

### 路径 C：LLM-Native UI Framework ⭐ (本方案选择)

> *"2026 年了，为什么还用 2020 年的组件化思维？"*

**思路：**
- 探索 **Vercel AI SDK** 或类似框架
- UI 即 Agent 对话界面
- 表格、表单、图表都是 Agent 可实时生成的响应

---

## B.4 综合评价

| 维度 | 评分 | 评语 |
|------|------|------|
| **技术选型成熟度** | ⭐⭐⭐⭐☆ | 主流、安全、无明显技术债 |
| **AI 协同设计** | ⭐⭐⭐⭐⭐ | 真正理解了 Agent 需要什么 |
| **执行可行性** | ⭐⭐⭐☆☆ | 双端同步复杂度被低估 |
| **前瞻性** | ⭐⭐⭐☆☆ | 为今天的 Copilot 设计，未为明天的自主 Agent 预留空间 |
| **商业价值** | ⭐⭐⭐⭐☆ | MIT 全栈，合规无忧 |

### 总结性评语

> *"这是一份 **务实且聪明** 的 2026 年架构方案——它抓住了 AI 辅助开发的核心（代码可操作性），但还停留在 **'人+AI' 的协作范式**。下一步应该思考：当 Agent 能力超越 Copilot 时，这套架构如何演进为 **'Agent 主导，人类审计'** 的模式？"*

---

# 附录 C：License 合规性核查

针对 B 端商业软件，合规性是红线。

| 组件 | License | 商用兼容性 |
|------|---------|------------|
| React | MIT | ✅ 宽松，允许闭源商用 |
| TypeScript | Apache 2.0 | ✅ 宽松，允许商用 |
| Next.js | MIT | ✅ |
| Tailwind CSS | MIT | ✅ |
| Vercel AI SDK | Apache 2.0 | ✅ |
| Shadcn/ui | MIT | ✅ |
| Zod | MIT | ✅ |
| Lucide React | ISC | ✅ 等同于 MIT |

**结论：** 全栈均为最宽松的开源协议，无 GPL 传染风险，完全满足商业化需求。

---

# 附录 D：术语表

| 术语 | 定义 |
|------|------|
| **Generative UI** | 由 LLM 根据用户意图动态生成的用户界面，而非预先编写的固定界面 |
| **Tool** | Agent 可调用的原子操作单元，包含描述、参数 Schema 和执行函数 |
| **streamUI()** | Vercel AI SDK 提供的流式 UI 生成函数 |
| **Tool Calling** | LLM 根据上下文自动选择并调用合适 Tool 的能力 |
| **Intent** | 用户的操作意图，由 LLM 从自然语言中解析 |
| **Confirmation Loop** | 写操作前的人工确认循环，防止 LLM 幻觉导致错误操作 |
| **Idempotency Key** | 幂等性标识，确保同一操作不会重复执行 |
| **RAG** | Retrieval-Augmented Generation，检索增强生成 |
| **RBAC** | Role-Based Access Control，基于角色的访问控制 |

---

# 附录 E：参考资源

## E.1 官方文档

- [Vercel AI SDK 文档](https://sdk.vercel.ai/docs)
- [Next.js 15 文档](https://nextjs.org/docs)
- [Prisma 文档](https://www.prisma.io/docs)
- [shadcn/ui 文档](https://ui.shadcn.com/docs)
- [VS Code 插件开发文档](https://code.visualstudio.com/api)

## E.2 示例项目

- [ai-chatbot (Vercel 官方)](https://github.com/vercel/ai-chatbot)
- [ai-sdk-preview-rsc](https://github.com/vercel/ai/tree/main/examples/next-ai-rsc)

## E.3 相关论文与文章

- [Generative UI and Outcome-Oriented Design](https://www.nngroup.com/articles/generative-ui/)
- [Building AI-Native Applications](https://vercel.com/blog/ai-sdk-3-generative-ui)
