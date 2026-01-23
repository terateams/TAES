# TeamsEdge 实例协同

> **定位**：TAES 规范与 TeamsEdge 软件实例的协同契约层
>
> 规范源头：[CONTEXT/TeamsEdge/](../../CONTEXT/TeamsEdge/README.md)

---

## 协同架构

```
TAES Repo                          TeamsEdge Repo              运行实例
───────────                        ──────────────              ────────
CONTEXT/TeamsEdge/         ──→    源代码实现        ──→      TE3.lsn189.cn
(规范定义)                         (软件开发)                  (生产环境)
        │
        ↓
CONNECTION/TeamsEdge/      ←─────────────────────────────────┘
(契约层：实例如何对齐规范)          (反馈：实现状态)
```

---

## 目录结构

| 文件 | 职责 |
|------|------|
| `README.md` | 本文件，协同说明 |
| `TE3.lsn189.cn.yaml` | TE3 实例配置契约 |
| `sync-policy.md` | 规范变更同步策略 |

---

## 实例清单

| 实例 | 域名 | 环境 | 状态 |
|------|------|------|:----:|
| **TE3** | `te3.lsn189.cn` | 生产 | 🟢 |

---

## 协同职责

| 角色 | 职责 |
|------|------|
| **TAES Repo** | 定义菜单规范、ATP 框架、用户角色 |
| **TeamsEdge Repo** | 实现规范、开发功能、修复 Bug |
| **CONNECTION/TeamsEdge/** | 记录实例契约、差异、同步策略 |

---

## 相关文档

| 文档 | 说明 |
|------|------|
| [Navigation-00.md](../../CONTEXT/TeamsEdge/Navigation-00.md) | 9 个 L1 菜单定义 |
| [ATP框架.md](../../CONTEXT/TeamsEdge/ATP框架.md) | AI 托举界面框架 |
| [Personas-10.md](../../CONTEXT/TeamsEdge/Personas-10.md) | 用户角色定义 |

---

*版本: v1.0 | 创建日期: 2026-01-21*
