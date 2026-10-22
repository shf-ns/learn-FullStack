# learn-FullStack
***

> 一个全栈实战示例项目：前端 + 后端 + Docker部署
>用于演示完整 的前后端分离开发流程、环境变量管理以及容器化部署

***


### ✨ 功能特性

-🏠 首页展示：LinkHub 品牌介绍，突出“高效使用工具，触手可及”的产品定位
-🔗 站点导航：分类展示常用开发站点，图标 + 名称 + 简介卡片式呈现，点击新窗口直达
-📚 文档导航：收录前后端开发文档资源，快速查阅常用技术文档
-🗂️ 分类清晰：网格布局（每行 4 项）展示站点与文档，浏览一目了然
-⚡ 动态数据：页面数据从后端 `/api/sites`、`/api/documents` 实时拉取渲染，前端零写死
-🛠️ 后端 API：Express 5 + TypeScript 搭建 RESTful 接口，统一返回 `{ code, data }` 结构
-🗄️ 数据库存储：MySQL 8.4 持久化站点与文档数据，首次启动自动执行初始化脚本建库建表并填充示例数据
-🐳 容器化部署：Docker Compose 一键编排 MySQL + 后端 + 前端三大服务
-💽 数据持久化：MySQL 数据挂载到命名卷，删除容器不丢失数据；通过 `healthcheck` 保证后端就绪后再启动
-🌐 统一入口：Nginx 托管前端静态资源并反向代理 `/api` 请求到后端，生产中前后端同源访问
-✨ 现代化前端：Vue 3 + Vite + TypeScript + Vue Router（自动路由），组件化 + 响应式网格适配不同屏幕
***


### 🛠️技术栈
|  层级 |  技术 |
|:---:|:---:|
|  前端 |  Vue3、Vite、TypeScript、Vue Router |
|  后端 |  Node.js（原生 TS 运行）、Express5 |
|  数据库 |  MySQL8.4（mysql2 驱动） |
|  部署 |  Docker、Docker Compose、Nginx |


***


### 📂项目结构
``` 
learn-FullStack/                         # 全栈学习项目根目录
├─ .env                                  # 环境变量配置
├─ .env.example                          # 环境变量示例模板
├─ .gitignore                            # Git 忽略规则
├─ README.md                             # 项目说明文档
├─ docker-compose.yml                    # Docker 容器编排（服务编排）
│
├─ sql/                                  # SQL 数据库脚本目录
│  └─ init.sql                           # 数据库初始化脚本（建表）
│
├─ client/                               # 前端（Vue 3 + TypeScript + Vite）
│  ├─ index.html                         # 前端 HTML 入口
│  ├─ env.d.ts                           # 环境变量类型声明
│  ├─ Dockerfile                         # 前端 Dockerfile
│  ├─ nginx.conf                         # Nginx 服务器配置
│  ├─ pnpm-lock.yaml                     # pnpm 锁定文件
│  ├─ pnpm-workspace.yaml                # pnpm 工作区配置
│  ├─ .dockerignore                      # Docker 忽略规则
│  ├─ .gitignore                         # Git 忽略规则
│  └─ src/
│     ├─ App.vue                         # 根组件
│     ├─ main.ts                         # 应用入口
│     ├─ pages/                          # 页面组件
│     │  ├─ index.vue                    # 首页
│     │  ├─ document.vue                 # 文档页
│     │  └─ site.vue                     # 站点页
│     ├─ router/
│     │  └─ index.ts                     # 路由配置
│     └─ styles/
│        └─ css/
│           └─ base.css                  # 基础样式
│
└─ server/                               # 后端（Express + TypeScript）
   ├─ Dockerfile                         # 后端 Dockerfile
   ├─ .dockerignore                      # Docker 忽略规则
   ├─ package.json                       # 后端依赖
   ├─ pnpm-lock.yaml                     # pnpm 锁定文件
   ├─ tsconfig.json                      # TypeScript 编译配置
   └─ src/
      ├─ app.ts                          # 应用入口（Express 初始化）
      ├─ config/
      │  └─ db.ts                        # 数据库连接配置
      ├─ controllers/
      │  └─ productController.ts         # 产品业务控制器
      └─ routers/
         └─ productRouter.ts             # 产品路由
```
***


