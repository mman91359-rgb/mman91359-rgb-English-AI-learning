<template>
  <div class="flex flex-col gap-4">
    <section v-if="referenceTokens.length" class="flex flex-col gap-2 rounded-2xl bg-surface-container-low p-4">
      <h3 class="font-label-lg text-label-lg text-on-surface-variant">{{ $t('translation.reference') }}</h3>
      <p class="font-body-md text-body-md text-on-surface leading-relaxed">
        <template v-for="(token, i) in referenceTokens" :key="i">
          <WordToken :text="token" @lookup="onLookup" /><span v-if="i < referenceTokens.length - 1">{{ ' ' }}</span>
        </template>
      </p>
    </section>

    <section v-if="userTokens.length" class="flex flex-col gap-2 rounded-2xl bg-surface-container-low p-4">
      <h3 class="font-label-lg text-label-lg text-on-surface-variant">{{ $t('translation.yourTranslation') }}</h3>
      <p class="font-body-md text-body-md text-on-surface leading-relaxed">
        <template v-for="(token, i) in userTokens" :key="i">
          <WordToken :text="token" @lookup="onLookup" /><span v-if="i < userTokens.length - 1">{{ ' ' }}</span>
        </template>
      </p>
    </section>

    <section v-if="data?.aiReason" class="rounded-2xl border border-outline-variant/40 p-4">
      <h3 class="mb-1 font-label-lg text-label-lg text-on-surface-variant">{{ $t('translation.aiFeedback') }}</h3>
      <p class="font-body-md text-body-md text-on-surface">{{ data.aiReason }}</p>
    </section>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import WordToken from '../../word/WordToken.vue'

/**
 * 翻译反馈模板：原文/译文上下对照，英文句子逐词可点开查词。
 */
const props = defineProps<{
  data?: {
    referenceAnswer?: string
    userAnswer?: string
    aiReason?: string
  } | null
}>()

const emit = defineEmits<{ (e: 'lookup', word: string): void }>()

function englishTokens(text: string): string[] {
  return text.split(/\s+/).filter(Boolean)
}

const referenceTokens = computed(() => englishTokens(props.data?.referenceAnswer ?? ''))
const userTokens = computed(() => englishTokens(props.data?.userAnswer ?? ''))

function onLookup(word: string): void {
  emit('lookup', word)
}
</script>
