# ☁️ Cloudflare Infrastructure (Infa)

> **Role**: Mission Repo 的数字底座与边缘基础设施。
> **Philosophy**: 以最低成本构建最高效、安全的全球分发与协作平面。

---

## 🔐 一、 账号定义 (Account Definition)

*   **登录方式 (Login)**: 统一使用企业级 GitHub 账号进行 SSO 关联登录，或指定管理员邮箱 + 强密码 + 2FA 认证。
*   **付款方式 (Payment)**: 绑定企业外币信用卡 (Visa/Mastercard)，用于域名续费及潜在的按需付费服务。

---

## 🌐 二、 域名资产 (Domain Assets)

*   **采购策略**: 域名统一通过 Cloudflare Registrar 进行采购与托管，确保价格透明（无溢价）且与 Pages/Workers 无缝集成。
*   **关联 Repo**: 每一个 Mission Repo 对应一个子域名或特定的路由规则，实现“一任务一站点”。

---

## 💰 三、 成本分析 (Cost Analysis)

基于当前 Mission 的资源消耗评估，月度预算控制在 **$1.00** 以内：

| 项目 | 费用 (月) | 备注 |
| :--- | :--- | :--- |
| **Cloudflare Plan** | **$0.00** | 使用 Free Plan，涵盖基础 CDN 与安全防护。 |
| **Domain (域名)** | **~$0.85** | 仅需支付域名年费 (约 $10.18/年)，无其他月租。 |
| **Pages (构建)** | **$0.00** | 免费额度：每月 500 次构建（对开发初期绰绰有余）。 |
| **R2 (存储/图床)** | **$0.00** | 免费额度：10GB 存储 + 1000万次读取/月。 |
| **Zero Trust** | **$0.00** | 免费额度：50 用户以内免费（覆盖团队成员）。 |
| **总计** | **< $1.00** | **预算剩余 $49+**，可用于其他软件订阅或咖啡。 |

---

## 🛠️ 四、 核心服务 (Core Services)

### 1. MRP Hosting (Pages)
*   **Source**: `Teams/Channel`
*   **Deployment**: GitHub Actions -> Cloudflare Pages，实现交付物的全球秒级分发。

### 2. Security (Zero Trust)
*   **Access**: 限制对 `Workbench` 敏感资源的访问，确保仅授权 Player 可进入。
*   **WAF**: 默认开启基础防护，抵御自动化攻击。

### 3. Storage (R2)
*   **Role**: 托管 Mission 相关的多媒体素材（如音频、高分辨率扫描件），减轻 Git 仓库负担。

---

## 🤖 五、 自动化 (Automation)

*   **IaC**: 推荐使用 Wrangler 或 Terraform 管理配置。
*   **Secrets**: API Tokens 严格存储于 GitHub Secrets 中。
