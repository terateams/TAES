# 执行门禁 (Execution Gates)

> **定位**：事中控制的核心机制，在关键节点自动检查并阻断异常  
> 版本：v1.0 | 更新日期：2026-01-03 | 维护者：QA Architect

---

## 1) 概述

### 1.1 什么是执行门禁？

**执行门禁 (Execution Gates)** 是在 Mission 执行过程中设置的自动检查点：
- **通过**：流程继续
- **失败**：流程阻断，触发告警

### 1.2 为什么需要门禁？

| 没有门禁 | 有门禁 |
|----------|--------|
| 问题在交付时才发现 | 问题在过程中被拦截 |
| 返工成本高 | 早发现早修复 |
| 无法追溯何时出问题 | 精确定位问题节点 |
| 依赖人工盯守 | 自动化 24/7 监控 |

### 1.3 门禁在 Mission 生命周期的位置

```
┌──────────────────────────────────────────────────────────────────┐
│                     Mission 执行阶段                              │
│                                                                  │
│  [Kickoff] → [G1] → [开发] → [G2] → [PR] → [G3] → [Merge] → [G4] │
│              Commit    ↑      PR Review     Daily    Milestone   │
│               Gate     │        Gate        Gate       Gate      │
│                        │                                         │
│                    你在这里                                       │
└──────────────────────────────────────────────────────────────────┘
```

---

## 2) 门禁清单

### 2.1 门禁总览

| Gate | 名称 | 触发时机 | 检查内容 | 失败动作 |
|------|------|----------|----------|----------|
| **G1** | Commit Gate | 每次 Commit | 基础结构完整性 | 阻断 Push |
| **G2** | PR Gate | 每次 PR 创建/更新 | Eval 执行 + AI 贡献率 | 阻断 Merge |
| **G3** | Daily Gate | 每日定时 | Evidence 留痕 + 异常检测 | 告警通知 |
| **G4** | Milestone Gate | 里程碑节点 | 全量指标达标 | 暂停执行 |

### 2.2 各门禁严格程度

```
严格程度：G1 < G3 < G2 < G4

G1 ──────────────────────────────────────────────────────→ G4
轻量检查                                              全量审计
自动化优先                                            人工参与
快速反馈                                              深度评估
```

---

## 3) G1: Commit Gate（提交门禁）

### 3.1 定义

| 属性 | 值 |
|------|-----|
| **触发时机** | 每次 `git push` |
| **检查耗时** | < 30 秒 |
| **失败动作** | 阻断 Push |
| **自动化程度** | 100% 自动 |

### 3.2 检查项

| # | 检查项 | 规则 | 阻断级别 |
|---|--------|------|----------|
| G1-1 | MISSION.md 存在 | 文件不得被删除 | 🔴 阻断 |
| G1-2 | copilot-instructions.md 存在 | 文件不得被删除 | 🔴 阻断 |
| G1-3 | 敏感信息检测 | 无 API Key/密码泄露 | 🔴 阻断 |
| G1-4 | 文件大小限制 | 单文件 < 10MB | 🟡 警告 |
| G1-5 | Commit Message 规范 | 符合约定格式 | 🟡 警告 |

### 3.3 实现方式

**方式 A: Git Hooks (本地)**

```bash
# .git/hooks/pre-push
#!/bin/bash

echo "=== G1: Commit Gate ==="

# G1-1: MISSION.md 存在
if [ ! -f "MISSION.md" ]; then
    echo "❌ G1-1: MISSION.md is missing"
    exit 1
fi

# G1-2: copilot-instructions.md 存在
if [ ! -f ".github/copilot-instructions.md" ]; then
    echo "❌ G1-2: copilot-instructions.md is missing"
    exit 1
fi

# G1-3: 敏感信息检测
if grep -rE "(api_key|password|secret)=" --include="*.md" --include="*.yaml" .; then
    echo "❌ G1-3: Sensitive information detected"
    exit 1
fi

echo "✅ G1: All checks passed"
exit 0
```

