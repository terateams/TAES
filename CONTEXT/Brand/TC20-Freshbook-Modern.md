# TC20 Freshbook Modern Logo Prompt

> **用途**：驱动 AI 生成图章式品牌 Logo（含收款信息，双 QR 码版）  
> **主体**：TC20 — 上海元协力营人工智能科技有限公司  
> **版本**：v1.0 | 更新日期：2026-01-02 | 状态：✅ 已填写  
> **指定工具**：Gemini 3.0 Pro — Imagen（唯一）

---

## 📐 尺寸规格

| 项目 | 规格 | 说明 |
|------|------|------|
| **基准** | A4 纸张 | 宽 210mm |
| **左右留空** | 各 10mm | 内容区宽度 = 190mm |
| **高度** | 30mm | 固定高度 |
| **比例** | **19:3** | 190mm ÷ 30mm ≈ 6.33:1 |
| **像素参考** | 1900 × 300 px | 或 2280 × 360 px (高清) |

---

## 📋 品牌信息

| 字段 | 内容 |
|------|------|
| **公司全称** | 上海元协力营人工智能科技有限公司 |
| **公司代号** | TC20 |
| **英文名称** | EdgeTeams |
| **注册商标** | 元协力 ®️ · 協力營 ®️ |
| **纳税人识别号** | 91310112585227605E |
| **银行账号** | 98570078801800000025 |
| **开户行** | 浦发银行真如支行 |
| **联系电话** | 021-62455100 |
| **注册地址** | 上海市普陀区云岭西路600弄5号3层 |

---

## 🎨 Logo 生成 Prompt

### ✅ 主 Prompt（5 行文字 + 双 QR 码占位）

> **指定工具**：Gemini 3.0 Pro — Imagen（不得使用其他 AI 工具）

```
A professional corporate stamp and information panel on a pure white background, designed for A4 width with 10mm margins on each side and 30mm height, resulting in a very wide horizontal aspect ratio of approximately 19:3. 

The left side features a large, dark blue circular stamp design. Inside the dark blue outer ring with a dotted inner circle, the text "EdgeTeams®" is prominently displayed at the top in a bold, dark blue sans-serif font with a gold registered trademark symbol. Below it, the Chinese text "元协力® · 協力營®" is arranged in a clean, modern dark blue Chinese font, also with gold registered trademark symbols. 

The right side contains five lines of right-aligned, dark blue sans-serif text:
Line 1: "公司: 上海元协力营人工智能科技有限公司"
Line 2: "账号: 98570078801800000025"
Line 3: "开户行: 浦发银行真如支行"
Line 4: "电话: 021-62455100"
Line 5: "地址: 上海市普陀区云岭西路600弄5号3层"

Below or beside this text block, reserve two clean rectangular placeholder areas for QR codes side by side (do not generate QR codes, leave blank spaces with subtle dotted borders). 

The overall style is flat, clean, and professional with a very wide horizontal aspect ratio of 19:3.
```

**参数：**
```json
{
  "aspect_ratio": "19:3"
}
```

> ⚠️ **注意**：双 QR 码区域仅为占位，需后期通过 PNG 附件合成真实二维码。

---

### 🔧 Prompt 结构解析

| 元素 | 描述 | 颜色 |
|------|------|------|
| **背景** | 纯白色 + A4 边距留白 | `#FFFFFF` |
| **圆形印章** | 深蓝色外环 + 点状内圈 | Dark Blue |
| **英文商标** | EdgeTeams®，粗体无衬线，顶部居中 | 深蓝 + 金色® |
| **中文商标** | 元协力® · 協力營® | 深蓝 + 金色® |
| **右侧文字** | 5 行右对齐（公司/账号/开户行/电话/地址） | 深蓝色 |
| **双 QR 码区域** | 两个并排的预留空白矩形区域 | — |

---

### 📝 变量替换表

| 变量 | 当前值 |
|------|--------|
| `{英文名}` | EdgeTeams |
| `{商标1}` | 元协力 |
| `{商标2}` | 協力營 |
| `{公司全称}` | 上海元协力营人工智能科技有限公司 |
| `{纳税人识别号}` | 91310112585227605E |
| `{银行账号}` | 98570078801800000025 |
| `{开户行名称}` | 浦发银行真如支行 |
| `{联系电话}` | 021-62455100 |
| `{联系地址}` | 上海市普陀区云岭西路600弄5号3层 |

---

## 📐 布局示意图

