# 🛠️ Workbench - 设备层

> CONNECTION > Workbench
> 
> **5W: What — 用什么设备工作？**
> 
> *管理的稀缺性：设备稀缺（并非所有设备都有能力连接外网）*

## 概述

Workbench 定义了 E队成员使用的物理设备和工具链。设备是人与数字世界的接口。

## 设备类型

| 类型 | 代号 | 典型设备 | 能力等级 |
|------|------|----------|----------|
| 🖥️ 桌面 | `desktop` | 公司台式机 | 完整 |
| 💻 笔记本 | `laptop` | MacBook / ThinkPad | 完整 |
| 📱 平板 | `tablet` | iPad / Surface | 受限 |
| 📲 手机 | `phone` | iPhone / Android | 基本 |

## ✅ 必备工具清单 (Must-Have)

| # | 工具/服务 | 说明 | 用途 |
|---|-----------|------|------|
| 1 | **VS Code** | Visual Studio Code | 核心开发编辑器 |
| 2 | **GitHub Enterprise + Copilot Enterprise License** | 企业级 GitHub 与 AI 编程助手 | 代码托管 + AI 增强开发 |
| 3 | **Microsoft 365 E1** | 微软企业办公套件 | 基础办公协作 |
| 4 | **Teams (M365)** | Microsoft Teams | 团队沟通与协作中枢 |
| 5 | **Edge + Work/School Profile** | Edge 浏览器企业配置 | 统一身份与安全浏览 |
| 6 | **TeamsEdge by TeamsCamp** | TeamsCamp 专属协作框架 | E队协作方法论实践 |
| 7 | **E Kard / V Kard / O Kard** | 身份卡三件套 | 身份验证与权限管理 |

> 💡 以上 7 项为 E队成员标准配置，缺一不可。

---

## 🖥️ Device & OS (设备与系统)
- **Host**: Windows PC / macOS / Linux
- **Shell**: PowerShell 7+ / zsh / bash
- **Environment**: Local Development

## 🧰 Toolchain (工具链)
- **Core**: Visual Studio Code
- **Extensions**:
  - GitHub Copilot (Enterprise)
  - Markdown All in One
  - GitHub Pull Requests
- **Local Scripts**: `tools/` (已集成在此目录下)

## ⚙️ Configuration (配置)
- **Sync**: Settings Sync Enabled
- **Profile**: Mission Repo Standard
- **Browser**: Edge with Work/School Profile

## 目录结构

```
Workbench/
├── README.md           # 本文件
├── Manual/             # 操作手册（新手入职）
│   ├── 01-github-basics.md
│   ├── 02-collaboration.md
│   ├── 03-project-management.md
│   ├── 04-copilot-guide.md
│   ├── 05-mr-convention.md
│   └── FAQ.md
└── tools/              # 基础设施脚本
    └── generate_audio.ps1
```

## 设备准入要求

| 要求 | 说明 |
|------|------|
| 网络能力 | 能配置代理/VPN |
| 存储空间 | ≥50GB 可用 |
| 开发环境 | Git + VS Code |
| 安全要求 | 磁盘加密、锁屏密码 |
