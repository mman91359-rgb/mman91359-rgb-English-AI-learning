#!/usr/bin/env bash
# 备份 user_db / exercise_db / learning_db 的表结构到 sql/backup/
# 用法：scripts/backup-schema.sh
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

if [ -n "${MYSQL_BIN:-}" ]; then
  BIN_DIR="$MYSQL_BIN"
elif command -v mysqldump >/dev/null 2>&1; then
  BIN_DIR="$(dirname "$(command -v mysqldump)")"
else
  BIN_DIR="/c/Program Files/MySQL/MySQL Server 8.0/bin"
fi

MYSQLDUMP="$BIN_DIR/mysqldump"
if [ ! -x "$MYSQLDUMP" ] && [ ! -f "$MYSQLDUMP.exe" ]; then
  echo "找不到 mysqldump，可设置 MYSQL_BIN 指向 MySQL bin 目录" >&2
  exit 1
fi

HOST="${MYSQL_HOST:-127.0.0.1}"
PORT="${MYSQL_PORT:-3306}"
STAMP="$(date +%Y%m%d_%H%M%S)"
mkdir -p "$ROOT_DIR/sql/backup"

for db in user_db exercise_db learning_db; do
  out="$ROOT_DIR/sql/backup/${STAMP}_${db}_schema.sql"
  MYSQL_PWD="${MYSQL_PASSWORD:?MYSQL_PASSWORD 未配置}" \
    "$MYSQLDUMP" -h "$HOST" -P "$PORT" -u "$MYSQL_USERNAME" \
    --no-data --skip-add-drop-table --skip-comments --default-character-set=utf8mb4 \
    --set-gtid-purged=OFF "$db" > "$out"
  echo "backup: $out"
done
