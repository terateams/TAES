# 🏭 Workshop - 车间

> Workplace > workshop

## 场景描述

生产车间、实验室、制造现场等。网络可能受限（防干扰、安全隔离），但有特定业务需求。

## 网络条件

| 指标 | 规格 |
|------|------|
| 带宽 | 10-50Mbps |
| 延迟 | <200ms |
| 稳定性 | 95% |
| 安全 | 工业隔离网络 |

## 默认配置

```yaml
workplace: workshop
workplane:
  proxy: workshop.gateway
  vpn: required  # 需要 VPN 穿透
  ai_channel: cached  # 优先本地缓存
workbench:
  type: rugged_tablet / industrial_pc
  managed: true
security:
  level: medium
  data_local: true  # 数据本地处理
```

## 可用服务

- ✅ 基本 AI 查询（缓存优先）
- ⚠️ GitHub（仅 pull，限制 push）
- ❌ 大文件同步（带宽受限）
- ⚠️ 文字通讯（视频受限）

## 特殊需求

- 离线模式支持
- 低带宽优化
- 抗干扰设计
