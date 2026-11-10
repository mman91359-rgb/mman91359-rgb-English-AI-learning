import { defineStore } from 'pinia'
import { ref } from 'vue'
import { chatStream, type ChatRequest } from '@/api/ai'

export type FeedbackKind = 'writing' | 'translation' | 'listening'

export interface ChatMessage {
  id: string
  role: 'user' | 'ai' | 'system'
  content: string
  timestamp: number
  isStreaming?: boolean
  /**
   * 结构化结果引用。只存 recordId，不存业务模型本体：
   * 消息体积可控、store 保持领域无关、渲染时按 id 反查。
   * 存在 meta 时，类型判定以它为准，不再做任何文本推断。
   */
  meta?: {
    kind: FeedbackKind
    recordId: string
  }
}

let msgSeq = 0
function nextId() {
  return `msg_${Date.now()}_${++msgSeq}`
}

export const useAiStore = defineStore('ai', () => {
  const isOpen = ref(false)
  const inlineMode = ref(false)
  const messages = ref<ChatMessage[]>([])
  const isLoading = ref(false)
  const contextType = ref('general')
  const questionContent = ref('')
  const userAnswer = ref('')
  /** 当前展开的卡片消息 id；null 表示全部收起，保证同一时间只展开一张 */
  const expandedCardId = ref<string | null>(null)

  function toggleCard(id: string) {
    expandedCardId.value = expandedCardId.value === id ? null : id
  }

  function open(context?: { contextType?: string; questionContent?: string; userAnswer?: string }) {
    if (context) {
      contextType.value = context.contextType || 'general'
      questionContent.value = context.questionContent || ''
      userAnswer.value = context.userAnswer || ''
      // 切题时清除上一题的对话记录，确保AI聚焦当前题目
      messages.value = []
      expandedCardId.value = null
    }
    isOpen.value = true
  }

  function close() {
    isOpen.value = false
  }

  function toggle() {
    if (isOpen.value) close()
    else open()
  }

  function setInlineMode(enabled: boolean) {
    inlineMode.value = enabled
  }

  function addMessage(role: 'user' | 'ai' | 'system', content: string) {
    const msg: ChatMessage = {
      id: nextId(),
      role,
      content,
      timestamp: Date.now(),
    }
    messages.value.push(msg)
    // 必须返回数组里的响应式代理：直接返回 msg 会拿到原始对象，
    // 后续 msg.content += token 绕过 proxy，视图不会更新。
    return messages.value[messages.value.length - 1]
  }

  async function sendMessage(text: string) {
    if (!text.trim() || isLoading.value) return
    addMessage('user', text.trim())

    const aiMsg = addMessage('ai', '')
    aiMsg.isStreaming = true
    isLoading.value = true
    // 新提问时自动折叠上一张卡片，保持同时只有一张展开
    expandedCardId.value = null

    const ctx: ChatRequest = {
      message: text.trim(),
      contextType: contextType.value,
      questionContent: questionContent.value || undefined,
      userAnswer: userAnswer.value || undefined,
    }

    // token 合并：流式回调每秒可达 10-40 次，逐 token 写入会触发整段富文本重解析，
    // 按帧合并后每帧最多更新一次。
    let pending = ''
    let rafId: number | null = null

    const flushTokens = () => {
      rafId = null
      if (!pending) return
      aiMsg.content += pending
      pending = ''
    }

    await chatStream(
      ctx,
      (token) => {
        pending += token
        if (rafId === null) rafId = requestAnimationFrame(flushTokens)
      },
      () => {
        // 收尾必须冲刷，否则最后不足一帧的 token 会丢失
        if (rafId !== null) cancelAnimationFrame(rafId)
        flushTokens()
        aiMsg.isStreaming = false
        isLoading.value = false
      },
      (err) => {
        if (rafId !== null) cancelAnimationFrame(rafId)
        flushTokens()
        aiMsg.content = '抱歉，AI服务暂时不可用：' + err
        aiMsg.isStreaming = false
        isLoading.value = false
      },
    )
  }

  function clearMessages() {
    messages.value = []
    expandedCardId.value = null
  }

  /**
   * 注入一张结构化结果卡（批改速览），不发起模型调用。
   * 与 sendMessage 的区别：不产生 isLoading，也不清空既有对话——追问是延续，不是新开一题。
   */
  function injectFeedback(kind: FeedbackKind, recordId: string) {
    const msg = addMessage('ai', '')
    msg.meta = { kind, recordId }
    // 新卡进来时收起上一张，保持同时只展开一张
    expandedCardId.value = null
    isOpen.value = true
  }

  function sendScoreRequest(content: string, scoreType: 'speaking' | 'writing') {
    const prompt = scoreType === 'speaking'
      ? `请对以下口语内容进行评分：\n\n${content}`
      : `请对以下作文进行评分：\n\n${content}`
    sendMessage(prompt)
  }

  return {
    isOpen,
    inlineMode,
    messages,
    isLoading,
    contextType,
    questionContent,
    userAnswer,
    expandedCardId,
    open,
    close,
    toggle,
    toggleCard,
    setInlineMode,
    sendMessage,
    clearMessages,
    injectFeedback,
    sendScoreRequest,
  }
})
