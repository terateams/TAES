# TAES 品控操作手册 (QC Playbook)

> **定位**：TAES 可验收承诺的执行规范  
> 版本：v1.0 | 更新日期：2026-01-03 | 维护者：QA Architect

---

## 快速导航

| 读者 | 推荐章节 |
|------|----------|
| **Mission Owner** | §1 品控总览 → §2 事前控制 |
| **Architect** | §2.2 Spec 评审 → §4 指标体系 |
| **QA/Auditor** | §4 事后控制 → §5 审计协议 |
| **Ops** | §3.2 监控配置 → §6 自动化 Pipeline |

---

## 1) 品控总览

### 1.1 品控定位

> **QC 不是"检查部门"，而是 TAES 可验收承诺的兑现机制。**

```
┌─────────────────────────────────────────────────────────┐
│                  TAES 品控定位                           │
│                                                         │
│   客户买的是"可验收"  ──→  QC 负责"让验收发生"           │
│                                                         │
│   ┌─────────────┐   ┌─────────────┐   ┌─────────────┐   │
│   │ AI 真干活？  │   │ 可复制？    │   │ 可审计？    │   │
│   │     ↓       │   │     ↓       │   │     ↓       │   │
│   │ Layer 4    │   │ Checklists  │   │ Evidence    │   │
│   │ 指标量化    │   │ Templates   │   │ Schema      │   │
│   └─────────────┘   └─────────────┘   └─────────────┘   │
└─────────────────────────────────────────────────────────┘
```

### 1.2 品控三阶段模型

| 阶段 | 时机 | 目标 | 核心动作 |
|------|------|------|----------|
| **事前控制** | Mission 启动前 | 预防问题 | Checklist 审核、Spec Review |
| **事中控制** | Mission 执行中 | 检测问题 | 执行门禁、实时监控 |
| **事后控制** | Mission 交付后 | 纠正问题 | 验收评审、审计报告、复盘改进 |

### 1.3 品控与 ICE 的映射

| ICE 要素 | 品控焦点 | 检查项示例 |
|----------|----------|------------|
| **Intent** | Spec 质量 | Mission.md 是否满足五要素？ |
| **Constraints** | 约束生效 | copilot-instructions.md 是否配置？ |
| **Evidence** | 证据完整 | 日志是否自动留痕？Eval 是否运行？ |

---

## 2) 事前控制（Pre-control）

### 2.1 Mission 启动检查 (Kickoff Checklist)

> **时机**：Mission Repo 创建后、AI 执行前

| # | 检查项 | 标准 | 验收方式 | 责任角色 | 自动化 |
|---|--------|------|----------|----------|--------|
| 1 | **Mission 五要素完整** | 输入/输出/验收/AI可介入/范围 全部明确 | Checklist 审核 | Owner | ⚪ 可辅助 |
| 2 | **MISSION.md 存在** | 文件存在且内容非空 | 文件检查 | Owner | ✅ 可自动 |
| 3 | **README.md 架构说明** | 包含目录结构说明 | 人工审核 | Architect | ⚪ 可辅助 |
| 4 | **copilot-instructions.md 配置** | 文件存在于 .github/ 目录 | 文件检查 | Owner | ✅ 可自动 |
| 5 | **Eval 方案已定义** | 至少有 Pass/Fail 条件 | 人工审核 | QA | ⚪ 可辅助 |
| 6 | **Workplane 可用** | 网络延迟 p95 < 200ms | 自动探测 | Ops | ✅ 可自动 |

**启动门禁**：以上 6 项全部通过，Mission 方可进入执行阶段。

### 2.2 Spec 评审标准 (Spec Review)

> **目标**：确保 Intent 清晰到 AI 可执行

| 维度 | 权重 | 评分标准 | 示例 |
|------|------|----------|------|
| **清晰度** | 30% | 任务描述无歧义 | ❌ "写个好文档" → ✅ "撰写 API 接口文档，包含请求/响应示例" |
| **可执行性** | 25% | AI 能理解并执行 | ❌ "优化性能" → ✅ "将 API 响应时间从 500ms 降至 200ms" |
| **可验收性** | 25% | Pass/Fail 可判定 | ❌ "质量要好" → ✅ "Eval 通过率 ≥ 80%" |
| **范围约束** | 20% | 边界清晰 | ❌ "尽快完成" → ✅ "3 天内完成，不超过 10 个文件" |

