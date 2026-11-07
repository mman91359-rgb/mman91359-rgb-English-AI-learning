#!/usr/bin/env bash
# Flyway baseline / migrate 辅助脚本。
# 用法：
#   scripts/flyway.sh user-service baseline
#   scripts/flyway.sh user-service migrate
#   scripts/flyway.sh exercise-service migrate
#   scripts/flyway.sh learning-engine-service migrate
#   scripts/flyway.sh user-service info
#   scripts/flyway.sh user-service validate
#   scripts/flyway.sh user-service repair
set -euo pipefail

MODULE="${1:-}"
COMMAND="${2:-}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_FILE="${ENV_FILE:-$ROOT_DIR/.env}"

case "$MODULE" in
  user-service) DB="user_db" ;;
  exercise-service) DB="exercise_db" ;;
  learning-engine-service) DB="learning_db" ;;
  *) echo "用法: scripts/flyway.sh <user-service|exercise-service|learning-engine-service> <baseline|migrate>" >&2; exit 1 ;;
esac

case "$COMMAND" in
  baseline|migrate|info|validate|repair) ;;
  *) echo "命令只支持 baseline/migrate/info/validate/repair" >&2; exit 1 ;;
esac

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

HOST="${MYSQL_HOST:-127.0.0.1}"
PORT="${MYSQL_PORT:-3306}"
export FLYWAY_URL="jdbc:mysql://${HOST}:${PORT}/${DB}?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&useSSL=false&allowPublicKeyRetrieval=true"
export FLYWAY_USER="${MYSQL_USERNAME:?MYSQL_USERNAME 未配置}"
export FLYWAY_PASSWORD="${MYSQL_PASSWORD:?MYSQL_PASSWORD 未配置}"

cd "$ROOT_DIR"
if [ "$COMMAND" = "baseline" ]; then
  # 空库保护：空库执行 baseline 会把 V1.0.0 记为“已应用”却不执行，
  # 随后 migrate 从 V1.0.1 开始，在写业务表时必然报 Table doesn't exist。
  INFO_OUT="$(mvn -q -pl "$MODULE" flyway:info \
    -Dflyway.locations="filesystem:${MODULE}/src/main/resources/db/migration" 2>&1 || true)"
  if printf '%s\n' "$INFO_OUT" | grep -qi "Empty Schema"; then
    cat >&2 <<EOF
错误：${DB} 是空库，不能执行 baseline。
  baseline 只用于“已有表结构但没有 flyway_schema_history”的存量库。
  空库请直接执行：scripts/flyway.sh ${MODULE} migrate
EOF
    exit 1
  fi

  mvn -q -pl "$MODULE" flyway:baseline \
    -Dflyway.locations="filesystem:${MODULE}/src/main/resources/db/migration" \
    -Dflyway.baselineVersion=1.0.0 \
    -Dflyway.baselineDescription="baseline current schema"
else
  mvn -q -pl "$MODULE" "flyway:${COMMAND}" \
    -Dflyway.locations="filesystem:${MODULE}/src/main/resources/db/migration"
fi
