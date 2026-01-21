# 📅 Schedule - 工作时段定义

> Worktime > schedule

## 标准工作时段

### 默认排班

| 时段 | 时间 | 状态 | 说明 |
|------|------|------|------|
| 早班 | 08:00 - 12:00 | ACTIVE | 全量 Connection |
| 午休 | 12:00 - 13:30 | STANDBY | 基本 Connection |
| 晚班 | 13:30 - 18:00 | ACTIVE | 全量 Connection |
| 下班 | 18:00 - 08:00 | STANDBY | 按需唤醒 |

### 周末/假期

| 日期类型 | 默认状态 | 说明 |
|----------|----------|------|
| 周六日 | STANDBY | 值班人员可 ACTIVE |
| 法定假日 | STANDBY | 紧急情况可唤醒 |
| 调休日 | 按安排 | 参照排班表 |

## 时区处理

```yaml
default_timezone: Asia/Shanghai (UTC+8)

# E队成员可能在不同时区
member_overrides:
  - member: remote_dev_1
    timezone: America/Los_Angeles
    shift: +16h  # 调整到当地工作时间
```

## 弹性时段

### 核心时间 (必须在线)
```
周一至周五: 10:00 - 12:00, 14:00 - 16:00
用途: 团队协作、会议、紧急响应
```

### 弹性时间 (自主安排)
```
08:00 - 10:00, 16:00 - 18:00
用途: 个人任务、深度工作
状态: 可选 ACTIVE 或 STANDBY
```

## 特殊排班

### 值班轮换
```yaml
oncall_rotation:
  cycle: weekly
  members: [member_a, member_b, member_c]
  responsibilities:
    - 监控 Connection 状态
    - 响应紧急问题
    - 非工作时间 ACTIVE 权限
```

### 项目冲刺
```yaml
sprint_mode:
  trigger: manual  # 项目经理启动
  duration: 1-2 weeks
  changes:
    - 扩展 ACTIVE 时段
    - 增加并发容量
    - 成本预算上调
```

## 日历集成

```
# 建议与企业日历同步
- Outlook / Google Calendar
- 自动识别会议 → ACTIVE
- 自动识别休假 → OFFLINE
```
