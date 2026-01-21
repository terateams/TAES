# Payment Channels Provider

> NexusPass > providers > payment

## 核心挑战

中国外汇管制下，持续稳定地按世界规则付费：

| 挑战 | 影响 |
|------|------|
| 外汇管制 | 每人每年 5 万美元额度 |
| 双币卡限制 | 部分平台不接受中国卡 |
| PayPal 限制 | 中国 PayPal 功能受限 |
| 汇率波动 | 成本不可预测 |

## 支付通道

### 主通道

| 通道 | 适用平台 | 优先级 |
|------|----------|--------|
| Visa/Mastercard (境外卡) | 通用 | ⭐⭐⭐ |
| 美区 Apple ID | App Store 订阅 | ⭐⭐⭐ |
| Stripe Link | 支持 Link 的平台 | ⭐⭐ |

### 备选通道

| 通道 | 适用场景 | 优先级 |
|------|----------|--------|
| 虚拟信用卡 | 小额订阅 | ⭐⭐ |
| 代付服务 | 大额/企业 | ⭐ |
| Crypto | 特定平台 | ⭐ |

## 订阅管理

```yaml
monthly_subscriptions:
  - service: GitHub Copilot
    amount: $19/month
    channel: 境外卡
    
  - service: Claude Pro
    amount: $20/month
    channel: 境外卡
    
  - service: ChatGPT Plus
    amount: $20/month
    channel: Apple ID

annual_review: 每年 1 月核算总成本
```

## 风险预案

- **卡片失效**: 备有 2+ 支付渠道
- **额度用尽**: 提前规划年度预算
- **平台封禁**: 记录可用替代平台
