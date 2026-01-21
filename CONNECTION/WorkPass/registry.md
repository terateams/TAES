# NexusPass Registry

> ⊕ NP 持有者登记

## 登记表

| 持有者 | NP 等级 | 可用服务 | 状态 |
|--------|---------|----------|------|
| (示例) Admin | Full | All | 🟢 Active |

## NP 等级定义

| 等级 | 说明 | 权限范围 |
|------|------|----------|
| **Full** | 完整 NexusPass | 所有 providers 完全访问 |
| **Limited** | 受限 NexusPass | 部分服务，需申请 |
| **Guest** | 访客 | 只读，临时授权 |

## 服务矩阵

```
              Google  GitHub  Payment
Full            ✅      ✅       ✅
Limited         ✅      ✅       ❌
Guest           ❌      ✅       ❌
```

## 申请流程

1. 提交 NP 申请 (Issue)
2. 管理员审核
3. 分配等级
4. 配置访问凭证
5. 记录入本登记表

## 安全须知

- 🔒 凭证不得明文存储于 Repo
- 🔒 使用环境变量或密钥管理服务
- 🔒 定期审计访问日志
