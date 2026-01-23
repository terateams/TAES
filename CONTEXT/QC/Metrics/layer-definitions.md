# Layer 1-4 指标详解 (Layer Definitions)

> **定位**：TAES 四层指标体系的完整定义与计算方法  
> 版本：v1.0 | 更新日期：2026-01-03 | 维护者：QA Architect  
> 来源：[TAES.md §6](../../../TAES.md)

---

## 1) 指标体系总览

### 1.1 四层架构

```
┌─────────────────────────────────────────────────────────────────┐
│  Layer 4: AI Contribution（AI 贡献度）— 核心差异化              │
│  回答：AI 真的在干活吗？                                        │
├─────────────────────────────────────────────────────────────────┤
│  Layer 3: Business Scale Outcomes（业务成效）                   │
│  回答：业务目标达成了吗？                                        │
├─────────────────────────────────────────────────────────────────┤
│  Layer 2: AI Execution Quality（执行质量）                      │
│  回答：执行过程规范吗？                                          │
├─────────────────────────────────────────────────────────────────┤
│  Layer 1: Workplane Connectivity（网络底座）                    │
│  回答：基础设施可用吗？                                          │
└─────────────────────────────────────────────────────────────────┘
```

### 1.2 各层定位

| Layer | 中文名 | 核心问题 | 关键指标数 |
|-------|--------|----------|------------|
| **L1** | 网络底座 | 能用吗？ | 4 |
| **L2** | 执行质量 | 过程规范吗？ | 4 |
| **L3** | 业务成效 | 结果好吗？ | 4 |
| **L4** | AI 贡献 | AI 真干活吗？ | 4 |

### 1.3 为什么 Layer 4 是核心？

> Layer 4 是 TAES 区别于传统方法论的核心差异点。

| 传统方法论 | TAES |
|------------|------|
| 衡量"任务完成了吗" | 衡量"AI 贡献了什么" |
| 人力投入 → 产出 | AI 生成 → 人工审核 → 产出 |
| 难以量化 AI 价值 | AI Contribution 可量化 |

---

## 2) Layer 1: Workplane Connectivity

> **核心问题**：基础设施能支撑 AI 执行吗？

### 2.1 指标清单

| 指标 | 英文 | 定义 | 单位 |
|------|------|------|------|
| **可用性** | Uptime | 服务可用时间占比 | % |
| **延迟** | Latency p95 | 95 分位请求延迟 | ms |
| **阻断率** | Block Rate | 被阻断请求占比 | % |
| **合规事件** | Compliance Events | 合规相关告警数 | 次/月 |

### 2.2 详细定义

#### L1-1: Uptime（可用性）

```
定义：Uptime = (总时间 - 不可用时间) / 总时间 × 100%

目标：≥ 99.5%

计算示例：
- 月总时间 = 30 × 24 = 720 小时
- 不可用时间 = 3 小时
- Uptime = (720 - 3) / 720 = 99.58%
```

| 等级 | 范围 | 说明 |
|------|------|------|
| 🟢 优秀 | ≥ 99.9% | 企业级 SLA |
| 🟡 达标 | 99.5-99.9% | 基本可用 |
| 🟠 警告 | 99.0-99.5% | 需要关注 |
| 🔴 告警 | < 99.0% | 需要干预 |

#### L1-2: Latency p95（95 分位延迟）

```
定义：所有请求中，95% 的请求延迟低于此值

目标：< 200ms

计算方法：
1. 收集所有请求延迟数据
2. 排序后取 95 分位值
```

| 等级 | 范围 | 说明 |
|------|------|------|
| 🟢 优秀 | < 100ms | 极佳体验 |
| 🟡 达标 | 100-200ms | 正常体验 |
| 🟠 警告 | 200-500ms | 可接受但需优化 |
| 🔴 告警 | > 500ms | 影响使用 |

#### L1-3: Block Rate（阻断率）

```
定义：Block Rate = 被阻断请求数 / 总请求数 × 100%

目标：< 1%

场景：
- 网络层阻断（防火墙/GFW）
- 服务限流
- 权限拒绝
```

#### L1-4: Compliance Events（合规事件）

```
定义：与合规相关的告警事件数量

目标：0 次/月（关键事件），< 5 次/月（一般事件）

事件类型：
- 数据泄露告警
- 跨境传输告警
- 权限越界告警
```

### 2.3 数据源

| 指标 | 数据源 | 采集方式 |
|------|--------|----------|
| Uptime | 监控系统（如 UptimeRobot） | 每分钟探测 |
| Latency p95 | APM（如 Azure Monitor） | 请求埋点 |
| Block Rate | 网关日志 | 日志分析 |
| Compliance Events | SIEM 系统 | 事件聚合 |

