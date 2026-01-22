# Billing & Entitlement（账务与权益）

> CONNECTION > WorkPass
>
> **核心结论**：Invoice 可以外部化；但 TAES 内必须有可执行的 Entitlement。
>
> - **Invoice**：商业事实（谁付钱、买了什么、买了多久）
> - **Entitlement**：系统事实（允许谁用、能用多少、超了怎么办）

---

## 1. 边界（Limit）

- 不在 Repo 存储任何支付凭证、卡号、API Key、对账明细截图。
- Repo 里只登记 **最小可执行信息**：`invoice_id`、`payer/payee`、周期、line_items（SKU/qty）、以及推导出的 `entitlement`。
- 如果发票/账单涉及敏感金额，可仅保存区间与状态（如 `amount_total` 可选）。

---

## 2. 对象关系（最小闭环）

```
External Invoice (Source of truth for commerce)
        |
        v
TAES Invoice Registry (reference)
        |
        v
Entitlement (executable)
        |
        v
Provisioning gates (seats/quota/routes)
        |
        v
(Optional) Usage events (audit/reconcile)
```

- **payer**：付款方，通常是 `E队` 的 `AO`（Augmented Org）
- **payee**：收款方，通常是 `T营` 的法人/主体（或 AITC 代理主体）

---

## 3. 登记表（模板）

### 3.1 Invoice 登记表（建议：外部链接 + 最小字段）

| invoice_id | payer | payee | status | period_start | period_end | amount_total | currency | external_ref |
|---|---|---|---|---|---|---:|---|---|
| INV-202601-0001 | T3.1.3.suibe-org | T3.2.1.alliedai | paid | 2026-01-01 | 2026-01-31 | 299.00 | USD | (link) |

> external_ref：建议放外部系统 URL（公司财务系统/Stripe/飞书表格/Notion），而不是附件。

### 3.2 Entitlement 登记表（可执行解释）

| entitlement_id | source_invoice_id | owner | status | effective_start | effective_end | limits | policy |
|---|---|---|---|---|---|---|---|
| ENT-202601-SUIBE-001 | INV-202601-0001 | T3.1.3.suibe-org | active | 2026-01-01 | 2026-01-31 | quota_usd_per_month_max=100 | overage=block, grace=3 |

---

## 4. 状态机（建议）

### 4.1 Invoice 状态

- `draft` → `issued` → `paid`
- `issued` → `overdue`（未按期支付）
- `paid` → `refunded`（退款）
- 任意 → `void`（作废）

### 4.2 Entitlement 状态

- `active`：可用
- `suspended`：宽限/冻结（通常来自 `overdue` 或风控）
- `expired`：周期自然到期
- `terminated`：提前终止（退款/违约）

---

## 5. 执行规则（从 Invoice 推导 Entitlement）

- **激活条件**：`invoice.status == paid` 才能生成/激活 Entitlement。
- **归属对象**：优先用 `line_items.scope_owner` 绑定到 AO（如 `T3.1.3.suibe-org`）。
- **周期**：`effective_start/end` 取 line_item 的 `period_start/end`（或 invoice 的统一周期）。
- **限额聚合**：同一 owner、同一周期内：
  - `quota_usd_per_month_max`：按 `qty` 求和（SKU=QUOTA_USD）
  - `seats_max`：按 `qty` 求和（SKU=SEAT）
  - `linkserver_instances_max`：按实例数求和（SKU=INSTANCE）

> 冲突策略：默认不叠加（避免重复买/重复开），需要时用 policy 显式声明。

---

## 6. API 对齐（指向 _spec）

- 规范接口见 CONNECTION/_spec/api.md 的 “账务与权益（Billing & Entitlement）” 章节：
  - `POST /billing/invoices`
  - `POST /billing/invoices/{invoice_id}/paid`
  - `GET /billing/entitlements?owner=...`
  - `POST /billing/usage`（可选）

---

## 7. 安全须知

- 不上传：发票 PDF、对账单、付款凭证截图。
- 不记录：卡号/姓名/地址/税号等个人或合规敏感信息。
- 仅记录：能够驱动系统授权的最小字段。