**方式 B: GitHub Actions (远端)**

```yaml
# .github/workflows/g1-commit-gate.yml
name: G1 Commit Gate

on: push

jobs:
  commit-gate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: G1-1 Check MISSION.md
        run: test -f MISSION.md || exit 1
        
      - name: G1-2 Check copilot-instructions.md
        run: test -f .github/copilot-instructions.md || exit 1
        
      - name: G1-3 Sensitive Info Detection
        run: |
          if grep -rE "(api_key|password|secret)=" --include="*.md" --include="*.yaml" .; then
            exit 1
          fi
```

---

## 4) G2: PR Gate（PR 门禁）

### 4.1 定义

| 属性 | 值 |
|------|-----|
| **触发时机** | PR 创建/更新 |
| **检查耗时** | 1-5 分钟 |
| **失败动作** | 阻断 Merge |
| **自动化程度** | 90% 自动 + 10% 人工 |

### 4.2 检查项

| # | 检查项 | 规则 | 阻断级别 |
|---|--------|------|----------|
| G2-1 | G1 全部通过 | 前置门禁通过 | 🔴 阻断 |
| G2-2 | Eval 执行成功 | Eval 脚本运行无错误 | 🔴 阻断 |
| G2-3 | Eval 通过率 | ≥ 70%（首次 PR）或 ≥ 80%（Merge） | 🔴 阻断 |
| G2-4 | AI 贡献率计算 | 记录 AI Contribution Rate | 🟢 记录 |
| G2-5 | 代码 Review | 至少 1 人 Approve | 🔴 阻断 |
| G2-6 | 无冲突 | 与目标分支无冲突 | 🔴 阻断 |

### 4.3 实现方式

```yaml
# .github/workflows/g2-pr-gate.yml
name: G2 PR Gate

on:
  pull_request:
    branches: [main]

jobs:
  pr-gate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0  # 用于 AI 贡献率计算
      
      - name: G2-1 Verify G1 Passed
        run: echo "G1 checks are enforced by branch protection"
        
      - name: G2-2 Run Eval Suite
        run: |
          if [ -f "scripts/run-eval.sh" ]; then
            ./scripts/run-eval.sh
          else
            echo "⚪ No eval script found, skipping"
          fi
          
      - name: G2-3 Check Eval Pass Rate
        run: |
          # 解析 eval 结果
          PASS_RATE=$(cat Teams/Metadata/eval-result.json | jq '.pass_rate')
          if (( $(echo "$PASS_RATE < 0.7" | bc -l) )); then
            echo "❌ Eval pass rate $PASS_RATE < 70%"
            exit 1
          fi
          echo "✅ Eval pass rate: $PASS_RATE"
          
      - name: G2-4 Calculate AI Contribution
        run: |
          # 计算 AI 生成内容占比
          ./scripts/calc-ai-contribution.sh > ai-contribution.txt
          cat ai-contribution.txt
          
      - name: Upload Metrics
        uses: actions/upload-artifact@v4
        with:
          name: pr-metrics
          path: |
            Teams/Metadata/eval-result.json
            ai-contribution.txt
```

### 4.4 Branch Protection 配置

```yaml
# 推荐的 Branch Protection Rules (main 分支)
branch_protection:
  required_status_checks:
    strict: true
    contexts:
      - "G1 Commit Gate"
      - "G2 PR Gate"
  required_pull_request_reviews:
    required_approving_review_count: 1
  enforce_admins: true
```

---

## 5) G3: Daily Gate（日常门禁）

### 5.1 定义

| 属性 | 值 |
|------|-----|
| **触发时机** | 每日定时（如 UTC 00:00） |
| **检查耗时** | 5-10 分钟 |
| **失败动作** | 告警通知（不阻断） |
| **自动化程度** | 100% 自动 |

### 5.2 检查项

