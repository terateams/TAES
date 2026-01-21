# Google Account Provider

> NexusPass > providers > google

## 服务范围

| 服务 | 用途 | 状态 |
|------|------|------|
| Gmail | 主认证邮箱、OAuth 登录 | 🟢 |
| Google Cloud | API 服务（Gemini、Vertex AI） | 🟢 |
| Google Workspace | 文档协作 | 🟡 |

## 账号规格

```yaml
account_type: Google Workspace / Personal
region: 非中国大陆区域注册
2fa: 已启用 (Authenticator / Security Key)
recovery: 备用邮箱已配置
```

## 维护要点

- **定期登录**: 避免长期不活跃被锁定
- **安全检查**: 每月检查异常登录
- **支付方式**: 绑定有效支付渠道

## 依赖此账号的服务

- GitHub OAuth (备选登录)
- Anthropic Console
- OpenAI Platform
- Vercel / Netlify