---

## 3) Layer 2: AI Execution Quality

> **核心问题**：AI 执行过程是否规范？

### 3.1 指标清单

| 指标 | 英文 | 定义 | 单位 |
|------|------|------|------|
| **Spec 质量** | Spec Quality Score | Spec 评审得分 | 分 |
| **Eval 覆盖率** | Eval Coverage | 有 Eval 的任务占比 | % |
| **AI 采纳率** | AI Adoption Rate | AI 建议被采纳的比例 | % |
| **证据完整率** | Evidence Completeness | 符合 Schema 的记录占比 | % |

### 3.2 详细定义

#### L2-1: Spec Quality Score（Spec 质量）

```
定义：按四维度评分模型计算的 MISSION.md 质量分

目标：≥ 80 分

计算方法：
- 清晰度 (30%) + 可执行性 (25%) + 可验收性 (25%) + 范围约束 (20%)
- 详见 spec-review.md
```

| 等级 | 范围 | 说明 |
|------|------|------|
| 🟢 A 级 | 90-100 | 优秀 |
| 🟡 B 级 | 80-89 | 达标 |
| 🟠 C 级 | 60-79 | 需改进 |
| 🔴 D 级 | < 60 | 不合格 |

#### L2-2: Eval Coverage（Eval 覆盖率）

```
定义：Eval Coverage = 有 Eval 的 Mission 数 / 总 Mission 数 × 100%

目标：≥ 80%

"有 Eval" 的判定：
- 存在 eval 脚本/配置
- 至少运行过 1 次
- 有 eval-result 记录
```

#### L2-3: AI Adoption Rate（AI 采纳率）

```
定义：AI Adoption = 被采纳的 AI 建议数 / AI 总建议数 × 100%

目标：参考值（不设硬性目标）

说明：
- 过高可能说明人工审核不严
- 过低可能说明 Spec 质量差或 AI 能力不匹配
- 合理范围：40-70%
```

#### L2-4: Evidence Completeness（证据完整率）

```
定义：Evidence Completeness = 符合 Schema 的 Evidence / 总 Evidence × 100%

目标：≥ 95%

验证方法：
- JSON Schema 自动校验
- 必填字段检查
- 格式合规检查
```

### 3.3 数据源

| 指标 | 数据源 | 采集方式 |
|------|--------|----------|
| Spec Quality | 评审记录 | 人工/AI 评审 |
| Eval Coverage | Repo 扫描 | CI/CD 统计 |
| AI Adoption | Git diff 分析 | 脚本计算 |
| Evidence Completeness | Schema 验证 | 自动校验 |

---

## 4) Layer 3: Business Scale Outcomes

> **核心问题**：业务目标达成了吗？

### 4.1 指标清单

| 指标 | 英文 | 定义 | 单位 |
|------|------|------|------|
| **交付周期** | Lead Time | 从启动到交付的时间 | 小时/天 |
| **成功率** | Success Rate | 一次通过验收的比例 | % |
| **越界拦截** | Boundary Interception | 约束拦截的次数 | 次 |
| **投资回报** | ROI | 效益 / 投入 | 倍数 |

### 4.2 详细定义

#### L3-1: Lead Time（交付周期）

```
定义：Lead Time = Mission 交付时间 - Mission 启动时间

目标：基线 ↓30%（相对于传统方式）

计算方法：
- 启动时间：Issue 创建 / Kickoff 会议
- 交付时间：PR Merge / 验收通过
```

| 任务类型 | 参考基线 | TAES 目标 |
|----------|----------|-----------|
| 小型（1-2 天） | 16 小时 | 11 小时 |
| 中型（3-5 天） | 40 小时 | 28 小时 |
| 大型（1-2 周） | 80 小时 | 56 小时 |

#### L3-2: Success Rate（成功率）

```
定义：Success Rate = 一次通过验收的 Mission / 总 Mission × 100%

目标：≥ 90%

"一次通过"判定：
- 首次提交验收即 Pass
- 无需返工/重做
```

#### L3-3: Boundary Interception Rate（越界拦截）

```
定义：Constraints 触发拦截的次数统计

目标：有记录即可（证明约束生效）

说明：
- 此指标不追求"越少越好"
- 有拦截 = 约束在保护
- 无拦截 = 可能约束未配置或未触发
```

#### L3-4: ROI（投资回报率）

