# 📍 Workplace - 工作场所层

> CONNECTION > Workplace
> 
> **5W: Where — 在哪工作？**
> 
> *管理的稀缺性：空间稀缺（并非所有地点都能联网）*

## 概述

Workplace 定义了 E队成员可能工作的物理据点。不同据点有不同的网络条件、设备配置和安全要求。

## 据点清单

| 据点 | 代号 | 典型场景 | 网络条件 | 推荐 Workplane |
|------|------|----------|----------|----------------|
| 🏢 办公室 | `office` | 公司总部、分支机构 | 最优 | direct / corp.vpn |
| 🏭 车间 | `workshop` | 生产现场、实验室 | 受限 | workshop.gateway |
| 📦 仓库 | `warehouse` | 物流中心、配送站 | 基本 | warehouse.ap |
| 🏠 居家 | `home` | 远程办公、居家办公 | 自建 | self_hosted proxy |
| 🚀 移动 | `mobile` | 出差、旅途、临时 | 不稳定 | mobile_fallback |

## 目录结构

```
Workplace/
├── README.md           # 本文件
├── office.md           # 办公室配置
├── workshop.md         # 车间配置
├── warehouse.md        # 仓库配置
├── home.md             # 居家配置
└── mobile.md           # 移动办公配置
```

## 据点选择逻辑

```
成员登录 MR 系统
    ↓
检测当前网络环境
    ↓
匹配 Workplace 配置
    ↓
加载对应的 Workplane 设置
    ↓
检查 Worktime 状态
    ↓
建立 Connection
```

## 配置继承

每个据点配置包含：
- **网络模板**: 默认 Workplane 配置
- **设备要求**: 最低 Workbench 规格
- **安全策略**: 数据保护级别
- **降级方案**: 网络不佳时的备选

---

> *Workplace 是 CONNECTION 的第一层——先确定"在哪"，才能配置"怎么连"。*
