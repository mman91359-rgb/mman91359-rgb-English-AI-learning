<template>
  <div class="flex flex-col gap-3">
    <!-- 加载态：shimmer 骨架，与 AiFeedbackPanel 保持同一套占位语言 -->
    <div v-if="loading" class="flex flex-col gap-3 py-1" role="status" aria-busy="true">
      <span class="sr-only">{{ t('ai.panel.loading') }}</span>
      <div class="animate-shimmer h-16 w-full rounded-xl bg-gradient-to-r from-surface-container-low via-surface-container to-surface-container-low bg-[length:200%_100%] motion-reduce:animate-none" aria-hidden="true"></div>
      <div
        v-for="i in 4"
        :key="i"
        class="animate-shimmer h-3 rounded-full bg-gradient-to-r from-surface-container-low via-surface-container to-surface-container-low bg-[length:200%_100%] motion-reduce:animate-none"
        :class="i % 2 ? 'w-full' : 'w-2/3'"
        aria-hidden="true"
      ></div>
    </div>

    <!-- 失败态：给出重试，而不是留一块空白让用户猜 -->
    <div v-else-if="error" class="flex flex-col items-center gap-2 py-4 text-center">
      <span class="material-symbols-outlined text-icon-lg text-error" aria-hidden="true">error</span>
      <p class="font-body-sm text-body-sm text-on-surface-variant">{{ error }}</p>
      <button
        type="button"
        class="mt-1 rounded-full bg-primary px-4 py-1.5 font-label-md text-label-md text-on-primary"
        @click="load"
      >
        {{ t('ai.card.retry') }}
      </button>
    </div>

    <!-- 就绪态：对话流只放速览，完整内容走跳转 -->
    <template v-else>
      <!-- 写作：总分 + 五维，其余留在报告页 -->
      <WritingFeedback v-if="kind === 'writing' && report" :score="report" compact />

      <!-- 翻译：原文/译文的逐词对照 + 题目解析 -->
      <TranslationFeedback
        v-else-if="kind === 'translation' && translationData"
        :data="translationData"
        @lookup="onLookup"
      />

      <p
        v-else-if="kind === 'listening'"
        class="py-2 text-center font-body-sm text-body-sm text-on-surface-variant"
      >
        {{ t('ai.card.listeningPending') }}
      </p>

      <button
        v-if="fullPath"
        type="button"
        class="flex h-10 w-full items-center justify-center gap-1.5 rounded-xl bg-primary/10 font-label-lg text-label-lg text-primary transition-colors hover:bg-primary/15"
        @click="openFull"
      >
        <span class="material-symbols-outlined text-icon-sm" aria-hidden="true">open_in_new</span>
        <span>{{ t('ai.card.openFullReport') }}</span>
      </button>
    </template>
  </div>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import WritingFeedback from './templates/WritingFeedback.vue'
import TranslationFeedback from './templates/TranslationFeedback.vue'
import { fetchSubmission } from '../../api/writing'
import { fetchExerciseLogDetail, type ExerciseHistoryVO } from '../../api/exercise'
import { useToast } from '../../composables/useToast'
import { useUserStore } from '../../stores/user'
import type { WritingScore } from '../../types/writing'
import type { FeedbackKind } from '../../stores/ai'

/**
 * 结构化结果卡的正文。
 * 按 kind 分支：各自解析自己的接口，不把三种异构结构塞进同一个 props。
 * 只在 AiCard 展开时挂载，因此天然是「展开才请求」，不做预取。
 */
const props = defineProps<{
  kind: FeedbackKind
  recordId: string
}>()

const router = useRouter()
const { t } = useI18n()
const userStore = useUserStore()
const { show: toast } = useToast()

const loading = ref(true)
const error = ref('')
const report = ref<WritingScore | null>(null)
const logDetail = ref<ExerciseHistoryVO | null>(null)

/** 只有写作有现成的深度报告页；翻译/听力的完整内容已经在卡片里，不再重复跳转 */
const fullPath = computed(() =>
  props.kind === 'writing' ? `/writing/report?submission=${props.recordId}` : '',
)

/**
 * 答题记录 → 翻译模板的契约映射。
 * referenceAnswer 取题库标准译文，userAnswer 取本次作答；
 * aiReason 用题库自带的 analysis 顶替——判分当时的启发式提示不落库，
 * 文案上按「题目解析」呈现，不谎称是 AI 当时的判分理由。
 */
const translationData = computed(() => {
  const d = logDetail.value
  if (!d) return null
  return {
    referenceAnswer: d.correctAnswer ?? '',
    userAnswer: d.userAnswer ?? '',
    aiReason: d.analysis ?? '',
  }
})

function onLookup(word: string) {
  // 对话流里没有查词侧栏宿主，先给一句明确提示，避免点了毫无反应
  toast(t('translation.wordLookupPending', { word }))
}

async function load() {
  loading.value = true
  error.value = ''
  try {
    if (props.kind === 'writing') {
      const submission = await fetchSubmission(props.recordId)
      if (!submission) {
        error.value = t('ai.card.recordNotFound')
        return
      }
      report.value = submission.report
      return
    }

    if (props.kind === 'translation') {
      const userId = userStore.userId
      if (!userId) {
        error.value = t('ai.card.recordNotFound')
        return
      }
      const detail = await fetchExerciseLogDetail(Number(props.recordId), userId)
      if (!detail) {
        error.value = t('ai.card.recordNotFound')
        return
      }
      logDetail.value = detail
      return
    }

    // 听力：反查接口暂不返回 transcript（原文在 listening_audio 表）。
    // 这里只结束加载态，由模板显示 listeningPending 文案；
    // 不要置 error，否则会走到失败态，那条提示永远显示不出来。
    return
  } catch (e) {
    error.value = e instanceof Error ? e.message : t('ai.card.loadFailed')
  } finally {
    loading.value = false
  }
}

function openFull() {
  if (fullPath.value) void router.push(fullPath.value)
}

onMounted(load)
</script>
