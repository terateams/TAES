# EdgeTeam（E队）— 操作单元（Principal）

> **定位**：TAES 生态中的"价值创造方 / 操作单元"。
>
> 一句话：**E队是被托举的团队单元，用 Mission Repo 执行任务，并对交付物质量负责。**

---

## 1. 定义

**EdgeTeam（E队）** 是 TAES 中的主体（Principal）：
- 在组织关系中：E队是 **服务消费方**（接受 TeamsCamp 的托举能力与资源）。
- 在执行关系中：E队是 **任务执行方**（执行 Mission，产出交付物）。
- 在责任关系中：E队是 **结果责任方**（对 Teams/ 中的交付质量、可追溯性负责）。

---

## 2. E队与 MAR 目录的对应关系

在单个 Mission Repo（MAR）中，E队的"可见投影"主要体现在两处：
- **意图与边界**：`MISSION.md` + `MISSION/`（定义本次 Mission 的 CLEAR/ICE 信息）
- **价值沉淀**：`Teams/`（Artifacts / Metadata / Metrics / Channel）

> **重要**：E队是"长期对象"，Repo 是"Mission 的原子载体"。因此 **E队不等于某个 repo 根目录下的一个文件夹名**，而是跨 Repo 可运营的主体。

---

## 3. 核心字段（最小可运营模型）

| 字段 | 说明 | 关联文档 |
|------|------|----------|
| **ET Code** | E队唯一标识 | [Code.md](Code.md) |
| **Owner** | E队负责人（对本队 Mission 与交付质量承担最终责任） | — |
| **Members** | 参与成员（以角色/权限矩阵管理） | — |
| **Mission Anchor** | 该 E队 当前锚定的核心 Mission | MISSION.md |
| **Repos** | 与 E队关联的 Repo 列表 | — |
| **Domains** | 与 E队关联的域名与入口 | [Domain.md](Domain.md) |

---

## 4. 边界（Limit）

- E队 **不持有** 算力资产与合规责任（归 TeamsCamp 持有）
- E队 **不等同于** 人员列表；它是"可运营的团队对象"，可随成员变更而延续
- E队 **不以工具为定义**（Copilot/LLM 只是托举与执行层），E队以"责任闭环"定义

---

## 5. 验收（Eval）

E队的验收不看"说了什么"，只看"交付能否被证明"：

| 验收维度 | 落地位置 | 验证问题 |
|----------|----------|----------|
| 可验证交付物 | `Teams/Artifacts/` | 交付物是否齐备？ |
| 证据链 | `Teams/Metadata/` | 过程是否可追溯？ |
| 效果度量 | `Teams/Metrics/` | E系数/ROI 是否可度量？ |
| 对外发布 | `Teams/Channel/` | 是否合规（无敏感信息）？ |

---

## 6. 关联索引

| 关联对象 | 路径 | 说明 |
|----------|------|------|
| **ET Code（番号）** | [Code.md](Code.md) | E队唯一标识编码体系 |
| **ET Domain（域名）** | [Domain.md](Domain.md) | E队入口与证书管理 |
| **T营** | [../TeamsCamp/README.md](../TeamsCamp/README.md) | 托举方（资源持有） |
| **AITC** | [../AITC/README.md](../AITC/README.md) | E队消费的算力资产 |
| **POP** | [../POP/README.md](../POP/README.md) | E队使用的网络接入点 |
| **Site** | [../Site/README.md](../Site/README.md) | E队的工作据点 |
| **NexusPass** | [../NexusPass/README.md](../NexusPass/README.md) | E队使用的身份凭证 |

---

## 7. 与 TAES 的映射

| TAES 要素 | 对应 | 说明 |
|-----------|------|------|
| **E** | EdgeTeam | 本文档定义的主体 |
| **E** (公式) | Empower | E队被赋能后的价值产出 |

> **E 的双重身份**：E 同时代表 EdgeTeams（主体）与 Empower（结果），把"谁负责"与"交付是什么"锁在一起。

---

*版本: v1.0 | 创建日期: 2026-01-20*