```
定义：ROI = (效益 - 投入) / 投入 × 100%

目标：> 100%（即 2 倍回报）

效益计算：
- 节省工时 × 人力成本
- 减少返工 × 返工成本
- 产出提升 × 产出价值

投入计算：
- TAES 订阅费用
- 培训成本
- 实施人力
```

### 4.3 数据源

| 指标 | 数据源 | 采集方式 |
|------|--------|----------|
| Lead Time | Issue/PR 时间戳 | GitHub API |
| Success Rate | 验收记录 | Evidence 统计 |
| Boundary Interception | 拦截日志 | 日志分析 |
| ROI | 财务数据 | 人工计算 |

---

## 5) Layer 4: AI Contribution（核心）

> **核心问题**：AI 在 Mission 中贡献了什么？

### 5.1 指标清单

| 指标 | 英文 | 定义 | 单位 |
|------|------|------|------|
| **AI 贡献率** | AI Contribution Rate | AI 生成内容占最终产出的比例 | % |
| **首次通过** | First-Pass Acceptance | 首次提交即通过的比例 | % |
| **迭代轮次** | Iteration Rounds | 平均修改轮次 | 次 |
| **人工干预率** | Human Intervention Rate | 需人工处理的环节占比 | % |

### 5.2 详细定义

#### L4-1: AI Contribution Rate（AI 贡献率）⭐

```
定义：AI Contribution = AI 生成内容量 / 最终交付内容量 × 100%

目标：≥ 60%

计算方法：
1. 基于 Git diff 分析
2. 识别 AI 生成的代码块/文本
3. 统计 AI 贡献的行数/字数
```

**计算脚本示例**：

```python
# calc_ai_contribution.py
import subprocess
import re

def calc_ai_contribution(repo_path: str, base_branch: str = "main") -> float:
    """
    计算 AI 贡献率
    方法：分析 commit message 或 diff 注释中的 AI 标记
    """
    # 获取所有 commit
    result = subprocess.run(
        ["git", "log", "--oneline", f"{base_branch}..HEAD"],
        cwd=repo_path,
        capture_output=True,
        text=True
    )
    
    total_commits = len(result.stdout.strip().split('\n'))
    
    # 识别 AI 生成的 commit（假设有 [AI] 或 [Copilot] 标记）
    ai_pattern = r'\[AI\]|\[Copilot\]|Generated by|Auto-generated'
    ai_commits = len(re.findall(ai_pattern, result.stdout, re.IGNORECASE))
    
    if total_commits == 0:
        return 0.0
    
    return ai_commits / total_commits

# 更精确的方法：基于行数统计
def calc_ai_contribution_by_lines(repo_path: str) -> float:
    """
    基于代码行数计算 AI 贡献率
    需要在 commit 时标记 AI 生成的内容
    """
    # 获取 AI 贡献的行数（通过 commit message 标记）
    ai_lines = subprocess.run(
        ["git", "log", "--all", "--grep=AI", "--numstat", "--pretty=format:"],
        cwd=repo_path,
        capture_output=True,
        text=True
    )
    
    # 解析统计数据
    total_ai_additions = 0
    for line in ai_lines.stdout.strip().split('\n'):
        if line:
            parts = line.split('\t')
            if len(parts) >= 2 and parts[0].isdigit():
                total_ai_additions += int(parts[0])
    
    # 获取总行数
    total_result = subprocess.run(
        ["git", "log", "--numstat", "--pretty=format:"],
        cwd=repo_path,
        capture_output=True,
        text=True
    )
    
    total_additions = 0
    for line in total_result.stdout.strip().split('\n'):
        if line:
            parts = line.split('\t')
            if len(parts) >= 2 and parts[0].isdigit():
                total_additions += int(parts[0])
    
    if total_additions == 0:
        return 0.0
    
    return total_ai_additions / total_additions
```

| 等级 | 范围 | 说明 |
|------|------|------|
| 🟢 高效 | ≥ 80% | AI 深度参与 |
| 🟡 达标 | 60-80% | AI 有效协同 |
| 🟠 待提升 | 40-60% | 需优化 Spec/Constraints |
| 🔴 低效 | < 40% | TAES 未真正落地 |

#### L4-2: First-Pass Acceptance（首次通过率）

```
定义：First-Pass = 首次提交即通过 Eval / 总提交次数 × 100%

目标：≥ 70%

说明：
- 衡量 AI 产出的精准度
- 高 = AI 理解准确，Spec 清晰
- 低 = 需要检查 Spec 质量或 Constraints 配置
```

#### L4-3: Iteration Rounds（迭代轮次）

