/**
 * LRC 字幕解析工具。
 *
 * 数据库里的时间戳是完整音频的绝对时间；页面按片段过滤后再减起点显示。
 */

export interface LrcCue {
  /** 绝对时间（秒） */
  time: number
  /** 英文/原文 */
  text: string
  /** 中文翻译（可选） */
  translation?: string
}

const TIME_TAG = /\[(\d{1,3}):(\d{2})(?:\.(\d{1,3}))?\]/g
const META_TAG = /^\[(ti|ar|al|by|re|ve):/i
const OFFSET_TAG = /^\[offset:\s*([+-]?\d+)\s*\]$/i

function round2(value: number): number {
  return Math.round(value * 100) / 100
}

function parseText(raw: string): { text: string; translation?: string } {
  const value = raw.trim()
  if (!value) return { text: '' }
  // 导入脚本使用全角分隔符；兼容 || 双竖线
  const separator = value.includes('｜') ? '｜' : value.includes('||') ? '||' : ''
  if (!separator) return { text: value }
  const index = value.indexOf(separator)
  const text = value.slice(0, index).trim()
  const translation = value.slice(index + separator.length).trim()
  return translation ? { text, translation } : { text }
}

/**
 * 解析 LRC 文本。支持 [mm:ss]、[mm:ss.xx]、[mm:ss.xxx]、一行多时间戳、[offset:]。
 * 传入的 offset 为正时，字幕整体后移；为负时前移。
 */
export function parseLrc(content?: string | null): LrcCue[] {
  if (!content) return []

  let offsetSeconds = 0
  const cues: LrcCue[] = []

  for (const rawLine of content.split(/\r?\n/)) {
    const line = rawLine.trim()
    if (!line) continue

    const offsetMatch = line.match(OFFSET_TAG)
    if (offsetMatch) {
      offsetSeconds = Number(offsetMatch[1]) / 1000
      continue
    }
    if (META_TAG.test(line)) continue

    const times: number[] = []
    TIME_TAG.lastIndex = 0
    let match: RegExpExecArray | null
    while ((match = TIME_TAG.exec(line)) !== null) {
      const minutes = Number(match[1])
      const seconds = Number(match[2])
      const fraction = Number(`0.${match[3] || '0'}`)
      times.push(round2(minutes * 60 + seconds + fraction))
    }
    if (times.length === 0) continue

    const lastTag = line.lastIndexOf(']')
    const { text, translation } = parseText(line.slice(lastTag + 1))
    if (!text && !translation) continue

    for (const time of times) {
      cues.push({
        time: round2(Math.max(0, time + offsetSeconds)),
        text: text || translation || '',
        translation: text ? translation : undefined,
      })
    }
  }

  cues.sort((a, b) => a.time - b.time)
  return cues
}

/**
 * 返回 time 时刻正在播放的字幕下标；早于第一句返回 -1。
 */
export function findCueIndex(cues: LrcCue[], time: number): number {
  if (cues.length === 0) return -1
  let low = 0
  let high = cues.length - 1
  let answer = -1
  while (low <= high) {
    const mid = Math.floor((low + high) / 2)
    if (cues[mid].time <= time) {
      answer = mid
      low = mid + 1
    } else {
      high = mid - 1
    }
  }
  return answer
}

/**
 * 按片段区间过滤 LRC。默认把时间转成相对片段起点，便于进度条/高亮使用。
 */
export function sliceLrc(
  cues: LrcCue[],
  startSeconds?: number,
  endSeconds?: number,
  relative = true,
): LrcCue[] {
  const start = Number.isFinite(startSeconds) ? Number(startSeconds) : 0
  const end = Number.isFinite(endSeconds) ? Number(endSeconds) : Number.POSITIVE_INFINITY
  return cues
    .filter((cue) => cue.time >= start && cue.time < end)
    .map((cue) => ({
      ...cue,
      time: round2(relative ? Math.max(0, cue.time - start) : cue.time),
    }))
}
