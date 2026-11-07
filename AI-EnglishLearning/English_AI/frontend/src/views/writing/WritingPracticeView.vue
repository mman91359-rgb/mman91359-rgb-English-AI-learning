<template>
  <AppLayout flush hide-top-bar>
    <template #topbar>
      <header class="sticky top-0 z-40 mx-auto flex h-20 w-full max-w-[1192px] items-center justify-between px-gutter">
        <div class="flex flex-1 items-center gap-4">
          <button
            type="button"
            class="rounded-full p-2 text-on-surface-variant transition-all hover:bg-surface-container-high/50"
            :aria-label="$t('writing.practice.backToLearning')"
            @click="router.push({ path: '/learning', query: { tab: 'writing' } })"
          >
            <span class="material-symbols-outlined">arrow_back_ios_new</span>
          </button>
          <QuizProgressBar :answered="submittedCount" :total="topicCount || 1" />
          <span class="inline-flex rounded-full bg-warning-container px-3 py-1 font-label-md text-label-md text-on-warning-container">
            {{ $t('writing.preview.badge') }}
          </span>
        </div>
        <div class="flex items-center gap-2">
          <button
            type="button"
            class="flex h-9 items-center gap-1 rounded-full px-2 font-label-md text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high/50"
            :aria-label="$t('topbar.currentLanguage')"
            @click="toggleLocale"
          >
            <span class="material-symbols-outlined">translate</span>
            {{ appStore.language === 'zh-CN' ? 'EN' : '中文' }}
          </button>
          <button
            type="button"
            class="rounded-full p-2 text-on-surface-variant transition-all hover:bg-surface-container-high/50"
            :aria-label="$t('topbar.notifications')"
            @click="toast($t('common.comingSoon'), 'info')"
          >
            <span class="material-symbols-outlined">notifications</span>
          </button>
          <button
            type="button"
            class="rounded-full p-2 text-on-surface-variant transition-all hover:bg-surface-container-high/50"
            :aria-label="appStore.isDark ? $t('topbar.switchToLight') : $t('topbar.switchToDark')"
            @click="appStore.toggleTheme"
          >
            <span class="material-symbols-outlined">{{ appStore.isDark ? 'light_mode' : 'dark_mode' }}</span>
          </button>
          <div class="flex h-8 w-8 items-center justify-center overflow-hidden rounded-full bg-surface-variant font-label-md text-label-md text-on-surface-variant">
            {{ avatarText }}
          </div>
        </div>
      </header>
    </template>

    <LoadingState v-if="loading" :message="$t('writing.practice.loading')" />
    <ErrorState
      v-else-if="error"
      :message="error"
      :action-label="$t('writing.common.retry')"
      @retry="load"
    />
    <EmptyState
      v-else-if="!topic"
      icon="edit_note"
      :title="$t('writing.practice.notFound')"
      :action-label="$t('writing.practice.backToLearning')"
      @action="router.push({ path: '/learning', query: { tab: 'writing' } })"
    />
    <div
      v-else
      class="mx-auto flex w-full max-w-[1192px] flex-1 flex-col justify-center gap-gutter px-gutter py-6 pb-24 md:pb-8 lg:grid lg:grid-cols-[minmax(0,1fr)_340px] xl:grid-cols-[minmax(0,1fr)_360px] 2xl:grid-cols-[minmax(0,768px)_400px]"
    >
      <WritingAnswerSheet
        v-model:content="content"
        :topic="topic"
        :word-count="wordCount"
        :formatted="formatted"
        :danger="danger"
        :disabled="disabled"
        :hints-open="hintsOpen"
        :save-status-text="saveStatusText"
        @save-draft="saveNow"
        @toggle-hints="hintsOpen = !hintsOpen"
        @submit="confirmOpen = true"
      />
      <WritingScorePanel
        :phase="phase"
        :score="score"
        :scoring-step="scoringStep"
        @retry="submit"
        @view-report="viewReport"
      />
    </div>

    <BaseDialog
      :visible="draftDialog"
      :title="$t('writing.practice.draftRestoreTitle')"
      max-width="max-w-md"
      :close-on-backdrop="false"
      :close-on-esc="false"
      @update:visible="onDraftDialogVisible"
    >
      <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('writing.practice.draftRestoreDesc') }}</p>
      <template #footer>
        <button type="button" class="rounded-full border border-outline-variant px-5 py-2.5 font-label-lg text-label-lg text-on-surface-variant" @click="discardDraft">
          {{ $t('writing.practice.discard') }}
        </button>
        <button type="button" class="rounded-full bg-primary px-5 py-2.5 font-label-lg text-label-lg text-on-primary" @click="restoreDraft">
          {{ $t('writing.practice.restore') }}
        </button>
      </template>
    </BaseDialog>

    <ConfirmDialog
      :open="confirmOpen"
      :title="$t('writing.practice.submitConfirmTitle')"
      :impact="$t('writing.practice.submitConfirm')"
      :confirm-label="$t('writing.practice.confirmSubmit')"
      :loading="phase === 'scoring'"
      @cancel="confirmOpen = false"
      @confirm="submit"
    />
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, onBeforeUnmount, onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../../components/AppLayout.vue'
import QuizProgressBar from '../../components/quiz/QuizProgressBar.vue'
import BaseDialog from '../../components/ui/BaseDialog.vue'
import ConfirmDialog from '../../components/admin/ConfirmDialog.vue'
import EmptyState from '../../components/ui/EmptyState.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import LoadingState from '../../components/ui/LoadingState.vue'
import WritingAnswerSheet from '../../components/writing/WritingAnswerSheet.vue'
import WritingScorePanel from '../../components/writing/WritingScorePanel.vue'
import { useCountdown } from '../../composables/useCountdown'
import { useToast } from '../../composables/useToast'
import { useWritingDraft } from '../../composables/useWritingDraft'
import {
  clearDraft,
  countWords,
  fetchDraft,
  fetchSubmissions,
  fetchWritingTopics,
  submitWritingEssay,
} from '../../api/writing'
import type { WritingDraft, WritingLevel, WritingScore, WritingTopic, WritingTopicType } from '../../types/writing'
import { useAppStore } from '../../stores/app'
import { useUserStore } from '../../stores/user'

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()
const appStore = useAppStore()
const userStore = useUserStore()

