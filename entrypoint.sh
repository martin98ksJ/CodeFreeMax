#!/bin/sh
set -e

echo "=== Starting entrypoint script ==="
echo "REDIS_ADDR: $REDIS_ADDR"

# 设置默认值
export REDIS_ADDR="${REDIS_ADDR:-localhost:6379}"
export REDIS_PASSWORD="${REDIS_PASSWORD:-}"

# 使用 envsubst 替换配置文件中的环境变量
envsubst < /app/manifest/config/config.yaml.template > /app/manifest/config/config.yaml

echo "=== Config file after substitution ==="
cat /app/manifest/config/config.yaml

# 启动应用
exec /app/main
