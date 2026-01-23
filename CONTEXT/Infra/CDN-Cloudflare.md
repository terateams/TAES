# [Playbook] cdn@Cloudflare Implementation (v1.1)

> **Status**: Active | **Version**: 1.1 | **Date**: 2026-01-01
> **Target**: 基于 Cloudflare 免费订阅，构建统一的 `cdn.ilya.team` 域名服务。
> **Reference**: [EdgeTeam Domain Strategy](EdgeTeam%20domain%20playbook.md)

---

## 0. 前置条件 (Prerequisites)

> ✅ Cloudflare 无需 ICP 备案，可直接使用。

- [ ] Cloudflare 账号已注册
- [ ] 域名已添加到 Cloudflare (如 `ilya.team`)
- [ ] DNS 解析已迁移到 Cloudflare

---

## 1. 基础设施准备 (Infrastructure)

### 1.1 Cloudflare 资源创建
1.  **创建 R2 Bucket**:
    *   Name: `ilya-cdn-storage` (示例)
    *   Location: `Automatic`
    *   **设置**: 开启 "Public Access" -> "Custom Domain" -> 绑定 `cdn.ilya.team`。
    *   *注意*: 此时 `cdn.ilya.team` 直接指向 Bucket 根目录。

2.  **获取 API Token**:
    *   在 R2 首页点击 "Manage R2 API Tokens"。
    *   创建 Token: 权限选择 **Admin Read/Write**。
    *   记录: `Access Key ID`, `Secret Access Key`, `Endpoint` (格式: `https://<ACCOUNT_ID>.r2.cloudflarestorage.com`).

3.  **目录规划 (Bucket Structure)**:
    ```text
    /image/      # [Image] 存放 PicGo 上传的图片
    /mission/    # [Mission] 存放 Astro 生成的静态网站
    /download/   # [Download] 存放大型交付文件
    ```

---

## 2. 实施方案 A: 影像 (Image) - PicGo + VS Code

> **场景**: 在 VS Code 编写 Markdown 时，自动上传图片到 `cdn.ilya.team/image/...` 并回填链接。

### 2.1 安装与配置
1.  **安装插件**: VS Code 扩展商店搜索安装 `PicGo` (vs-picgo)。
2.  **安装 S3 插件**:
    *   推荐使用 **PicGo GUI** (应用端) 进行配置，VS Code 插件连接 GUI Server (默认端口 36677)。
    *   确保安装 `picgo-plugin-s3`。

### 2.2 PicGo S3 设置 (Amazon S3 插件)
| 配置项 | 值 / 说明 |
| :--- | :--- |
| **图床别名** | `Ilya-R2` |
| **AccessKeyId** | (从 1.2 获取) |
| **SecretAccessKey** | (从 1.2 获取) |
| **Bucket** | `ilya-cdn-storage` |
| **UploadPath** | `image/{year}/{month}/` (自动归档) |
| **Region** | `auto` (R2 固定为 auto) |
| **Endpoint** | `https://<ACCOUNT_ID>.r2.cloudflarestorage.com` (注意: **不带** bucket 名) |
| **CustomDomain** | `https://cdn.ilya.team` |
| **ForcePathStyle** | `No` (R2 推荐关闭) |

### 2.3 验证
*   截图/复制图片 -> VS Code 中按快捷键 (默认 `Ctrl+Alt+U`) -> 自动上传并生成 `![](https://cdn.ilya.team/image/2025/12/xxx.png)`.

---

## 3. 实施方案 B: 任务 (Mission) - Astro 静态站

> **场景**: 将 Mission Repo 中的文档通过 Astro 编译为静态网站，发布到 `/mission/` 路径。

### 3.1 Astro 项目配置 (`astro.config.mjs`)
为了适配子路径 `/mission/`，需配置 `base`：
```javascript
import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://cdn.ilya.team',
  base: '/mission', // 关键：生成带前缀的资源链接
  build: {
    format: 'file' // 生成 index.html 而不是依赖服务端路由
  }
});
```

### 3.2 部署流程 (GitHub Actions)
创建 `.github/workflows/deploy-mission.yml`:

```yaml
name: Deploy Mission to R2
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
          
      - name: Upload to R2
        uses: ryand56/r2-upload-action@latest
        with:
          r2-account-id: ${{ secrets.R2_ACCOUNT_ID }}
          r2-access-key-id: ${{ secrets.R2_ACCESS_KEY_ID }}
          r2-secret-access-key: ${{ secrets.R2_SECRET_ACCESS_KEY }}
          r2-bucket: ilya-cdn-storage
          source-dir: dist
          destination-dir: mission # 上传到 bucket 的 mission 目录
```