| # | 检查项 | 规则 | 告警级别 |
|---|--------|------|----------|
| G3-1 | Evidence 留痕 | 当日有活动则必须有日志 | 🟡 警告 |
| G3-2 | 指标异常检测 | 关键指标无异常波动 | 🟡 警告 |
| G3-3 | Workplane 健康 | Uptime ≥ 99%, Latency p95 < 200ms | 🟠 告警 |
| G3-4 | 停滞检测 | 超过 3 天无 Commit | 🟡 警告 |

### 5.3 实现方式

```yaml
# .github/workflows/g3-daily-gate.yml
name: G3 Daily Gate

on:
  schedule:
    - cron: '0 0 * * *'  # 每日 UTC 00:00
  workflow_dispatch:  # 支持手动触发

jobs:
  daily-gate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          fetch-depth: 0
          
      - name: G3-1 Check Evidence Logging
        run: |
          # 检查最近 24 小时是否有 Evidence 更新
          LAST_EVIDENCE=$(git log --since="24 hours ago" --oneline -- Teams/Metadata/)
          if [ -z "$LAST_EVIDENCE" ]; then
            echo "⚠️ G3-1: No evidence logged in last 24 hours"
          else
            echo "✅ G3-1: Evidence logging active"
          fi
          
      - name: G3-3 Workplane Health Check
        run: |
          # Ping Workplane 端点
          LATENCY=$(curl -o /dev/null -s -w '%{time_total}' https://workplane.edgeteams.ai/health)
          LATENCY_MS=$(echo "$LATENCY * 1000" | bc)
          if (( $(echo "$LATENCY_MS > 200" | bc -l) )); then
            echo "⚠️ G3-3: Workplane latency ${LATENCY_MS}ms > 200ms"
          else
            echo "✅ G3-3: Workplane healthy (${LATENCY_MS}ms)"
          fi
          
      - name: G3-4 Stagnation Detection
        run: |
          DAYS_SINCE_COMMIT=$(( ($(date +%s) - $(git log -1 --format=%ct)) / 86400 ))
          if [ $DAYS_SINCE_COMMIT -gt 3 ]; then
            echo "⚠️ G3-4: No commits in $DAYS_SINCE_COMMIT days"
          else
            echo "✅ G3-4: Active (last commit $DAYS_SINCE_COMMIT days ago)"
          fi
          
      - name: Send Alert (if needed)
        if: failure()
        uses: actions/github-script@v7
        with:
          script: |
            github.rest.issues.create({
              owner: context.repo.owner,
              repo: context.repo.repo,
              title: '⚠️ G3 Daily Gate Alert',
              body: 'Daily gate check detected issues. Please review.',
              labels: ['qc-alert']
            })
```

---

## 6) G4: Milestone Gate（里程碑门禁）

### 6.1 定义

| 属性 | 值 |
|------|-----|
| **触发时机** | 里程碑节点（M1/M2/M3） |
| **检查耗时** | 30-60 分钟 |
| **失败动作** | 暂停执行，要求整改 |
| **自动化程度** | 50% 自动 + 50% 人工 |

### 6.2 检查项

> 根据 TAES 三大里程碑分别定义

#### M1 (1 个月) — 上手 · 交付

| # | 检查项 | 标准 | 阻断级别 |
|---|--------|------|----------|
| G4-M1-1 | ICE 流程跑通 | Intent → Constraints → Evidence 完整 | 🔴 阻断 |
| G4-M1-2 | 至少 1 个 Mission 完成 | 有 approved 状态的 Evidence | 🔴 阻断 |
| G4-M1-3 | Eval 至少运行 1 次 | 有 eval-result 记录 | 🔴 阻断 |
| G4-M1-4 | 指标基线建立 | Layer 2-4 有初始数据 | 🟡 警告 |

#### M2 (1 季度) — 会用 · 成功案例

| # | 检查项 | 标准 | 阻断级别 |
|---|--------|------|----------|
| G4-M2-1 | ≥ 3 个 Mission 完成 | 有 3+ 个 approved Evidence | 🔴 阻断 |
| G4-M2-2 | Eval Coverage ≥ 80% | 统计数据 | 🔴 阻断 |
| G4-M2-3 | AI Contribution ≥ 50% | 平均值 | 🟡 警告 |
| G4-M2-4 | 成功案例文档 | 有可展示的案例 | 🔴 阻断 |