### 🚀快速开始

#### 方式一：Docker Compose 一键部署（推荐）

**前置要求**：已安装 Docker Desktop 和 Docker Compose

```bash
# 1. 克隆项目
git clone <your-repo-url>
cd learn-FullStack

# 2. 配置环境变量
cp .env.example .env
# 编辑 .env 文件，填写数据库密码等配置

# 3. 启动所有服务
docker compose up -d

# 4. 访问应用
# 前端：http://localhost
# 后端 API：http://localhost/api
# 数据库端口：3307（宿主机映射）
```

**常用 Docker 命令**：
```bash
# 查看服务状态
docker compose ps

# 查看日志
docker compose logs -f

# 停止服务
docker compose down

# 停止并删除数据卷（谨慎使用）
docker compose down -v

# 重新构建并启动
docker compose up -d --build
```

#### 方式二：本地开发环境

**前置要求**：
- Node.js >= 24
- pnpm >= 8
- MySQL 8.4

**1. 启动 MySQL 数据库**
```bash
# 使用 Docker 启动 MySQL（推荐）
docker run -d \
  --name mysql-dev \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=123456 \
  -e TZ=Asia/Shanghai \
  mysql:8.4

# 导入初始化脚本
docker exec -i mysql-dev mysql -uroot -p123456 < sql/init.sql
```

**2. 启动后端服务**
```bash
cd server

# 安装依赖
pnpm install

# 配置环境变量（复制根目录 .env 到 server 目录或修改 db.ts 中的路径）

# 启动开发服务
pnpm dev
# 或直接运行
node --experimental-strip-types src/app.ts
```

**3. 启动前端服务**
```bash
cd client

# 安装依赖
pnpm install

# 启动开发服务器
pnpm dev
# 访问 http://localhost:5173
```

***

### 🔌 API 文档

#### 基础信息
- **Base URL**: `http://localhost:3000/api`（本地开发）
- **Base URL**: `http://localhost/api`（Docker 部署）
- **响应格式**: `{ code: number, message: string, data: any }`

#### 接口列表

##### 1. 获取文档列表
```http
GET /api/documents
```

**响应示例**：
```json
{
  "code": 200,
  "message": "success",
  "data": [
    {
      "id": 1,
      "name": "文档名称",
      "url": "https://example.com",
      "icon": "icon-url",
      "description": "文档描述",
      "category_id": 1
    }
  ]
}
```

##### 2. 获取站点列表
```http
GET /api/sites
```

**响应示例**：
```json
{
  "code": 200,
  "message": "success",
  "data": [
    {
      "id": 1,
      "name": "站点名称",
      "url": "https://example.com",
      "icon": "icon-url",
      "description": "站点描述",
      "category_id": 2
    }
  ]
}
```

**错误响应**：
```json
{
  "code": 404,
  "message": "项目不存在"
}
```

***

### ⚙️ 环境变量说明

项目使用 `.env` 文件管理环境变量，根目录已提供 `.env.example` 模板。

| 变量名 | 说明 | 默认值 | 必填 |
|:---|:---|:---|:---:|
| `SERVER_PORT` | 后端服务端口 | `3000` | 是 |
| `DB_HOST` | 数据库主机地址 | `127.0.0.1` | 是 |
| `DB_PORT` | 数据库端口 | `3306` | 是 |
| `DB_USER` | 数据库用户名 | `root` | 是 |
| `DB_PASSWORD` | 数据库密码 | - | 是 |
| `DB_NAME` | 数据库名称 | `link` | 是 |
| `JWT_SECRET` | JWT 密钥（预留） | - | 否 |
| `JWT_EXPIRES_IN` | JWT 过期时间（预留） | `7d` | 否 |

**配置步骤**：
```bash
# 1. 复制环境变量模板
cp .env.example .env

# 2. 编辑 .env 文件，填写真实配置
# 注意：.env 文件已被 .gitignore 忽略，不会提交到 Git
```

