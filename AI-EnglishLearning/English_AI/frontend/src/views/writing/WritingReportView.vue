<template>
  <AppLayout flush hide-top-bar>
    <template #topbar>
      <div class="mx-auto flex h-20 w-full max-w-[1192px] items-center justify-between px-gutter">
        <button type="button" class="flex items-center gap-2 rounded-full px-3 py-2 font-label-lg text-label-lg text-on-surface-variant transition-colors hover:bg-surface-container-high/50" @click="router.push({ path: '/learning', query: { tab: 'writing' } })">
          <AppIcon name="arrow_back" size="md" />
          {{ $t('writing.practice.backToLearning') }}
        </button>
        <span class="rounded-full bg-warning-container px-3 py-1 font-label-md text-label-md text-on-warning-container">
          {{ $t('writing.preview.badge') }}
        </span>
      </div>
    </template>

    <LoadingState v-if="loading" :message="$t('writing.common.loading')" />
    <ErrorState v-else-if="error" :message="error" :action-label="$t('writing.common.retry')" @retry="load" />
    <EmptyState v-else-if="!submission" icon="description" :title="$t('writing.report.notFound')" :action-label="$t('writing.entry.history')" @action="router.push('/writing/history')" />
    <div v-else class="mx-auto flex w-full max-w-[1192px] flex-col gap-6 px-gutter py-8 pb-24 md:pb-8">
      <section class="flex flex-col gap-6 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow md:flex-row md:items-center md:justify-between">
        <div class="flex items-center gap-6">
          <div
            class="relative flex h-28 w-28 shrink-0 items-center justify-center rounded-full"
            :style="{ background: `conic-gradient(rgb(var(--color-primary)) ${ratio}%, rgb(var(--color-surface-container-high)) 0)` }"
            :aria-label="$t('writing.report.scoreOf', { score: score.rawScore, max: SCORE_MAX })"
          >
            <span class="flex h-[88px] w-[88px] flex-col items-center justify-center rounded-full bg-surface-container-lowest">
              <span class="font-headline-lg text-headline-lg tabular-nums text-on-surface">{{ score.rawScore }}</span>
              <span class="font-label-sm text-label-sm text-on-surface-variant">/ {{ SCORE_MAX }}</span>
            </span>
          </div>
          <div class="flex flex-col gap-1">
            <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.report.title') }}</span>
            <span class="font-headline-sm text-headline-sm text-on-surface">{{ $t(SCORE_LEVEL_LABEL_KEYS[score.level]) }}</span>
            <span class="font-body-sm text-body-sm text-primary">
              {{ $t('writing.report.weighted') }}：{{ $t('writing.score.weightedValue', { score: score.weightedScore }) }}
            </span>
          </div>
        </div>
        <div class="flex flex-wrap gap-3">
          <button type="button" :class="btnSecondarySm" @click="router.push('/writing/history')">
            <AppIcon name="history" size="sm" />
            {{ $t('writing.report.history') }}
          </button>
          <button type="button" :class="btnSecondarySm" @click="toggleFavorite">
            <AppIcon
              :name="isFavorite ? 'favorite' : 'favorite_border'"
              :filled="isFavorite"
              size="sm"
            />
            {{ isFavorite ? $t('writing.report.unfavorite') : $t('writing.report.favorite') }}
          </button>
          <button type="button" :class="btnSecondarySm" @click="askAi">
            <AppIcon name="forum" size="sm" />
            {{ $t('writing.report.askAi') }}
          </button>
          <button type="button" :class="btnPrimarySm" @click="rewrite">
            <AppIcon name="refresh" size="sm" />
            {{ $t('writing.report.again') }}
          </button>
        </div>
      </section>

      <div class="grid grid-cols-1 gap-6 lg:grid-cols-2">
        <section class="flex flex-col gap-4 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
          <h2 class="font-body-lg text-body-lg font-semibold text-on-surface">{{ $t('writing.report.dimensions') }}</h2>
          <WritingDimensionBar
            v-for="dimension in WRITING_DIMENSIONS"
            :key="dimension"
            :label="$t(DIMENSION_LABEL_KEYS[dimension])"
            :value="score.dimensions[dimension]"
            :max="DIMENSION_MAX"
          />
        </section>

        <section class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-1">
          <FeedbackList :title="$t('writing.report.strengths')" icon="thumb_up" :items="score.strengths" tone="success" />
          <FeedbackList :title="$t('writing.report.issues')" icon="priority_high" :items="score.issues" tone="warning" />
        </section>
      </div>

      <section class="flex flex-col gap-4">
        <h2 class="font-body-lg text-body-lg font-semibold text-on-surface">{{ $t('writing.report.corrections') }}</h2>
        <WritingCorrectionList :corrections="score.corrections" />
      </section>

      <section v-if="score.highlights.length" class="flex flex-col gap-4 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
        <h2 class="font-body-lg text-body-lg font-semibold text-on-surface">{{ $t('writing.report.highlights') }}</h2>
        <ul class="flex flex-col gap-2">
          <li v-for="sentence in score.highlights" :key="sentence" class="rounded-xl bg-primary-container/20 px-4 py-3 font-body-md text-body-md italic text-on-surface">
            {{ sentence }}
          </li>
        </ul>
      </section>

      <section class="flex flex-col gap-4 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
        <h2 class="font-body-lg text-body-lg font-semibold text-on-surface">{{ $t('writing.report.modelEssay') }}</h2>
        <p class="font-body-md text-body-md leading-relaxed text-on-surface">{{ score.modelEssay }}</p>
      </section>

      <section v-if="score.rewriteSuggestions.length" class="flex flex-col gap-4 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
        <h2 class="font-body-lg text-body-lg font-semibold text-on-surface">{{ $t('writing.report.rewriteSuggestions') }}</h2>
        <ul class="flex list-disc flex-col gap-1.5 pl-5 font-body-sm text-body-sm text-on-surface">
          <li v-for="item in score.rewriteSuggestions" :key="item">{{ item }}</li>
        </ul>
      </section>
    </div>
  </AppLayout>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import AppLayout from '../../components/AppLayout.vue'
