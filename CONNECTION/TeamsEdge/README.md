# TeamsEdge 实例协同

> **定位**：TAES 规范与 TeamsEdge 软件实例的协同契约层
>
> 规范源头：[CONTEXT/TeamsEdge/](../../CONTEXT/TeamsEdge/README.md)

---

## 为什么放在 CONNECTION 下？（核心解释）

把 TeamsEdge 放在 `CONNECTION/` 下，不是在说“TeamsEdge 属于网络/代理”，而是在说：

- **这里存的是“实例可达 + 实例对齐”的契约与证据**：域名、环境、菜单版本、与 TAES 规范的差异清单。
- 这些内容的性质是 **C¹（可达性基础设施）的一部分**：它决定“人/AI 能不能稳定进入 TeamsEdge 运行实例”，以及“进入之后看到的是不是 TAES 对齐后的系统”。

同一个 TeamsEdge 有三层不同的“存在方式”，分别应该落在不同目录：

- **规范层（What/Why）**：放在 [CONTEXT/TeamsEdge/README.md](../../CONTEXT/TeamsEdge/README.md)（产品规格、信息架构、ATP 框架、角色定义）。
- **实现层（How/Build）**：放在 TeamsEdge 独立代码仓库（软件开发与发布节奏）。
- **实例层（How/Run）**：放在 `CONNECTION/TeamsEdge/`（接入契约、运行实例清单、对齐状态、同步策略）。

> 一句话：`CONNECTION/TeamsEdge` 管的是“能不能用、用到的是什么版本”，而不是“TeamsEdge 是什么”。

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

## TeamsEdge × VS Code：控制面与执行面（你提到的“工作台”视角）

你说“TeamsEdge 与 VS Code 一起工作，服务 TAES 系统的工作台”，这句话非常对，但需要再切一刀：

- **VS Code（Workbench）是执行面**：人在本机/IDE 里把 Mission 做完（编辑、运行、生成、评测、留痕）。它属于 [CONNECTION/Workbench/README.md](../Workbench/README.md) 所描述的“设备与工具链”。
- **TeamsEdge 是控制面**：把 E队、AO/AR（Org/Repo）、Workplane、AITa、证据与结算等“组织级对象”管理起来，并把“执行规则”对齐到 TAES。

控制面与执行面是强耦合协同，但**不应该落在同一个目录层级**：
- 放一起会让“产品规格/治理规则”和“运行实例/接入配置”混成一锅，后续公开推广时最容易爆炸（权限、披露边界、版本节奏都不同）。

---

## 目录结构

| 文件 | 职责 |
|------|------|
| `README.md` | 本文件，协同说明 |
| `Te3.lsn189.cn.md` | TE3 实例对齐（菜单结构/版本/差异）的契约与证据 |

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
