# Evidence Schema（证据规格定义）

> **定位**：TAES 可审计承诺的技术规范  
> 版本：v1.0 | 更新日期：2026-01-03 | 维护者：QA Architect

---

## 1) 概述

### 1.1 为什么需要 Evidence Schema？

| 没有 Schema | 有 Schema |
|-------------|-----------|
| Evidence 是散乱的日志 | Evidence 是结构化资产 |
| 无法自动验证 | 可自动校验完整性 |
| 审计靠人工翻找 | 审计可程序化执行 |
| 跨 Mission 不可比 | 跨 Mission 可聚合分析 |

### 1.2 Schema 设计原则

1. **必要性**：只定义审计必需的字段
2. **可验证**：每个字段有明确的验证规则
3. **可扩展**：支持自定义扩展字段
4. **与 MR 对齐**：路径规范与 Mission Repo 架构一致

---

## 2) Schema 定义

### 2.1 完整 Schema (JSON Schema)

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "$id": "https://edgeteams.ai/schemas/evidence/v1.0",
  "title": "TAES Evidence Schema",
  "description": "TAES 方法论的证据规格定义",
  "type": "object",
  "required": ["mission_id", "timestamp", "artifacts", "metrics", "audit"],
  "properties": {
    "mission_id": {
      "type": "string",
      "description": "Mission 唯一标识，格式：{org}/{repo}",
      "pattern": "^[a-zA-Z0-9_-]+/[a-zA-Z0-9_-]+$",
      "examples": ["EdgeTeam-Alpha/mission-api-docs"]
    },
    "version": {
      "type": "string",
      "description": "Schema 版本",
      "const": "1.0"
    },
    "timestamp": {
      "type": "string",
      "format": "date-time",
      "description": "证据生成时间（ISO 8601）",
      "examples": ["2026-01-03T10:30:00Z"]
    },
    "phase": {
      "type": "string",
      "enum": ["kickoff", "execution", "delivery", "audit"],
      "description": "Mission 阶段"
    },
    "artifacts": {
      "type": "array",
      "description": "产出物清单",
      "minItems": 1,
      "items": {
        "$ref": "#/definitions/artifact"
      }
    },
    "metrics": {
      "$ref": "#/definitions/metrics"
    },
    "audit": {
      "$ref": "#/definitions/audit"
    },
    "extensions": {
      "type": "object",
      "description": "自定义扩展字段",
      "additionalProperties": true
    }
  },
  "definitions": {
    "artifact": {
      "type": "object",
      "required": ["type", "path", "hash"],
      "properties": {
        "type": {
          "type": "string",
          "enum": ["spec", "output", "eval_result", "audit_log", "other"],
          "description": "产出物类型"
        },
        "path": {
          "type": "string",
          "description": "相对于 Repo 根目录的路径",
          "examples": ["Teams/Artifacts/api-docs.md"]
        },
        "hash": {
          "type": "string",
          "description": "文件 SHA-256 哈希",
          "pattern": "^[a-f0-9]{64}$"
        },
        "size_bytes": {
          "type": "integer",
          "description": "文件大小（字节）",
          "minimum": 0
        },
        "created_at": {
          "type": "string",
          "format": "date-time",
          "description": "创建时间"
        },
        "git_commit": {
          "type": "string",
          "description": "关联的 Git Commit SHA",
          "pattern": "^[a-f0-9]{40}$"
        }
      }
    },
    "metrics": {
      "type": "object",
      "description": "关键指标",
      "properties": {
        "layer1": {
          "type": "object",
          "description": "Workplane 指标",
          "properties": {
            "uptime": { "type": "number", "minimum": 0, "maximum": 1 },
            "latency_p95_ms": { "type": "number", "minimum": 0 }
          }
        },
        "layer2": {
          "type": "object",
          "description": "执行质量指标",
          "properties": {
            "spec_quality_score": { "type": "number", "minimum": 0, "maximum": 100 },
            "eval_coverage": { "type": "number", "minimum": 0, "maximum": 1 },
            "evidence_completeness": { "type": "number", "minimum": 0, "maximum": 1 }
          }
        },
        "layer3": {
          "type": "object",
          "description": "业务成效指标",
          "properties": {
            "lead_time_hours": { "type": "number", "minimum": 0 },
            "success_rate": { "type": "number", "minimum": 0, "maximum": 1 }
          }
        },
        "layer4": {
          "type": "object",
          "description": "AI 贡献度指标（核心）",
          "required": ["ai_contribution_rate"],
          "properties": {
            "ai_contribution_rate": { 
              "type": "number", 
              "minimum": 0, 
              "maximum": 1,
              "description": "AI 生成内容占比"
            },
            "first_pass_acceptance": { 
              "type": "boolean",
              "description": "首次提交是否通过"
            },
            "iteration_rounds": { 
              "type": "integer", 
              "minimum": 1,
              "description": "迭代轮次"
            },
            "human_intervention_rate": { 
              "type": "number", 
              "minimum": 0, 
              "maximum": 1,
              "description": "人工干预比例"
            }
          }
        }
      }
    },
    "audit": {
      "type": "object",
      "required": ["status"],
      "properties": {
        "status": {
          "type": "string",
          "enum": ["pending", "approved", "rejected", "conditional"],
          "description": "审计状态"
        },
        "reviewer": {
          "type": "string",
          "description": "审计员 GitHub 用户名"
        },
        "reviewed_at": {
          "type": "string",
          "format": "date-time",
          "description": "审计时间"
        },
        "comments": {
          "type": "string",
          "description": "审计备注"
        },
        "issues": {
          "type": "array",
          "description": "发现的问题",
          "items": {
            "type": "object",
            "properties": {
              "severity": { "type": "string", "enum": ["critical", "major", "minor"] },
              "description": { "type": "string" },
              "resolved": { "type": "boolean" }
            }
          }
        }
      }
    }
  }
}
```

### 2.2 YAML 格式示例

```yaml
# evidence.yaml - 放置于 Teams/Metadata/
mission_id: "EdgeTeam-Alpha/mission-api-docs"
version: "1.0"
timestamp: "2026-01-03T10:30:00Z"
phase: "delivery"

