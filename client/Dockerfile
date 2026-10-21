# ===== 构建阶段：编译 Vue 前端 =====
# 使用基于 glibc 的镜像（vue-tsc/typescript-native-bridge 的原生模块依赖 glibc，
# Alpine 的 musl 会导致 ERR_DLOPEN_FAILED）
FROM node:24-slim AS build

WORKDIR /app
RUN corepack enable

# 先复制依赖清单与锁文件安装依赖，充分利用镜像层缓存
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
RUN pnpm install --frozen-lockfile

COPY . .
RUN pnpm build

# ===== 运行阶段：nginx 托管静态资源 =====
FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80