# [Issue] Menu of System（System Kernel）

> 目标：把 TeamsEdge 的 **System Kernel** 菜单从“概念描述”落到可实现、可验收的配置与治理能力。

## 0. 对齐：当前菜单定义（来自 Menu.md）

System Kernel 目前包含：

- **Operator**：操作员与权限
- **Setting**：全局系统设置（含全局变量 Var）
- **Compliance**：合规审计（例如对齐 MCSB / 数据隐私）
- **Backup and Restore**：备份与恢复

## 1. 被使用场景（Jobs-to-be-done）

1) 新接手/新环境：快速知道“谁有权限、系统怎么配、在哪里看合规、怎么备份”。

2) 日常运维：
- 给某人临时授权、到期回收
- 调整全局配置并可追溯变更
- 在发布或事故后做审计/复盘

3) 事故与恢复：
- 定位最近一次可用备份
- 执行恢复并输出可审计记录

## 2. 设计原则（顶级 UX 视角）

- **默认面向操作效率**：一线运维在 30 秒内能完成“查看状态 / 找到入口”。
- **高风险操作强约束**：授权变更、关键配置变更、恢复动作必须可审计。
- **信息分层**：
  - 默认展示：当前状态与常用操作
  - 折叠/详情：审计记录、策略细节、历史版本

## 3. 信息架构（IA）

### 3.1 Operator（操作员）

**默认展示**：
- 操作员列表（账号/角色/权限范围/状态/有效期）
- 常用动作：新增、禁用、权限变更、到期回收

**详情/折叠**：
- 权限变更审计日志（谁在何时做了什么）

### 3.2 Setting（系统配置）

**默认展示**：
- 关键配置概览（按分组展示：系统级 / 运行时 / 集成）
- 全局变量 Var 列表（键、当前值摘要、最近变更时间、变更人）

**详情/折叠**：
- 配置历史版本与差异（diff）
- 回滚到某个版本（受控动作）

### 3.3 Compliance（合规审计）

**默认展示**：
- 当前合规状态摘要（Pass/Warning/Fail）
- 最近一次审计时间、责任人、报告入口

**详情/折叠**：
- 审计项目清单与证据链接
- 例外项（Exception）记录与到期时间

### 3.4 Backup and Restore（备份与恢复）

**默认展示**：
- 最近备份状态（成功/失败、时间点、范围摘要）
- 常用动作：立即备份、查看备份列表

**高风险动作**：
- 恢复（Restore）必须二次确认，并记录审计信息

## 4. 功能需求（MVP）

> 只覆盖“能用 + 可控 + 可审计”的最小闭环。

- Operator
  - 支持创建/禁用操作员
  - 支持给操作员分配权限范围（最少粒度：读/写/管理）
  - 支持设置权限有效期（到期自动失效）
  - 记录权限变更审计日志

- Setting
  - 支持查看/编辑全局配置（Var）
  - 配置变更必须记录：变更人、时间、变更原因（可选或必填按风险等级）
  - 支持查看历史版本

- Compliance
  - 支持存档审计记录（报告链接/证据链接）
  - 支持展示当前状态摘要

- Backup and Restore
  - 支持备份列表与状态
  - 支持执行恢复（带二次确认）
  - 恢复动作记录审计信息（操作者、时间、恢复点、原因）

## 5. 数据字段建议（用于实现对齐）

- Operator
  - operator_id
  - account（登录账号）
  - display_name
  - role（可选）
  - permission_scope（读/写/管理 + 资源范围）
  - status（active/disabled）
  - expires_at（可空）
  - updated_by / updated_at

- Setting / Var
  - key
  - value（可脱敏展示）
  - value_type
  - scope（global / env / integration）
  - last_changed_by / last_changed_at
  - change_reason（按风险等级决定必填）

- Compliance
  - audit_id
  - status（pass/warn/fail）
  - audited_at
  - owner
  - report_url
  - evidence_urls[]
  - exceptions[]（含到期时间）

- Backup
  - backup_id
  - created_at
  - created_by
  - status
  - scope_summary
  - storage_location（可选）

- Restore
  - restore_id
  - backup_id
  - requested_by
  - requested_at
  - approved_by（如需要审批）
  - executed_at
  - reason

## 6. 验收标准（可测试）

- [ ] 能在 Operator 中创建/禁用操作员，并看到权限范围与到期时间
- [ ] 权限变更会产生审计记录，且可按时间倒序查询
- [ ] 能在 Setting 中修改 Var，并能看到最近变更人/时间
- [ ] Setting 变更具备历史版本可追溯
- [ ] Compliance 能展示当前状态摘要，并可打开审计报告/证据链接
- [ ] Backup 列表能看到最近状态；Restore 需要二次确认且有审计记录

## 7. 开放问题

- Operator 的权限模型最小粒度：是否需要按“菜单/资源类型”细分？
- Setting 的“变更原因”是否对所有变更必填，还是仅对高风险键必填？
- Restore 是否需要审批流（双人复核）？
