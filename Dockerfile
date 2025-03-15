FROM node:20.12.0 AS builder

WORKDIR /app

ARG VERSION=main

RUN npm install -g pnpm@8.5.0

# 复制 package.json 和 pnpm-lock.yaml 以利用缓存
COPY package.json pnpm-lock.yaml ./

# 安装依赖
RUN pnpm install --frozen-lockfile

# 复制项目文件
# RUN git clone --depth 1 --branch ${VERSION} https://github.com/AppFlowy-IO/AppFlowy-Web.git .
COPY . .

# 设置构建时的环境变量
ENV AF_BASE_URL=AF_BASE_URL_PLACEHOLDER
ENV AF_GOTRUE_URL=AF_GOTRUE_URL_PLACEHOLDER
# 构建项目
RUN pnpm run build

# 清理不必要的文件
RUN rm -rf node_modules

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html/
# COPY nginx.conf /etc/nginx/nginx.conf
COPY env.sh /docker-entrypoint.d/env.sh
RUN chmod +x /docker-entrypoint.d/env.sh