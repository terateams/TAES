# [Playbook] cdn@Tencent Implementation (v1.1)

> **Status**: Active | **Version**: 1.1 | **Date**: 2026-01-01
> **Target**: 基于腾讯云，构建统一的 `cdn.example.cn` 域名服务（需 ICP 备案）。
> **Reference**: [EdgeTeam Domain Strategy](EdgeTeam%20domain%20playbook.md)

---

## 0. 前置条件 (Prerequisites)

> ⚠️ **重要**: 腾讯云 CDN 需完成 ICP 备案，否则无法绑定自定义域名。

- [ ] 域名已完成 ICP 备案（通过腾讯云备案系统）
- [ ] 腾讯云账号已完成实名认证
- [ ] 已开通 COS 和 CDN 服务

---

## 1. 基础设施准备 (Infrastructure)

### 1.1 腾讯云 COS Bucket 创建
1.  **创建存储桶**:
    *   登录 [腾讯云 COS 控制台](https://console.cloud.tencent.com/cos)
    *   Name: `ilya-cdn-storage-<APPID>` (腾讯云会自动追加 APPID)
    *   Region: `ap-shanghai` (上海) 或就近选择
    *   访问权限: `公有读私有写`

2.  **获取访问凭证**:
    *   进入 [API 密钥管理](https://console.cloud.tencent.com/cam/capi)
    *   创建密钥或使用已有密钥
    *   记录: `SecretId`, `SecretKey`
    *   Endpoint: `cos.ap-shanghai.myqcloud.com` (根据 Region 调整)

3.  **目录规划 (Bucket Structure)**:
    ```text
    /image/      # [Image] 存放 PicGo 上传的图片
    /mission/    # [Mission] 存放 Astro 生成的静态网站
    /download/   # [Download] 存放大型交付文件
    ```

### 1.2 腾讯云 CDN 配置
1.  **添加域名**:
    *   进入 [CDN 控制台](https://console.cloud.tencent.com/cdn)
    *   添加域名: `cdn.example.cn`
    *   业务类型: `CDN 网页小文件`
    *   源站类型: `COS 源` -> 选择对应存储桶

2.  **DNS 解析**:
    *   获取 CDN 分配的 CNAME 地址（如 `cdn.example.cn.cdn.dnsv1.com`）
    *   在 DNSPod 控制台添加 CNAME 记录

3.  **HTTPS 配置**:
    *   开启 HTTPS，上传 SSL 证书或申请腾讯云免费证书

---

## 2. 实施方案 A: 影像 (Image) - PicGo + VS Code

> **场景**: 在 VS Code 编写 Markdown 时，自动上传图片到 `cdn.example.cn/image/...` 并回填链接。

### 2.1 安装与配置
1.  **安装插件**: VS Code 扩展商店搜索安装 `PicGo` (vs-picgo)。
2.  **图床类型**: PicGo 原生支持腾讯云 COS，无需额外插件。

### 2.2 PicGo 腾讯云 COS 设置
| 配置项 | 值 / 说明 |
| :--- | :--- |
| **图床类型** | `腾讯云 COS` |
| **COS 版本** | `v5` (当前版本) |
| **SecretId** | (从 1.2 获取) |
| **SecretKey** | (从 1.2 获取) |
| **Bucket** | `ilya-cdn-storage-<APPID>` (完整名称含 APPID) |
| **AppId** | (在控制台账号信息中查看) |
| **Area** | `ap-shanghai` (根据 Region 调整) |
| **Path** | `image/{year}/{month}/` (自动归档) |
| **CustomUrl** | `https://cdn.example.cn` (CDN 域名，非 COS 直连) |

### 2.3 验证
*   截图/复制图片 -> VS Code 中按快捷键 (默认 `Ctrl+Alt+U`) -> 自动上传并生成 `![](https://cdn.example.cn/image/2026/01/xxx.png)`.

---

## 3. 实施方案 B: 任务 (Mission) - Astro 静态站

> **场景**: 将 Mission Repo 中的文档通过 Astro 编译为静态网站，发布到 `/mission/` 路径。

### 3.1 Astro 项目配置 (`astro.config.mjs`)
为了适配子路径 `/mission/`，需配置 `base`：
```javascript
import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://cdn.example.cn',
  base: '/mission', // 关键：生成带前缀的资源链接
  build: {
    format: 'file' // 生成 index.html 而不是依赖服务端路由
  }
});
```

### 3.2 部署流程 (GitHub Actions)
创建 `.github/workflows/deploy-mission.yml`:

```yaml
name: Deploy Mission to Tencent COS
on:
  push:
    branches: [ main ]
    paths: ['MISSION/**'] # 仅当 Mission 内容变更时触发

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Install & Build Astro
        run: |
          npm install
          npm run build # 产物在 dist/ 目录
          
      - name: Upload to Tencent COS
        uses: TencentCloud/cos-action@v1
        with:
          secret_id: ${{ secrets.TENCENT_SECRET_ID }}
          secret_key: ${{ secrets.TENCENT_SECRET_KEY }}
          cos_bucket: ${{ secrets.COS_BUCKET }}
          cos_region: ap-shanghai
          local_path: dist
          remote_path: /mission/
          clean: true # 清理目标目录后上传
```

### 3.3 静态网站托管 (COS 原生支持)
腾讯云 COS 原生支持静态网站托管，**无需额外 Worker**：
1.  进入存储桶 -> **基础配置** -> **静态网站**
2.  开启静态网站功能
3.  索引文档: `index.html`
4.  错误文档: `404.html`
5.  *注意*: 需通过静态网站域名或绑定的 CDN 域名访问

---

## 4. 实施方案 C: 交付 (Download) - 文件管理

> **场景**: 上传大文件（安装包、视频）到 `/download/` 目录。

### 4.1 推荐工具

| 方案 | 工具 | 适用场景 | 推荐指数 |
| :--- | :--- | :--- | :--- |
| **官方工具** | **COSBrowser** | 腾讯云官方 GUI，功能完整 | ⭐⭐⭐⭐⭐ (首选) |
| **命令行** | **coscli** | 脚本自动化、批量同步 | ⭐⭐⭐⭐⭐ (极客/运维) |
| **跨平台** | **Cyberduck** | 支持腾讯云 COS 协议 | ⭐⭐⭐⭐ (多云管理) |

### 4.2 COSBrowser 配置 (Windows/Mac)
1.  **下载**: [COSBrowser 官方下载](https://cloud.tencent.com/document/product/436/11366)
2.  **登录**:
    *   SecretId / SecretKey: (同上)
    *   或使用腾讯云账号扫码登录
3.  **操作**: 拖拽文件到 `/download/` 目录即可上传

### 4.3 coscli 命令行
```bash
# 安装 coscli
# Windows/Mac/Linux: https://cloud.tencent.com/document/product/436/63144

# 配置
coscli config set --secret_id <SecretId> --secret_key <SecretKey>

# 上传文件
coscli cp ./my-app-v1.zip cos://ilya-cdn-storage-<APPID>/download/

# 同步目录
coscli sync ./release/ cos://ilya-cdn-storage-<APPID>/download/ --delete
```

---

## 5. 缓存策略配置 (CDN Cache Rules)

在腾讯云 CDN 控制台配置缓存规则：

| 规则 | 路径 | 缓存时间 | 说明 |
| :--- | :--- | :--- | :--- |
| **Rule A** | `/image/*`, `/download/*` | 365 天 | 静态资源长缓存 |
| **Rule B** | `/mission/*.html` | 0 秒 (不缓存) | HTML 实时更新 |
| **Rule C** | `/mission/*` | 30 天 | 其他静态资源 |

**配置路径**: CDN 控制台 -> 域名管理 -> `cdn.example.cn` -> 缓存配置 -> 节点缓存过期配置

---

## 6. 安全加固 (Security Hardening)

### 6.1 Bucket 访问控制
- [ ] COS Bucket 设置为 **私有读写**，通过 CDN 回源访问
- [ ] 开启 **防盗链** (Referer 白名单)，限制仅允许已知域名访问
- [ ] 开启 **COS 日志**，记录访问日志

### 6.2 CAM 子用户权限
- [ ] 为 PicGo 创建独立 CAM 子用户，仅授予 `cos:PutObject` 权限
- [ ] 为 CI/CD 创建独立 CAM 子用户，限制特定 Bucket 和路径

### 6.3 GitHub Secrets 命名规范
| Secret 名称 | 用途 |
| :--- | :--- |
| `TENCENT_SECRET_ID` | 腾讯云 SecretId |
| `TENCENT_SECRET_KEY` | 腾讯云 SecretKey |
| `TENCENT_COS_BUCKET` | COS Bucket 名称 (含 APPID) |
| `TENCENT_COS_REGION` | COS Region (如 `ap-shanghai`) |

---

## 7. 故障排查 (Troubleshooting)

| 问题 | 可能原因 | 解决方案 |
| :--- | :--- | :--- |
| **PicGo 上传失败** | Bucket 名称未包含 APPID | 确保 Bucket 格式为 `name-APPID` |
| **CDN 访问 403** | 未完成 ICP 备案 | 完成域名备案后重新绑定 |
| **图片显示慢** | CDN 未生效 | 检查 CNAME 解析，等待 CDN 节点同步 |
| **/mission/ 404** | 静态网站未开启 | Bucket -> 基础配置 -> 静态网站 -> 开启 |
| **缓存未更新** | CDN 缓存未刷新 | CDN 控制台 -> 刷新预热 -> 提交 URL 刷新 |
| **SecretKey 报错** | Key 包含特殊字符 | 重新生成 Key，避免特殊字符 |

---

## 8. 总结 (Checklist)

- [ ] **ICP 备案**: 域名已完成备案，CDN 可正常绑定
- [ ] **Image**: PicGo 配置完成，截图可直接粘贴生成 Markdown 链接
- [ ] **Mission**: Astro 配置了 `base: '/mission'`, GitHub Actions 自动构建并上传
- [ ] **Download**: 安装 COSBrowser，用于管理 `/download/` 目录的大文件
- [ ] **Cache**: 缓存规则已配置，Image/Download 长缓存，Mission HTML 无缓存
- [ ] **Security**: CAM 权限最小化，防盗链已开启，GitHub Secrets 已配置
