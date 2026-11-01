<template>
  <section class="flex flex-col gap-4 rounded-[16px] border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
    <h3 class="font-headline-sm text-headline-sm text-on-surface">{{ title }}</h3>
    <p v-if="entries.length === 0" class="font-body-sm text-body-sm text-on-surface-variant">
      {{ $t('adminConsole.detail.unavailable') }}
    </p>
    <dl v-else class="flex flex-col gap-3">
      <div v-for="[key, value] in entries" :key="key" class="flex items-center justify-between gap-4 border-b border-outline-variant/30 pb-2">
        <dt class="font-body-sm text-body-sm text-on-surface-variant">{{ labelOf(key) }}</dt>
        <dd class="tabular-nums font-body-sm text-body-sm font-semibold text-on-surface">{{ displayOrDash(value) }}</dd>
      </div>
    </dl>
  </section>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import type { LooseRecord } from '../../../api/admin'
import { displayOrDash } from '../../../utils/format'

const props = defineProps<{
  title: string
  data: LooseRecord | null
}>()

const { t } = useI18n()
const entries = computed(() => (props.data ? Object.entries(props.data) : []))

const LABELS: Record<string, string> = {
  eloScore: 'adminConsole.detail.fields.eloScore',
  vocabularyScore: 'adminConsole.detail.fields.vocabularyScore',
  grammarScore: 'adminConsole.detail.fields.grammarScore',
  listeningScore: 'adminConsole.detail.fields.listeningScore',
  readingScore: 'adminConsole.detail.fields.readingScore',
  balance: 'adminConsole.detail.fields.balance',
  totalEarned: 'adminConsole.detail.fields.totalEarned',
  checkInStreak: 'adminConsole.detail.fields.checkInStreak',
  dailyNewWords: 'adminConsole.detail.fields.dailyNewWords',
  dailyReviewWords: 'adminConsole.detail.fields.dailyReviewWords',
  vocabGroupSize: 'adminConsole.detail.fields.vocabGroupSize',
  totalAnswered: 'adminConsole.detail.fields.totalAnswered',
  correctRate: 'adminConsole.detail.fields.correctRate',
  totalStudySeconds: 'adminConsole.detail.fields.totalStudySeconds',
  activeDays: 'adminConsole.detail.fields.activeDays',
  targetLevel: 'adminConsole.detail.fields.targetLevel',
  correctCount: 'adminConsole.detail.fields.correctCount',
  errorCount: 'adminConsole.detail.fields.errorCount',
  totalDurationSeconds: 'adminConsole.detail.fields.totalDurationSeconds',
  totalHours: 'adminConsole.detail.fields.totalHours',
  totalMinutes: 'adminConsole.detail.fields.totalMinutes',
  masteredWords: 'adminConsole.detail.fields.masteredWords',
  nationalRankPercent: 'adminConsole.detail.fields.nationalRankPercent',
  vocabularyComprehension: 'adminConsole.detail.fields.vocabularyComprehension',
  heatmapData: 'adminConsole.detail.fields.heatmapData',
}

const labelOf = (key: string) => (LABELS[key] ? t(LABELS[key]) : key)
</script>
