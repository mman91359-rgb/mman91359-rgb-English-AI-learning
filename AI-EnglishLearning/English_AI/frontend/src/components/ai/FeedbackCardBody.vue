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

    <!-- 就绪态：对话流只放总分与维度，完整批改走跳转 -->
    <template v-else>
      <WritingFeedback v-if="report" :score="report" compact />

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
import { fetchSubmission } from '../../api/writing'
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

const loading = ref(true)
const error = ref('')
const report = ref<WritingScore | null>(null)

/** 只有写作有现成的深度报告页；翻译/听力接口就绪后再补各自的落点 */
const fullPath = computed(() =>
  props.kind === 'writing' ? `/writing/report?submission=${props.recordId}` : '',
)

async function load() {
  loading.value = true
  error.value = ''
  try {
    if (props.kind !== 'writing') {
      error.value = t('ai.card.loadFailed')
      return
    }
    const submission = await fetchSubmission(props.recordId)
    if (!submission) {
      error.value = t('ai.card.recordNotFound')
      return
    }
    report.value = submission.report
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
