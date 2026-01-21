# 🧬 模型层追踪

> 每个 AITa 底层使用的模型

---

## 为什么需要追踪？

2026 年，LLM 每 6 个月翻一番。AITa 产品不变，但底层模型可能更新：

```
GitHub Copilot (产品不变)
├── 2025 Q4: GPT-4 Turbo
├── 2026 Q1: Claude Sonnet 4 + GPT-4o  ← 当前
└── 2026 Q3: ??? (待更新)
```

---

## 当前模型矩阵

| AITa | 主模型 | 备选模型 | 更新时间 |
|------|--------|----------|----------|
| **GitHub Copilot** | Claude Sonnet 4 | GPT-4o, Gemini 2.0 | 2026-01 |
| **M365 Copilot** | GPT-4 Turbo | - | 2025-12 |
| **Google Gemini** | Gemini 2.0 Pro | Gemini 2.0 Flash | 2026-01 |

---

## 详细信息

### GitHub Copilot

| 维度 | 说明 |
|------|------|
| **代码补全** | Claude Sonnet 4 (默认) / GPT-4o / Gemini 2.0 |
| **Copilot Chat** | Claude Sonnet 4 (默认) |
| **Agent 模式** | Claude Sonnet 4 |
| **用户可选** | ✅ 是，可在设置中切换 |

> 💡 2026年1月 GitHub 开放多模型选择，用户可自行切换

### M365 Copilot

| 维度 | 说明 |
|------|------|
| **Word/Excel/PPT** | GPT-4 Turbo |
| **Teams** | GPT-4 Turbo |
| **用户可选** | ❌ 否，由微软决定 |

> ⚠️ M365 Copilot 模型由微软统一管理，用户无法选择

### Google Gemini

| 维度 | 说明 |
|------|------|
| **Gemini Advanced** | Gemini 2.0 Pro (默认) |
| **快速响应** | Gemini 2.0 Flash |
| **用户可选** | ✅ 是，对话中可切换 |

---

## 季度评估机制

T营 每季度评估 Frontier Model，确保 E队 使用"当季最强"：

| 季度 | 评估日期 | 更新内容 |
|------|----------|----------|
| 2026 Q1 | 2026-01-14 | GitHub Copilot 默认切换 Claude Sonnet 4 |
| 2026 Q2 | (待定) | - |

---

*更新时间: 2026-01-19*
