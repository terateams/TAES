# 🏢 Office - 办公室

> Workplace > office

## 场景描述

公司办公室、分支机构等固定办公场所。通常有最优的网络基础设施和 IT 支持。

## 网络条件

| 指标 | 规格 |
|------|------|
| 带宽 | ≥100Mbps |
| 延迟 | <50ms to AI endpoints |
| 稳定性 | 99.9% |
| 安全 | 企业防火墙 |

## 默认配置

```yaml
workplace: office
workplane:
  proxy: corp.proxy.internal
  vpn: not_required  # 内网已配置
  ai_channel: direct
workbench:
  type: desktop / laptop
  managed: true  # IT 托管设备
security:
  level: high
  data_local: false  # 可上传企业云
```

## 可用服务

- ✅ 全量 AI 服务
- ✅ GitHub 完整访问
- ✅ 大文件同步
- ✅ 视频会议

## 注意事项

- 遵守公司 IT 政策
- 敏感数据不出内网
- 使用企业账号登录
