<template>
  <section class="flex flex-col gap-4">
    <div class="flex flex-wrap items-center gap-2">
      <span class="rounded-full bg-secondary-container/60 px-3 py-1 font-label-md text-label-md text-on-secondary-container">
        {{ $t(WRITING_TYPE_META[topic.type].labelKey) }}
      </span>
      <span class="rounded-full bg-surface-container-high px-3 py-1 font-label-md text-label-md text-on-surface-variant">
        {{ $t(WRITING_LEVEL_LABEL_KEYS[topic.level]) }}
      </span>
      <span v-if="topic.source" class="font-label-md text-label-md text-on-surface-variant">
        {{ $t('writing.practice.source') }}：{{ topic.source }}
      </span>
      <span class="rounded-full bg-primary-container/30 px-3 py-1 font-label-md text-label-md text-primary">
        {{ $t('writing.practice.new') }}
      </span>
    </div>

    <div class="rounded-3xl bg-surface-container p-4 shadow-soft-glow md:p-6">
      <article class="rounded-sm border-2 border-outline bg-surface-container-lowest p-5 text-on-surface dark:bg-surface md:p-8">
        <header class="text-center">
          <p class="font-label-md tracking-[0.3em] text-on-surface-variant">{{ $t('writing.paper.subtitle') }}</p>
          <h1 class="mt-2 font-headline-md text-headline-md font-semibold text-on-surface">{{ $t('writing.paper.title') }}</h1>
        </header>

        <dl class="mt-6 grid grid-cols-2 border border-outline md:grid-cols-4 [&>div]:border-b [&>div]:border-r [&>div]:border-outline [&>div]:px-3 [&>div]:py-2">
          <div>
            <dt class="font-label-sm text-label-sm text-on-surface-variant">{{ $t('writing.paper.level') }}</dt>
            <dd class="font-body-sm text-body-sm font-semibold">{{ $t(WRITING_LEVEL_LABEL_KEYS[topic.level]) }}</dd>
          </div>
          <div>
            <dt class="font-label-sm text-label-sm text-on-surface-variant">{{ $t('writing.paper.type') }}</dt>
            <dd class="font-body-sm text-body-sm font-semibold">{{ $t(WRITING_TYPE_META[topic.type].labelKey) }}</dd>
          </div>
          <div>
            <dt class="font-label-sm text-label-sm text-on-surface-variant">{{ $t('writing.paper.suggested') }}</dt>
            <dd class="font-body-sm text-body-sm font-semibold tabular-nums">{{ topic.wordRange[0] }}-{{ topic.wordRange[1] }}</dd>
          </div>
          <div>
            <dt class="font-label-sm text-label-sm text-on-surface-variant">{{ $t('writing.paper.timeLeft') }}</dt>
            <dd class="font-mono font-body-sm text-body-sm font-semibold tabular-nums" :class="danger ? 'text-error' : ''">
              {{ formatted }}
            </dd>
          </div>
        </dl>

        <section class="mt-6">
          <h2 class="font-label-md text-label-md font-semibold text-on-surface-variant">{{ $t('writing.paper.prompt') }}</h2>
          <h3 class="mt-2 text-center font-body-lg text-body-lg font-semibold">{{ topic.title }}</h3>
          <p class="mt-3 whitespace-pre-line font-body-md text-body-md leading-[150%] text-on-surface-variant">{{ topic.directions }}</p>
          <p class="mt-2 whitespace-pre-line font-body-sm text-body-sm italic text-on-surface-variant">{{ topic.topic }}</p>
          <ul class="mt-3 flex list-disc flex-col gap-1 pl-5 font-body-sm text-body-sm text-on-surface">
            <li v-for="item in topic.requirements" :key="item">{{ item }}</li>
          </ul>
        </section>

        <section class="mt-6">
          <button
            type="button"
            class="flex items-center gap-1 font-label-md text-label-md text-primary"
            :aria-expanded="hintsOpen"
            @click="$emit('toggleHints')"
          >
            <span class="material-symbols-outlined text-icon-sm">{{ hintsOpen ? 'expand_less' : 'expand_more' }}</span>
            {{ hintsOpen ? $t('writing.practice.hideHints') : $t('writing.practice.viewHints') }}
          </button>
          <div v-if="hintsOpen" class="mt-3 grid grid-cols-1 gap-4 rounded-xl bg-surface-container-low p-4 sm:grid-cols-2">
            <div class="flex flex-col gap-2">
              <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.practice.outline') }}</span>
              <ul class="flex list-disc flex-col gap-1 pl-4 font-body-sm text-body-sm text-on-surface">
                <li v-for="hint in topic.outlineHints" :key="hint">{{ hint }}</li>
              </ul>
            </div>
            <div class="flex flex-col gap-2">
              <span class="font-label-md text-label-md text-on-surface-variant">{{ $t('writing.practice.usefulExpressions') }}</span>
              <ul class="flex flex-wrap gap-2">
                <li v-for="phrase in topic.usefulExpressions" :key="phrase" class="rounded-full bg-primary-container/20 px-2.5 py-1 font-label-sm text-label-sm text-on-primary-container">
                  {{ phrase }}
                </li>
              </ul>
            </div>
          </div>
        </section>

        <section class="mt-8">
          <h2 class="font-label-md text-label-md font-semibold text-on-surface-variant">{{ $t('writing.paper.body') }}</h2>
          <div class="mt-3 border-l-2 border-error/50 pl-4 md:pl-6">
            <textarea
              :value="content"
              :disabled="disabled"
              :placeholder="$t('writing.practice.placeholder')"
              :aria-label="$t('writing.paper.body')"
              :style="ruledLines"
              class="block min-h-[320px] w-full resize-y bg-transparent font-serif font-body-md text-body-md leading-[40px] text-on-surface placeholder:text-outline focus:outline-none disabled:opacity-70"
              @input="$emit('update:content', ($event.target as HTMLTextAreaElement).value)"
            />
          </div>
        </section>

        <footer class="mt-6 flex flex-col-reverse items-stretch gap-3 border-t border-outline pt-4 sm:flex-row sm:items-center sm:justify-between">
          <span class="font-label-md text-label-md tabular-nums" :class="wordHintClass">
            {{ $t('writing.practice.wordCountRange', { count: wordCount, min: topic.wordRange[0], max: topic.wordRange[1] }) }}
          </span>
          <div class="flex flex-col gap-2 sm:flex-row">
            <button type="button" class="rounded-full border border-outline-variant px-4 py-2 font-label-lg text-label-lg text-on-surface-variant" :disabled="disabled" @click="$emit('saveDraft')">
              {{ $t('writing.practice.saveDraft') }}
            </button>
            <button type="button" class="flex items-center justify-center gap-2 rounded-full bg-primary px-5 py-2 font-label-lg text-label-lg text-on-primary disabled:opacity-50" :disabled="disabled || wordCount === 0" @click="$emit('submit')">
              <span class="material-symbols-outlined text-icon-sm">send</span>
              {{ $t('writing.practice.submit') }}
            </button>
          </div>
        </footer>

        <p v-if="wordHint" class="mt-3 text-right font-label-md text-label-md" :class="wordCount < topic.wordRange[0] ? 'text-warning' : 'text-on-surface-variant'">
          {{ wordHint }}
        </p>
        <p v-if="saveStatusText" class="mt-2 text-right font-label-md text-label-md text-on-surface-variant">{{ saveStatusText }}</p>
      </article>
    </div>
  </section>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useI18n } from 'vue-i18n'