```
┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                                                                                                      │
│  ┌─────┐  ┌─────────────────┐                公司: 上海元协力营人工智能科技有限公司         ┌────────┐ ┌────────┐  ┌─────┐│
│  │     │  │  ╭───────────╮  │                账号: 98570078801800000025                   │        │ │        │  │     ││
│  │ 左  │  │  │ · · · · · │  │                开户行: 浦发银行真如支行                      │  QR 1  │ │  QR 2  │  │ 右  ││
│  │ 侧  │  │  │ EdgeTeams®│  │                电话: 021-62455100                          │  占位  │ │  占位  │  │ 侧  ││
│  │ 留  │  │  │元协力·協力營│  │                地址: 上海市普陀区云岭西路600弄5号3层        │        │ │        │  │ 留  ││
│  │ 白  │  │  │ · · · · · │  │                                                            └────────┘ └────────┘  │ 白  ││
│  │     │  │  ╰───────────╯  │                                                                                    │     ││
│  └─────┘  └─────────────────┘                                                                                    └─────┘│
│                                                                                                                      │
│           [圆形印章区]                               [5 行收款信息]                         [双 QR 码占位]              │
│                                                                                                                      │
└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

尺寸: A4 宽度 (210mm) - 左右各 10mm = 190mm 内容区 × 30mm 高度
比例: 19:3 (例如: 1900 × 300 px 或 2280 × 360 px)
```

**设计特点：**
- 尺寸：A4 宽度适配，左右各留 10mm，高度 30mm
- 比例：19:3（极扁平横幅）
- 左侧：深蓝色圆形印章（外环 + 点状内圈）
- 中间：5 行右对齐公司信息（深蓝色）
- 右侧：双 QR 码占位区（由 PNG 附件后期合成）

---

## 🎯 变体版本

> 所有变体均须使用 **Gemini 3.0 Pro — Imagen** 生成

### 变体 A：双码收款版（当前模板）✅
- 左侧圆形印章 + 中间 5 行信息 + 右侧双 QR 占位
- 比例：19:3
- 适用于：收款场景、发票抬头、对公转账
- **需后期合成 QR 码 PNG 附件**

### 变体 B：单码简洁版
```
A professional corporate stamp and information panel on a pure white background, designed for A4 width with 10mm margins and 30mm height. The left side features a dark blue circular stamp with "EdgeTeams®" and "元协力® · 協力營®". The right side contains three lines: "上海元协力营人工智能科技有限公司", "账号: 98570078801800000025", "开户行: 浦发银行真如支行". One rectangular QR placeholder on the far right. Aspect ratio 19:3.
```
- 比例：19:3
- 仅 3 行文字 + 单 QR 码
- 适用于：简洁收款场景

### 变体 C：纯信息版（无 QR 码）
```
A professional corporate stamp and company header on a pure white background, designed for A4 width with 10mm margins and 30mm height. The left side features a dark blue circular stamp with "EdgeTeams®" and "元协力® · 協力營®". The right side displays five lines of company information: "上海元协力营人工智能科技有限公司", "账号: 98570078801800000025", "开户行: 浦发银行真如支行", "电话: 021-62455100", "地址: 上海市普陀区云岭西路600弄5号3层" in right-aligned dark blue text. No QR code areas. Aspect ratio 19:3.
```
- 比例：19:3
- 适用于：官方文件抬头、信纸头部

### 变体 D：含税号版（发票专用）
```
A professional corporate stamp and invoice header on a pure white background, designed for A4 width with 10mm margins and 30mm height. The left side features a dark blue circular stamp with "EdgeTeams®" and "元协力® · 協力營®". The right side contains six lines: "上海元协力营人工智能科技有限公司", "税号: 91310112585227605E", "账号: 98570078801800000025", "开户行: 浦发银行真如支行", "电话: 021-62455100", "地址: 上海市普陀区云岭西路600弄5号3层" in right-aligned dark blue text. No QR code areas. Aspect ratio 19:3.
```
- 比例：19:3
- 含纳税人识别号
- 适用于：开票信息、发票抬头

---

## 🔧 使用说明

### 指定 AI 工具（必须）

| 工具 | 规格 | 状态 |
|------|------|------|
| **Gemini 3.0 Pro — Imagen** | Google AI Studio | ✅ 唯一指定工具 |

> ⛔ **禁止使用**：ChatGPT DALL-E、Midjourney、Ideogram 等其他工具

