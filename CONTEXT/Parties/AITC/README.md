# AITC（算力资产）

> **全称**：AI Integrated Tenant Compute
>
> **定位**：TAES 生态中的算力资源，是托举效应"Token 可用"的物质基础。

---

## 1. 定义

**AITC** 是 T营 持有并分配给 E队 使用的 AI 算力资产，包括：
- 多云 AI 订阅（Azure OpenAI / Google Gemini / Anthropic Claude）
- 配额管理（TPM / RPM / 月度额度）
- 密钥与访问控制
- 成本核算与账单

---

## 2. 核心能力

| 能力 | 说明 |
|------|------|
| **多云订阅** | 统一管理 Azure/Google/Anthropic 等 AI 服务订阅 |
| **配额分配** | 按 E队 分配 Token 额度（如 $100/月） |
| **模型路由** | 根据任务类型选择最优模型（成本/性能/上下文） |
| **成本追踪** | 按 E队/Mission/模型 维度核算消耗 |

---

## 3. 与 E队 的关系

```
T营 持有 AITC
    │
    │ Premium Quota（如 $100/月）
    │
    ↓
E队 消费 → 产出 Teams/ → E系数可度量
```

> **价值契约**：Premium Quota 不是"预算约束"，是"信任额度"——E队 用 $100 创造 > $100 的价值。

---

## 4. 支持的云厂商

| 厂商 | 服务 | 典型模型 | 适用场景 |
|------|------|----------|----------|
| **Azure** | Azure OpenAI | GPT-4o, o1 | 主力模型、代码生成 |
| **Google** | Gemini API | Gemini 2 Pro/Flash | 长上下文、成本优化 |
| **Anthropic** | Claude API | Claude Sonnet/Opus | 深度推理、架构设计 |

---

## 5. 审计字段（最小集）

| 字段 | 类型 | 说明 |
|------|------|------|
| `et_code` | string | 分配给的 E队 |
| `provider` | enum | azure / google / anthropic |
| `quota_monthly` | decimal | 月度额度（USD） |
| `usage_current` | decimal | 当前消耗 |
| `models_allowed` | array | 允许使用的模型列表 |

---

## 6. 边界（Limit）

- AITC **由 T营 持有**，E队 获得使用授权
- AITC **不包含** 网络可达性（归 POP / Workplane）
- AITC **不替代** 模型选择（路由逻辑归 AITa / LLM Router）

---

*版本: v1.0 | 创建日期: 2026-01-20*
