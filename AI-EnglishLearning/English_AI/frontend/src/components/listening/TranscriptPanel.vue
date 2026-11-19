<template>
  <div class="bg-surface-container-lowest rounded-[20px] p-5 shadow-soft-glow border border-outline-variant/20">
    <div class="flex items-center justify-between mb-3">
      <div class="flex items-center gap-2">
        <AppIcon name="description" size="lg" tone="secondary" />
        <span class="font-label-lg text-label-lg text-on-surface">{{ $t('listening.transcriptTitle') }}</span>
      </div>
      <button
        v-if="!locked && transcript"
        type="button"
        class="transition-colors font-label-md text-label-md flex items-center gap-1"
        :class="favorited ? 'text-error' : 'text-secondary hover:text-secondary-fixed-variant'"
        :aria-pressed="favorited"
        @click="$emit('favorite')"
      >
        <AppIcon :name="favorited ? 'favorite' : 'favorite_border'" size="lg" :filled="favorited" />{{ $t('listening.favorite') }}
      </button>
    </div>

    <div v-if="locked" class="flex items-center gap-2 py-4 text-on-surface-variant">
      <AppIcon name="lock" size="md" />
      <span class="font-body-md text-body-md">{{ $t('listening.transcriptLocked') }}</span>
    </div>

    <template v-else>
      <div class="flex items-center gap-2 border-b border-outline-variant/20 pb-2 mb-3">
        <button
          v-if="transcript"
          type="button"
          class="px-2 py-1 rounded-lg font-label-md text-label-md transition-colors"
          :class="view === 'transcript' ? 'bg-secondary-container/30 text-secondary' : 'text-on-surface-variant hover:text-secondary'"
          @click="view = 'transcript'"
        >{{ $t('listening.transcriptMode') }}</button>
        <button
          v-if="lrcContent"
          type="button"
          class="px-2 py-1 rounded-lg font-label-md text-label-md transition-colors"
          :class="view === 'lyrics' ? 'bg-secondary-container/30 text-secondary' : 'text-on-surface-variant hover:text-secondary'"
          @click="view = 'lyrics'"
        >{{ $t('listening.lyricsMode') }}</button>
      </div>

      <p v-if="view === 'transcript' && transcript" class="font-body-md text-body-md text-on-surface-variant leading-relaxed whitespace-pre-line max-h-64 overflow-y-auto">
        {{ transcript }}
      </p>

      <div v-else ref="lyricsEl" class="max-h-64 overflow-y-auto">
        <button
          v-for="(cue, index) in visibleCues"
          :key="`${cue.time}-${index}`"
          type="button"
          class="block w-full text-left px-2 py-1.5 rounded-lg transition-colors"
          :class="index === activeIndex ? 'bg-secondary-container/20 text-secondary font-semibold' : 'text-on-surface-variant hover:bg-surface-container-high/50'"
          :data-active="index === activeIndex"
          @click="$emit('seek', cue.time)"
        >
          <span class="font-body-md text-body-md leading-relaxed">{{ cue.text }}</span>
          <span v-if="cue.translation" class="block font-label-md text-label-md opacity-70 mt-0.5">{{ cue.translation }}</span>
        </button>
      </div>
    </template>
  </div>
</template>

<script setup lang="ts">
import { computed, nextTick, ref, watch } from 'vue'
import AppIcon from '../ui/AppIcon.vue'
import { findCueIndex, parseLrc } from '../../utils/lrc'

const props = withDefaults(defineProps<{
  locked?: boolean
  transcript?: string
  lrcContent?: string
  currentTime?: number
  rangeStart?: number
  rangeEnd?: number
  /** 当前内容是否已收藏，驱动空心/红色实心切换 */
  favorited?: boolean
}>(), {
  locked: false,
  currentTime: 0,
  rangeStart: 0,
  rangeEnd: Number.POSITIVE_INFINITY,
  favorited: false,
})

defineEmits<{
  seek: [seconds: number]
  favorite: []
}>()

const view = ref<'transcript' | 'lyrics'>('lyrics')
const lyricsEl = ref<HTMLElement | null>(null)

const allCues = computed(() => parseLrc(props.lrcContent))
const visibleCues = computed(() => allCues.value.filter((cue) => cue.time >= props.rangeStart && cue.time < props.rangeEnd))
const activeIndex = computed(() => findCueIndex(visibleCues.value, props.currentTime))

watch(() => props.lrcContent, (value) => {
  view.value = value ? 'lyrics' : 'transcript'
}, { immediate: true })

watch(activeIndex, () => {
  void nextTick(() => {
    const container = lyricsEl.value
    if (!container) return
    const active = container.querySelector<HTMLElement>('[data-active="true"]')
    if (active) {
      container.scrollTop = active.offsetTop - container.clientHeight / 2 + active.clientHeight / 2
    }
  })
})
</script>
