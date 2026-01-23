# Mission 启动检查清单 (Kickoff Checklist)

> **定位**：事前控制的核心文档，确保 Mission 在启动前满足所有前置条件  
> 版本：v1.0 | 更新日期：2026-01-03 | 维护者：QA Architect

---

## 1) 检查清单总览

### 1.1 使用时机

```
┌─────────────────────────────────────────────────────────────┐
│                    Mission 生命周期                          │
│                                                             │
│   [创建 Repo] → [Kickoff Checklist] → [开始执行] → [交付]   │
│                       ↑                                     │
│                   你在这里                                   │
│                   ════════                                   │
└─────────────────────────────────────────────────────────────┘
```

### 1.2 检查原则

| 原则 | 说明 |
|------|------|
| **全量检查** | 所有检查项必须逐一确认，不可跳过 |
| **阻断机制** | 任一必选项未通过，Mission 不得启动 |
| **留痕记录** | 检查结果需记录在 Issue 或文档中 |

---

## 2) 完整检查清单

### 2.1 Intent（意图）检查 — 5 项

> **目标**：确保任务描述清晰到 AI 可执行

| # | 检查项 | 标准 | 验收方式 | 必选 | 自动化 |
|---|--------|------|----------|------|--------|
| I-1 | **MISSION.md 存在** | 文件存在于 Repo 根目录 | 文件检查 | ✅ | ✅ 可自动 |
| I-2 | **明确输入** | 有清晰的任务描述与上下文 | 人工审核 | ✅ | ⚪ 可辅助 |
| I-3 | **预期输出** | 产出物是具体的（文档/代码/数据） | 人工审核 | ✅ | ⚪ 可辅助 |
| I-4 | **验收标准** | Pass/Fail 可判定的条件 | 人工审核 | ✅ | ⚪ 可辅助 |
| I-5 | **范围约束** | 时间/规模/依赖的明确边界 | 人工审核 | ✅ | ⚪ 可辅助 |

**I-2 至 I-5 的快速判定方法**：

```markdown
## 快速自检问题

- [ ] 我能用一句话说清楚这个 Mission 要做什么吗？ → I-2
- [ ] 我能列出具体要产出的文件/代码/数据吗？ → I-3
- [ ] 我能明确说出"什么情况算完成"吗？ → I-4
- [ ] 我能说出"不包含什么"吗？ → I-5
```

### 2.2 Constraints（约束）检查 — 4 项

> **目标**：确保 AI 执行边界已配置

| # | 检查项 | 标准 | 验收方式 | 必选 | 自动化 |
|---|--------|------|----------|------|--------|
| C-1 | **copilot-instructions.md 存在** | 文件存在于 `.github/` 目录 | 文件检查 | ✅ | ✅ 可自动 |
| C-2 | **角色定义** | 指令中包含 AI 角色说明 | 内容检查 | ✅ | ⚪ 可辅助 |
| C-3 | **输出规范** | 指令中包含格式/风格要求 | 内容检查 | ⚪ | ⚪ 可辅助 |
| C-4 | **禁止事项** | 指令中包含红线/边界 | 内容检查 | ⚪ | ⚪ 可辅助 |

**copilot-instructions.md 最小模板**：

```markdown
# Copilot Instructions

## 角色定义
当在此 Repo 工作时，AI 应以 [角色名] 身份协助...

## 输出规范
- 使用 [语言] 编写
- 遵循 [格式] 规范

## 禁止事项
- 不 [具体禁止行为]
```

### 2.3 Evidence（证据）检查 — 3 项

> **目标**：确保验收机制已就绪

| # | 检查项 | 标准 | 验收方式 | 必选 | 自动化 |
|---|--------|------|----------|------|--------|
| E-1 | **Eval 方案已定义** | 至少有 Pass/Fail 条件 | 人工审核 | ✅ | ⚪ 可辅助 |
| E-2 | **OUTPUT 目录存在** | 目录结构符合 MR 规范 | 目录检查 | ⚪ | ✅ 可自动 |
| E-3 | **Evidence 模板准备** | evidence.yaml 模板已创建 | 文件检查 | ⚪ | ✅ 可自动 |

