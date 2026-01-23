# 🌐 Workplane - 网络层

> CONNECTION > Workplane
> 
> **5W: How — 数据包如何到达目的地？**
> 
> *管理的稀缺性：带宽稀缺（通道有限、质量不一）*
>
> 📋 **上级文档**：[Augment.md](../../CONTEXT/TAES/Framework/Augment.md) — TAES 四字之 A 的组织化实现

## 概述

Workplane 定义了数据传输的路由策略。在中国环境下，这是最关键的技术层——决定了能否真正"连上"。

## 通道类型

| 类型 | 代号 | 适用场景 | 延迟 | 稳定性 |
|------|------|----------|------|--------|
| 直连 | `direct` | 内网/国内服务 | <50ms | 99% |
| 企业 VPN | `corp.vpn` | 办公室环境 | <100ms | 98% |
| 自建代理 | `self_hosted` | 居家办公 | <200ms | 95% |
| 商业代理 | `commercial` | 备选方案 | <300ms | 90% |
| 移动备选 | `mobile_fallback` | 出差/应急 | 不定 | 70% |

## 📡 Network Substrate (网络基建)
- **Requirement**: Low Latency (<200ms) to AI Endpoints
- **Strategy**: 
  - 内网直连 M365 (数据吞吐)
  - 专线连接 LLM API (低抖动)

## 🧠 AI Channel (智能通道)
- **Provider**: Google / Anthropic / OpenAI
- **Governance**:
  - **Data Privacy**: 严禁上传 PII (个人敏感信息)
  - **Account Safety**: 多账号冗余策略

## 路由选择逻辑

```
检测当前 Workplace
    ↓
加载对应 Workplane 配置
    ↓
测试主通道延迟
    ↓
延迟 < 阈值？ ──是──→ 使用主通道
    │
    否
    ↓
尝试备选通道
    ↓
全部失败？ ──是──→ 进入 OFFLINE 模式
```

## 降级策略

| 级别 | 触发条件 | 行为 |
|------|----------|------|
| L0 正常 | 延迟 < 200ms | 全量服务 |
| L1 受限 | 延迟 200-500ms | 禁用视频/大文件 |
| L2 最小 | 延迟 > 500ms | 仅文本通讯 |
| L3 离线 | 无法连接 | 本地缓存模式 |

## 安全要求

- ⚠️ 所有外部流量必须加密
- ⚠️ 禁止使用公共代理传输敏感数据
- ⚠️ 定期更换代理节点
- ⚠️ 监控异常流量
