FROM ssmdo/kiro2api:latest

# 安装 envsubst 工具
RUN apk add --no-cache gettext

# 复制配置模板和启动脚本
COPY config.yaml /app/manifest/config/config.yaml.template
COPY entrypoint.sh /entrypoint.sh

# 设置脚本执行权限
RUN chmod +x /entrypoint.sh

# 创建数据目录
RUN mkdir -p /app/data

EXPOSE 8000

# 使用自定义入口点脚本
ENTRYPOINT ["/entrypoint.sh"]
