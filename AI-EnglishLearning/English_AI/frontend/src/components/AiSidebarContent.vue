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
          v-for="{ msg, card } in rendered"
          :key="msg.id"
          class="flex"
          :class="msg.role === 'user' ? 'justify-end' : 'justify-start'"
        >
          <!-- 用户消息：保持气泡与 85% 宽度，发言语义靠颜色与右对齐承载 -->
          <div
            v-if="msg.role === 'user'"
            class="max-w-[85%] rounded-2xl rounded-br-md bg-primary px-4 py-3 text-on-primary"
          >
            <div class="select-text whitespace-pre-wrap break-words font-body-sm text-body-sm leading-relaxed">{{ msg.content }}</div>
          </div>

          <!-- AI 消息：满宽。流式态与卡片态共用同一列宽，完成瞬间不会出现横向跳变 -->
          <div v-else class="group w-full">
            <!--
              流式气泡 → 结构化卡片 是一次"换帧"：两者高度差可达数百像素。
              out-in 让旧元素先退出（120ms）再让卡片进入（200ms），
              避免两帧叠加时消息流同时容纳两份高度造成的夹挤。
            -->
            <Transition name="ai-swap" mode="out-in">
              <AiCard
                v-if="card"
                key="card"
                :sections="card.sections"
                :card-type="card.type"
                :expanded="aiStore.expandedCardId === msg.id"
                :avail-height="availHeight"
                @toggle="aiStore.toggleCard(msg.id)"
              />

              <div
                v-else
                key="bubble"
                class="select-text rounded-2xl rounded-bl-md border border-outline-variant/10 bg-surface-container-lowest px-4 py-3 text-on-surface shadow-sm dark:bg-surface"
              >
                <!-- AI 内容：formatAiContent 先转义再做白名单格式化，禁止注入 -->
                <div class="break-words font-body-sm text-body-sm leading-relaxed" v-html="formatAiContent(msg.content)"></div>
                <div
                  v-if="msg.isStreaming"
                  class="mt-2 flex items-center gap-1.5 font-body-xs text-body-xs text-on-surface-variant"
                >
                  <span class="material-symbols-outlined animate-spin text-icon-sm" aria-hidden="true">progress_activity</span>
                  <span>{{ t('ai.card.generating') }}</span>
                </div>
              </div>
            </Transition>

            <!-- 复制按钮：槽位高度常驻（h-8），只切透明度。显隐若同时改高度会让消息流再重排一次 -->
            <div v-if="msg.content && !msg.isStreaming" class="mt-2 flex h-8 items-center justify-end">
              <button
                type="button"
                class="flex h-8 items-center gap-1 rounded-md px-2 font-label-md text-label-md text-on-surface-variant opacity-0 transition-opacity hover:bg-surface-container-high hover:text-primary focus-visible:opacity-100 group-hover:opacity-100"
                :title="$t('ai.copy')"
                :aria-label="$t('ai.copy')"
                @click="copyMessage(msg.content)"
              >
                <span class="material-symbols-outlined text-icon-sm" aria-hidden="true">content_copy</span>
                <span>{{ $t('ai.copy') }}</span>
              </button>
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
import { computed, nextTick, onBeforeUnmount, onMounted, ref, watch } from 'vue'
import { useI18n } from 'vue-i18n'
import { useAiStore, type ChatMessage } from '@/stores/ai'
import { useToast } from '@/composables/useToast'
import { btnIconSm } from '@/components/ui/buttonStyles'
import AiCard from '@/components/ai/AiCard.vue'
import { formatAiContent, splitSections, type AiCardType, type AiSection } from '@/utils/aiContent'

const { t } = useI18n()
const { show: toast } = useToast()

const emit = defineEmits<{
  (e: 'close'): void
}>()

const aiStore = useAiStore()

const inputText = ref('')
const msgContainer = ref<HTMLDivElement>()

/**
 * 卡片门槛：结构化回答（≥2 节且 ≥200 字符）才建卡，
 * 避免把"你好""这个我不确定"这类散文硬塞进卡框。
 */
function cardOf(msg: ChatMessage): { sections: AiSection[]; type: AiCardType } | null {
  if (msg.role !== 'ai' || msg.isStreaming || !msg.content) return null
  const sections = splitSections(msg.content)
  if (sections.length < 2) return null
  const chars = sections.reduce((n, s) => n + s.title.length + s.body.length, 0)
  if (chars < 200) return null

  const text = sections.map((s) => `${s.title} ${s.body}`).join(' ')
  let type: AiCardType = 'vocab'
  if (/语法|成分|时态|从句|句式|主谓/.test(text)) type = 'grammar'
  else if (/评分|得分|批改|维度|总分/.test(text)) type = 'review'
  return { sections, type }
}

/** 消息与卡片的配对缓存，避免模板里反复 splitSections */
const rendered = computed(() =>
  aiStore.messages.map((msg) => ({ msg, card: cardOf(msg) })),
)

/**
 * 消息区可用高度。
 * 必须 clamp 到视口：侧栏父级只有 min-h-screen，列高会被内容撑大，
 * 直接用 clientHeight 会让截断永不触发，且用户要滚整页才看得到输入框。
 */
const availHeight = ref(600)

function computeAvailHeight() {
  const el = msgContainer.value
  if (!el) return
  const vh = window.visualViewport?.height ?? window.innerHeight
  // 侧栏头部约 72 + 输入区约 76 + 可能的「返回题目」条 44
  availHeight.value = Math.max(320, Math.min(el.clientHeight, vh - 72 - 76 - 44))
}

onMounted(() => {
  computeAvailHeight()
  window.addEventListener('resize', computeAvailHeight)
  window.visualViewport?.addEventListener('resize', computeAvailHeight)
})

onBeforeUnmount(() => {
  window.removeEventListener('resize', computeAvailHeight)
  window.visualViewport?.removeEventListener('resize', computeAvailHeight)
})

watch(
  () => aiStore.isOpen,
  (open) => {
    if (open) nextTick(computeAvailHeight)
  },
)

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

/* 流式气泡 ⇄ 结构化卡片 换帧：短退 + 稍长入，方向感来自轻微上移 */
.ai-swap-leave-active {
  transition: opacity 0.12s ease;
}
.ai-swap-leave-to {
  opacity: 0;
}
.ai-swap-enter-active {
  transition: opacity 0.2s ease, transform 0.2s ease;
}
.ai-swap-enter-from {
  opacity: 0;
  transform: translateY(4px);
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
