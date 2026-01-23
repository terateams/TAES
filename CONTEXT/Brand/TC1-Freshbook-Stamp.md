# TC1 Freshbook Stamp Prompt

> **用途**：驱动 AI 生成图章式品牌 Logo（含收款信息）  
> **主体**：TC1 — 上海万联信息科技有限公司  
> **版本**：v1.1 | 更新日期：2026-01-02 | 状态：✅ 已填写  
> **指定工具**：Google Nano Banana Pro（唯一）

---

## 📋 品牌信息

| 字段 | 内容 |
|------|------|
| **公司全称** | 上海万联信息科技有限公司 |
| **公司代号** | TC1 |
| **英文名称** | TeraTeams |
| **注册商标** | TeamsCamp ®️ · E队 ®️ |
| **银行账号** | 3100 1511 9800 5600 4001 |
| **开户行** | 建行上海普陀支行 |

---

## 🎨 Logo 生成 Prompt

### ✅ 已验证版本 (Verified Prompt)

> 以下 Prompt 已实际验证可生成符合要求的输出。  
> **指定工具**：Google Nano Banana Pro（不得使用其他 AI 工具）

```
A professional corporate stamp and information panel on a pure white background with generous left and right margins. The left side features a large, dark blue circular stamp design. Inside the dark blue outer ring with a dotted inner circle, the text "TeraTeams®" is prominently displayed at the top in a bold, dark blue sans-serif font with a gold registered trademark symbol. Below it, the Chinese text "TeamsCamp® · E队®" is arranged in a clean, modern dark blue Chinese font, also with gold registered trademark symbols. The right side contains three lines of right-aligned, dark blue sans-serif text: "账号: 3100 1511 9800 5600 4001", "开户行: 建行上海普陀支行", and "上海万联信息科技有限公司". Below this text block, reserve a clean rectangular placeholder area for QR code (do not generate QR code, leave blank space). The overall style is flat, clean, and professional with a wide horizontal aspect ratio of 16:7.
```

**参数：**
```json
{
  "aspect_ratio": "16:7"
}
```

> ⚠️ **注意**：QR 码区域仅为占位，需后期通过 PNG 附件合成真实二维码。

---

### 🔧 Prompt 结构解析

| 元素 | 描述 | 颜色 |
|------|------|------|
| **背景** | 纯白色 + 左右合理留白 | `#FFFFFF` |
| **圆形印章** | 深蓝色外环 + 点状内圈 | Dark Blue |
| **TeraTeams®** | 粗体无衬线，顶部居中 | 深蓝 + 金色® |
| **中文商标** | TeamsCamp® · E队® | 深蓝 + 金色® |
| **右侧文字** | 账号/开户行/公司名，右对齐 | 深蓝色 |
| **二维码区域** | 预留空白矩形区域（后期合成） | — |

---

### 📝 变量替换表

| 变量 | 当前值 |
|------|--------|
| `{英文名商标}` | TeraTeams |
| `{中文商标1}` | TeamsCamp |
| `{中文商标2}` | E队 |
| `{银行账号}` | 3100 1511 9800 5600 4001 |
| `{开户行名称}` | 建行上海普陀支行 |
| `{公司全称}` | 上海万联信息科技有限公司 |

---

## 📐 布局示意图

```
┌──────────────────────────────────────────────────────────────────────────────────┐
│                                                                                  │
│  ┌─────┐  ┌──────────────────────┐       账号: 3100 1511 9800 5600 4001  ┌─────┐ │
│  │     │  │    ╭─────────────╮   │                                      │     │ │
│  │ 左  │  │    │  · · · · ·  │   │       开户行: 建行上海普陀支行        │ 右  │ │
│  │ 侧  │  │    │ TeraTeams®  │   │                                      │ 侧  │ │
│  │ 留  │  │    │TeamsCamp®·E队®│   │       上海万联信息科技有限公司       │ 留  │ │
│  │ 白  │  │    │  · · · · ·  │   │                                      │ 白  │ │
│  │     │  │    ╰─────────────╯   │            ┌───────────┐             │     │ │
│  │     │  │                      │            │ QR 占位区  │             │     │ │
│  └─────┘  └──────────────────────┘            │ (后期合成) │             └─────┘ │
│                                               └───────────┘                      │
│           [圆形印章区]                      [收款信息 + 二维码占位]               │
│                                                                                  │
└──────────────────────────────────────────────────────────────────────────────────┘

比例: 16:7 (例如: 1600 x 700 px 或 1920 x 840 px) — 更扁平
```

**设计特点：**
- 比例：16:7（更扁平的横向布局）
- 左右留白：合理的边距空间
- 左侧：深蓝色圆形印章（外环 + 点状内圈）
- 右侧上方：三行右对齐银行信息（深蓝色）
- 右侧下方：QR 码占位区（由 PNG 附件后期合成）

---

## 🎯 变体版本

> 所有变体均须使用 **Google Nano Banana Pro** 生成

### 变体 A：收款版（当前验证版本）✅
- 左侧圆形印章 + 右侧银行信息 + QR 占位区
- 比例：16:7
- 适用于：收款场景、对公转账、支付页面
- **需后期合成 QR 码 PNG 附件**

