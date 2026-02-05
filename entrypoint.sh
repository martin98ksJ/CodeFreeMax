#!/bin/sh
set -e

echo "=== Starting entrypoint script ==="
echo "REDIS_ADDR: $REDIS_ADDR"
echo "REDIS_PASSWORD: [hidden]"

# 使用 envsubst 替换配置文件中的环境变量
export REDIS_ADDR="${REDIS_ADDR:-localhost:6379}"
export REDIS_PASSWORD="${REDIS_PASSWORD:-}"

envsubst < /app/manifest/config/config.yaml.template > /app/manifest/config/config.yaml

echo "=== Config file after substitution ==="
cat /app/manifest/config/config.yaml

# 执行原始镜像的启动命令
exec "$@"