import type { WritingTopic } from '../../types/writing'
import { WRITING_LEVEL_LABEL_KEYS, WRITING_TYPE_META } from '../../utils/writing'

const props = defineProps<{
  topic: WritingTopic
  content: string
  wordCount: number
  formatted: string
  danger: boolean
  disabled: boolean
  hintsOpen: boolean
  saveStatusText: string
}>()

defineEmits<{
  'update:content': [value: string]
  saveDraft: []
  toggleHints: []
  submit: []
}>()

const { t } = useI18n()

const RULED_LINE_HEIGHT_PX = 40
const ruledLines = {
  backgroundImage: `linear-gradient(to bottom, transparent ${RULED_LINE_HEIGHT_PX - 1}px, rgb(var(--color-outline-variant) / 0.7) ${RULED_LINE_HEIGHT_PX - 1}px, rgb(var(--color-outline-variant) / 0.7) ${RULED_LINE_HEIGHT_PX}px)`,
  backgroundSize: `100% ${RULED_LINE_HEIGHT_PX}px`,
}

const wordHint = computed(() => {
  if (props.wordCount === 0) return ''
  if (props.wordCount < props.topic.wordRange[0]) {
    return t('writing.practice.tooShort', { min: props.topic.wordRange[0] })
  }
  if (props.wordCount > props.topic.wordRange[1]) {
    return t('writing.practice.tooLong', { max: props.topic.wordRange[1] })
  }
  return ''
})

const wordHintClass = computed(() => (wordHint.value ? 'text-warning' : 'text-on-surface-variant'))
</script>
