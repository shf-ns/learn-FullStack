# 后端镜像：Node.js 直接运行 TypeScript（--experimental-strip-types）
FROM node:24-alpine

WORKDIR /app

# 启用 pnpm（项目使用 pnpm 管理依赖，且有 pnpm-lock.yaml）
RUN corepack enable

# 先复制依赖清单与锁文件安装依赖，充分利用镜像层缓存
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# 复制源码（.dockerignore 已排除 node_modules 与 .env）
COPY . .

EXPOSE 3000

# 与 package.json 中 "start" 保持一致
CMD ["node", "--experimental-strip-types", "src/app.ts"]