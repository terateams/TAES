# 🔧 AAI - Augmented AITa

> AITa 的生产运维层

---

## 什么是 AAI？

**AAI** = Augmented AITa = AITa 增强/生产

```
AITa = E队看到的菜单（使用层）
AAI  = 我们如何让 AITa 可用（生产层）
```

---

## 为什么需要 AAI？

| 维度 | AITa | AAI |
|------|------|-----|
| **视角** | E队（消费者） | 我们（生产者） |
| **关注** | 能用什么 AI | 如何让 AI 可用 |
| **复杂度** | 简单（选择即用） | 复杂（合作伙伴运维） |

---

## 生产运维矩阵

| 大厂 | AITa 产出 | 运维复杂度 | 核心活动 |
|------|-----------|------------|----------|
| [Microsoft](Microsoft/) | 2 个 | ⭐⭐⭐⭐⭐ | 合作伙伴身份、IUR、Benefit |
| [Google](Google/) | 1 个 | ⭐⭐⭐ | 代付流程、账号管理 |

---

## Microsoft 运维（高复杂度）

```
Microsoft Partner Network (MPN)
    ↓
合作伙伴等级维护
    ↓
├── Azure IUR 申请 → GitHub Copilot
└── M365 Benefit 分配 → M365 Copilot
```

详见：
- [Microsoft/partner.md](Microsoft/partner.md) - 合作伙伴身份
- [Microsoft/iur.md](Microsoft/iur.md) - IUR 申请与使用
- [Microsoft/benefit.md](Microsoft/benefit.md) - Benefit 分配

---

## Google 运维（中复杂度）

```
代付账号体系
    ↓
集中采购
    ↓
额度分发 → Google Gemini
```

详见：
- [Google/proxy.md](Google/proxy.md) - 代付流程

---

## 年度运维日历

| 月份 | Microsoft | Google |
|------|-----------|--------|
| 1月 | MPN 年度审计准备 | |
| 3月 | IUR 额度确认 | |
| 6月 | Benefit 中期检查 | 代付续费 |
| 9月 | MPN 等级评估 | |
| 12月 | 年度续期 | 年度结算 |

---

## 与 AITa 的关系

```
AAI (生产)           AITa (消费)
──────────          ────────────
Microsoft/    →     Microsoft.md
├── partner.md      ├── GitHub Copilot
├── iur.md          └── M365 Copilot
└── benefit.md

Google/       →     Google.md
└── proxy.md        └── Gemini
```

**AAI 就绪 → AITa 可用**

---

*更新时间: 2026-01-14*