**评分规则**：
- 总分 = 各维度得分 × 权重
- **≥ 80 分**：可进入执行
- **60-79 分**：需修改后重审
- **< 60 分**：打回重写

### 2.3 约束配置验证 (Constraints Validation)

| 检查项 | 路径 | 验证内容 | 标准 |
|--------|------|----------|------|
| Copilot 指令 | `.github/copilot-instructions.md` | 文件存在、内容有效 | 包含角色定义、输出规范、禁止事项 |
| 目录约束 | `.github/instructions/*.md` | applyTo 配置正确 | Glob 模式有效 |
| 权限边界 | GitHub Org 设置 | Repo 归属正确 | 属于 E隊 Org |

---

## 3) 事中控制（In-process Control）

### 3.1 执行门禁 (Execution Gates)

> **原则**：在关键节点设置自动检查，异常时阻断并告警

| Gate | 触发时机 | 检查内容 | 通过条件 | 失败动作 |
|------|----------|----------|----------|----------|
| **G1** | 每次 Commit | Spec 引用完整 | MISSION.md 未被删除 | 阻断 Push |
| **G2** | 每次 PR | Eval 已运行 | Eval 脚本执行成功 | 阻断 Merge |
| **G3** | 每日定时 | Evidence 留痕 | 当日有日志记录 | 告警通知 |
| **G4** | 里程碑节点 | 指标达标 | Layer 2-4 指标在阈值内 | 暂停执行 |

### 3.2 实时监控指标

| 指标 | 计算方式 | 告警阈值 | 监控频率 |
|------|----------|----------|----------|
| **First-Pass Acceptance** | 首次通过数 / 总提交数 | < 50% 告警 | 每次 Commit |
| **Iteration Rounds** | PR 平均修改轮次 | > 5 轮告警 | 每次 Merge |
| **Human Intervention Rate** | 人工操作 / 总操作 | > 50% 告警 | 每日 |
| **Workplane Latency** | p95 延迟 | > 300ms 告警 | 每分钟 |

### 3.3 人工干预协议

> **何时需要人工干预？**

| 场景 | 触发条件 | 干预动作 | 记录要求 |
|------|----------|----------|----------|
| **AI 产出偏离** | 连续 3 次 Eval 失败 | Architect 介入审查 Spec | 记录偏离原因、修改内容 |
| **越界尝试** | Guardrails 拦截 | Owner 确认是否放行 | 记录拦截内容、处理决策 |
| **指标异常** | Layer 4 指标 < 30% | QA 发起复盘 | 记录根因、改进措施 |

---

## 4) 事后控制（Post-control）

### 4.1 交付验收标准 (Delivery Criteria)

| # | 验收项 | 标准 | 验收方式 | 责任角色 |
|---|--------|------|----------|----------|
| 1 | **OUTPUT 目录完整** | 符合 MR 架构规范 | 结构验证脚本 | Auditor |
| 2 | **Evidence 合规** | 100% 可追溯 | 审计抽检 | Auditor |
| 3 | **Eval 通过率** | ≥ 80% | 评测报告 | QA |
| 4 | **AI 贡献率** | ≥ 60% | Git diff 分析 | Architect |
| 5 | **复盘记录** | 有改进点归档 | 文档检查 | Owner |

### 4.2 Evidence 规格要求

> 详见 [Acceptance/evidence-schema.md](Acceptance/evidence-schema.md)

**必要字段**：
- `mission_id`: 任务唯一标识
- `timestamp`: 时间戳
- `artifacts`: 产出物列表（路径 + 哈希）
- `metrics`: 关键指标值
- `audit.status`: 审计状态

### 4.3 验收评审会议

| 项目 | 内容 |
|------|------|
| **参与者** | Owner, Architect, QA/Auditor |
| **议程** | 1) 指标回顾 → 2) Evidence 抽检 → 3) 问题讨论 → 4) 改进项确认 |
| **产出** | Acceptance Report（通过/有条件通过/不通过） |
| **频率** | 每个 Mission 交付时 |

---

## 5) 审计协议 (Audit Protocol)

### 5.1 审计类型

