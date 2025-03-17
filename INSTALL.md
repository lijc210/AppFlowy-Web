# docker

docker build -t appflowy_web .

docker buildx build --platform linux/amd64 -t appflowy_web .

## 推送容器镜像

docker tag appflowy_web ccr.ccs.tencentyun.com/self-hub/appflowy_web:latest
docker push ccr.ccs.tencentyun.com/self-hub/appflowy_web:latest

## 启动

export AF_BASE_URL=https://note.cizai.net
pnpm install
pnpm run dev

## 访问

http://localhost:3000/dd3354c8-e47f-48b4-bf98-379e75ebc734/%E7%AB%99%E7%82%B9%E6%94%B6%E8%97%8F