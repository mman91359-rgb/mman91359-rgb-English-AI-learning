/**
 * Navicat/MySQL dump 解析的最小公共实现。
 *
 * 为什么单独抽出：生成词库难度与生成词汇题都要读同一份 6.26.sql，
 * 解析规则（MySQL 转义、字面 \n 清理）一旦分叉就会出现两套口径。
 * scripts/import-words.mjs 内保留了一份等价实现（该脚本已验证可用，暂不回归）。
 */

import fs from 'node:fs'

const ESCAPES = {
  0: '\0',
  b: '\b',
  n: '\n',
  r: '\r',
  t: '\t',
  Z: '\u001a',
  '\\': '\\',
  "'": "'",
  '"': '"',
}

/** 解析一行 INSERT 的 VALUES 部分，字符串按 MySQL 规则反转义 */
export function parseRow(line) {
  const marker = ' VALUES ('
  const idx = line.indexOf(marker)
  if (idx < 0) return null
  const s = line.slice(idx + marker.length)
  const out = []
  let i = 0
  while (i < s.length) {
    while (s[i] === ' ') i += 1
    if (i >= s.length || s[i] === ')') break
    if (s[i] === "'") {
      i += 1
      let buf = ''
      while (i < s.length) {
        const c = s[i]
        if (c === '\\') {
          const n = s[i + 1]
          buf += Object.prototype.hasOwnProperty.call(ESCAPES, n) ? ESCAPES[n] : n
          i += 2
        } else if (c === "'") {
          if (s[i + 1] === "'") {
            buf += "'"
            i += 2
          } else {
            i += 1
            break
          }
        } else {
          buf += c
          i += 1
        }
      }
      out.push(buf)
    } else {
      let buf = ''
      while (i < s.length && s[i] !== ',' && s[i] !== ')') {
        buf += s[i]
        i += 1
      }
      const t = buf.trim()
      if (/^null$/i.test(t) || t === '') out.push(null)
      else out.push(Number.isNaN(Number(t)) ? t : Number(t))
    }
    while (s[i] === ' ') i += 1
    if (s[i] === ',') i += 1
  }
  return out
}

/** 清理文本：字面 \n、真实换行、连续空白压成单空格 */
export function cleanText(value) {
  if (value === null || value === undefined) return ''
  return String(value)
    .replace(/\\n/g, ' ')
    .replace(/\\r/g, ' ')
    .replace(/\\t/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
}

/** SQL 字符串字面量转义：先转义反斜杠，再转义单引号 */
export function sqlEscape(value) {
  return String(value === null || value === undefined ? '' : value)
    .replace(/\\/g, '\\\\')
    .replace(/'/g, "''")
}

/** 解析 .env（与 scripts/flyway.sh 的解析口径一致） */
export function readEnv(filePath) {
  const env = {}
  if (!fs.existsSync(filePath)) return env
  for (const raw of fs.readFileSync(filePath, 'utf8').split(/\r?\n/)) {
    const line = raw.trim()
    if (!line || line.startsWith('#')) continue
    const i = line.indexOf('=')
    if (i <= 0) continue
    env[line.slice(0, i).trim()] = line.slice(i + 1).trim()
  }
  return env
}
