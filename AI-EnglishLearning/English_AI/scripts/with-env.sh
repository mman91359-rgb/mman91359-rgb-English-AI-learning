#!/usr/bin/env bash
# 读取项目根目录 .env 并导出为环境变量，然后执行传入命令。
# 用法：
#   scripts/with-env.sh mvn -pl user-service spring-boot:run
#   scripts/with-env.sh mvn -DskipTests install
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_FILE="${ENV_FILE:-$ROOT_DIR/.env}"

if [ ! -f "$ENV_FILE" ]; then
  echo "缺少环境文件: $ENV_FILE" >&2
  exit 1
fi

set -a
while IFS='=' read -r key value; do
  [ -z "$key" ] && continue
  case "$key" in
    \#*) continue ;;
  esac
  value="${value%$'\r'}"
  export "$key=$value"
done < "$ENV_FILE"
set +a

exec "$@"