import AppIcon from '../../components/ui/AppIcon.vue'
import EmptyState from '../../components/ui/EmptyState.vue'
import ErrorState from '../../components/ui/ErrorState.vue'
import LoadingState from '../../components/ui/LoadingState.vue'
import { btnPrimarySm, btnSecondarySm } from '../../components/ui/buttonStyles'
import WritingCorrectionList from '../../components/writing/WritingCorrectionList.vue'
import WritingDimensionBar from '../../components/writing/WritingDimensionBar.vue'
import { useToast } from '../../composables/useToast'
import { useAiStore } from '../../stores/ai'
import { fetchFavoriteIds, fetchSubmission, fetchSubmissions, fetchWritingTopics, setFavorite } from '../../api/writing'
import type { WritingScore, WritingSubmission, WritingTopic } from '../../types/writing'
import {
  DIMENSION_LABEL_KEYS,
  DIMENSION_MAX,
  SCORE_LEVEL_LABEL_KEYS,
  SCORE_MAX,
  WRITING_DIMENSIONS,
} from '../../utils/writing'
import FeedbackList from './components/FeedbackList.vue'

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()
const aiStore = useAiStore()

const loading = ref(true)
const error = ref('')
const submission = ref<WritingSubmission | null>(null)
const favoriteIds = ref<string[]>([])

const score = computed(() => submission.value!.report)
const ratio = computed(() => Math.round((score.value.rawScore / SCORE_MAX) * 100))
const isFavorite = computed(() => Boolean(submission.value && favoriteIds.value.includes(submission.value.topicId)))

const load = async () => {
  loading.value = true
  error.value = ''
  try {
    const id = typeof route.query.submission === 'string' ? route.query.submission : ''
    const [loadedSubmission, favorites] = await Promise.all([
      id ? fetchSubmission(id) : Promise.resolve(null),
      fetchFavoriteIds(),
    ])
    favoriteIds.value = favorites
    // 仅在未指定 id 时才回退到最近一条；显式 id 无效应显示 notFound
    if (loadedSubmission) {
      submission.value = loadedSubmission
    } else if (!id) {
      const submissions = await fetchSubmissions()
      submission.value = submissions[0] ?? null
    } else {
      submission.value = null
    }
  } catch (e) {
    error.value = e instanceof Error ? e.message : t('writing.common.error')
  } finally {
    loading.value = false
  }
}