### 3.3 解决 `index.html` 问题 (Cloudflare Worker)
R2 原生不自动将 `/mission/01` 映射到 `/mission/01/index.html`。需创建一个简单的 Worker 路由：
1.  **Create Worker**: `cdn-router`
2.  **Code**:
    ```javascript
    export default {
      async fetch(request, env) {
        const url = new URL(request.url);
        // 如果访问的是目录且没有扩展名，尝试追加 index.html
        if (url.pathname.startsWith('/mission/') && !url.pathname.includes('.')) {
            if (!url.pathname.endsWith('/')) url.pathname += '/';
            url.pathname += 'index.html';
            return env.R2_BUCKET.get(url.pathname); // 需绑定 R2 Bucket 变量
        }
        return env.R2_BUCKET.get(url.pathname);
      }
    };
    ```
3.  **Trigger**: 绑定路由 `cdn.ilya.team/mission/*`。

---

## 4. 实施方案 C: 交付 (Download) - 文件管理

> **场景**: 上传大文件（安装包、视频）到 `/download/` 目录。

### 4.1 推荐工具

| 方案 | 工具 | 适用场景 | 推荐指数 |
| :--- | :--- | :--- | :--- |
| **GUI 客户端** | **Cyberduck** / **Mountain Duck** | 类似 FTP 的可视化管理，适合人工上传 | ⭐⭐⭐⭐⭐ (日常使用) |
| **命令行** | **Rclone** | 脚本自动化、批量同步、服务器迁移 | ⭐⭐⭐⭐⭐ (极客/运维) |

### 4.2 Cyberduck 配置 (Windows/Mac)
1.  **新建连接**: 选择 `Amazon S3`.
2.  **Server**: `<ACCOUNT_ID>.r2.cloudflarestorage.com`.
3.  **Access Key ID**: (同上).
4.  **Secret Access Key**: (同上).
5.  **Path**: `/ilya-cdn-storage/download/`.
6.  **操作**: 拖拽文件即可上传，右键文件 -> "Copy URL" (需手动将域名替换为 `cdn.ilya.team`).

---

## 5. 缓存策略配置 (CDN Cache Rules)

在 Cloudflare Dashboard 配置 Cache Rules：

**路径**: Cloudflare Dashboard -> 域名 -> Caching -> Cache Rules

| 规则名 | 匹配条件 | 缓存策略 | 说明 |
| :--- | :--- | :--- | :--- |
| **Image-Long-Cache** | URI Path starts with `/image/` | Edge TTL: 1 year, Browser TTL: 1 year | 图片永久缓存 |
| **Download-Long-Cache** | URI Path starts with `/download/` | Edge TTL: 1 year, Browser TTL: 1 year | 文件永久缓存 |
| **Mission-No-Cache** | URI Path starts with `/mission/` | Edge TTL: 0, Browser TTL: 0 | HTML 实时更新 |

---

## 6. 安全加固 (Security Hardening)

### 6.1 Bucket 访问控制
- [ ] R2 Bucket 设置为 **仅通过 Custom Domain 访问**，禁止直接访问 `*.r2.dev` 域名
- [ ] 禁用 Bucket 的 Public URL

### 6.2 API Token 最小权限
- [ ] 为 PicGo 创建 **只写** Token（Object Read & Write，无 Delete）
- [ ] 为 CI/CD 创建独立 Token，限制特定 Bucket

### 6.3 GitHub Secrets 命名规范
| Secret 名称 | 用途 |
| :--- | :--- |
| `CF_ACCOUNT_ID` | Cloudflare Account ID |
| `CF_R2_ACCESS_KEY_ID` | R2 Access Key ID |
| `CF_R2_SECRET_ACCESS_KEY` | R2 Secret Access Key |
| `CF_R2_BUCKET` | R2 Bucket 名称 |

---

## 7. 故障排查 (Troubleshooting)

| 问题 | 可能原因 | 解决方案 |
| :--- | :--- | :--- |
| **PicGo 上传失败** | Endpoint 格式错误 | 确保不包含 Bucket 名，格式为 `https://<ACCOUNT_ID>.r2.cloudflarestorage.com` |
| **图片 403 Forbidden** | Bucket 未开启 Public Access | R2 -> Bucket -> Settings -> Public Access -> Enable |
| **自定义域名无法访问** | DNS 未生效 | 检查 CNAME 记录，等待 DNS 传播 (5-10 分钟) |
| **/mission/ 404** | R2 不支持目录索引 | 部署 Worker 处理 index.html 路由 |
| **缓存未更新** | 缓存规则未配置 | 检查 Cache Rules，或手动 Purge Cache |
| **CORS 错误** | 未配置 CORS | R2 -> Bucket -> Settings -> CORS -> 添加规则 |

---

## 8. 总结 (Checklist)

- [ ] **前置**: Cloudflare 账号已配置，DNS 已迁移
- [ ] **Image**: PicGo 配置完成，截图可直接粘贴生成 Markdown 链接
- [ ] **Mission**: Astro 配置了 `base: '/mission'`, GitHub Actions 自动构建并上传
- [ ] **Download**: 安装 Cyberduck，用于管理 `/download/` 目录的大文件
- [ ] **Cache**: 缓存规则已配置，Image/Download 长缓存，Mission 无缓存
- [ ] **Security**: API Token 权限最小化，GitHub Secrets 已配置
