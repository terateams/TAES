# 🏠 Home - 居家办公

> Workplace > home

## 场景描述

远程办公、居家办公。网络由成员自行维护，质量参差不齐，但通常有较好的私密性。

## 网络条件

| 指标 | 规格 |
|------|------|
| 带宽 | 50-500Mbps（家庭宽带） |
| 延迟 | 50-150ms |
| 稳定性 | 85-99%（视 ISP） |
| 安全 | 需自建代理 |

## 默认配置

```yaml
workplace: home
workplane:
  proxy: self_hosted  # 自建代理
  vpn: recommended
  ai_channel: direct_via_proxy
workbench:
  type: personal_laptop / desktop
  managed: false  # 个人设备
security:
  level: self_managed
  data_local: recommended
```

## 可用服务

- ✅ 全量 AI 服务（需配置代理）
- ✅ GitHub 完整访问
- ✅ 大文件同步
- ✅ 视频会议

## 成员责任

- 自行维护代理服务
- 确保网络稳定性
- 保护设备安全
- 遵守数据保护规范

## 推荐配置

```bash
# 代理建议
- Clash / Surge / V2Ray
- 备用线路 ≥2 条
- 自动故障切换
```