const toggleFavorite = async () => {
  if (!submission.value) return
  const topicId = submission.value.topicId
  const next = !favoriteIds.value.includes(topicId)
  const previous = favoriteIds.value
  favoriteIds.value = next ? [...previous, topicId] : previous.filter((id) => id !== topicId)
  try {
    await setFavorite(topicId, next)
  } catch {
    favoriteIds.value = previous
    toast(t('writing.library.favoriteFailed'), 'error')
  }
}

const rewrite = () => {
  if (!submission.value) return
  void router.push({ path: '/writing/practice', query: { topic: submission.value.topicId } })
}

/**
 * 把题目整理成一段可读上下文。
 * 后端会把它包成「【当前题目】…」塞进 user message，所以这里不再加标题前缀。
 * 英文题面必须带上：用户追问「这句怎么改」时，模型需要知道原题要求才能判断切题与否。
 */
function buildTopicContext(topic: WritingTopic): string {
  const lines: string[] = [topic.title]
  if (topic.directions) lines.push(topic.directions)
  if (topic.topic) lines.push(`英文题面：${topic.topic}`)
  if (topic.requirements.length) {
    lines.push('写作要点：')
    topic.requirements.forEach((item, i) => lines.push(`${i + 1}. ${item}`))
  }
  lines.push(`字数要求：${topic.wordRange[0]}-${topic.wordRange[1]} 词`)
  return lines.join('\n')
}

/**
 * 把报告页的评分拼成一段文本摘要，交给模型当上下文。
 *
 * 只带结构化事实（分数 / 等级 / 五维 / 主要问题），刻意不带逐句批改：
 * corrections 动辄几十条，会把 prompt 撑大，而用户问到具体句子时
 * 模型能从正文里自己找到——带了反而是在替它做重复劳动。
 */
function buildScoreSummary(s: WritingScore): string {
  const lines: string[] = [
    `总分 ${s.rawScore}/${SCORE_MAX}，折算 ${s.weightedScore.toFixed(1)}/106.5，等级：${t(SCORE_LEVEL_LABEL_KEYS[s.level])}`,
  ]
  const dims = WRITING_DIMENSIONS.map(
    (d) => `${t(DIMENSION_LABEL_KEYS[d])} ${s.dimensions[d]}/${DIMENSION_MAX}`,
  ).join('、')
  lines.push(`维度得分：${dims}`)
  if (s.issues.length) {
    lines.push('主要问题：')
    s.issues.slice(0, 3).forEach((item, i) => {
      lines.push(`${i + 1}. ${item.length > 80 ? `${item.slice(0, 80)}…` : item}`)
    })
  }
  return lines.join('\n')
}

/**
 * 追问入口。
 * 先按当前作文重建对话上下文（open 传 context 会清空上一题的记录），
 * 再注入一张批改速览卡。不自动发送提问，避免直接消耗一次模型调用。
 *
 * 题目按 topicId 从前端题库取（题库为静态数据，不走接口）；
 * 取不到时退化为只带作文正文，不阻塞入口——缺题目只是回答没那么准，不该点不动。
 *
 * contextType 保持 general：writing 的 system prompt 是「按百分制重新评分」，
 * 会诱导模型再打一次分，而报告页用 15 分制，两套分数并列会让用户困惑。
 */
const askAi = async () => {
  const current = submission.value
  if (!current) return
  let questionContent: string | undefined
  try {
    const topics = await fetchWritingTopics()
    const topic = topics.find((item) => item.id === current.topicId)
    if (topic) questionContent = buildTopicContext(topic)
  } catch {
    // 题库读取失败不影响追问，按无题目处理
  }
  aiStore.open({
    contextType: 'general',
    questionContent,
    userAnswer: current.content,
    scoreSummary: buildScoreSummary(current.report),
  })
  aiStore.injectFeedback('writing', current.id, true)
}

onMounted(load)
</script>
