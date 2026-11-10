<template>
  <div class="flex flex-col gap-5">
    <section v-if="score" class="flex flex-col gap-4">
      <div class="flex items-center justify-between rounded-2xl bg-surface-container-low px-4 py-4">
        <div class="flex flex-col">
          <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.score.raw') }}</span>
          <span class="font-headline-md text-headline-md tabular-nums text-on-surface">{{ score.rawScore }} / {{ score.maxRawScore }}</span>
        </div>
        <div class="flex flex-col items-end">
          <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.score.weighted') }}</span>
          <span class="font-body-lg text-body-lg tabular-nums text-primary">{{ score.weightedScore }}</span>
        </div>
      </div>

      <div class="flex flex-col gap-3">
        <WritingDimensionBar
          v-for="dimension in WRITING_DIMENSIONS"
          :key="dimension"
          :label="$t(DIMENSION_LABEL_KEYS[dimension])"
          :value="score.dimensions?.[dimension] ?? 0"
          :max="3"
        />
      </div>
    </section>

    <section v-if="!compact && score?.strengths?.length" class="flex flex-col gap-2">
      <h3 class="font-label-lg text-label-lg text-on-surface">{{ $t('writing.report.strengths') }}</h3>
      <ul class="flex flex-col gap-2">
        <li v-for="(s, i) in score.strengths" :key="i" class="flex items-start gap-2 font-body-md text-body-md text-on-surface">
          <span class="material-symbols-outlined text-icon-sm text-tertiary">check_circle</span>
          <span>{{ s }}</span>
        </li>
      </ul>
    </section>

    <section v-if="!compact && score?.issues?.length" class="flex flex-col gap-2">
      <h3 class="font-label-lg text-label-lg text-on-surface">{{ $t('writing.report.issues') }}</h3>
      <ul class="flex flex-col gap-2">
        <li v-for="(s, i) in score.issues" :key="i" class="flex items-start gap-2 font-body-md text-body-md text-on-surface">
          <span class="material-symbols-outlined text-icon-sm text-error">info</span>
          <span>{{ s }}</span>
        </li>
      </ul>
    </section>

    <section v-if="!compact && score?.corrections?.length" class="flex flex-col gap-3">
      <h3 class="font-label-lg text-label-lg text-on-surface">{{ $t('writing.report.corrections') }}</h3>
      <WritingCorrectionList :corrections="score.corrections" />
    </section>

    <section v-if="!compact && score?.modelEssay" class="flex flex-col gap-2 rounded-2xl bg-surface-container-low p-4">
      <h3 class="font-label-lg text-label-lg text-on-surface">{{ $t('writing.report.modelEssay') }}</h3>
      <p class="font-body-md text-body-md text-on-surface whitespace-pre-line">{{ score.modelEssay }}</p>
    </section>
  </div>
</template>

<script setup lang="ts">
import WritingCorrectionList from '../../writing/WritingCorrectionList.vue'
import WritingDimensionBar from '../../writing/WritingDimensionBar.vue'
import type { WritingScore } from '../../../types/writing'
import { DIMENSION_LABEL_KEYS, WRITING_DIMENSIONS } from '../../../utils/writing'

/**
 * compact：只渲染总分与五个维度，用于对话流速览。
 * 优点/问题/批改/范文属于深度内容，留在报告页，避免同一份报告在对话里铺开上千像素。
 */
withDefaults(defineProps<{
  score?: WritingScore | null
  compact?: boolean
}>(), {
  score: null,
  compact: false,
})
</script>
