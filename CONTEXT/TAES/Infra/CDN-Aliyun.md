# [Playbook] cdn@Aliyun Implementation (v1.1)

> **Status**: Active | **Version**: 1.1 | **Date**: 2026-01-01
> **Target**: 基于阿里云，构建统一的 `cdn.example.cn` 域名服务（需 ICP 备案）。
> **Reference**: [EdgeTeam Domain Strategy](EdgeTeam%20domain%20playbook.md)

---

## 0. 前置条件 (Prerequisites)

> ⚠️ **重要**: 阿里云 CDN 需完成 ICP 备案，否则无法绑定自定义域名。

- [ ] 域名已完成 ICP 备案（通过阿里云备案系统）
- [ ] 阿里云账号已完成实名认证
- [ ] 已开通 OSS 和 CDN 服务

---

## 1. 基础设施准备 (Infrastructure)

### 1.1 阿里云 OSS Bucket 创建
1.  **创建 Bucket**:
    *   登录 [阿里云 OSS 控制台](https://oss.console.aliyun.com/)
    *   Name: `ilya-cdn-storage` (示例)
    *   Region: `华东1（杭州）` 或就近选择
    *   存储类型: `标准存储`
    *   读写权限: `公共读` (或通过 CDN 鉴权访问)

2.  **获取访问凭证**:
    *   进入 [RAM 访问控制](https://ram.console.aliyun.com/)
    *   创建子用户，勾选 "Open API 调用访问"
    *   授权策略: `AliyunOSSFullAccess`
    *   记录: `AccessKey ID`, `AccessKey Secret`
    *   Endpoint: `oss-cn-hangzhou.aliyuncs.com` (根据 Region 调整)

3.  **目录规划 (Bucket Structure)**:
    ```text
    /image/      # [Image] 存放 PicGo 上传的图片
    /mission/    # [Mission] 存放 Astro 生成的静态网站
    /download/   # [Download] 存放大型交付文件
    ```

### 1.2 阿里云 CDN 配置
1.  **添加域名**:
    *   进入 [CDN 控制台](https://cdn.console.aliyun.com/)
    *   添加域名: `cdn.example.cn`
    *   业务类型: `图片小文件`
    *   源站类型: `OSS 域名` -> 选择 `ilya-cdn-storage.oss-cn-hangzhou.aliyuncs.com`

2.  **DNS 解析**:
    *   获取 CDN 分配的 CNAME 地址（如 `cdn.example.cn.w.cdngslb.com`）
    *   在阿里云 DNS 控制台添加 CNAME 记录

3.  **HTTPS 配置**:
    *   开启 HTTPS，上传 SSL 证书或使用阿里云免费证书

---

## 2. 实施方案 A: 影像 (Image) - PicGo + VS Code

> **场景**: 在 VS Code 编写 Markdown 时，自动上传图片到 `cdn.example.cn/image/...` 并回填链接。

### 2.1 安装与配置
1.  **安装插件**: VS Code 扩展商店搜索安装 `PicGo` (vs-picgo)。
2.  **图床类型**: PicGo 原生支持阿里云 OSS，无需额外插件。

### 2.2 PicGo 阿里云 OSS 设置
| 配置项 | 值 / 说明 |
| :--- | :--- |
| **图床类型** | `阿里云 OSS` |
| **AccessKeyId** | (从 1.2 获取) |
| **AccessKeySecret** | (从 1.2 获取) |
| **Bucket** | `ilya-cdn-storage` |
| **Area** | `oss-cn-hangzhou` (根据 Region 调整) |
| **Path** | `image/{year}/{month}/` (自动归档) |
| **CustomUrl** | `https://cdn.example.cn` (CDN 域名，非 OSS 直连) |
| **Options** | 留空 |

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
name: Deploy Mission to Aliyun OSS
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
          
      - name: Upload to Aliyun OSS
        uses: manyuanrong/setup-ossutil@v3.0
        with:
          endpoint: oss-cn-hangzhou.aliyuncs.com
          access-key-id: ${{ secrets.ALIYUN_ACCESS_KEY_ID }}
          access-key-secret: ${{ secrets.ALIYUN_ACCESS_KEY_SECRET }}
          
      - name: Sync to OSS
        run: |
          ossutil sync dist/ oss://ilya-cdn-storage/mission/ --delete --force
```

### 3.3 静态网站托管 (OSS 原生支持)
阿里云 OSS 原生支持静态网站托管，**无需额外 Worker**：
1.  进入 Bucket -> **基础设置** -> **静态页面**
2.  默认首页: `index.html`
3.  默认 404 页: `404.html`
4.  *注意*: 需通过 OSS 域名或绑定的 CDN 域名访问

---

## 4. 实施方案 C: 交付 (Download) - 文件管理

> **场景**: 上传大文件（安装包、视频）到 `/download/` 目录。

### 4.1 推荐工具

| 方案 | 工具 | 适用场景 | 推荐指数 |
| :--- | :--- | :--- | :--- |
| **官方工具** | **OSS Browser** | 阿里云官方 GUI，功能完整 | ⭐⭐⭐⭐⭐ (首选) |
| **命令行** | **ossutil** | 脚本自动化、批量同步 | ⭐⭐⭐⭐⭐ (极客/运维) |
| **跨平台** | **Cyberduck** | 支持阿里云 OSS 协议 | ⭐⭐⭐⭐ (多云管理) |

### 4.2 OSS Browser 配置 (Windows/Mac)
1.  **下载**: [OSS Browser 官方下载](https://help.aliyun.com/document_detail/61872.html)
2.  **登录**:
    *   Endpoint: `oss-cn-hangzhou.aliyuncs.com`
    *   AccessKeyId / AccessKeySecret: (同上)
3.  **操作**: 拖拽文件到 `/download/` 目录即可上传

### 4.3 ossutil 命令行
```bash
# 安装 ossutil
# Windows: 下载 https://help.aliyun.com/document_detail/120075.html
# Mac: brew install aliyun-cli

# 配置
ossutil config -e oss-cn-hangzhou.aliyuncs.com -i <AccessKeyId> -k <AccessKeySecret>

# 上传文件
ossutil cp ./my-app-v1.zip oss://ilya-cdn-storage/download/

# 同步目录
ossutil sync ./release/ oss://ilya-cdn-storage/download/ --delete
```

---

## 5. 缓存策略配置 (CDN Cache Rules)

在阿里云 CDN 控制台配置缓存规则：

| 规则 | 路径 | 缓存时间 | 说明 |
| :--- | :--- | :--- | :--- |
| **Rule A** | `/image/*`, `/download/*` | 365 天 | 静态资源长缓存 |
| **Rule B** | `/mission/*` | 0 秒 (回源) | HTML 实时更新 |

**配置路径**: CDN 控制台 -> 域名管理 -> `cdn.example.cn` -> 缓存配置 -> 缓存规则

---

## 6. 安全加固 (Security Hardening)

### 6.1 Bucket 访问控制
- [ ] OSS Bucket 设置为 **私有**，通过 CDN 回源访问
- [ ] 开启 **防盗链** (Referer 白名单)，限制仅允许已知域名访问
- [ ] 开启 **OSS 日志**，记录访问日志

### 6.2 RAM 子用户权限
- [ ] 为 PicGo 创建独立 RAM 子用户，仅授予 `oss:PutObject` 权限
- [ ] 为 CI/CD 创建独立 RAM 子用户，限制特定 Bucket 和路径

### 6.3 GitHub Secrets 命名规范
| Secret 名称 | 用途 |
| :--- | :--- |
| `ALIYUN_ACCESS_KEY_ID` | 阿里云 AccessKey ID |
| `ALIYUN_ACCESS_KEY_SECRET` | 阿里云 AccessKey Secret |
| `ALIYUN_OSS_BUCKET` | OSS Bucket 名称 |
| `ALIYUN_OSS_REGION` | OSS Region (如 `oss-cn-hangzhou`) |

---

## 7. 故障排查 (Troubleshooting)

| 问题 | 可能原因 | 解决方案 |
| :--- | :--- | :--- |
| **PicGo 上传失败** | AccessKey 权限不足 | 检查 RAM 策略，确保有 `oss:PutObject` 权限 |
| **CDN 访问 403** | 未完成 ICP 备案 | 完成域名备案后重新绑定 |
| **图片显示慢** | CDN 未生效 | 检查 CNAME 解析，等待 CDN 节点同步 |
| **/mission/ 404** | 静态网站未开启 | Bucket -> 基础设置 -> 静态页面 -> 开启 |
| **缓存未更新** | CDN 缓存未刷新 | CDN 控制台 -> 刷新预热 -> 提交 URL 刷新 |
| **费用异常** | 流量被盗用 | 开启防盗链，设置带宽封顶 |

---

## 8. 总结 (Checklist)

- [ ] **ICP 备案**: 域名已完成备案，CDN 可正常绑定
- [ ] **Image**: PicGo 配置完成，截图可直接粘贴生成 Markdown 链接
- [ ] **Mission**: Astro 配置了 `base: '/mission'`, GitHub Actions 自动构建并上传
- [ ] **Download**: 安装 OSS Browser，用于管理 `/download/` 目录的大文件
- [ ] **Cache**: 缓存规则已配置，Image/Download 长缓存，Mission 无缓存
- [ ] **Security**: RAM 权限最小化，防盗链已开启，GitHub Secrets 已配置
