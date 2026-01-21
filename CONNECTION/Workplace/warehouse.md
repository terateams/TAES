# 📦 Warehouse - 仓库

> Workplace > warehouse

## 场景描述

物流仓库、配送中心、存储设施等。网络覆盖可能不均匀，移动作业为主。

## 网络条件

| 指标 | 规格 |
|------|------|
| 带宽 | 10-30Mbps |
| 延迟 | <300ms |
| 稳定性 | 90% |
| 安全 | 基本 Wi-Fi |

## 默认配置

```yaml
workplace: warehouse
workplane:
  proxy: warehouse.ap
  vpn: optional
  ai_channel: lightweight  # 轻量模式
workbench:
  type: handheld / phone / tablet
  managed: partial
security:
  level: basic
  data_local: true
```

## 可用服务

- ✅ 轻量 AI（快速问答）
- ⚠️ GitHub（移动端 App）
- ❌ 大文件操作
- ✅ 即时通讯

## 优化策略

- 预加载常用数据
- 离线任务队列
- 网络恢复后批量同步