| 类型 | 频率 | 范围 | 执行者 |
|------|------|------|--------|
| **自审** | 每次交付 | 单个 Mission | Owner |
| **互审** | 每周 | 抽选 2-3 个 Mission | Peer Review |
| **正式审计** | 每季度 | 全量 Mission | Auditor/外部 |

### 5.2 审计检查清单

| # | 审计项 | 检查内容 | 判定标准 |
|---|--------|----------|----------|
| 1 | Intent 可追溯 | MISSION.md 版本历史 | Git log 完整 |
| 2 | Constraints 生效 | 拦截日志存在 | 有拦截记录或"无越界"声明 |
| 3 | Evidence 完整 | 符合 Schema | 必要字段 100% 填充 |
| 4 | 指标真实 | 计算过程可复现 | 提供计算脚本/数据源 |
| 5 | 改进闭环 | 问题有跟进 | Issue 状态为 Closed |

### 5.3 审计报告模板

```markdown
# Audit Report: [Mission ID]

## 基本信息
- Mission: [名称]
- 审计日期: [YYYY-MM-DD]
- 审计员: [姓名]

## 审计结果
| 审计项 | 状态 | 说明 |
|--------|------|------|
| Intent 可追溯 | ✅/❌ | ... |
| Constraints 生效 | ✅/❌ | ... |
| Evidence 完整 | ✅/❌ | ... |
| 指标真实 | ✅/❌ | ... |
| 改进闭环 | ✅/❌ | ... |

## 总体评价
- [ ] 通过
- [ ] 有条件通过（需整改项：...）
- [ ] 不通过（原因：...）

## 改进建议
1. ...
2. ...
```

---

## 6) 指标体系 (Metrics)

### 6.1 四层指标定义

> 与 [TAES.md §6](../../TAES.md) 保持一致

#### Layer 1: Workplane Connectivity（网络底座）

| 指标 | 定义 | 目标值 | 数据源 |
|------|------|--------|--------|
| Uptime | 可用时间 / 总时间 | ≥ 99.5% | 监控系统 |
| Latency p95 | 95 分位延迟 | < 200ms | 探测日志 |
| Block Rate | 被阻断请求 / 总请求 | < 1% | 网关日志 |

#### Layer 2: AI Execution Quality（执行质量）

| 指标 | 定义 | 目标值 | 数据源 |
|------|------|--------|--------|
| Spec Quality Score | Spec 评审得分 | ≥ 80 | 评审记录 |
| Eval Coverage | 有 Eval 的任务 / 总任务 | ≥ 80% | Repo 扫描 |
| Evidence Completeness | 符合 Schema 的记录 / 总记录 | ≥ 95% | Schema 验证 |

#### Layer 3: Business Scale Outcomes（业务成效）

| 指标 | 定义 | 目标值 | 数据源 |
|------|------|--------|--------|
| Lead Time | 从启动到交付的周期 | 基线 ↓30% | Issue 时间戳 |
| Success Rate | 一次通过验收 / 总交付 | ≥ 90% | 验收记录 |
| Boundary Interception | 越界拦截次数 | 有记录即可 | 拦截日志 |

#### Layer 4: AI Contribution（AI 贡献度）— 核心

| 指标 | 定义 | 目标值 | 数据源 |
|------|------|--------|--------|
| **AI Contribution Rate** | AI 生成内容 / 最终交付物 | ≥ 60% | Git diff 分析 |
| **First-Pass Acceptance** | 首次即通过 / 总提交 | ≥ 70% | Eval 结果 |
| **Iteration Rounds** | 平均迭代轮次 | ≤ 3 | PR 历史 |
| **Human Intervention Rate** | 人工环节 / 总环节 | ≤ 30% | 操作日志 |

### 6.2 指标看板配置

```yaml
# dashboard-spec.yaml
dashboard:
  name: "TAES QC Dashboard"
  refresh: 5min
  
  panels:
    - name: "Workplane Health"
      metrics: [uptime, latency_p95, block_rate]
      alert_threshold: 
        latency_p95: 300ms
        
    - name: "AI Execution"
      metrics: [spec_quality, eval_coverage, evidence_completeness]
      
    - name: "Business Outcomes"
      metrics: [lead_time, success_rate]
      trend: week_over_week
      
    - name: "AI Contribution (Core)"
      metrics: [ai_contribution_rate, first_pass_acceptance, iteration_rounds]
      highlight: true  # 核心指标高亮
```