**Eval 方案最小定义**：

```markdown
## 验收标准

### Pass 条件
- [ ] 产出物 A 完成，包含 [具体内容]
- [ ] 产出物 B 完成，格式符合 [规范]

### Fail 条件
- [ ] 缺少核心产出物
- [ ] 格式严重不符
- [ ] 逻辑错误/自相矛盾
```

### 2.4 Workplane（基础设施）检查 — 3 项

> **目标**：确保执行环境可用

| # | 检查项 | 标准 | 验收方式 | 必选 | 自动化 |
|---|--------|------|----------|------|--------|
| W-1 | **网络可用** | 延迟 p95 < 200ms | 自动探测 | ✅ | ✅ 可自动 |
| W-2 | **Copilot 可访问** | VS Code 能正常调用 | 手动测试 | ✅ | ⚪ 需手动 |
| W-3 | **Repo 权限正确** | 执行者有 Write 权限 | 权限检查 | ✅ | ✅ 可自动 |

---

## 3) 检查记录模板

### 3.1 Issue 模板

```markdown
## Mission Kickoff Checklist

**Mission**: [Mission 名称]
**Repo**: [org/repo]
**Owner**: @[用户名]
**检查日期**: YYYY-MM-DD

### Intent 检查
- [x] I-1 MISSION.md 存在
- [x] I-2 明确输入
- [x] I-3 预期输出
- [x] I-4 验收标准
- [x] I-5 范围约束

### Constraints 检查
- [x] C-1 copilot-instructions.md 存在
- [x] C-2 角色定义
- [ ] C-3 输出规范 (可选)
- [ ] C-4 禁止事项 (可选)

### Evidence 检查
- [x] E-1 Eval 方案已定义
- [ ] E-2 OUTPUT 目录存在 (可选)
- [ ] E-3 Evidence 模板准备 (可选)

### Workplane 检查
- [x] W-1 网络可用 (p95: ___ms)
- [x] W-2 Copilot 可访问
- [x] W-3 Repo 权限正确

### 检查结果
- [x] **通过** - Mission 可以启动
- [ ] **不通过** - 需整改项：___

### 备注
[任何需要记录的特殊情况]
```

### 3.2 检查结果判定

| 结果 | 条件 | 后续动作 |
|------|------|----------|
| **✅ 通过** | 所有必选项(✅)全部通过 | Mission 进入执行阶段 |
| **⚠️ 有条件通过** | 必选项通过，部分可选项未通过 | 可启动，但需跟进补充 |
| **❌ 不通过** | 任一必选项未通过 | 阻断启动，先整改 |

---

## 4) 自动化检查脚本

### 4.1 结构检查脚本

```bash
#!/bin/bash
# mission-kickoff-check.sh

REPO_PATH=${1:-.}
ERRORS=0

echo "=== Mission Kickoff Check ==="

# I-1: MISSION.md 存在
if [ -f "$REPO_PATH/MISSION.md" ]; then
    echo "✅ I-1: MISSION.md exists"
else
    echo "❌ I-1: MISSION.md NOT found"
    ERRORS=$((ERRORS+1))
fi

# C-1: copilot-instructions.md 存在
if [ -f "$REPO_PATH/.github/copilot-instructions.md" ]; then
    echo "✅ C-1: copilot-instructions.md exists"
else
    echo "❌ C-1: copilot-instructions.md NOT found"
    ERRORS=$((ERRORS+1))
fi

# E-2: OUTPUT 目录存在
if [ -d "$REPO_PATH/OUTPUT" ]; then
    echo "✅ E-2: OUTPUT directory exists"
else
    echo "⚪ E-2: OUTPUT directory not found (optional)"
fi

# 结果汇总
echo ""
if [ $ERRORS -eq 0 ]; then
    echo "=== ✅ PASSED: Ready to start ==="
    exit 0
else
    echo "=== ❌ FAILED: $ERRORS critical issues ==="
    exit 1
fi
```

