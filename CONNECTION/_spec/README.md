# CONNECTION 执行规范 (_spec)

> 从理念到落地的桥梁

---

## 目录

| 文件 | 用途 | 读者 |
|------|------|------|
| [schema.yaml](schema.yaml) | 数据模型定义 | 后端开发 |
| [api.md](api.md) | API 接口规范 | 前后端开发 |
| [ui-spec.md](ui-spec.md) | 界面交互设计 | 前端开发、设计师 |
| [dashboard.md](dashboard.md) | 监控指标定义 | 运维、产品 |
| [roadmap.md](roadmap.md) | 实施路线图 | 项目经理、全员 |

---

## 与文档的关系

```
CONNECTION/
├── README.md          # What: 运维手册
├── NEXUS.md           # Why: 哲学基础
├── <5W dirs>/         # How-to: 操作指南
│
└── _spec/             # ← 你在这里
    ├── schema.yaml    # 数据是什么形状
    ├── api.md         # 接口怎么调用
    ├── ui-spec.md     # 界面怎么展示
    ├── dashboard.md   # 指标怎么监控
    └── roadmap.md     # 分几步落地
```

**理念层** (NEXUS.md) → **操作层** (5W dirs) → **执行层** (_spec)

---

## 核心原则

1. **可落地** - 每个规范都能直接转化为代码
2. **可追溯** - 规范变更有版本记录
3. **可验收** - 每个阶段有明确的验收标准
4. **可迭代** - 预留扩展空间，不过度设计
