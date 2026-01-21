# NexusPass（身份凭证）

> **定位**：TAES 生态中的身份认证与授权服务，连接主体（T营/E队）与资源（AITC/POP）。

---

## 1. 定义

**NexusPass** 是 TAES 的身份凭证体系，提供：
- 跨系统 SSO 认证
- 权限与角色管理
- T营 → E队 身份关联
- 审计与合规追溯

---

## 2. 为什么需要 NexusPass？

在 TAES 生态中，用户可能同时使用多个系统：
- GitHub（代码与 Mission Repo）
- Microsoft 365（协作与通讯）
- TeamsEdge（运营管理）
- AI 服务（Copilot / Gemini / Claude）

**NexusPass 的作用**：
- **统一身份**：一个凭证访问所有系统
- **权限关联**：身份与 ET Code、资源授权绑定
- **审计追溯**：谁在什么时候用了什么

---

## 3. 核心能力

| 能力 | 说明 |
|------|------|
| **SSO 认证** | 单点登录，减少密码管理 |
| **角色管理** | 定义 T营/E队 内的角色与权限 |
| **资源授权** | 控制对 AITC/POP 的访问权限 |
| **审计日志** | 记录所有认证与授权事件 |

---

## 4. 与其他实体的关系

```
NexusPass
    │
    ├── 认证 ──→ E队 Player（成员身份）
    │
    ├── 关联 ──→ ET Code（E队归属）
    │
    ├── 授权 ──→ AITC（算力访问）
    │
    └── 授权 ──→ POP（网络访问）
```

---

## 5. 身份层次

| 层次 | 说明 | 示例 |
|------|------|------|
| **个人身份** | 自然人身份 | user@example.com |
| **E队身份** | 团队归属 | ET Code: T189 |
| **角色身份** | 权限角色 | Owner / Member / Viewer |
| **服务身份** | 系统间调用 | Service Account |

---

## 6. 审计字段（最小集）

| 字段 | 类型 | 说明 |
|------|------|------|
| `user_id` | string | 用户唯一标识 |
| `email` | string | 主邮箱 |
| `et_code` | string | 归属的 E队 |
| `roles` | array | 角色列表 |
| `created_at` | datetime | 创建时间 |
| `last_login` | datetime | 最后登录时间 |
| `mfa_enabled` | boolean | 是否启用多因素认证 |

---

## 7. 边界（Limit）

- NexusPass **由 T营 管理**，E队 使用凭证
- NexusPass **不存储** 业务数据（只管身份）
- NexusPass **不替代** 各系统的细粒度权限（只做身份断言）

---

*版本: v1.0 | 创建日期: 2026-01-20*