***

### 🗄️ 数据库说明

#### 初始化脚本
项目提供 `sql/init.sql` 初始化脚本，首次启动 Docker 时会自动执行：
- 创建数据库 `link`
- 创建数据表（category、site 等）
- 插入示例数据

#### 数据持久化
MySQL 数据通过 Docker Volume 持久化：
```yaml
volumes:
  mysql_data:  # 命名卷，删除容器不丢失数据
```

#### 手动执行 SQL
```bash
# 进入 MySQL 容器
docker exec -it fullstack-mysql mysql -uroot -p${DB_PASSWORD}

# 或在宿主机执行 SQL 文件
docker exec -i fullstack-mysql mysql -uroot -p${DB_PASSWORD} < sql/init.sql
```

***

### 🛠️ 本地开发指南

#### 前端开发
```bash
cd client

# 安装依赖
pnpm install

# 启动开发服务器（热更新）
pnpm dev

# 构建生产版本
pnpm build

# 类型检查
pnpm type-check
```

**前端技术栈**：
- Vue 3（Composition API）
- Vite（构建工具）
- TypeScript
- Vue Router（自动路由）
- 响应式网格布局

#### 后端开发
```bash
cd server

# 安装依赖
pnpm install

# 启动开发服务（支持 TypeScript 直接运行）
pnpm dev

# 或手动启动
node --experimental-strip-types src/app.ts
```

**后端技术栈**：
- Express 5
- TypeScript（Node.js 24 原生支持）
- mysql2（数据库驱动）
- cors（跨域处理）
- dotenv（环境变量）

#### 项目架构
```
前端请求 → Nginx (80端口)
              ↓
         /api/* → 后端 (3000端口)
              ↓
         MySQL (3306端口)
```

**开发时跨域处理**：
- 本地开发：后端 CORS 配置允许 `http://localhost:5173`
- 生产环境：Nginx 反向代理，前后端同源访问

***

### ❓ 常见问题

#### 1. Docker 启动失败
```bash
# 检查 Docker 是否运行
docker ps

# 查看服务日志
docker compose logs mysql
docker compose logs backend
docker compose logs frontend

# 端口冲突解决
# 修改 docker-compose.yml 中的端口映射
ports:
  - "3001:3000"  # 将宿主机端口改为 3001
```

#### 2. 数据库连接失败
- 检查 `.env` 中的数据库配置是否正确
- 确保 MySQL 服务已启动并健康检查通过
- Docker 环境中后端通过 `mysql` 主机名访问数据库

#### 3. 前端页面空白
- 检查后端服务是否正常启动
- 打开浏览器控制台查看网络请求
- 确认 API 地址配置正确

#### 4. 数据卷清理
```bash
# 查看数据卷
docker volume ls | grep mysql_data

# 删除数据卷（会丢失所有数据）
docker volume rm fullstack_mysql_data
```

#### 5. 重新初始化数据库
```bash
# 停止服务并删除数据卷
docker compose down -v

# 重新启动（会重新执行 init.sql）
docker compose up -d
```

***

### 📝 开发规范

#### Git 提交规范
```
feat: 新功能
fix: 修复 bug
docs: 文档更新
style: 代码格式调整
refactor: 重构代码
test: 测试相关
chore: 构建/工具链相关
```

#### 分支管理
- `main`: 主分支，稳定版本
- `dev`: 开发分支
- `feature/*`: 功能分支
- `fix/*`: 修复分支

***

### 🤝 贡献指南

欢迎提交 Issue 和 Pull Request！

**提交 Issue**：
- 描述清楚问题现象、复现步骤
- 提供环境信息（操作系统、Node 版本、Docker 版本等）
- 附上错误日志或截图

**提交 PR**：
1. Fork 本仓库
2. 创建功能分支 `git checkout -b feature/xxx`
3. 提交修改 `git commit -m 'feat: 添加xxx功能'`
4. 推送到分支 `git push origin feature/xxx`
5. 提交 Pull Request


***

> 💡 **提示**：本项目用于全栈学习演示，生产环境请根据实际情况调整配置和安全策略。