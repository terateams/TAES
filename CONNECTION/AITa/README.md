# 📋 AITa 清单

> **Token 可用** — 托举效应的另一半
> 
> E队可用的 AGI 红利路径

---

## 什么是 AITa？

**AITa** /ˈaɪtɑː/ — 内部黑话，注册商标

| 释义 | 全称 | 含义 |
|------|------|------|
| **官方** | AI TeamsCamp Augmented | 团队营地增强 — 商标注册名 |
| **内部** | AI Token Arbitrage | AI 额度套利 — 红利路径的本质 |

---

## 🔗 为什么 AITa 在 CONNECTION/ 下？

> **托举效应 = 网络可靠 (bit) × AI可用 (Token)**
>
> 📋 **上级文档**：[Augment.md](../Augment.md) — TAES 四字之 A 的组织化实现

| 组件 | 含义 | 位置 | TAES 映射 |
|------|------|------|-----------|
| **Workplane** | bit 可靠 | `CONNECTION/Workplane/` | A (基础设施) |
| **AITa** | Token 可用 | `CONNECTION/AITa/` ← 你在这里 | A (基础设施) |

两者都是 **T营 持有的托举基础设施**，共同构成 TAES 中 **A (Augment)** 的物理实现。

---

## AITa 总览

| 大厂 | AITa 数量 | 红利路径 |
|------|-----------|----------|
| [Microsoft](Microsoft.md) | 2 | IUR + Benefit |
| [Google](Google.md) | 1 | 代付 |
| **总计** | **3** | |

---

## 完整清单

| # | 大厂 | AITa | 红利路径 | E队成本 |
|---|------|------|----------|---------|
| 1 | Microsoft | GitHub Copilot | Azure IUR | $0 |
| 2 | Microsoft | M365 Copilot | M365 Benefit | $0 |
| 3 | Google | Google Gemini | 代付 | $0 |

---

## 选择指南

```
写代码？ → GitHub Copilot (Microsoft)
    ↓ 不是
写文档/PPT？ → M365 Copilot (Microsoft)
    ↓ 不是
长文本/深度分析？ → Google Gemini (Google)
```

---

## 与 CONNECTION 其他层的关系

| AITa | CONNECTION 依赖 | 状态 |
|------|-----------------|------|
| GitHub Copilot | Workpass/github | ✅ |
| M365 Copilot | Workpass/payment (Benefit) | ✅ |
| Google Gemini | Workpass/google + Workplane | ✅ |

---

## 生产运维

AITa 的生产运维（如何让这些红利路径可用）：

→ 详见 [../../AI/AAI/](../../AI/AAI/)

---

## 目录结构

```
CONNECTION/AITa/
├── README.md           # ← 你在这里：AITa 总览
├── Microsoft.md        # 微软体系 (Copilot + M365)
├── Google.md           # Google 体系 (Gemini)
├── _models.md          # 模型层追踪
├── _template.md        # 新增 AITa 模板
└── _meta.yaml          # 结构化元数据 (AI 可读)
```

---

*更新时间: 2026-01-19*
