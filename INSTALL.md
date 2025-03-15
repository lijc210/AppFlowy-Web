# docker

docker build -t appflowy_web

docker buildx build --platform linux/amd64 -t appflowy_web .

## 推送容器镜像

docker tag appflowy_web ccr.ccs.tencentyun.com/self-hub/appflowy_web:latest
docker push ccr.ccs.tencentyun.com/self-hub/appflowy_web:latest

## 启动

export AF_BASE_URL=https://note.cizai.net
pnpm install
pnpm run dev