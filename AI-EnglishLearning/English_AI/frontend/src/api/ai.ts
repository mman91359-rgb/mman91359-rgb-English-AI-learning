/**
 * AI 对话 API：SSE 流式返回 + 评分。
 */
export interface ChatRequest {
  message: string
  contextType?: string
  questionContent?: string
  userAnswer?: string
  /** 已有评分摘要：让模型知道各维度实际得分，追问失分原因时才有依据 */
  scoreSummary?: string
  history?: { role: string; content: string }[]
  scoreType?: string
}

const BASE = '/ai'

async function streamRequest(
  endpoint: string,
  request: ChatRequest,
  onToken: (text: string) => void,
  onDone: (fullText: string) => void,
  onError: (err: string) => void,
): Promise<void> {
  const token = sessionStorage.getItem('token')

  try {
    const response = await fetch(`/api${BASE}${endpoint}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        ...(token ? { Authorization: `Bearer ${token}` } : {}),
      },
      body: JSON.stringify(request),
    })

    if (!response.ok) {
      if (response.status === 401) {
        sessionStorage.removeItem('token')
        sessionStorage.removeItem('user')
        window.location.href = '/login'
        throw new Error('登录已过期，请重新登录')
      }
      throw new Error(`请求失败 (${response.status})`)
    }

    const reader = response.body?.getReader()
    if (!reader) {
      throw new Error('不支持流式响应')
    }

    const decoder = new TextDecoder()
    let fullText = ''
    let buffer = ''
    let currentEvent = 'token'
    let doneSent = false
    // SSE 规范：一个事件的多条 data 行属于同一段负载，需按换行拼接后再派发。
    // 后端会把 token 里的换行拆成多条 data 行（如 "音标  \n" → "data:音标  " + "data:"），
    // 逐行 trim 会把换行/缩进吃掉，导致 Markdown 结构塌成一行，故此处必须原样保留空白。
    let dataLines: string[] = []

    /** 事件结束（空行）时派发，拼接规则见上方注释 */
    const dispatch = () => {
      if (dataLines.length === 0) {
        currentEvent = 'token'
        return
      }
      const payload = dataLines.join('\n')
      dataLines = []
      const event = currentEvent
      currentEvent = 'token'

      if (event === 'done') {
        doneSent = true
        onDone(fullText)
        return
      }
      if (event === 'error') {
        throw new Error(payload)
      }
      fullText += payload
      onToken(payload)
    }

    while (true) {
      const { done, value } = await reader.read()
      if (done) break

      buffer += decoder.decode(value, { stream: true })
      const lines = buffer.split('\n')
      buffer = lines.pop() || ''

      for (const rawLine of lines) {
        // 兼容 CRLF：只去掉行尾 \r，其余空白一律保留
        const line = rawLine.endsWith('\r') ? rawLine.slice(0, -1) : rawLine

        if (line === '') {
          dispatch()
          continue
        }

        if (line.startsWith('event:')) {
          currentEvent = line.substring(6).trim() || 'token'
          continue
        }

        if (line.startsWith('data:')) {
          // 规范只允许去掉 "data:" 后的一个前导空格，多余空格属于正文
          const raw = line.substring(5)
          dataLines.push(raw.startsWith(' ') ? raw.slice(1) : raw)
        }
      }
    }

    // 流意外结束且末尾没有空行时，兜底派发残留负载
    dispatch()

    if (!doneSent) {
      onDone(fullText)
    }
  } catch (e: any) {
    onError(e.message || '连接失败')
  }
}

/** SSE 流式对话，前端呈现打字机效果。 */
export async function chatStream(
  request: ChatRequest,
  onToken: (text: string) => void,
  onDone: (fullText: string) => void,
  onError: (err: string) => void,
): Promise<void> {
  return streamRequest('/chat', request, onToken, onDone, onError)
}

/** AI 评分：口语/作文。 */
export async function scoreStream(
  request: ChatRequest,
  onToken: (text: string) => void,
  onDone: (fullText: string) => void,
  onError: (err: string) => void,
): Promise<void> {
  return streamRequest('/score', request, onToken, onDone, onError)
}
