#!/bin/sh
set -e

# 替换配置文件中的环境变量占位符
if [ -n "$REDIS_ADDR" ]; then
    sed -i "s|\${REDIS_ADDR}|$REDIS_ADDR|g" /app/manifest/config/config.yaml
fi

if [ -n "$REDIS_PASSWORD" ]; then
    sed -i "s|\${REDIS_PASSWORD}|$REDIS_PASSWORD|g" /app/manifest/config/config.yaml
else
    # 如果没有密码，设置为空字符串
    sed -i "s|\${REDIS_PASSWORD}||g" /app/manifest/config/config.yaml
fi

# 执行原始镜像的启动命令
exec "$@"