const loading = ref(true)
const error = ref('')
const topic = ref<WritingTopic | null>(null)
const content = ref('')
const hintsOpen = ref(false)
const draftDialog = ref(false)
const confirmOpen = ref(false)
const draftCandidate = ref<WritingDraft | null>(null)
const phase = ref<'idle' | 'scoring' | 'scored' | 'failed'>('idle')
const score = ref<WritingScore | null>(null)
const scoringStep = ref(0)
const topicCount = ref(0)
const submittedCount = ref(0)
const timeUp = ref(false)
const latestSubmissionId = ref('')

let scoringTimer: ReturnType<typeof setInterval> | null = null
let autoSubmitTimer: ReturnType<typeof setTimeout> | null = null

const { formatted, danger, reset, stop } = useCountdown(1800, handleTimeUp, false)

const remainingSeconds = computed(() => {
  const [minutes, seconds] = formatted.value.split(':').map(Number)
  return minutes * 60 + seconds
})

const wordCount = computed(() => countWords(content.value))
const disabled = computed(() => phase.value === 'scoring' || timeUp.value)
const avatarText = computed(() => (userStore.username || 'U').slice(0, 1).toUpperCase())
const toggleLocale = () => {
  appStore.setLanguage(appStore.language === 'zh-CN' ? 'en-US' : 'zh-CN')
}

const {
  status: draftStatus,
  savedAt: draftSavedAt,
  saveNow,
  markSaved,
  stopAutoSave,
} = useWritingDraft(
  () => topic.value?.id ?? '',
  content,
  // 已写作秒数随草稿持久化，恢复后继续按剩余时间倒计时
  () => (topic.value ? Math.max(0, topic.value.timeLimitSeconds - remainingSeconds.value) : 0),
)

const saveStatusText = computed(() => {
  if (draftStatus.value === 'saving') return t('writing.practice.saving')
  if (draftStatus.value === 'error') return t('writing.practice.saveFailed')
  if (draftStatus.value === 'saved' && draftSavedAt.value) {
    const time = new Date(draftSavedAt.value).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' })
    return t('writing.practice.saved', { time })
  }
  return ''
})

const readQuery = () => ({
  topicId: typeof route.query.topic === 'string' ? route.query.topic : '',
  type: typeof route.query.type === 'string' ? (route.query.type as WritingTopicType) : '',
  level: typeof route.query.level === 'string' ? (route.query.level as WritingLevel) : '',
})

