# CONNECTION API 规范

> TeamsEdge 软件接口定义
> 
> Version: 1.0.0

---

## 概述

本文档定义了 TeamsEdge 软件中 CONNECTION 模块的 API 接口。

**Base URL**: `/api/v1/connection`

---

## 认证

所有 API 需要 Workpass 认证：

```http
Authorization: Bearer <nexuspass_token>
```

---

## 1. 状态查询

### 1.1 获取个人状态

```http
GET /status
```

**Response**:
```json
{
  "member_id": "zhang_san",
  "workplace": "office",
  "worktime": "ACTIVE",
  "workbench": {
    "device_id": "macbook-001",
    "device_type": "laptop",
    "os": "macos"
  },
  "workplane": {
    "channel": "corp.vpn",
    "latency_ms": 45,
    "status": "healthy"
  },
  "Workpass": {
    "nexuspass_id": "zhang@nexuspass",
    "level": "full",
    "providers": ["google", "github", "payment"]
  },
  "updated_at": "2026-01-13T14:32:00+08:00"
}
```

### 1.2 获取团队状态

```http
GET /team
```

**Response**:
```json
{
  "timestamp": "2026-01-13T14:32:00+08:00",
  "summary": {
    "active_count": 5,
    "standby_count": 2,
    "offline_count": 1
  },
  "members": [
    {
      "member_id": "zhang_san",
      "workplace": "office",
      "worktime": "ACTIVE",
      "workplane_status": "healthy"
    },
    {
      "member_id": "li_si",
      "workplace": "home",
      "worktime": "ACTIVE",
      "workplane_status": "degraded"
    }
  ],
  "cost": {
    "today": 127.5,
    "budget": 200,
    "utilization": 0.63
  }
}
```

---

## 2. 状态变更

### 2.1 签到 (Check-in)

```http
POST /checkin
```

**Request Body**:
```json
{
  "workplace": "office",
  "workbench": {
    "device_id": "macbook-001",
    "device_type": "laptop"
  }
}
```

**Response**:
```json
{
  "success": true,
  "worktime": "ACTIVE",
  "workplane": {
    "channel": "corp.vpn",
    "latency_ms": 45,
    "status": "healthy"
  },
  "message": "签到成功，已切换到 ACTIVE 状态"
}
```

### 2.2 签退 (Check-out)

```http
POST /checkout
```

**Response**:
```json
{
  "success": true,
  "worktime": "STANDBY",
  "message": "签退成功，已切换到 STANDBY 状态"
}
```

### 2.3 更新工作场所

```http
PUT /workplace
```

**Request Body**:
```json
{
  "workplace": "home"
}
```

**Response**:
```json
{
  "success": true,
  "workplace": "home",
  "workplane": {
    "channel": "self_hosted",
    "latency_ms": 120,
    "status": "healthy"
  },
  "message": "已切换到居家办公模式"
}
```

---

## 3. 健康检查

### 3.1 网络健康检查

```http
GET /health
```

**Response**:
```json
{
  "workplace": "office",
  "checks": [
    {
      "target": "github.com",
      "latency_ms": 45,
      "status": "ok"
    },
    {
      "target": "api.openai.com",
      "latency_ms": 89,
      "status": "ok"
    },
    {
      "target": "api.anthropic.com",
      "latency_ms": 102,
      "status": "ok"
    }
  ],
  "overall": "healthy",
  "checked_at": "2026-01-13T14:32:00+08:00"
}
```

### 3.2 Workpass 状态检查

```http
GET /Workpass/status
```

**Response**:
```json
{
  "nexuspass_id": "zhang@nexuspass",
  "level": "full",
  "providers": {
    "google": {
      "status": "active",
      "expires_at": null
    },
    "github": {
      "status": "active",
      "expires_at": "2026-12-31"
    },
    "payment": {
      "status": "active",
      "balance": 500.00,
      "currency": "USD"
    }
  }
}
```

---

## 4. 事件通知 (WebSocket)

### 连接

```
ws://teamsedge.local/ws/connection
```

### 事件类型

#### 状态变化
```json
{
  "event": "connection.state.changed",
  "data": {
    "member_id": "zhang_san",
    "previous_state": "STANDBY",
    "current_state": "ACTIVE",
    "timestamp": "2026-01-13T08:00:00+08:00"
  }
}
```

#### 网络降级
```json
{
  "event": "connection.health.degraded",
  "data": {
    "member_id": "li_si",
    "workplace": "home",
    "previous_status": "healthy",
    "current_status": "degraded",
    "latency_ms": 350,
    "message": "网络延迟升高，建议切换备用通道"
  }
}
```

#### 凭证即将过期
```json
{
  "event": "connection.Workpass.expiring",
  "data": {
    "provider": "github",
    "expires_at": "2026-01-20",
    "days_remaining": 7,
    "message": "GitHub 访问令牌将在 7 天后过期"
  }
}
```

---

## 5. 管理接口 (Admin Only)

### 5.1 紧急召回

```http
POST /admin/recall
```

**Request Body**:
```json
{
  "members": ["zhang_san", "li_si"],
  "reason": "紧急会议",
  "priority": "high"
}
```

### 5.2 强制降级

```http
POST /admin/degrade
```

**Request Body**:
```json
{
  "level": 2,
  "reason": "成本超预算",
  "duration_minutes": 60
}
```

### 5.3 成本报表

```http
GET /admin/cost/report?period=weekly
```

**Response**:
```json
{
  "period": "2026-W02",
  "total_cost": 856.50,
  "budget": 1000,
  "by_workplace": {
    "office": 320.00,
    "home": 450.00,
    "mobile": 86.50
  },
  "by_member": [
    { "member_id": "zhang_san", "cost": 200.00, "active_hours": 40 },
    { "member_id": "li_si", "cost": 180.00, "active_hours": 36 }
  ]
}
```

---

## 错误响应

```json
{
  "error": {
    "code": "CONNECTION_FAILED",
    "message": "无法建立连接",
    "details": {
      "workplace": "mobile",
      "reason": "网络不可达"
    }
  }
}
```

### 错误码

| Code | Description |
|------|-------------|
| `AUTH_REQUIRED` | 需要 Workpass 认证 |
| `AUTH_EXPIRED` | Workpass 已过期 |
| `CONNECTION_FAILED` | 连接建立失败 |
| `WORKPLACE_INVALID` | 无效的工作场所 |
| `QUOTA_EXCEEDED` | 超出配额/预算 |
| `ADMIN_ONLY` | 需要管理员权限 |

---

## SDK 示例

### JavaScript/TypeScript

```typescript
import { ConnectionClient } from '@teamsedge/connection';

const client = new ConnectionClient({
  token: process.env.NEXUSPASS_TOKEN
});

// 签到
await client.checkin({
  workplace: 'office',
  workbench: { device_id: 'macbook-001' }
});

// 监听状态变化
client.on('connection.state.changed', (event) => {
  console.log(`${event.member_id} 状态变为 ${event.current_state}`);
});
```

### Python

```python
from teamsedge import ConnectionClient

client = ConnectionClient(token=os.environ['NEXUSPASS_TOKEN'])

# 获取团队状态
team = client.get_team_status()
print(f"在线人数: {team.summary.active_count}")

# 健康检查
health = client.health_check()
if health.overall != 'healthy':
    print(f"警告: 网络状态 {health.overall}")
```