artifacts:
  - type: "spec"
    path: "MISSION.md"
    hash: "a1b2c3d4e5f6..."
    git_commit: "abc123def456..."
    
  - type: "output"
    path: "Teams/Artifacts/api-docs.md"
    hash: "f6e5d4c3b2a1..."
    size_bytes: 15360
    created_at: "2026-01-03T10:25:00Z"
    
  - type: "eval_result"
    path: "Teams/Metadata/eval-report.json"
    hash: "1a2b3c4d5e6f..."

metrics:
  layer1:
    uptime: 0.998
    latency_p95_ms: 180
    
  layer2:
    spec_quality_score: 85
    eval_coverage: 0.9
    evidence_completeness: 1.0
    
  layer3:
    lead_time_hours: 48
    success_rate: 1.0
    
  layer4:  # 核心指标
    ai_contribution_rate: 0.72
    first_pass_acceptance: true
    iteration_rounds: 2
    human_intervention_rate: 0.15

audit:
  status: "approved"
  reviewer: "auditor-zhang"
  reviewed_at: "2026-01-03T14:00:00Z"
  comments: "Evidence 完整，指标达标"
  issues: []

extensions:
  team: "EdgeTeam-Alpha"
  project_type: "documentation"
```

---

## 3) 字段详解

### 3.1 必填字段

| 字段 | 类型 | 说明 | 验证规则 |
|------|------|------|----------|
| `mission_id` | string | Mission 唯一标识 | 格式 `{org}/{repo}` |
| `timestamp` | datetime | 证据生成时间 | ISO 8601 格式 |
| `artifacts` | array | 产出物清单 | 至少 1 项 |
| `metrics.layer4.ai_contribution_rate` | number | AI 贡献率 | 0-1 之间 |
| `audit.status` | enum | 审计状态 | pending/approved/rejected/conditional |

### 3.2 Artifact 类型说明

| 类型 | 说明 | 典型文件 |
|------|------|----------|
| `spec` | 任务规格 | MISSION.md, README.md |
| `output` | 主要产出 | 代码、文档、数据 |
| `eval_result` | 评测结果 | eval-report.json |
| `audit_log` | 审计日志 | audit-log.md |
| `other` | 其他 | 辅助文件 |

### 3.3 审计状态流转

```
┌──────────┐    通过    ┌──────────┐
│ pending  │ ─────────→ │ approved │
└──────────┘            └──────────┘
     │                       
     │ 有问题                 
     ↓                       
┌──────────┐    整改后   ┌─────────────┐
│ rejected │ ←───────── │ conditional │
└──────────┘            └─────────────┘
```

---

## 4) 存放规范

### 4.1 文件位置

```
Mission-Repo/
├── Teams/
│   └── Metadata/
│       ├── evidence.yaml      # 主 Evidence 文件
│       ├── evidence-history/  # 历史版本
│       │   ├── evidence-2026-01-01.yaml
│       │   └── evidence-2026-01-02.yaml
│       └── eval-report.json   # Eval 结果（被 evidence 引用）
```

### 4.2 命名规范

| 场景 | 文件名 | 说明 |
|------|--------|------|
| 当前版本 | `evidence.yaml` | 始终指向最新 |
| 历史版本 | `evidence-{date}.yaml` | 日期格式 YYYY-MM-DD |
| 阶段快照 | `evidence-{phase}.yaml` | kickoff/execution/delivery |

---

## 5) 验证工具

### 5.1 命令行验证

```bash
# 使用 ajv-cli 验证
npm install -g ajv-cli
ajv validate -s evidence-schema.json -d evidence.yaml

