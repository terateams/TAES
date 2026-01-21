# 视觉识别 (Visual Identity)

> **定位**：品牌视觉规范  
> 核心问题：**"品牌长什么样？"**

---

## 📁 目录结构

```
Identity/
├── README.md             # 本文件 - 视觉规范总览
│
├── AlliedAI/             # Allied AI 品牌视觉
│   ├── AlliedAI.md      # 品牌说明
│   └── Logo.md          # Logo 设计规范
│
├── TeamsCamp/            # TeamsCamp 品牌视觉
│   ├── TC1/             # TC1 视觉资产
│   │   ├── Freshbook-Stamp.md
│   │   └── Logo-Stamp.md
│   └── TC20/            # TC20 视觉资产
│       ├── Freshbook-Modern.md
│       └── Logo-Stamp.md
│
└── TeamsEdge/            # TeamsEdge 主品牌 (计划)
    └── (待补充)
```

---

## 全局视觉规范

### 色彩系统 (Color Palette)

| 品牌 | 主色 | Hex | 辅色 | 用途 |
|------|------|-----|------|------|
| **TeamsEdge** | 深蓝 | `#1a365d` | 科技银 | 主品牌 |
| **TeamsCamp** | 森绿 | `#2d5016` | 暖棕 | T营 |
| **EdgeTeam** | 活力橙 | `#c05621` | 钢灰 | E队 |
| **Allied AI** | 蓝染 (Aizome) | `#003366` | 樱色 | 教育 |

### 字体规范 (Typography)

| 用途 | 英文 | 中文 | 日文 |
|------|------|------|------|
| 标题 | Inter Bold | 思源黑体 Bold | Noto Sans JP Bold |
| 正文 | Inter Regular | 思源黑体 Regular | Noto Sans JP Regular |
| 代码 | JetBrains Mono | - | - |

### Logo 使用规范

```
┌─────────────────────────────────────────────────────────────────┐
│                    Logo 安全区域                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│       ┌─────────────────────────────────────────┐              │
│       │                                         │              │
│       │    ┌───┐                               │              │
│       │    │   │ ← 最小安全边距 = Logo 高度 × 0.5 │              │
│       │    │ L │                               │              │
│       │    │ O │                               │              │
│       │    │ G │                               │              │
│       │    │ O │                               │              │
│       │    │   │                               │              │
│       │    └───┘                               │              │
│       │                                         │              │
│       └─────────────────────────────────────────┘              │
│                                                                 │
│  最小尺寸: 数字媒体 24px 高度 / 印刷品 8mm 高度                   │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## 品牌视觉索引

### Allied AI

| 文档 | 说明 |
|------|------|
| [AlliedAI/AlliedAI.md](AlliedAI/AlliedAI.md) | Allied AI 品牌完整说明 |
| [AlliedAI/Logo.md](AlliedAI/Logo.md) | Logo 设计 Prompt 与规范 |

### TeamsCamp

| 文档 | 说明 |
|------|------|
| [TeamsCamp/TC1/Freshbook-Stamp.md](TeamsCamp/TC1/Freshbook-Stamp.md) | TC1 鲜书签章 |
| [TeamsCamp/TC1/Logo-Stamp.md](TeamsCamp/TC1/Logo-Stamp.md) | TC1 Logo 签章 |
| [TeamsCamp/TC20/Freshbook-Modern.md](TeamsCamp/TC20/Freshbook-Modern.md) | TC20 现代鲜书 |
| [TeamsCamp/TC20/Logo-Stamp.md](TeamsCamp/TC20/Logo-Stamp.md) | TC20 Logo 签章 |

---

## 设计资产管理

- **源文件位置**：各品牌文件夹内的 .md 文件包含设计 Prompt
- **生成工具**：DALL-E / Midjourney / Figma
- **导出格式**：
  - Web: SVG (首选), PNG (备用)
  - Print: PDF, AI
  - Favicon: ICO, 32x32 PNG
