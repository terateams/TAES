# 🧑‍💻 GitHub Copilot 上手指南

> 从 0 到能用，预计 10 分钟

---

## 前置条件

| 条件 | 检查方式 | 未就绪怎么办 |
|------|----------|--------------|
| GitHub 账号 | 能登录 github.com | 联系 IT 开通 |
| 企业 GitHub Org 成员 | 在 org 成员列表中 | 联系 IT 邀请 |
| VS Code / JetBrains IDE | 已安装 | 自行安装 |

---

## 步骤

### Step 1: 确认席位分配 (2分钟)

1. 联系 **AITa 管理员**（或在内部系统申请）
2. 确认你已被分配 Copilot 席位
3. 收到确认邮件/消息

> 💡 席位来源：Azure IUR 红利，你无需付费

### Step 2: 接受邀请 (1分钟)

1. 检查邮箱，查找 GitHub 邀请邮件
2. 点击邀请链接
3. 接受 Copilot Business/Enterprise 授权

### Step 3: 安装插件 (3分钟)

**VS Code:**
1. 打开 VS Code
2. 扩展市场搜索 "GitHub Copilot"
3. 安装 "GitHub Copilot" 和 "GitHub Copilot Chat"
4. 重启 VS Code

**JetBrains (IntelliJ/PyCharm/...):**
1. Settings → Plugins
2. 搜索 "GitHub Copilot"
3. 安装并重启

### Step 4: 登录激活 (2分钟)

1. VS Code 左下角点击账户图标
2. 选择 "Sign in to GitHub"
3. 浏览器完成授权
4. 返回 VS Code，看到 Copilot 图标亮起 ✅

### Step 5: 验证 (2分钟)

1. 新建一个文件 `test.py`
2. 输入注释：`# 写一个快速排序函数`
3. 按 Tab 接受建议
4. 如果有代码补全 → 成功！🎉

---

## 常用功能

| 功能 | 快捷键 (VS Code) | 说明 |
|------|------------------|------|
| 代码补全 | Tab | 接受建议 |
| 下一个建议 | Alt + ] | 切换建议 |
| 打开 Chat | Ctrl + Shift + I | 对话模式 |
| Inline Chat | Ctrl + I | 行内对话 |

---

## 预计时间

| 步骤 | 时间 |
|------|------|
| 确认席位 | 2 分钟（如已分配）|
| 接受邀请 | 1 分钟 |
| 安装插件 | 3 分钟 |
| 登录激活 | 2 分钟 |
| 验证 | 2 分钟 |
| **总计** | **~10 分钟** |

---

## 遇到问题？

| 问题 | 解决 |
|------|------|
| 没收到邀请邮件 | 检查垃圾邮件 / 联系管理员 |
| 登录失败 | 确认 GitHub 账号正确 |
| 没有代码建议 | 检查右下角 Copilot 状态 |
| 提示需要付费 | 联系管理员确认席位 |

→ 更多问题见 [troubleshoot.md](troubleshoot.md)

---

## 下一步

- 📖 [Copilot 最佳实践](../AITa/Microsoft.md)
- 🎯 尝试 Agent 模式：`@workspace` 提问
- 💬 加入内部 Copilot 交流群

---

*更新时间: 2026-01-14*
