# 项目管理

> 预计学习时间：15 分钟
> 
> 适合：任务负责人

## GitHub 项目管理工具

### 1. Issues - 任务管理

Issue 是最基本的任务单元。

**创建 Issue**：
1. 点击 "Issues" → "New issue"
2. 选择模板（任务/问题反馈）
3. 填写标题和描述
4. 分配负责人（Assignees）
5. 添加标签（Labels）
6. 关联里程碑（Milestone）

**Issue 模板**：
- `任务模板`：创建新任务
- `问题反馈模板`：报告问题

### 2. Projects - 看板视图

Projects 提供可视化的任务看板。

**创建 Project**：
1. 点击 "Projects" → "New project"
2. 选择模板（推荐 Board）
3. 添加列：待办 / 进行中 / 已完成
4. 将 Issues 拖入对应列

**看板布局**：
```
┌─────────────┬─────────────┬─────────────┐
│   📋 待办   │  🔄 进行中  │   ✅ 完成   │
├─────────────┼─────────────┼─────────────┤
│  Issue #1   │  Issue #3   │  Issue #5   │
│  Issue #2   │  Issue #4   │  Issue #6   │
│             │             │             │
└─────────────┴─────────────┴─────────────┘
```

### 3. Milestones - 里程碑

Milestones 用于管理阶段性目标。

**创建 Milestone**：
1. Issues → Milestones → New milestone
2. 设置名称、截止日期、描述
3. 将相关 Issues 关联到 Milestone

**示例**：
```
M1: 需求确认 (截止: 12/15)
├── Issue #1: 需求调研
├── Issue #2: 需求文档
└── Issue #3: 需求评审

M2: 开发阶段 (截止: 12/30)
├── Issue #4: 功能开发
└── Issue #5: 测试
```

## 任务分解技巧

### 使用 Checklist

在 Issue 描述中使用 Checklist 分解子任务：

```markdown
## 子任务

- [ ] 调研竞品
- [ ] 整理需求
- [ ] 编写文档
- [x] 已完成的项
```

### 使用子 Issue

对于复杂任务，可以创建子 Issue：

```markdown
## 关联 Issue

- #10 子任务一
- #11 子任务二

依赖: #5 需先完成
```

## MISSION.md 管理

作为任务负责人，需要维护 `MISSION.md`：

1. **定期更新进度**
2. **更新里程碑状态**
3. **记录重要决策**
4. **维护更新日志**

## 下一步

👉 继续学习 [04-copilot-guide.md](04-copilot-guide.md)
