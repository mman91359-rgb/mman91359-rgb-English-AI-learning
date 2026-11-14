<template>
  <div v-if="loading || result" class="mt-6 rounded-2xl bg-surface-container-low px-5 py-4">
    <p v-if="loading" class="font-label-md text-label-md text-on-surface-variant">
      {{ $t('learning.practiceSettle.settling') }}
    </p>
    <p v-else-if="result?.reason" class="font-label-md text-label-md text-on-surface-variant">
      {{ $t('learning.practiceSettle.settleFailed') }}
    </p>
    <template v-else-if="result">
      <p
        class="font-headline-sm text-headline-sm tabular-nums"
        :class="result.points > 0 ? 'text-primary' : 'text-on-surface'"
      >
        <template v-if="result.points > 0">
          {{ $t('learning.practiceSettle.earned', { points: result.points }) }}
        </template>
        <template v-else-if="result.qualified">
          {{ $t('learning.practiceSettle.dailyLimitReached') }}
        </template>
        <template v-else>
          {{ $t('learning.practiceSettle.notQualified', { accuracy: result.accuracy }) }}
        </template>
      </p>
      <p v-if="result.totalPoints != null" class="mt-1 font-label-sm text-label-sm text-on-surface-variant">
        {{ $t('learning.practiceSettle.total', { points: result.totalPoints, title: result.title || '' }) }}
      </p>
      <p v-else-if="!result.qualified" class="mt-1 font-label-sm text-label-sm text-on-surface-variant">
        {{ $t('learning.practiceSettle.notQualifiedTip') }}
      </p>
      <p v-if="result.dailyLimitReached" class="mt-1 font-label-sm text-label-sm text-on-surface-variant">
        {{ $t('learning.practiceSettle.dailyLimitHint') }}
      </p>
    </template>
  </div>
</template>

<script setup lang="ts">
import type { PracticeSettleResult } from '@/api/exercise'

/**
 * 练习积分结算结果卡片。
 *
 * <p>三态展示：正常结算（含未达 60% 与每日上限）、结算失败、结算中。
 * 未达门槛时明确给出本次正确率，避免用户不知道为什么没有加分。</p>
 */
defineProps<{
  result: PracticeSettleResult | null
  loading: boolean
}>()
</script>