#### M3 (1 年) — 能用 · 能普及

| # | 检查项 | 标准 | 阻断级别 |
|---|--------|------|----------|
| G4-M3-1 | ≥ 10 个 Mission 完成 | 统计数据 | 🔴 阻断 |
| G4-M3-2 | Evidence Schema 100% 合规 | 审计报告 | 🔴 阻断 |
| G4-M3-3 | AI Contribution ≥ 60% | 平均值 | 🔴 阻断 |
| G4-M3-4 | 可输出能力包 | 有培训材料/模板库 | 🔴 阻断 |
| G4-M3-5 | 外部审计通过 | 审计报告 | 🔴 阻断 |

### 6.3 M4 评审会议

```markdown
## Milestone Gate Review Meeting

**里程碑**: M1 / M2 / M3
**日期**: YYYY-MM-DD
**参与者**: Owner, Architect, QA/Auditor, [Stakeholder]

### 议程
1. 指标回顾（10 min）
2. Evidence 抽检（20 min）
3. 问题讨论（15 min）
4. 通过/整改决议（5 min）

### 检查结果
| 检查项 | 状态 | 说明 |
|--------|------|------|
| G4-Mx-1 | ✅/❌ | |
| G4-Mx-2 | ✅/❌ | |
| ... | | |

### 决议
- [ ] **通过** - 进入下一阶段
- [ ] **有条件通过** - 整改项：___，整改期限：___
- [ ] **不通过** - 原因：___

### 签字
- Owner: @___
- Reviewer: @___
```

---

## 7) 门禁配置矩阵

### 7.1 按 Mission 复杂度配置

| 复杂度 | G1 | G2 | G3 | G4 |
|--------|----|----|----|----|
| **简单** | ✅ 必需 | ⚪ 可选 | ⚪ 可选 | ⚪ 可选 |
| **标准** | ✅ 必需 | ✅ 必需 | ✅ 必需 | ⚪ 按里程碑 |
| **关键** | ✅ 必需 | ✅ 必需 + 严格 | ✅ 必需 | ✅ 每个里程碑 |

### 7.2 按团队成熟度配置

| 成熟度 | 配置建议 |
|--------|----------|
| **新手团队** | G1 必需，G2/G3/G4 逐步引入 |
| **成熟团队** | G1-G4 全量启用 |
| **高合规要求** | G1-G4 全量 + 加强 G4 外部审计 |

---

## 8) 告警与通知

### 8.1 告警级别

| 级别 | 图标 | 含义 | 通知方式 |
|------|------|------|----------|
| 🔴 阻断 | Critical | 必须立即处理 | 邮件 + IM + Issue |
| 🟠 告警 | Warning | 需要关注 | IM + Issue |
| 🟡 提醒 | Notice | 建议改进 | Issue |
| 🟢 记录 | Info | 仅记录 | Log |

### 8.2 通知模板

```markdown
## 🔴 G2 PR Gate 失败

**Repo**: [org/repo]
**PR**: #[number]
**时间**: YYYY-MM-DD HH:MM

### 失败项
- G2-3: Eval 通过率 65% < 70%

### 建议动作
1. 检查失败的 Eval 用例
2. 修复后重新提交 PR

### 详情
[查看 Action 日志](link)
```

---

## 9) 与其他文档的关系

```
Checklists/mission-kickoff.md (事前)
           │
           ↓
    [Mission 启动]
           │
           ↓
Checkpoints/execution-gates.md (本文档 - 事中)
           │
           ├── G1: 每次 Commit
           ├── G2: 每次 PR
           ├── G3: 每日
           └── G4: 里程碑
           │
           ↓
Acceptance/evidence-schema.md (事后)
```

---

## 版本历史

| 版本 | 日期 | 变更 | 作者 |
|------|------|------|------|
| v1.0 | 2026-01-03 | 初始版本 | QA Architect |
