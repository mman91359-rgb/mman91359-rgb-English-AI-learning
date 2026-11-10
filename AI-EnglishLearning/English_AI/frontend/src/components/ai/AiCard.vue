<template>
  <!--
    折叠态：88px 扁条。整条 header 是一个 button，全区域可点。
    摘要行只在此态渲染——展开后内容已全可见，摘要属冗余。
  -->
  <button
    v-if="!expanded"
    type="button"
    class="flex w-full flex-col items-start rounded-2xl border border-outline-variant/60 bg-surface-container-lowest p-4 text-left transition-colors hover:bg-surface-container-low dark:bg-surface"
    :aria-expanded="false"
    @click="emit('toggle')"
  >
    <span class="flex h-7 w-full items-center gap-2.5">
      <span class="flex h-7 w-7 shrink-0 items-center justify-center rounded-[10px] bg-surface-container-high text-on-surface-variant">
        <span class="material-symbols-outlined text-icon-md">{{ resolvedIcon }}</span>
      </span>
      <span class="min-w-0 flex-1 truncate font-headline-sm text-headline-sm text-on-surface">{{ resolvedTitle }}</span>
      <span class="material-symbols-outlined shrink-0 text-icon-sm text-on-surface-variant" aria-hidden="true">expand_more</span>
    </span>
    <span class="mt-2 w-full truncate font-body-sm text-body-sm text-on-surface-variant">{{ resolvedSummary }}</span>
  </button>

  <!--
    展开态：完整内容或截断预览。
    ready 之前用 invisible 占位，避免"先渲染全部再裁掉"的可见跳变。
  -->
  <div
    v-else
    class="rounded-2xl bg-surface-container-lowest p-4 shadow-[0_4px_20px_rgba(51,58,72,0.05),inset_0_0_0_1px_rgb(var(--outline-variant)/0.6)] dark:bg-surface"
  >
    <button
      type="button"
      class="flex w-full items-center gap-2.5 text-left"
      :aria-expanded="true"
      :aria-controls="bodyId"
      @click="emit('toggle')"
    >
      <span class="flex h-7 w-7 shrink-0 items-center justify-center rounded-[10px] bg-surface-container-high text-on-surface-variant">
        <span class="material-symbols-outlined text-icon-md">{{ resolvedIcon }}</span>
      </span>
      <span class="min-w-0 flex-1 truncate font-headline-sm text-headline-sm text-on-surface">{{ resolvedTitle }}</span>
      <span class="material-symbols-outlined shrink-0 text-icon-sm text-on-surface-variant" aria-hidden="true">expand_less</span>
    </button>

    <div
      :id="bodyId"
      ref="bodyEl"
      class="ai-card-body mt-4 flex flex-col gap-4"
      :class="ready ? '' : 'invisible'"
    >
      <!--
        默认插槽保留原有的 sections 渲染；结构化结果（meta 卡）由调用方塞自己的内容，
        所以那段内容的长度由调用方负责，不参与下面的逐节截断。
      -->
      <slot>
        <section
          v-for="(section, i) in shownSections"
          :key="i"
          :data-section="i"
          class="flex flex-col gap-2"
        >
          <h4 v-if="section.title" class="flex items-center gap-2 font-label-md text-label-md text-on-surface-variant">
            <span class="h-0.5 w-4 shrink-0 rounded-full bg-primary/40" aria-hidden="true"></span>
            <span class="truncate">{{ section.title }}</span>
          </h4>
          <!-- 标题由上方 h4 承担，正文只渲染内容，避免与 .ai-title 样式重复 -->
          <div class="ai-body" v-html="renderSection({ title: '', body: section.body })"></div>
        </section>
      </slot>
    </div>

    <!-- 截断时给出唯一出口；未截断则不渲染按钮，避免死按钮 -->
    <div v-if="isClipped" class="relative mt-2">
      <div class="pointer-events-none absolute -top-12 left-0 right-0 h-12 bg-gradient-to-b from-transparent to-surface-container-lowest dark:to-surface"></div>
      <button
        type="button"
        class="mt-2 flex h-10 w-full items-center justify-center rounded-xl bg-primary/10 font-label-lg text-label-lg text-primary transition-colors hover:bg-primary/15"
        @click="showAll = !showAll"
      >
        {{ showAll ? t('ai.card.collapseFull') : t('ai.card.expandAll', { n: sections.length }) }}
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, nextTick, ref, useId, watch } from 'vue'
import { useI18n } from 'vue-i18n'
import { renderSection, type AiCardType, type AiSection } from '@/utils/aiContent'

const props = defineProps<{
  /** 纯文本分节卡用；结构化结果卡传空数组，内容走默认插槽 */
  sections: AiSection[]
  cardType: AiCardType
  /** 是否展开；由 store 的 expandedCardId 统一控制，保证同时只展开一张 */
  expanded: boolean
  /** 消息区可用高度，已 clamp 到视口 */
  availHeight: number
  /** 覆盖头部标题（结构化结果卡用，无 sections 可推导） */
  headTitle?: string
  /** 覆盖折叠态摘要 */
  summary?: string
  /** 覆盖头部图标 */
  icon?: string
}>()

