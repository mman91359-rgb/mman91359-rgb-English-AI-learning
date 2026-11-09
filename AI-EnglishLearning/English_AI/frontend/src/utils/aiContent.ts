/**
 * AI 回答的内容解析层。
 *
 * 回答是纯文本流（SSE 逐 token 累积），结构只能靠 `## ` 标题推断。
 * 拆成两段是有意为之：
 * - splitSections 只负责切分与转义，不产 HTML，可低成本用于计数/门槛判定；
 * - renderSection 才产 HTML，卡片可以只渲染前 n 节，其余懒渲染。
 */

export interface AiSection {
  /** 区块标题（`## ` 之后的内容）；引导语段为空字符串 */
  title: string
  /** 已转义、已规范化 `## ` 的正文原文，交给 renderSection 处理 */
  body: string
}

/** 卡片类型：决定卡头图标与标题前缀 */
export type AiCardType = 'vocab' | 'grammar' | 'review'

/** HTML 转义：所有进入 v-html 的内容必须先经过它，杜绝注入 */
function escapeHtml(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;')
}

/** 行内白名单格式：加粗 / 斜体 / 行内代码 / 音标，输入已转义 */
function inlineFormat(s: string): string {
  return s
    .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
    .replace(/\*(.+?)\*/g, '<em>$1</em>')
    .replace(/`([^`]+)`/g, '<code class="ai-code">$1</code>')
    .replace(/\b(\/[^/]+\/)\b/g, '<span class="ai-phonetic">$1</span>')
}

/**
 * 把一整段回答切成区块。
 * 转义与 `## ` 规范化必须整段先做（全局正则），只有 section 内部才可以懒渲染。
 */
export function splitSections(text: string): AiSection[] {
  if (!text) return []

  let result = escapeHtml(text)
  // 规范化 ## 标题：确保每个 ## 在新行开始
  result = result.replace(/([^\n])##\s*/g, '$1\n## ')
  result = result.replace(/^\s*##\s*/gm, '## ')

  // 按 ## 标题分割（首个 ## 之前的内容作为引导语，title 为空）
  const chunks = result.split(/\n(?=##\s)/)
  const sections: AiSection[] = []

  for (const chunk of chunks) {
    const trimmed = chunk.trim()
    if (!trimmed) continue

    if (trimmed.startsWith('## ')) {
      const nl = trimmed.indexOf('\n')
      if (nl > 0) {
        sections.push({ title: trimmed.slice(3, nl).trim(), body: trimmed.slice(nl + 1).trim() })
      } else {
        sections.push({ title: trimmed.slice(3).trim(), body: '' })
      }
    } else {
      // 不以 ## 开头：整段都是正文，不做"把第一行当标题"的猜测
      sections.push({ title: '', body: trimmed })
    }
  }

  return sections
}

function renderBody(content: string): string {
  if (!content) return ''

  const lines = content.split('\n')
  const out: string[] = []
  let inList = false
  let listType = ''

  function closeList() {
    if (inList) {
      out.push(listType === 'ol' ? '</ol>' : '</ul>')
      inList = false
      listType = ''
    }
  }

  for (const rawLine of lines) {
    const line = rawLine.trim()
    if (!line) {
      closeList()
      out.push('<div class="ai-spacer"></div>')
      continue
    }

    // 编号列表：1. / 2. / 1、/ 2、
    if (/^\d+[.、)]\s/.test(line)) {
      if (!inList || listType !== 'ol') {
        closeList()
        out.push('<ol class="ai-ordered-list">')
        inList = true
        listType = 'ol'
      }
      out.push(`<li>${inlineFormat(line.replace(/^\d+[.、)]\s*/, ''))}</li>`)
      continue
    }

    // 无序列表：- / * / •
    if (line.startsWith('- ') || line.startsWith('* ') || line.startsWith('• ')) {
      if (!inList || listType !== 'ul') {
        closeList()
        out.push('<ul class="ai-unordered-list">')
        inList = true
        listType = 'ul'
      }
      out.push(`<li>${inlineFormat(line.replace(/^[-*•]\s*/, ''))}</li>`)
      continue
    }

    closeList()
    out.push(`<div class="ai-paragraph">${inlineFormat(line)}</div>`)
  }

  closeList()
  return out.join('')
}

/** 单节渲染为 HTML。标题为空时只输出正文（供引导语段使用） */
export function renderSection(section: AiSection): string {
  const parts: string[] = []
  if (section.title) {
    const renderedTitle = section.title.replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
    parts.push(`<h3 class="ai-title">${renderedTitle}</h3>`)
  }
  const body = renderBody(section.body)
  if (body) parts.push(body)
  return parts.join('')
}

/**
 * 兼容旧调用：一次性渲染整段回答。
 * 新代码优先用 splitSections + renderSection，以便按需只渲染前几节。
 */
export function formatAiContent(text: string): string {
  return splitSections(text)
    .map(renderSection)
    .join('<div class="ai-section-gap"></div>')
}
