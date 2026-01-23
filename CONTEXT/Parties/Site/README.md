---
type: resource
entity: Site
owner: TeamsCamp
status: active
created: 2026-01-21
---

# Site（据点）

> **一句话**：E队 执行 Mission 的物理或逻辑工作站点——"人在哪里工作"。

---

## 定义

**Site（据点）** 是 T营 分配给 E队 的工作空间：
- **物理站点**：办公室、仓库、车间
- **逻辑站点**：居家办公、移动办公

与 [POP](../POP/README.md)（网络接入点）的区别：
- **POP** = bit 可靠（网络层）
- **Site** = 人、设备、空间的组织单元（组织层）

---

## 站点类型

| 类型 | 英文 | 说明 | 规范文档 |
|------|------|------|----------|
| 🏢 办公室 | Office | 固定工位 | [office.md](../../../CONNECTION/Workplace/office.md) |
| 🏠 居家 | Home | 远程办公 | [home.md](../../../CONNECTION/Workplace/home.md) |
| 📱 移动 | Mobile | 出差/外勤 | [mobile.md](../../../CONNECTION/Workplace/mobile.md) |
| 📦 仓库 | Warehouse | 物料存储 | [warehouse.md](../../../CONNECTION/Workplace/warehouse.md) |
| 🔧 车间 | Workshop | 生产制造 | [workshop.md](../../../CONNECTION/Workplace/workshop.md) |

---

## 核心字段

| 字段 | 类型 | 说明 |
|------|------|------|
| `site_id` | string | 站点唯一标识 |
| `site_type` | enum | office / home / mobile / warehouse / workshop |
| `et_code` | string | 归属的 E队 |
| `location` | string | 地理位置 / 逻辑标识 |
| `pop_id` | string | 关联的 POP（网络接入点） |
| `status` | enum | active / inactive |

---

## 与其他实体的关系

```
Site (据点)
    │
    ├── → POP：通过 POP 获得网络可达性
    ├── → EdgeTeam：归属于 E队
    └── → NexusPass：站点内成员使用 NexusPass 认证
```

---

## 边界（Limit）

| ❌ 不是 | ✅ 是 |
|--------|-------|
| 网络层（归 POP） | 组织层（人+设备+空间） |
| 算力资源（归 AITC） | 工作环境 |
| 身份管理（归 NexusPass） | 空间授权 |

---

## 与 CONNECTION/Workplace/ 的关系

- **Site（本文档）**：实体定义——"据点是什么"
- **Workplace/**：操作规范——"据点怎么用"

---

*版本: v1.0 | 创建日期: 2026-01-21*
