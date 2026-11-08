<template>
  <aside class="flex flex-col gap-5 rounded-[24px] border border-outline-variant/40 bg-surface-container-lowest p-6 shadow-soft-glow">
    <header class="flex items-center gap-2">
      <span class="flex h-9 w-9 items-center justify-center rounded-full bg-tertiary-container/40 text-tertiary">
        <span class="material-symbols-outlined text-icon-md">rate_review</span>
      </span>
      <h2 class="font-headline-sm text-headline-sm text-on-surface">{{ $t('writing.score.dimensionTitle') }}</h2>
    </header>

    <template v-if="phase === 'idle'">
      <ul class="flex flex-col gap-3">
        <li v-for="dimension in WRITING_DIMENSIONS" :key="dimension" class="flex items-center justify-between rounded-xl bg-surface-container-low px-4 py-3">
          <span class="font-body-sm text-body-sm text-on-surface">{{ $t(DIMENSION_LABEL_KEYS[dimension]) }}</span>
          <span class="font-label-md text-label-md text-on-surface-variant">0-{{ DIMENSION_MAX }}</span>
        </li>
      </ul>
      <div class="rounded-xl bg-primary-container/20 px-4 py-3">
        <p class="font-label-lg text-label-lg text-on-primary-container">{{ $t('writing.score.pendingTitle') }}</p>
        <p class="mt-1 font-body-sm text-body-sm text-on-surface-variant">{{ $t('writing.score.pendingDesc') }}</p>
      </div>
    </template>

    <template v-else-if="phase === 'scoring'">
      <div class="flex flex-col items-center gap-3 py-4">
        <span class="material-symbols-outlined animate-spin text-4xl text-primary">progress_activity</span>
        <p class="font-body-sm text-body-sm text-on-surface-variant">{{ $t('writing.practice.scoring') }}</p>
      </div>
      <ol class="flex flex-col gap-3">
        <li
          v-for="(key, index) in SCORING_STEP_KEYS"
          :key="key"
          class="flex items-center gap-3 font-body-sm text-body-sm"
          :class="index <= scoringStep ? 'text-on-surface' : 'text-outline'"
        >
          <span class="material-symbols-outlined text-icon-sm">
            {{ index < scoringStep ? 'check_circle' : index === scoringStep ? 'progress_activity' : 'radio_button_unchecked' }}
          </span>
          {{ $t(key) }}
        </li>
      </ol>
    </template>

    <template v-else-if="phase === 'failed'">
      <div class="flex flex-col items-center gap-3 py-6 text-center">
        <span class="material-symbols-outlined text-4xl text-error">error</span>
        <p class="font-body-sm text-body-sm text-on-surface-variant">{{ $t('writing.practice.scoringFailed') }}</p>
        <button type="button" class="rounded-full bg-primary px-5 py-2 font-label-lg text-label-lg text-on-primary" @click="$emit('retry')">
          {{ $t('writing.practice.retry') }}
        </button>
      </div>
    </template>

    <template v-else-if="score">
      <div class="flex items-center justify-between rounded-2xl bg-surface-container-low px-4 py-4">
        <div class="flex flex-col">
          <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.score.raw') }}</span>
          <span class="font-headline-md text-headline-md tabular-nums text-on-surface">{{ score.rawScore }} / {{ SCORE_MAX }}</span>
        </div>
        <div class="flex flex-col items-end">
          <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.score.weighted') }}</span>
          <span class="font-body-lg text-body-lg tabular-nums text-primary">{{ $t('writing.score.weightedValue', { score: score.weightedScore }) }}</span>
        </div>
      </div>
      <p class="font-label-lg text-label-lg text-on-surface">{{ $t(SCORE_LEVEL_LABEL_KEYS[score.level]) }}</p>
      <div class="flex flex-col gap-4">
        <WritingDimensionBar
          v-for="dimension in WRITING_DIMENSIONS"
          :key="dimension"
          :label="$t(DIMENSION_LABEL_KEYS[dimension])"
          :value="score.dimensions[dimension]"
          :max="DIMENSION_MAX"
        />
      </div>
      <button type="button" class="rounded-full bg-primary px-5 py-2.5 font-label-lg text-label-lg text-on-primary" @click="$emit('viewReport')">
        {{ $t('writing.report.title') }}
      </button>
    </template>
  </aside>
</template>

<script setup lang="ts">
import WritingDimensionBar from './WritingDimensionBar.vue'
import type { WritingScore } from '../../types/writing'
import {
  DIMENSION_LABEL_KEYS,
  DIMENSION_MAX,
  SCORE_LEVEL_LABEL_KEYS,
  SCORE_MAX,
  SCORING_STEP_KEYS,
  WRITING_DIMENSIONS,
} from '../../utils/writing'

withDefaults(defineProps<{
  phase: 'idle' | 'scoring' | 'scored' | 'failed'
  score?: WritingScore | null
  scoringStep?: number
}>(), {
  score: null,
  scoringStep: 0,
})

defineEmits<{ retry: []; viewReport: [] }>()
</script>
