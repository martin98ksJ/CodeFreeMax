FROM ssmdo/kiro2api:latest

# 复制配置文件
COPY config.yaml /app/manifest/config/config.yaml

# 创建数据目录
RUN mkdir -p /app/data

EXPOSE 8000

# 使用基础镜像的默认启动命令
