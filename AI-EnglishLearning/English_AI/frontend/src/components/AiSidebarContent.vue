<template>
  <div class="flex h-full flex-col bg-background dark:bg-surface-container-lowest">
    <!-- 头部 -->
    <div class="flex items-center justify-between border-b border-outline-variant/30 px-6 py-4">
      <div class="flex items-center gap-3">
        <div class="flex h-10 w-10 items-center justify-center rounded-full bg-gradient-to-br from-primary to-primary-container">
          <span class="material-symbols-outlined text-icon-lg text-on-primary">forum</span>
        </div>
        <div>
          <div class="font-label-lg text-label-lg font-semibold text-on-surface">{{ $t('ai.title') }}</div>
          <div class="mt-0.5 flex items-center gap-1.5">
            <span class="h-2 w-2 rounded-full bg-tertiary"></span>
            <span class="font-body-xs text-body-xs text-on-surface-variant">{{ contextLabel }}</span>
          </div>
        </div>
      </div>
      <div class="flex items-center gap-2">
        <button
          v-if="aiStore.messages.length > 0"
          type="button"
          :class="btnIconSm"
          :title="$t('ai.clearChat')"
          :aria-label="$t('ai.clearChat')"
          @click="aiStore.clearMessages()"
        >
          <span class="material-symbols-outlined text-icon-md text-on-surface-variant">delete_outline</span>
        </button>
        <button
          type="button"
          :class="btnIconSm"
          :aria-label="$t('ai.close')"
          @click="$emit('close')"
        >
          <span class="material-symbols-outlined text-on-surface-variant">close</span>
        </button>
      </div>
    </div>

    <!-- 消息列表 -->
    <div ref="msgContainer" class="flex-1 overflow-y-auto px-5 py-4">
      <!-- 空状态：欢迎页 -->
      <div v-if="aiStore.messages.length === 0" class="flex flex-col items-center pt-8 text-center">
        <div class="relative mb-6">
          <div class="absolute inset-0 scale-150 rounded-full bg-gradient-to-br from-primary/20 to-primary-container/10 blur-2xl"></div>
          <div class="relative flex h-20 w-20 items-center justify-center rounded-2xl border border-outline-variant/20 bg-surface-container-lowest shadow-lg dark:bg-surface">
            <span class="material-symbols-outlined fill text-icon-xl text-primary">support_agent</span>
          </div>
        </div>
        <h3 class="mb-2 font-headline-md text-headline-md font-bold text-on-surface">{{ $t('ai.subtitle') }}</h3>
        <p class="max-w-[260px] font-body-md text-body-md leading-relaxed text-on-surface-variant">
          {{ $t('ai.welcomeDesc') }}
        </p>

        <!-- 功能入口卡片 -->
        <div class="mt-8 w-full space-y-3">
          <button
            type="button"
            class="group flex w-full items-center gap-4 rounded-2xl border border-outline-variant/20 bg-surface-container-lowest px-4 py-3.5 text-left transition-all hover:shadow-md dark:bg-surface"
            @click="sendQuickAction('vocab')"
          >
            <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-primary-fixed dark:bg-primary-container/20">
              <span class="material-symbols-outlined text-primary">menu_book</span>
            </div>
            <div class="flex-1 min-w-0">
              <div class="flex items-center gap-2">
                <span class="font-body-md text-body-md font-medium text-on-surface">{{ $t('ai.quickVocab') }}</span>
              </div>
            </div>
            <span class="material-symbols-outlined text-icon-md text-outline transition-colors group-hover:text-primary">chevron_right</span>
          </button>

          <button
            type="button"
            class="group flex w-full items-center gap-4 rounded-2xl border border-outline-variant/20 bg-surface-container-lowest px-4 py-3.5 text-left transition-all hover:shadow-md dark:bg-surface"
            @click="sendQuickAction('grammar')"
          >
            <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-secondary-fixed dark:bg-secondary-container/30">
              <span class="material-symbols-outlined text-secondary">schema</span>
            </div>
            <div class="flex-1 min-w-0">
              <div class="flex items-center gap-2">
                <span class="font-body-md text-body-md font-medium text-on-surface">{{ $t('ai.quickGrammar') }}</span>
              </div>
            </div>
            <span class="material-symbols-outlined text-icon-md text-outline transition-colors group-hover:text-primary">chevron_right</span>
          </button>
        </div>
      </div>

      <!-- 消息列表 -->
      <div v-else class="space-y-4">
        <div
          v-for="msg in aiStore.messages"
          :key="msg.id"
          class="flex"
          :class="msg.role === 'user' ? 'justify-end' : 'justify-start'"
        >
          <div
            class="max-w-[85%] rounded-2xl px-4 py-3"
            :class="msg.role === 'user'
              ? 'rounded-br-md bg-primary text-on-primary'
              : 'select-text rounded-bl-md border border-outline-variant/10 bg-surface-container-lowest text-on-surface shadow-sm dark:bg-surface'"
          >
            <div v-if="msg.role === 'ai'" class="mb-1.5 flex items-center justify-between">
              <div class="flex items-center gap-2">
                <span class="material-symbols-outlined text-icon-sm text-primary">forum</span>
                <span class="font-label-sm text-label-sm text-primary">{{ $t('ai.badge') }}</span>
              </div>
              <button
                v-if="msg.content && !msg.isStreaming"
                type="button"
                class="rounded-md p-1 text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-primary"
                :title="$t('ai.copy')"
                :aria-label="$t('ai.copy')"
                @click="copyMessage(msg.content)"
              >
                <span class="material-symbols-outlined text-icon-md">content_copy</span>
              </button>
            </div>
            <div class="select-text font-body-sm text-body-sm leading-relaxed break-words">
              <!-- AI 内容：formatAiContent 先转义再做白名单格式化，禁止注入 -->
              <span v-if="msg.role === 'ai'" v-html="formatAiContent(msg.content)"></span>
              <!-- 用户内容：纯插值，永不进入 v-html -->
              <span v-else>{{ msg.content }}</span>
              <span
                v-if="msg.isStreaming"
                class="ml-0.5 inline-block h-4 w-1.5 animate-pulse bg-primary align-text-bottom"
              ></span>
            </div>
          </div>
        </div>

        <!-- loading 占位 -->
        <div v-if="aiStore.isLoading && aiStore.messages.length === 0" class="flex justify-start">
          <div class="rounded-2xl border border-outline-variant/10 bg-surface-container-lowest px-4 py-3 shadow-sm dark:bg-surface">
            <div class="flex gap-1.5">
              <span class="h-2.5 w-2.5 animate-bounce rounded-full bg-on-surface-variant/30" style="animation-delay:0s"></span>
              <span class="h-2.5 w-2.5 animate-bounce rounded-full bg-on-surface-variant/30" style="animation-delay:0.15s"></span>
              <span class="h-2.5 w-2.5 animate-bounce rounded-full bg-on-surface-variant/30" style="animation-delay:0.3s"></span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 输入区 -->
    <div class="border-t border-outline-variant/30 px-5 py-4">
      <div class="flex items-center gap-2 rounded-full border border-outline-variant/20 bg-surface-container-lowest px-4 py-2.5 shadow-sm transition-colors focus-within:border-primary/50 dark:bg-surface">
        <span class="material-symbols-outlined text-icon-md text-outline">add</span>
        <input
          v-model="inputText"
          class="flex-1 bg-transparent font-body-md text-body-md text-on-surface outline-none placeholder:text-on-surface-variant/50"
          :placeholder="inputPlaceholder"
          maxlength="500"
          :disabled="aiStore.isLoading"
          @keydown.enter.prevent="handleSend"
        />
        <button
          type="button"
          class="flex h-9 w-9 shrink-0 items-center justify-center rounded-full bg-gradient-to-br from-primary to-primary-container text-on-primary transition-opacity hover:shadow-lg disabled:opacity-40 disabled:hover:shadow-none"
          :disabled="!inputText.trim() || aiStore.isLoading"
          @click="handleSend"
        >
          <span class="material-symbols-outlined fill text-icon-md">arrow_upward</span>
        </button>
      </div>
      <!-- 底部提示 -->
      <div v-if="aiStore.messages.length === 0" class="mt-3 text-center">
        <p class="font-body-xs text-body-xs text-on-surface-variant/50">
          {{ $t('ai.disclaimer') }}
        </p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, watch, nextTick, computed } from 'vue'