### 4.2 PowerShell 版本

```powershell
# mission-kickoff-check.ps1

param(
    [string]$RepoPath = "."
)

$Errors = 0

Write-Host "=== Mission Kickoff Check ===" -ForegroundColor Cyan

# I-1: MISSION.md 存在
if (Test-Path "$RepoPath/MISSION.md") {
    Write-Host "✅ I-1: MISSION.md exists" -ForegroundColor Green
} else {
    Write-Host "❌ I-1: MISSION.md NOT found" -ForegroundColor Red
    $Errors++
}

# C-1: copilot-instructions.md 存在
if (Test-Path "$RepoPath/.github/copilot-instructions.md") {
    Write-Host "✅ C-1: copilot-instructions.md exists" -ForegroundColor Green
} else {
    Write-Host "❌ C-1: copilot-instructions.md NOT found" -ForegroundColor Red
    $Errors++
}

# E-2: OUTPUT 目录存在
if (Test-Path "$RepoPath/OUTPUT" -PathType Container) {
    Write-Host "✅ E-2: OUTPUT directory exists" -ForegroundColor Green
} else {
    Write-Host "⚪ E-2: OUTPUT directory not found (optional)" -ForegroundColor Yellow
}

# 结果汇总
Write-Host ""
if ($Errors -eq 0) {
    Write-Host "=== ✅ PASSED: Ready to start ===" -ForegroundColor Green
    exit 0
} else {
    Write-Host "=== ❌ FAILED: $Errors critical issues ===" -ForegroundColor Red
    exit 1
}
```

### 4.3 GitHub Actions 集成

```yaml
# .github/workflows/kickoff-check.yml
name: Mission Kickoff Check

on:
  push:
    branches: [main]
    paths:
      - 'MISSION.md'
      - '.github/copilot-instructions.md'

jobs:
  kickoff-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Check MISSION.md
        run: |
          if [ -f "MISSION.md" ]; then
            echo "✅ MISSION.md exists"
          else
            echo "❌ MISSION.md NOT found"
            exit 1
          fi
          
      - name: Check copilot-instructions.md
        run: |
          if [ -f ".github/copilot-instructions.md" ]; then
            echo "✅ copilot-instructions.md exists"
          else
            echo "❌ copilot-instructions.md NOT found"
            exit 1
          fi
          
      - name: Kickoff Status
        run: echo "✅ Mission ready for kickoff"
```

---

## 5) 常见问题与解决

### Q1: MISSION.md 应该包含什么？

**最小内容**：

```markdown
# [Mission 名称]

## 任务描述
[一句话说清楚要做什么]

## 输入
- [上下文/依赖/参考资料]

## 预期输出
- [ ] [具体产出物 1]
- [ ] [具体产出物 2]

## 验收标准
- [Pass 条件]
- [Fail 条件]

## 范围约束
- 时间：[截止日期]
- 不包含：[明确排除的内容]
```

### Q2: 没有 Eval 脚本怎么办？

**可接受的最小 Eval**：
- 人工 Checklist（在 MISSION.md 中定义）
- 验收会议（Owner + Reviewer 共同确认）

**不可接受**：
- 没有任何验收标准
- "完成了就行"

### Q3: Workplane 检查失败怎么办？

| 问题 | 解决方案 |
|------|----------|
| 网络延迟高 | 联系 Ops 检查 Workplane 状态 |
| Copilot 不可用 | 检查订阅状态、网络配置 |
| 权限不足 | 联系 Org Admin 授权 |

---

## 6) 与其他 QC 文档的关系

```
mission-kickoff.md (本文档)
    │
    ├── 通过后 → Checkpoints/execution-gates.md (事中控制)
    │
    └── 参考 → spec-review.md (Spec 质量评审，更详细)
```

---

## 版本历史

| 版本 | 日期 | 变更 | 作者 |
|------|------|------|------|
| v1.0 | 2026-01-03 | 初始版本 | QA Architect |
