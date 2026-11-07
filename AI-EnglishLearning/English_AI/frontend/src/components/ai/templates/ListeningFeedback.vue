<template>
  <div class="flex flex-col gap-4">
    <section v-if="transcriptTokens.length" class="flex flex-col gap-2 rounded-2xl bg-surface-container-low p-4">
      <h3 class="font-label-lg text-label-lg text-on-surface-variant">{{ $t('listening.transcript') }}</h3>
      <p class="font-body-md text-body-md text-on-surface leading-relaxed">
        <template v-for="(token, i) in transcriptTokens" :key="i">
          <WordToken :text="token" @lookup="onLookup" /><span v-if="i < transcriptTokens.length - 1">{{ ' ' }}</span>
        </template>
      </p>
    </section>

    <section v-if="data?.analysis" class="flex flex-col gap-2 rounded-2xl border border-outline-variant/40 p-4">
      <h3 class="font-label-lg text-label-lg text-on-surface-variant">{{ $t('listening.analysis') }}</h3>
      <p class="font-body-md text-body-md text-on-surface">{{ data.analysis }}</p>
    </section>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import WordToken from '../../word/WordToken.vue'

/**
 * 听力反馈模板：听力原文 + 答案解析，原文逐词可点开查词。
 */
const props = defineProps<{
  data?: {
    transcript?: string
    analysis?: string
  } | null
}>()

const emit = defineEmits<{ (e: 'lookup', word: string): void }>()

function englishTokens(text: string): string[] {
  return text.split(/\s+/).filter(Boolean)
}

const transcriptTokens = computed(() => englishTokens(props.data?.transcript ?? ''))

function onLookup(word: string): void {
  emit('lookup', word)
}
</script>