const emit = defineEmits<{ (e: 'toggle'): void }>()

const { t } = useI18n()
const bodyId = useId()
const bodyEl = ref<HTMLElement>()
const ready = ref(false)
const showAll = ref(false)
const visibleCount = ref(props.sections.length)

const ICON_MAP: Record<AiCardType, string> = {
  vocab: 'menu_book',
  grammar: 'schema',
  review: 'rate_review',
}

const resolvedIcon = computed(() => props.icon || ICON_MAP[props.cardType])

const resolvedTitle = computed(() => {
  if (props.headTitle) return props.headTitle
  const typeLabel = t(`ai.card.type${props.cardType.charAt(0).toUpperCase()}${props.cardType.slice(1)}`)
  // 首个有标题的区块可作为实体名（词汇卡的词头、语法卡的语法点）
  const anchor = props.sections.find((s) => s.title)?.title
  return anchor ? `${typeLabel} · ${anchor}` : typeLabel
})

/** 折叠态摘要：外部覆盖 → 锚点标题 → 首节正文首行 → 节数兜底，保证永不为空 */
const resolvedSummary = computed(() => {
  if (props.summary) return props.summary
  const anchor = props.sections.find((s) => s.title)?.title
  if (anchor) return anchor
  const firstBody = props.sections[0]?.body?.split('\n').find((l) => l.trim())
  if (firstBody) return firstBody.replace(/\*\*/g, '').slice(0, 40)
  return t('ai.card.sections', { n: props.sections.length })
})

const shownSections = computed(() =>
  showAll.value ? props.sections : props.sections.slice(0, visibleCount.value),
)

/** 内容确实被裁掉时才显示按钮 */
const isClipped = computed(() => !showAll.value && visibleCount.value < props.sections.length)

/**
 * 测量与定态。
 * 顺序：完整渲染（invisible）→ 同帧读高 → 定 visibleCount → 显形。
 * 反过来会先让用户看到全部内容再收缩。
 */
async function measure() {
  if (!props.expanded) {
    ready.value = false
    return
  }
  await nextTick()
  const el = bodyEl.value
  if (!el) return

  // 插槽内容（结构化结果卡）自己控制密度，不参与逐节截断，直接显形
  if (props.sections.length === 0) {
    visibleCount.value = 0
    ready.value = true
    return
  }

  const full = el.scrollHeight
  const avail = Math.max(320, props.availHeight)

  if (full <= avail * 0.85) {
    visibleCount.value = props.sections.length
  } else if (props.sections.length <= 3 && full <= avail * 2) {
    visibleCount.value = props.sections.length
  } else {
    // 逐节测量：尾部还有按钮与间距，预算里必须先扣掉
    const nodes = Array.from(el.querySelectorAll<HTMLElement>('[data-section]'))
    const chrome = 128
    const budget = avail * 0.85 - chrome
    let sum = 0
    let n = 0
    for (const node of nodes) {
      const h = node.offsetHeight
      if (sum + h <= budget) {
        sum += h
        n += 1
      } else break
    }
    visibleCount.value = Math.max(1, Math.min(3, n))
  }
  ready.value = true
}

watch(
  () => props.expanded,
  (open) => {
    if (open) {
      showAll.value = false
      void measure()
    } else {
      ready.value = false
    }
  },
  { immediate: true },
)

// 容器尺寸变化后重新定态（不做高度动画，避免重排抖动）
watch(
  () => props.availHeight,
  () => {
    if (props.expanded && !showAll.value) void measure()
  },
)
</script>

<style scoped>
/* 卡片内富文本沿用与消息流一致的排版令牌 */
.ai-body :deep(.ai-paragraph) {
  font-size: 13px;
  line-height: 1.8;
  color: rgb(var(--color-on-surface));
  margin: 0 0 6px 0;
}
.ai-body :deep(.ai-paragraph:last-child) {
  margin-bottom: 0;
}
.ai-body :deep(.ai-spacer) {
  height: 4px;
}
.ai-body :deep(.ai-ordered-list),
.ai-body :deep(.ai-unordered-list) {
  margin: 0;
  padding-left: 1.15rem;
}
.ai-body :deep(.ai-ordered-list) {
  list-style: decimal;
}
.ai-body :deep(.ai-unordered-list) {
  list-style: disc;
}
.ai-body :deep(.ai-ordered-list li),
.ai-body :deep(.ai-unordered-list li) {
  font-size: 13px;
  line-height: 1.8;
  color: rgb(var(--color-on-surface));
  margin: 3px 0;
}
.ai-body :deep(strong) {
  font-weight: 600;
  color: rgb(var(--color-on-surface));
}
.ai-body :deep(em) {
  font-style: italic;
  color: rgb(var(--color-on-surface-variant));
}
.ai-body :deep(.ai-code) {
  background-color: rgb(var(--color-surface-container-high));
  padding: 1px 5px;
  border-radius: 4px;
  font-family: 'Consolas', monospace;
  font-size: 12px;
}
.ai-body :deep(.ai-phonetic) {
  color: rgb(var(--color-primary));
  font-style: italic;
}
</style>
