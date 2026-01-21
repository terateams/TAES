# GitHub Account Provider

> NexusPass > providers > github

## 服务范围

| 服务 | 用途 | 状态 |
|------|------|------|
| GitHub Repos | 代码托管、MR 仓库 | 🟢 |
| GitHub Actions | CI/CD 自动化 | 🟢 |
| GitHub Copilot | AI 编程助手 | 🟢 |
| GitHub Pages | 静态站点托管 | 🟢 |

## 账号规格

```yaml
account_type: Pro / Team / Enterprise
plan: GitHub Copilot Pro / Business
2fa: 已启用
ssh_keys: 已配置
pat: Personal Access Token 已生成
```

## 维护要点

- **Token 轮换**: PAT 定期更新
- **SSH Key**: 设备更换时更新
- **Copilot 订阅**: 确保付费持续

## 中国访问注意

- 建议使用 SSH 而非 HTTPS
- `github.com` 偶有连接不稳定
- 备选：GitHub CLI + 代理
