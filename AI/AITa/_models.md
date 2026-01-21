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
| **GitHub Copilot** | Claude Sonnet 4.5 | GPT-5.2-Codex, Gemini 3 Pro | 2026-01-20 |
| **M365 Copilot** | GPT-5 | - | 2026-01 |
| **Google Gemini** | Gemini 3 Pro | Gemini 3 Flash | 2026-01-20 |

---

## 详细信息

### GitHub Copilot

| 维度 | 说明 |
|------|------|
| **代码补全** | Claude Sonnet 4.5 (默认) / GPT-5.2-Codex / Gemini 3 |
| **Copilot Chat** | Claude Sonnet 4.5 (默认) |
| **Agent 模式** | Claude Opus 4.5 / Claude Sonnet 4.5 |
| **用户可选** | ✅ 是，可在设置中切换 |

> 💡 2026年1月 GitHub 支持 Anthropic / OpenAI / Google / xAI 四家供应商

### M365 Copilot

| 维度 | 说明 |
|------|------|
| **Word/Excel/PPT** | GPT-5 |
| **Teams** | GPT-5 |
| **用户可选** | ❌ 否，由微软决定 |

> ⚠️ M365 Copilot 模型由微软统一管理，用户无法选择

### Google Gemini

| 维度 | 说明 |
|------|------|
| **Gemini Advanced** | Gemini 3 Pro (默认) |
| **快速响应** | Gemini 3 Flash |
| **用户可选** | ✅ 是，对话中可切换 |

---

## 模型能力对比

| 模型 | 上下文窗口 | 强项 | 弱项 |
|------|------------|------|------|
| Claude Opus 4.5 | 200K | 深度推理、架构 | 成本高 |
| Claude Sonnet 4.5 | 200K | 代码、推理 | 多模态 |
| GPT-5.2-Codex | 256K | 代码生成、重构 | 长上下文 |
| GPT-5.2 | 256K | 通用、创作 | 深度推理 |
| Gemini 3 Pro | 2M | 超长上下文 | 实时性 |
| Gemini 3 Flash | 2M | 速度、成本 | 复杂推理 |
| Grok Code Fast 1 | 128K | 极速响应 | 深度任务 |

---

## 更新日志

| 日期 | AITa | 变更 |
|------|------|------|
| 2026-01-20 | GitHub Copilot | 更新为 Claude Sonnet 4.5 + GPT-5.2 + Gemini 3 |
| 2026-01-14 | GitHub Copilot | GPT-5.2-Codex 正式发布 |
| 2026-01-06 | GitHub Copilot | Gemini 3 Flash 可用 |
| 2026-01 | M365 Copilot | 升级到 GPT-5 |
| 2025-12-01 | M365 Copilot | 升级到 GPT-4 Turbo |
| 2025-11-15 | Google Gemini | 升级到 Gemini 2.0 |

---

## 未来关注

| 大厂 | 预期动态 |
|------|----------|
| OpenAI | GPT-5 (2026 Q2?) |
| Anthropic | Claude Opus 4 (2026 Q1?) |
| Google | Gemini 2.5 (2026 Q2?) |

---

*更新时间: 2026-01-14*
*下次 Review: 2026-03-01*