### 变体 B：简洁版（仅印章）
```
A professional circular corporate stamp on a pure white background. The stamp features a dark blue outer ring with a dotted inner circle. The text "TeraTeams®" is prominently displayed at the top in a bold, dark blue sans-serif font with a gold registered trademark symbol. Below it, the Chinese text "TeamsCamp® · E队®" is arranged in a clean, modern dark blue Chinese font, also with gold registered trademark symbols. The overall style is flat, clean, and professional. Square aspect ratio 1:1.
```
- 比例：1:1
- 仅显示圆形印章
- 适用于：名片、水印、图标

### 变体 C：横幅版（无二维码）
```
A professional corporate stamp and company information on a pure white background with generous left and right margins. The left side features a large, dark blue circular stamp design with a dotted inner circle, containing "TeraTeams®" at the top and "TeamsCamp® · E队®" below, both with gold trademark symbols. The right side displays "上海万联信息科技有限公司" in right-aligned dark blue text. The overall style is flat, clean, and professional with aspect ratio 16:7.
```
- 比例：16:7
- 适用于：官方文件抬头、邮件签名

---

## 🔧 使用说明

### 指定 AI 工具（必须）

| 工具 | 规格 | 状态 |
|------|------|------|
| **Google Nano Banana Pro** | Google AI Studio | ✅ 唯一指定工具 |

> ⛔ **禁止使用**：ChatGPT DALL-E、Midjourney、Ideogram、Gemini Imagen 等其他工具

### Google Nano Banana Pro 使用方式

1. 访问 Google AI Studio
2. 选择 Nano Banana Pro 图像生成
3. 粘贴已验证 Prompt
4. 设置比例：`16:7`
5. 生成并下载 PNG

### 后期合成流程（必须）

```
┌─────────────────────────────────────────────────────────────┐
│  Step 1: Nano Banana Pro 生成底图（含 QR 占位区）            │
│                        ↓                                    │
│  Step 2: 准备 QR 码 PNG 附件                                │
│          - 微信收款码 / 支付宝收款码 / 企业收款码            │
│          - 尺寸：约 200x200 px                              │
│          - 格式：PNG（透明背景优先）                        │
│                        ↓                                    │
│  Step 3: 使用 Figma / PS / Canva 合成                       │
│          - 将 QR 码叠加到占位区                             │
│          - 调整大小与位置                                   │
│                        ↓                                    │
│  Step 4: 导出最终版本                                       │
│          - PNG-24（高清版）                                 │
│          - JPEG（白底版，用于打印）                         │
└─────────────────────────────────────────────────────────────┘
```

### QR 码 PNG 附件规范

| 项目 | 要求 |
|------|------|
| 格式 | PNG（推荐透明背景） |
| 尺寸 | 200×200 px 以上 |
| 来源 | 微信/支付宝官方导出 |
| 命名 | `TC1-QRCode-WeChat.png` 或 `TC1-QRCode-Alipay.png` |

---

## 📁 输出文件命名规范

```
TC1-Freshbook-Stamp-{变体}-{版本}.png

示例：
- TC1-Freshbook-Stamp-Official-v1.png    (正式版)
- TC1-Freshbook-Stamp-Simple-v1.png      (简洁版)
- TC1-Freshbook-Stamp-Payment-v1.png     (收款版)
```

---

## ✅ 验收标准

### AI 生成底图验收

| 检查项 | 要求 | 状态 |
|--------|------|------|
| AI 工具 | Google Nano Banana Pro | ⬜ 必须 |
| 比例 | 16:7（更扁平） | ⬜ |
| 左右留白 | 合理边距空间 | ⬜ |
| 印章样式 | 深蓝色圆形 + 点状内圈 | ⬜ |
| 英文名 | "TeraTeams®" 清晰可读 + 金色® | ⬜ |
| 中文商标 | "TeamsCamp®" 和 "E队®" 完整显示 | ⬜ |
| 银行信息 | 账号、开户行、公司名三行右对齐 | ⬜ |
| QR 占位区 | 预留干净矩形空间（非 AI 生成二维码） | ⬜ |
| 背景 | 纯白色 | ⬜ |
| 风格 | 扁平、专业、干净 | ⬜ |

### 最终合成版验收

| 检查项 | 要求 |
|--------|------|
| QR 码来源 | 官方导出的真实收款码 PNG |
| QR 码位置 | 准确放置于占位区 |
| QR 码清晰度 | 可正常扫码识别 |
| 整体协调 | QR 码与底图风格统一 |

---

## 📎 附件清单

| 文件 | 状态 | 说明 |
|------|------|------|
| `TC1-Freshbook-Stamp-Base.png` | ⬜ 待生成 | Nano Banana Pro 生成的底图 |
| `TC1-QRCode-WeChat.png` | ⬜ 待准备 | 微信收款码 |
| `TC1-QRCode-Alipay.png` | ⬜ 待准备 | 支付宝收款码 |
| `TC1-Freshbook-Stamp-Final.png` | ⬜ 待合成 | 最终合成版本 |

---

*Last Updated: 2026-01-02 | Version: v1.1 (上海万联信息科技有限公司 / Google Nano Banana Pro)*
