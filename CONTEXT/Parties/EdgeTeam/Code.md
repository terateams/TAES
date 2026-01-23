# ET Code（E队番号体系）

> **定位**：E队的唯一标识，用于"识别哪个 E队"，并与 GitHub Org / 域名 / 资源分配建立可追溯关联。

---

## 1. 为什么需要 ET Code？

在 TAES 中，E队是"长期对象"，成员/项目可变。
要实现规模化运营与审计，必须先解决：**哪个 E队**。

ET Code 的作用：
- **统一命名**：避免仅靠中文名/公司名造成歧义
- **资产追溯**：把算力/网络/身份的分配记录绑定到同一个 E队
- **系统对齐**：对接 GitHub Org、域名、VPN 地址段、账单维度等

---

## 2. 编码规则（最小一致性）

| 原则 | 说明 |
|------|------|
| **唯一性** | ET Code 在 TeamsCamp 全域唯一 |
| **稳定性** | E队改名不影响 ET Code |
| **可读性** | 人类可读、可口述、可写在合同/报表里 |

**示例**：
- `T189` / `S114` / `I117`

---

## 3. 与系统的映射

| 系统对象 | 映射规则 | 示例 |
|----------|----------|------|
| **GitHub Org** | `<et-code>-<brand>` 或 `<brand>-<et-code>` | `t189-acme` |
| **Mission Repo** | Repo 应能回溯到 ET Code | 在 MISSION.md 中标注 |
| **Teams/ 交付** | Metadata/Metrics 中标注归属 | `et_code: T189` |
| **域名** | 子域名前缀或路径 | `t189.workplane.example.com` |

---

## 4. 审计字段（最小集）

| 字段 | 类型 | 说明 |
|------|------|------|
| `et_code` | string | 唯一标识 |
| `created_at` | datetime | 创建时间 |
| `owner` | string | E队负责人 |
| `org_slug` | string | GitHub Org 名称 |
| `primary_domain` | string | 主域名 |
| `status` | enum | active / suspended / archived |

---

## 5. 边界（Limit）

- ET Code **不是** "成员编号"；成员管理属于 Player/权限矩阵
- ET Code **不是** "客户编号"；它标识的是可运营的团队单元
- ET Code **不可变**；一旦分配不可修改（可归档后新建）

---

*版本: v1.0 | 创建日期: 2026-01-20*
