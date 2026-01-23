# ET Domain（E队域名服务）

> **定位**：E队的"可达入口"。解决问题：**怎么找到你、怎么安全访问你**。

---

## 1. 定义

**ET Domain** 是分配给 E队 的域名与子域名规范，覆盖：
- DNS 解析（A/CNAME/TXT 等）
- SSL/TLS 证书生命周期
- 品牌域名与子域名命名约定
- 与 Workplane / TeamsDisplay / Publisher 的入口对齐

---

## 2. 为什么域名属于 E队能力？

域名在 TAES 的角色不是"网站装饰"，而是：
- **连接边界**：把"哪个 E队"与"哪个入口"绑定
- **合规边界**：证书/解析可审计、可回滚
- **运营边界**：便于对外发布与对内运维（入口稳定）

---

## 3. 子域名规范（建议）

| 子域名模式 | 用途 | 示例 |
|------------|------|------|
| `*.workplane.<domain>` | 网络托举入口 | `t189.workplane.lsn189.cn` |
| `teams.<domain>` | 交付物/看板入口 | `teams.t189.example.com` |
| `status.<domain>` | 健康检查/公告 | `status.t189.example.com` |

---

## 4. 与系统的关联

| 系统 | 关联方式 | 说明 |
|------|----------|------|
| **Workplane** | 子域名绑定 | 每个 E队 可分配专属 Workplane 入口 |
| **TeamsDisplay** | CNAME 指向 | 任务看板入口 |
| **Publisher** | 发布域名 | 对外发布频道的域名 |

---

## 5. 审计字段（最小集）

| 字段 | 类型 | 说明 |
|------|------|------|
| `et_code` | string | 归属的 E队 |
| `primary_domain` | string | 主域名 |
| `subdomain_rules` | json | 子域名规则 |
| `certificate_issuer` | string | 证书颁发机构 |
| `expiry_at` | datetime | 证书过期时间 |
| `dns_zone_owner` | string | DNS 区域管理方 |

---

## 6. 边界（Limit）

- 域名能力 **不定义** "交付内容"，交付内容仍归 `Teams/`
- 域名能力 **不替代** 身份体系，身份与权限归 NexusPass
- 域名 **由 T营 持有**，E队 获得使用授权

---

*版本: v1.0 | 创建日期: 2026-01-20*