```
定义：从首次 AI 产出到验收通过的平均修改轮次

目标：≤ 3 次

计算方法：
- 统计每个 Mission 的 PR 修改次数
- 取平均值
```

| 等级 | 范围 | 说明 |
|------|------|------|
| 🟢 优秀 | 1-2 次 | AI 一次到位 |
| 🟡 正常 | 3 次 | 可接受 |
| 🟠 偏高 | 4-5 次 | 需优化 |
| 🔴 过高 | > 5 次 | 需根因分析 |

#### L4-4: Human Intervention Rate（人工干预率）

```
定义：Human Intervention = 需人工处理的环节 / 总环节 × 100%

目标：≤ 30%

"人工处理"场景：
- 手动修改 AI 产出
- 手动触发流程
- 人工决策节点
- 异常处理

"非人工"场景：
- AI 自动生成
- 自动化 Eval
- 自动化部署
```

### 5.3 数据源

| 指标 | 数据源 | 采集方式 |
|------|--------|----------|
| AI Contribution | Git diff + Commit 标记 | 脚本分析 |
| First-Pass | Eval 结果 | CI 统计 |
| Iteration Rounds | PR 历史 | GitHub API |
| Human Intervention | 操作日志 | 行为分析 |

### 5.4 为什么 Layer 4 是"核心"？

```
如果 AI Contribution Rate < 40%：
    → 说明团队还在用传统方式工作
    → TAES 没有真正落地
    → 需要检查：
        1. Spec 质量是否足够让 AI 理解？
        2. Constraints 是否配置正确？
        3. 团队是否真的在用 Copilot？
```

---

## 6) 指标看板配置

### 6.1 看板布局

```
┌─────────────────────────────────────────────────────────────────┐
│                    TAES Metrics Dashboard                        │
├─────────────────────────────────────────────────────────────────┤
│  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐  │
│  │ L1: Workplane   │  │ L2: Execution   │  │ L3: Business    │  │
│  │ Uptime: 99.8%   │  │ Spec Qual: 85   │  │ Lead Time: ↓32% │  │
│  │ Latency: 120ms  │  │ Eval Cov: 82%   │  │ Success: 92%    │  │
│  └─────────────────┘  └─────────────────┘  └─────────────────┘  │
├─────────────────────────────────────────────────────────────────┤
│  ┌───────────────────────────────────────────────────────────┐  │
│  │              ⭐ L4: AI Contribution (核心)                 │  │
│  │  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐      │  │
│  │  │   68%   │  │   75%   │  │  2.3 次  │  │   22%   │      │  │
│  │  │AI Contrib│  │1st Pass │  │Iteration│  │Human Int│      │  │
│  │  └─────────┘  └─────────┘  └─────────┘  └─────────┘      │  │
│  └───────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

### 6.2 告警规则

```yaml
# alert-rules.yaml
alerts:
  - name: "L1 Uptime 告警"
    condition: uptime < 99.0
    level: critical
    action: notify_ops
    
  - name: "L4 AI Contribution 低"
    condition: ai_contribution_rate < 0.4
    level: warning
    action: notify_owner
    message: "AI 贡献率过低，请检查 Spec 质量和 Constraints 配置"
    
  - name: "L4 Iteration 过高"
    condition: iteration_rounds > 5
    level: warning
    action: create_issue
```

---

## 7) 指标采集周期

| Layer | 指标 | 采集周期 | 聚合周期 |
|-------|------|----------|----------|
| L1 | Uptime | 1 分钟 | 日/周/月 |
| L1 | Latency | 实时 | 日/周/月 |
| L2 | Spec Quality | 每次评审 | 周/月 |
| L2 | Eval Coverage | 每日 | 周/月 |
| L3 | Lead Time | 每次交付 | 周/月 |
| L3 | Success Rate | 每次交付 | 周/月 |
| L4 | AI Contribution | 每次 Merge | 周/月 |
| L4 | First-Pass | 每次 PR | 周/月 |

---

## 8) 与其他文档的关系

| 文档 | 关系 |
|------|------|
| [TAES.md §6](../../../TAES.md) | 本文档是 §6 的详细展开 |
| [qc-playbook.md](../qc-playbook.md) | 引用本文档的指标定义 |
| [evidence-schema.md](../Acceptance/evidence-schema.md) | 指标值存储在 Evidence 中 |
| [execution-gates.md](../Checkpoints/execution-gates.md) | 门禁检查引用指标阈值 |

---

## 版本历史

| 版本 | 日期 | 变更 | 作者 |
|------|------|------|------|
| v1.0 | 2026-01-03 | 初始版本 | QA Architect |
