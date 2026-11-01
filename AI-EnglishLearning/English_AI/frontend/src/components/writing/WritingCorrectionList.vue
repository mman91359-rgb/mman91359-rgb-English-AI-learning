<template>
  <div class="flex flex-col gap-4">
    <article
      v-for="(item, index) in corrections"
      :key="`${item.original}-${index}`"
      class="flex flex-col gap-3 rounded-2xl border border-outline-variant/40 bg-surface-container-lowest p-5 shadow-soft-glow"
    >
      <span class="w-fit rounded-full bg-secondary-container/60 px-2.5 py-0.5 font-label-sm text-label-sm text-on-secondary-container">
        {{ $t(CORRECTION_TYPE_LABEL_KEYS[item.type]) }}
      </span>
      <p class="font-body-md text-body-md text-error line-through decoration-error/60">{{ item.original }}</p>
      <p class="font-body-md text-body-md text-tertiary">{{ item.suggestion }}</p>
      <p class="font-body-sm text-body-sm text-on-surface-variant">{{ item.reason }}</p>
    </article>
  </div>
</template>

<script setup lang="ts">
import type { WritingCorrection } from '../../types/writing'
import { CORRECTION_TYPE_LABEL_KEYS } from '../../utils/writing'

defineProps<{ corrections: WritingCorrection[] }>()
</script>
