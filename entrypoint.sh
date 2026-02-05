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

echo "=== Checking /app directory ==="
ls -la /app/ || true

echo "=== Searching for executables in /app ==="
find /app -type f -executable 2>/dev/null || true

echo "=== Checking current directory ==="
pwd
ls -la

echo "=== Searching for any kiro* files ==="
find / -name "kiro*" 2>/dev/null | head -20 || true

echo "ERROR: Cannot determine startup command"
exit 1