import { useI18n } from 'vue-i18n'
import { useAiStore } from '@/stores/ai'
import { useToast } from '@/composables/useToast'
import { btnIconSm } from '@/components/ui/buttonStyles'

const { t } = useI18n()
const { show: toast } = useToast()

/** HTML 转义：所有进入 v-html 的内容必须先经过它，杜绝注入 */
function escapeHtml(str: string): string {
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;')
}

function formatAiContent(text: string): string {
  if (!text) return ''

  // 先整体转义，再做白名单格式化；插入的标签全部来自本函数
  let result = escapeHtml(text)

  // 规范化 ## 标题：确保每个 ## 在新行开始
  result = result.replace(/([^\n])##\s*/g, '$1\n## ')
  result = result.replace(/^\s*##\s*/gm, '## ')

  // 按 ## 标题分割
  const sections = result.split(/\n(?=##\s)/)
  const formattedSections: string[] = []

  for (const section of sections) {
    const trimmed = section.trim()
    if (!trimmed) continue

    // 解析标题和内容
    const firstLineEnd = trimmed.indexOf('\n')
    let title = ''
    let content = ''

    if (firstLineEnd > 0) {
      const firstLine = trimmed.substring(0, firstLineEnd).trim()
      if (firstLine.startsWith('## ')) {
        title = firstLine.substring(3).trim()
      } else {
        title = firstLine
      }
      content = trimmed.substring(firstLineEnd + 1).trim()
    } else {
      if (trimmed.startsWith('## ')) {
        title = trimmed.substring(3).trim()
      } else {
        content = trimmed
      }
    }

    // 渲染标题（加粗为白名单标签）
    if (title) {
      const renderedTitle = title.replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
      formattedSections.push(`<h3 class="ai-title">${renderedTitle}</h3>`)
    }
    if (content) {
      formattedSections.push(formatSection(content))
    }
  }

  return formattedSections.join('<div class="ai-section-gap"></div>')
}

function formatSection(content: string): string {
  if (!content) return ''

  const lines = content.split('\n')
  const formattedLines: string[] = []
  let inList = false
  let listType = ''

  function closeList() {
    if (inList) {
      formattedLines.push(listType === 'ol' ? '</ol>' : '</ul>')
      inList = false
      listType = ''
    }
  }

  /** 行内白名单格式：加粗 / 斜体 / 行内代码 / 音标，输入已转义 */
  function inlineFormat(s: string): string {
    return s
      .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
      .replace(/\*(.+?)\*/g, '<em>$1</em>')
      .replace(/`([^`]+)`/g, '<code class="ai-code">$1</code>')
      .replace(/\b(\/[^/]+\/)\b/g, '<span class="ai-phonetic">$1</span>')
  }

  for (const rawLine of lines) {
    const line = rawLine.trim()
    if (!line) {
      closeList()
      formattedLines.push('<div class="ai-spacer"></div>')
      continue
    }

    // 编号列表：1. / 2. / 1、/ 2、
    if (/^\d+[.、\)]\s/.test(line)) {
      if (!inList || listType !== 'ol') {
        closeList()
        formattedLines.push('<ol class="ai-ordered-list">')
        inList = true
        listType = 'ol'
      }
      formattedLines.push(`<li>${inlineFormat(line.replace(/^\d+[.、\)]\s*/, ''))}</li>`)
      continue
    }

    // 无序列表：- / * / •
    if (line.startsWith('- ') || line.startsWith('* ') || line.startsWith('• ')) {
      if (!inList || listType !== 'ul') {
        closeList()
        formattedLines.push('<ul class="ai-unordered-list">')
        inList = true
        listType = 'ul'
      }
      formattedLines.push(`<li>${inlineFormat(line.replace(/^[-*•]\s*/, ''))}</li>`)
      continue
    }

    // 普通段落
    closeList()
    formattedLines.push(`<div class="ai-paragraph">${inlineFormat(line)}</div>`)
  }

  closeList()
  return formattedLines.join('')
}

const emit = defineEmits<{
  (e: 'close'): void
}>()

const aiStore = useAiStore()

const inputText = ref('')
const msgContainer = ref<HTMLDivElement>()

const contextLabel = computed(() => {
  if (aiStore.contextType === 'vocab') return t('ai.contextVocab')
  if (aiStore.contextType === 'grammar') return t('ai.contextGrammar')
  return t('ai.contextGeneral')
})

const inputPlaceholder = computed(() => {
  if (aiStore.isLoading) return t('ai.inputLoading')
  if (aiStore.contextType === 'vocab') return t('ai.inputVocab')
  if (aiStore.contextType === 'grammar') return t('ai.inputGrammar')
  return t('ai.inputGeneral')
})

function handleSend() {
  const text = inputText.value.trim()
  if (!text || aiStore.isLoading) return
  inputText.value = ''
  aiStore.sendMessage(text)
}

function sendQuickAction(type: 'vocab' | 'grammar') {
  if (type === 'vocab') {
    if (aiStore.questionContent) {
      aiStore.sendMessage(t('ai.askVocab', { content: aiStore.questionContent }))
    } else {
      aiStore.sendMessage(t('ai.fallbackVocab'))
    }
  } else {
    if (aiStore.questionContent) {
      aiStore.sendMessage(t('ai.askGrammar', { content: aiStore.questionContent }))
    } else {
      aiStore.sendMessage(t('ai.fallbackGrammar'))
    }
  }
}

async function copyMessage(text: string) {
  if (!text) return
  try {
    await navigator.clipboard.writeText(text)
    toast(t('ai.copied'), 'success')
  } catch {
    // 非安全上下文回退：临时 textarea + execCommand
    const ta = document.createElement('textarea')
    ta.value = text
    ta.style.position = 'fixed'
    ta.style.opacity = '0'
    document.body.appendChild(ta)
    ta.select()
    try { document.execCommand('copy') } catch { /* 忽略回退失败 */ }
    document.body.removeChild(ta)
    toast(t('ai.copied'), 'success')
  }
}

// 新消息自动滚动到底部
watch(
  () => aiStore.messages.length,
  () => {
    nextTick(() => {
      if (msgContainer.value) {
        msgContainer.value.scrollTop = msgContainer.value.scrollHeight
      }
    })
  },
)

// 流式更新时也滚动
watch(
  () => {
    const msgs = aiStore.messages
    return msgs.length > 0 ? msgs[msgs.length - 1].content : ''
  },
  () => {
    nextTick(() => {
      if (msgContainer.value) {
        const el = msgContainer.value
        const atBottom = el.scrollHeight - el.scrollTop - el.clientHeight < 60
        if (atBottom) el.scrollTop = el.scrollHeight
      }
    })
  },
)
</script>

<style scoped>
input {
  min-height: 24px;
}

/* 深度渲染内容字号对齐 body-md/label 令牌（AI 富文本无法套用 Tailwind 类） */
:deep(.ai-section-gap) {
  height: 16px;
}

:deep(.ai-title) {
  font-size: 15px;
  font-weight: 600;
  color: rgb(var(--color-primary));
  margin: 0 0 12px 0;
  padding-left: 10px;
  border-left: 4px solid rgb(var(--color-primary));
  line-height: 1.4;
}

:deep(.ai-subtitle) {
  font-size: 14px;
  font-weight: 600;
  color: rgb(var(--color-on-surface-variant));
  margin: 12px 0 8px 0;
  line-height: 1.4;
}

:deep(.ai-spacer) {
  height: 6px;
}

:deep(.ai-phonetic) {
  color: rgb(var(--color-primary));
  font-style: italic;
  font-family: 'Noto Serif SC', serif;
}

:deep(.ai-paragraph) {
  font-size: 13px;
  color: rgb(var(--color-on-surface));
  line-height: 1.8;
  margin: 0 0 10px 0;
  padding-left: 10px;
}

:deep(.ai-ordered-list) {
  margin: 0 0 12px 28px;
  padding: 0;
}

:deep(.ai-ordered-list li) {
  font-size: 13px;
  color: rgb(var(--color-on-surface));
  line-height: 1.8;
  margin: 6px 0;
  padding-left: 10px;
}

:deep(.ai-unordered-list) {
  margin: 0 0 12px 24px;
  padding: 0;
  list-style: none;
}

:deep(.ai-unordered-list li) {
  font-size: 13px;
  color: rgb(var(--color-on-surface));
  line-height: 1.8;
  margin: 6px 0;
  padding-left: 18px;
  position: relative;
}

:deep(.ai-unordered-list li::before) {
  content: '•';
  position: absolute;
  left: 4px;
  color: rgb(var(--color-primary));
  font-weight: bold;
}

:deep(.ai-code) {
  background-color: rgb(var(--color-surface-container-high));
  padding: 2px 6px;
  border-radius: 4px;
  font-family: 'Consolas', monospace;
  font-size: 12px;
  color: rgb(var(--color-error));
}

:deep(strong) {
  font-weight: 600;
  color: rgb(var(--color-on-surface));
  margin-right: 6px;
}

:deep(em) {
  font-style: italic;
  color: rgb(var(--color-on-surface-variant));
}
</style>