const resolveTopic = (topics: WritingTopic[]) => {
  const { topicId, type, level } = readQuery()
  if (topicId) return topics.find((item) => item.id === topicId)
  return topics.find((item) => item.type === type && item.level === level)
    ?? topics.find((item) => item.type === type)
    ?? topics.find((item) => item.level === level)
    ?? topics[0]
}

const startCountdown = (elapsedSeconds = 0) => {
  if (!topic.value) return
  const total = topic.value.timeLimitSeconds
  const remain = Math.max(0, total - Math.floor(elapsedSeconds))
  if (remain <= 0) {
    // 草稿已写满时限：直接按到时处理（会自动提交已有内容）
    reset(0)
    handleTimeUp()
    return
  }
  reset(remain)
}

const load = async () => {
  loading.value = true
  error.value = ''
  try {
    const [topics, submissions] = await Promise.all([fetchWritingTopics(), fetchSubmissions()])
    topicCount.value = topics.length
    submittedCount.value = submissions.length
    const resolved = resolveTopic(topics)
    if (!resolved) {
      topic.value = null
      return
    }
    topic.value = resolved
    const existing = await fetchDraft(resolved.id)
    if (existing && existing.content.trim()) {
      draftCandidate.value = existing
      draftDialog.value = true
    } else {
      startCountdown()
    }
  } catch (e) {
    error.value = e instanceof Error ? e.message : t('writing.common.error')
  } finally {
    loading.value = false
  }
}

const restoreDraft = () => {
  const elapsed = draftCandidate.value?.elapsedSeconds ?? 0
  if (draftCandidate.value) {
    content.value = draftCandidate.value.content
    markSaved(draftCandidate.value.content, draftCandidate.value.updatedAt)
  }
  draftDialog.value = false
  // 按剩余时间续计，而不是重置为满时长
  startCountdown(elapsed)
}

const discardDraft = () => {
  if (topic.value) clearDraft(topic.value.id)
  content.value = ''
  draftDialog.value = false
  startCountdown()
}

/** 点击弹窗右上角关闭时按“恢复草稿”处理，避免误丢内容 */
const onDraftDialogVisible = (visible: boolean) => {
  if (visible) {
    draftDialog.value = true
    return
  }
  restoreDraft()
}

function handleTimeUp() {
  if (timeUp.value) return
  timeUp.value = true
  toast(t('writing.practice.timeUp'), 'warning')
  autoSubmitTimer = setTimeout(() => {
    if (wordCount.value > 0 && phase.value === 'idle') {
      confirmOpen.value = false
      void submit(true)
    }
  }, 1500)
}

const submit = async (auto = false) => {
  if (!topic.value || phase.value === 'scoring') return
  confirmOpen.value = false
  phase.value = 'scoring'
  scoringStep.value = 0
  scoringTimer = setInterval(() => {
    scoringStep.value = Math.min(3, scoringStep.value + 1)
  }, 1200)
  try {
    // 预览模式没有真实评分耗时，至少展示一个完整的四步进度
    const [submission] = await Promise.all([
      submitWritingEssay({
        topicId: topic.value.id,
        content: content.value,
        durationSeconds: Math.max(0, topic.value.timeLimitSeconds - remainingSeconds.value),
      }),
      new Promise((resolve) => setTimeout(resolve, 4800)),
    ])
    score.value = submission.report
    latestSubmissionId.value = submission.id
    phase.value = 'scored'
    stopAutoSave()
    stop()
    toast(auto ? t('writing.practice.autoSubmitted') : t('writing.practice.scoredToast'), 'success')
    void router.push({ path: '/writing/report', query: { submission: submission.id } })
  } catch {
    phase.value = 'failed'
  } finally {
    if (scoringTimer) {
      clearInterval(scoringTimer)
      scoringTimer = null
    }
  }
}

const viewReport = () => {
  if (latestSubmissionId.value) {
    void router.push({ path: '/writing/report', query: { submission: latestSubmissionId.value } })
  } else {
    void router.push('/writing/history')
  }
}

onBeforeUnmount(() => {
  if (scoringTimer) clearInterval(scoringTimer)
  if (autoSubmitTimer) clearTimeout(autoSubmitTimer)
})

onMounted(load)
</script>
