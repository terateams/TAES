# 🚀 Mobile - 移动办公

> Workplace > mobile

## 场景描述

出差、旅途、临时办公点（咖啡厅、酒店、机场）。网络条件不可预测，需要最大灵活性。

## 网络条件

| 指标 | 规格 |
|------|------|
| 带宽 | 不可预测（1-100Mbps） |
| 延迟 | 不可预测（50-500ms） |
| 稳定性 | 低（50-90%） |
| 安全 | 公共网络，高风险 |

## 默认配置

```yaml
workplace: mobile
workplane:
  proxy: mobile_fallback  # 多重备选
  vpn: required  # 强制 VPN
  ai_channel: adaptive  # 自适应
workbench:
  type: laptop / phone / tablet
  managed: partial
security:
  level: paranoid  # 最高警惕
  data_local: true  # 敏感数据不上传
```

## 可用服务

- ⚠️ AI 服务（降级模式）
- ⚠️ GitHub（仅紧急操作）
- ❌ 大文件操作
- ✅ 基本通讯

## 生存策略

### 网络备选链
```
1. 酒店/场所 Wi-Fi + VPN
2. 手机热点 + 代理
3. 漫游数据（紧急）
4. 离线模式（最后手段）
```

### 安全要求
- ⚠️ 不使用公共 Wi-Fi 传输敏感数据
- ⚠️ 强制 VPN 加密
- ⚠️ 公共场所注意屏幕隐私
- ⚠️ 设备离身必锁屏

## 出差前检查清单

- [ ] VPN 配置已测试
- [ ] 手机热点流量充足
- [ ] 离线资料已同步
- [ ] 紧急联系方式已记录
