# 使用Node.js作为基础镜像
FROM node:18-alpine as build-stage

# 设置工作目录
WORKDIR /app

# 复制package.json和package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制项目文件
COPY . .

# 构建应用
RUN npm run build

# 使用nginx作为生产环境服务器
FROM nginx:stable-alpine as production-stage

# 暴露80端口
EXPOSE 6105

# 容器启动时执行的命令，类似npm run start
CMD npm start 