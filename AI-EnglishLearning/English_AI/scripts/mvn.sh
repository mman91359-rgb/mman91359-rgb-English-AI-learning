#!/usr/bin/env bash
# 用 JDK 17+ 运行 Maven。
#
# 背景：本机 JAVA_HOME 默认指向 JRE 8（C:\Program Files\Java\jre1.8.0_152），
# 直接跑 mvn 会报 “class file version 61.0 … up to 52.0”。
#
# 用法：
#   scripts/mvn.sh -pl exercise-service -am test
#   scripts/mvn.sh -DskipTests install
set -euo pipefail

# 取 java 主版本号：openjdk version "21.0.1" -> 21；java version "1.8.0_152" -> 8
java_major() {
  local bin="$1"
  local line
  line="$("$bin" -version 2>&1 | head -n 1)"
  local ver
  ver="$(printf '%s' "$line" | sed -n 's/.*version "\([^"]*\)".*/\1/p')"
  [ -z "$ver" ] && echo 0 && return
  if [[ "$ver" == 1.* ]]; then
    echo "${ver#1.}" | cut -d. -f1
  else
    echo "$ver" | cut -d. -f1
  fi
}

usable_jdk() {
  local dir="$1"
  [ -n "$dir" ] || return 1
  [ -d "$dir" ] || return 1
  [ -x "$dir/bin/java" ] || return 1
  [ -x "$dir/bin/javac" ] || return 1
  local major
  major="$(java_major "$dir/bin/java")"
  [ "${major:-0}" -ge 17 ]
}

CANDIDATES=()
[ -n "${JAVA_HOME:-}" ] && CANDIDATES+=("$JAVA_HOME")
CANDIDATES+=("/c/Program Files/Java/jdk-21" "/c/Program Files/Java/jdk-17" "C:/jdk-21" "C:/jdk-17")
for d in "/c/Program Files/Java"/jdk-* "/c/Program Files/Eclipse Adoptium"/jdk-*; do
  [ -d "$d" ] && CANDIDATES+=("$d")
done

CHOSEN=""
for dir in "${CANDIDATES[@]}"; do
  if usable_jdk "$dir"; then
    CHOSEN="$dir"
    break
  fi
done

if [ -z "$CHOSEN" ]; then
  echo "错误：找不到 JDK 17+。请先安装 JDK 17 或 21，再设置 JAVA_HOME 后重试。" >&2
  echo "      当前 JAVA_HOME=${JAVA_HOME:-<未设置>}" >&2
  exit 1
fi

# Maven 需要 Windows 风格路径
if command -v cygpath >/dev/null 2>&1; then
  export JAVA_HOME="$(cygpath -w "$CHOSEN")"
else
  export JAVA_HOME="$CHOSEN"
fi

echo "[mvn.sh] JAVA_HOME=$JAVA_HOME (Java $(java_major "$CHOSEN/bin/java"))" >&2
exec mvn "$@"