### Gemini Imagen 使用方式

1. 访问 Google AI Studio 或 Gemini 高级版
2. 选择 Imagen 图像生成
3. 粘贴 Prompt（已填写实际值）
4. 设置比例：`19:3`
5. 生成并下载 PNG

### 后期合成流程（必须）

```
┌─────────────────────────────────────────────────────────────────────┐
│  Step 1: Gemini Imagen 生成底图（含双 QR 占位区）                   │
│                        ↓                                            │
│  Step 2: 准备双 QR 码 PNG 附件                                      │
│          - QR 码 1：微信收款码 / 企业收款码                         │
│          - QR 码 2：支付宝收款码 / 官网二维码                       │
│          - 尺寸：约 250×250 px 各                                   │
│          - 格式：PNG（透明背景优先）                                │
│                        ↓                                            │
│  Step 3: 使用 Figma / PS / Canva 合成                               │
│          - 将双 QR 码叠加到占位区                                   │
│          - 调整大小与位置                                           │
│                        ↓                                            │
│  Step 4: 导出最终版本                                               │
│          - PNG-24（高清版）                                         │
│          - JPEG（白底版，用于打印）                                 │
└─────────────────────────────────────────────────────────────────────┘
```

### QR 码 PNG 附件规范

| 项目 | 要求 |
|------|------|
| 格式 | PNG（推荐透明背景） |
| 尺寸 | 250×250 px 以上 |
| 数量 | 2 个（并排放置） |
| 来源 | 微信/支付宝官方导出 |
| 命名 | `TC20-QRCode-1.png`, `TC20-QRCode-2.png` |

---

## 📁 输出文件命名规范

```
TC20-Freshbook-Modern-{变体}-{版本}.png

示例：
- TC20-Freshbook-Modern-DualQR-v1.png     (双码收款版)
- TC20-Freshbook-Modern-SingleQR-v1.png   (单码简洁版)
- TC20-Freshbook-Modern-Header-v1.png     (纯信息版)
- TC20-Freshbook-Modern-Invoice-v1.png    (含税号发票版)
```

---

## ✅ 验收标准

### AI 生成底图验收

| 检查项 | 要求 | 状态 |
|--------|------|------|
| AI 工具 | Gemini 3.0 Pro — Imagen | ⬜ 必须 |
| 比例 | 19:3（极扁平） | ⬜ |
| 尺寸适配 | A4 宽度 - 左右各 10mm，高度 30mm | ⬜ |
| 左右留白 | 合理边距空间 | ⬜ |
| 印章样式 | 深蓝色圆形 + 点状内圈 | ⬜ |
| 英文商标 | "EdgeTeams®" 清晰可读 + 金色® | ⬜ |
| 中文商标 | "元协力®" 和 "協力營®" 完整显示 | ⬜ |
| 右侧文字 | 5 行右对齐 | ⬜ |
| 双 QR 占位区 | 两个并排的预留空白区域 | ⬜ |
| 背景 | 纯白色 | ⬜ |
| 风格 | 扁平、专业、干净 | ⬜ |

### 最终合成版验收

| 检查项 | 要求 |
|--------|------|
| QR 码来源 | 官方导出的真实收款码 PNG |
| QR 码位置 | 准确放置于双占位区 |
| QR 码清晰度 | 可正常扫码识别 |
| 整体协调 | QR 码与底图风格统一 |
| 打印测试 | A4 打印后尺寸准确 |

---

## 📎 附件清单

| 文件 | 状态 | 说明 |
|------|------|------|
| `TC20-Freshbook-Modern-Base.png` | ⬜ 待生成 | Gemini 生成的底图 |
| `TC20-QRCode-1.png` | ⬜ 待准备 | 第一个 QR 码（如微信收款） |
| `TC20-QRCode-2.png` | ⬜ 待准备 | 第二个 QR 码（如支付宝收款） |
| `TC20-Freshbook-Modern-Final.png` | ⬜ 待合成 | 最终合成版本 |

---

## 📋 开票信息速查

> 便于复制粘贴的完整开票信息

```
公司名称：上海元协力营人工智能科技有限公司
纳税人识别号：91310112585227605E
注册地址：上海市普陀区云岭西路600弄5号3层
电话：021-62455100
开户行：浦发银行真如支行
账号：98570078801800000025
```

---

*Last Updated: 2026-01-02 | Version: v1.0 (上海元协力营人工智能科技有限公司)*