---

## 7) 自动化 Pipeline

### 7.1 品控自动化架构

```
┌─────────────────────────────────────────────────────────────┐
│                    QC Automation Pipeline                    │
│                                                             │
│   on_commit:                                                │
│   ├── spec_structure_check    # 结构检查                    │
│   ├── constraints_validation  # 约束验证                    │
│   └── evidence_auto_log       # 自动留痕                    │
│                                                             │
│   on_pr:                                                    │
│   ├── eval_run                # Eval 执行                   │
│   ├── ai_contribution_calc    # AI 贡献率计算               │
│   └── spec_quality_score      # Spec 质量评分               │
│                                                             │
│   on_merge:                                                 │
│   ├── evidence_schema_validate # Evidence 验证              │
│   ├── metrics_update          # 指标更新                    │
│   └── audit_report_gen        # 审计报告生成                │
│                                                             │
│   scheduled (daily):                                        │
│   ├── dashboard_refresh       # 看板刷新                    │
│   └── anomaly_detection       # 异常检测                    │
└─────────────────────────────────────────────────────────────┘
```

### 7.2 GitHub Actions 示例

```yaml
# .github/workflows/qc-pipeline.yml
name: TAES QC Pipeline

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  pre-check:
    runs-on: ubuntu-latest
    steps:
      - name: Check MISSION.md exists
        run: test -f MISSION.md
        
      - name: Validate copilot-instructions
        run: test -f .github/copilot-instructions.md
        
  eval:
    needs: pre-check
    runs-on: ubuntu-latest
    steps:
      - name: Run Eval Suite
        run: ./scripts/run-eval.sh
        
      - name: Calculate AI Contribution
        run: ./scripts/calc-ai-contribution.sh
        
  evidence:
    needs: eval
    if: github.event_name == 'push'
    runs-on: ubuntu-latest
    steps:
      - name: Validate Evidence Schema
        run: ./scripts/validate-evidence.sh
        
      - name: Generate Audit Log
        run: ./scripts/gen-audit-log.sh
```

---

## 8) 三大里程碑的品控节奏

| 里程碑 | 时间 | 品控焦点 | 品控活动 | 验收标准 |
|--------|------|----------|----------|----------|
| **M1** | 1 个月 | 流程跑通 | Mission 首次完整交付评审 | ICE 全流程有 Evidence |
| **M2** | 1 季度 | 质量达标 | 月度 Eval 覆盖率审查 | ≥ 3 Mission、Eval ≥ 80% |
| **M3** | 1 年 | 可审计 | 季度审计 + 外部抽检 | Evidence Schema 100% 合规 |

### M1 品控重点：跑通

- [ ] 第一个 Mission 完成 Kickoff Checklist
- [ ] 至少一次 Eval 运行成功
- [ ] Evidence 日志存在（格式可不完美）

### M2 品控重点：质量

- [ ] Spec Quality Score 平均 ≥ 80
- [ ] Eval Coverage ≥ 80%
- [ ] AI Contribution Rate ≥ 50%（过渡期）

### M3 品控重点：合规

- [ ] Evidence Schema 100% 合规
- [ ] 通过外部审计
- [ ] 可向其他 E隊 输出品控规范

---

## 附录：角色职责矩阵 (RACI)

| 品控活动 | Owner | Architect | QA | Auditor | Ops |
|----------|-------|-----------|----|---------| ----|
| Kickoff Checklist | **R** | C | C | I | C |
| Spec Review | A | **R** | C | I | - |
| Constraints 配置 | **R** | C | - | I | C |
| Eval 设计与执行 | A | C | **R** | I | - |
| Evidence 验证 | I | C | C | **R** | - |
| 审计报告 | I | I | C | **R** | - |
| Workplane 监控 | I | I | - | I | **R** |

> R=Responsible, A=Accountable, C=Consulted, I=Informed

---

## 版本历史

| 版本 | 日期 | 变更 | 作者 |
|------|------|------|------|
| v1.0 | 2026-01-03 | 初始版本 | QA Architect |
