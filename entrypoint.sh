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

# 查找可执行文件
if [ -f "/app/kiro2api" ]; then
    exec /app/kiro2api
elif [ -f "./kiro2api" ]; then
    exec ./kiro2api
elif [ -f "/kiro2api" ]; then
    exec /kiro2api
else
    echo "=== Searching for kiro2api executable ==="
    find / -name "kiro2api" -type f 2>/dev/null || true
    echo "ERROR: kiro2api executable not found"
    exit 1
fi
