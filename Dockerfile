# 使用基础的 Node.js 镜像作为基础制作docusaurus镜像
# docker build --no-cache -t nolanatom/docusaurus:latest .
# docker build -t nolanatom/docusaurus:latest .
# docker push nolanatom/docusaurus:latest
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 构建静态网站
RUN npx create-docusaurus@latest my-website classic

# 安装依赖
RUN npm install --global @docusaurus/core

ENTRYPOINT ["/bin/sh" , "-c"]