# 输出示例
# evidence.yaml valid
```

### 5.2 Python 验证脚本

```python
# validate_evidence.py
import json
import yaml
from jsonschema import validate, ValidationError

def validate_evidence(evidence_path: str, schema_path: str) -> bool:
    """验证 Evidence 文件是否符合 Schema"""
    with open(schema_path, 'r') as f:
        schema = json.load(f)
    
    with open(evidence_path, 'r') as f:
        evidence = yaml.safe_load(f)
    
    try:
        validate(instance=evidence, schema=schema)
        print(f"✅ {evidence_path} 验证通过")
        return True
    except ValidationError as e:
        print(f"❌ {evidence_path} 验证失败: {e.message}")
        return False

if __name__ == "__main__":
    validate_evidence("evidence.yaml", "evidence-schema.json")
```

### 5.3 GitHub Actions 集成

```yaml
# .github/workflows/validate-evidence.yml
name: Validate Evidence

on:
  push:
    paths:
      - 'Teams/Metadata/evidence.yaml'

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Install ajv-cli
        run: npm install -g ajv-cli
        
      - name: Validate Evidence Schema
        run: |
          ajv validate \
            -s .github/schemas/evidence-schema.json \
            -d Teams/Metadata/evidence.yaml
```

---

## 6) 生成工具

### 6.1 自动生成脚本

```python
# generate_evidence.py
import hashlib
import os
from datetime import datetime
from pathlib import Path
import yaml

def sha256_file(filepath: str) -> str:
    """计算文件 SHA-256 哈希"""
    with open(filepath, 'rb') as f:
        return hashlib.sha256(f.read()).hexdigest()

def generate_evidence(repo_path: str, mission_id: str) -> dict:
    """生成 Evidence 结构"""
    evidence = {
        "mission_id": mission_id,
        "version": "1.0",
        "timestamp": datetime.utcnow().isoformat() + "Z",
        "phase": "delivery",
        "artifacts": [],
        "metrics": {
            "layer4": {
                "ai_contribution_rate": 0.0,  # 需要计算
                "first_pass_acceptance": False,
                "iteration_rounds": 1,
                "human_intervention_rate": 0.0
            }
        },
        "audit": {
            "status": "pending"
        }
    }
    
    # 扫描关键文件
    key_files = [
        ("spec", "MISSION.md"),
        ("spec", "README.md"),
    ]
    
    for artifact_type, filepath in key_files:
        full_path = Path(repo_path) / filepath
        if full_path.exists():
            evidence["artifacts"].append({
                "type": artifact_type,
                "path": filepath,
                "hash": sha256_file(str(full_path)),
                "size_bytes": full_path.stat().st_size
            })
    
    return evidence

if __name__ == "__main__":
    evidence = generate_evidence(".", "EdgeTeam/my-mission")
    with open("Teams/Metadata/evidence.yaml", "w") as f:
        yaml.dump(evidence, f, default_flow_style=False, allow_unicode=True)
```

---

## 7) 查询与聚合

### 7.1 单 Mission 查询

```bash
# 查看 AI 贡献率
yq '.metrics.layer4.ai_contribution_rate' evidence.yaml

# 查看审计状态
yq '.audit.status' evidence.yaml
```

### 7.2 跨 Mission 聚合（示例 SQL）

```sql
-- 假设 Evidence 已导入数据库
-- 计算团队平均 AI 贡献率
SELECT 
    DATE_TRUNC('week', timestamp) as week,
    AVG(metrics_layer4_ai_contribution_rate) as avg_ai_contribution,
    COUNT(*) as mission_count
FROM evidence
WHERE audit_status = 'approved'
GROUP BY week
ORDER BY week DESC;
```

---

## 8) 与其他模块的关系

| 模块 | 关系 | 说明 |
|------|------|------|
| [qc-playbook.md](../qc-playbook.md) | 引用 | 验收标准引用本 Schema |
| [MR-playbook.md](../../../Framework/MR-playbook.md) | 对齐 | 路径规范与 MR 架构一致 |
| [TAES.md §6](../../../TAES.md) | 来源 | 指标定义来自 TAES 主文档 |

---

## 版本历史

| 版本 | 日期 | 变更 | 作者 |
|------|------|------|------|
| v1.0 | 2026-01-03 | 初始版本 | QA Architect |
