<template>
  <div class="bg-surface-container-low rounded-2xl p-4 md:p-5">
    <audio
      ref="audioEl"
      :src="src"
      preload="metadata"
      class="hidden"
      @loadedmetadata="handleLoaded"
      @timeupdate="handleTimeUpdate"
      @play="handlePlay"
      @pause="handlePause"
      @ended="handleEnded"
      @error="handleError"
    />

    <div class="space-y-3">
      <div
        class="rounded-xl border p-3 transition-colors"
        :class="range === 'article' ? 'border-tertiary/40 bg-tertiary/5' : 'border-outline-variant/20'"
      >
        <div class="flex items-center gap-2">
          <span class="material-symbols-outlined text-tertiary text-[20px]">article</span>
          <span class="font-label-lg text-label-lg" :class="range === 'article' ? 'text-tertiary' : 'text-on-surface'">
            {{ $t('listening.articleAudio') }}
          </span>
          <span class="ml-auto font-label-md text-label-md text-on-surface-variant">
            {{ range === 'article' ? formatTime(currentTime) : '00:00' }} / {{ formatTime(articleDuration) }}
          </span>
        </div>
        <div class="flex items-center gap-2 mt-2">
          <button
            type="button"
            class="w-9 h-9 rounded-full bg-tertiary text-on-tertiary flex items-center justify-center disabled:opacity-50"
            :disabled="disabled || hasError"
            :aria-label="range === 'article' && isPlaying ? $t('listening.pause') : $t('listening.play')"
            @click="playRange('article')"
          >
            <span class="material-symbols-outlined text-[20px]">
              {{ range === 'article' && isPlaying ? 'pause' : 'play_arrow' }}
            </span>
          </button>
          <input
            type="range"
            min="0"
            :max="articleDuration || 0"
            step="0.1"
            :value="range === 'article' ? currentTime : 0"
            class="flex-1 accent-tertiary disabled:opacity-50"
            :disabled="disabled || hasError || range !== 'article'"
            :aria-label="$t('listening.progress')"
            @input="seekFrom('article', $event)"
          />
          <button
            type="button"
            class="p-2 rounded-full text-tertiary hover:bg-tertiary/10 disabled:opacity-50"
            :disabled="disabled || hasError"
            :aria-label="$t('listening.replay')"
            @click="replayRange('article')"
          >
            <span class="material-symbols-outlined text-[20px]">replay</span>
          </button>
        </div>
      </div>

      <div
        v-if="hasQuestionTrack"
        class="rounded-xl border p-3 transition-colors"
        :class="range === 'question' ? 'border-secondary/40 bg-secondary/5' : 'border-outline-variant/20'"
      >
        <div class="flex items-center gap-2">
          <span class="material-symbols-outlined text-secondary text-[20px]">record_voice_over</span>
          <span class="font-label-lg text-label-lg" :class="range === 'question' ? 'text-secondary' : 'text-on-surface'">
            {{ $t('listening.questionAudio') }}
          </span>
          <span class="ml-auto font-label-md text-label-md text-on-surface-variant">
            {{ range === 'question' ? formatTime(currentTime) : '00:00' }} / {{ formatTime(questionDuration) }}
          </span>
        </div>
        <div class="flex items-center gap-2 mt-2">
          <button
            type="button"
            class="w-9 h-9 rounded-full bg-secondary text-on-secondary flex items-center justify-center disabled:opacity-50"
            :disabled="disabled || hasError"
            :aria-label="range === 'question' && isPlaying ? $t('listening.pause') : $t('listening.play')"
            @click="playRange('question')"
          >
            <span class="material-symbols-outlined text-[20px]">
              {{ range === 'question' && isPlaying ? 'pause' : 'play_arrow' }}
            </span>
          </button>
          <input
            type="range"
            min="0"
            :max="questionDuration || 0"
            step="0.1"
            :value="range === 'question' ? currentTime : 0"
            class="flex-1 accent-secondary disabled:opacity-50"
            :disabled="disabled || hasError || range !== 'question'"
            :aria-label="$t('listening.progress')"
            @input="seekFrom('question', $event)"
          />
          <button
            type="button"
            class="p-2 rounded-full text-secondary hover:bg-secondary/10 disabled:opacity-50"
            :disabled="disabled || hasError"
            :aria-label="$t('listening.replay')"
            @click="replayRange('question')"
          >
            <span class="material-symbols-outlined text-[20px]">replay</span>
          </button>
        </div>
      </div>
    </div>

    <p v-if="hasError" class="mt-2 font-label-md text-label-md text-error">
      {{ $t('listening.audioError') }}
    </p>

    <div v-if="hasContent" class="mt-4">
      <div class="flex items-center gap-2 border-b border-outline-variant/20 pb-2">
        <button
          v-if="lrcContent"
          type="button"
          class="px-2 py-1 rounded-lg font-label-md text-label-md transition-colors"
          :class="view === 'lyrics' ? 'bg-primary-container/30 text-primary' : 'text-on-surface-variant hover:text-primary'"
          @click="view = 'lyrics'"
        >
          {{ $t('listening.lyrics') }}
        </button>
        <button
          v-if="transcript"
          type="button"
          class="px-2 py-1 rounded-lg font-label-md text-label-md transition-colors"
          :class="view === 'transcript' ? 'bg-primary-container/30 text-primary' : 'text-on-surface-variant hover:text-primary'"
          @click="view = 'transcript'"
        >
          {{ $t('listening.transcript') }}
        </button>
        <span v-if="range === 'question' && activeCue" class="ml-auto font-label-md text-label-md text-secondary truncate">
          {{ activeCue.text }}
        </span>
      </div>

      <div v-if="view === 'transcript' && transcript" class="mt-3 max-h-64 overflow-y-auto">
        <p class="font-body-md text-body-md text-on-surface-variant leading-relaxed whitespace-pre-line">
          {{ transcript }}
        </p>
      </div>

      <div v-else-if="view === 'lyrics' && lrcContent" ref="lyricsEl" class="mt-3 max-h-64 overflow-y-auto">
        <button
          v-for="(cue, index) in segmentCues"
          :key="`${cue.time}-${index}`"
          type="button"
          class="block w-full text-left px-2 py-1.5 rounded-lg transition-colors"
          :class="index === activeCueIndex ? 'bg-primary-container/30 text-primary font-semibold' : 'text-on-surface-variant hover:bg-surface-container-high/50'"
          :data-active="index === activeCueIndex"
          @click="seekToCue(cue.time)"
        >
          <span class="font-body-md text-body-md leading-relaxed">{{ cue.text }}</span>
          <span v-if="cue.translation" class="block font-label-md text-label-md opacity-70 mt-0.5">{{ cue.translation }}</span>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, nextTick, onBeforeUnmount, ref, watch } from 'vue'
import { findCueIndex, parseLrc, sliceLrc } from '../utils/lrc'

type RangeMode = 'article' | 'question'

const props = withDefaults(defineProps<{
  src: string
  durationSeconds?: number
  audioTotalSeconds?: number
  audioStartSeconds?: number
  audioEndSeconds?: number
  questionStartSeconds?: number
  questionEndSeconds?: number
  transcript?: string
  lrcContent?: string
  disabled?: boolean
}>(), {
  disabled: false,
})

const emit = defineEmits<{
  loaded: [duration: number]
  play: []
  pause: []
  ended: []
  error: [message: string]
  timeupdate: [payload: { currentTime: number; duration: number; range: RangeMode }]
}>()

const audioEl = ref<HTMLAudioElement | null>(null)
const lyricsEl = ref<HTMLElement | null>(null)
const duration = ref(0)
const currentTime = ref(0)
const isPlaying = ref(false)
const hasError = ref(false)
const range = ref<RangeMode>('article')
const view = ref<'lyrics' | 'transcript'>('lyrics')

const totalDuration = computed(() => {
  return duration.value || props.audioTotalSeconds || props.durationSeconds || 0
})

const articleStart = computed(() => props.audioStartSeconds ?? 0)
const articleEnd = computed(() => props.audioEndSeconds ?? totalDuration.value)
const questionStart = computed(() => props.questionStartSeconds ?? articleStart.value)
const questionEnd = computed(() => props.questionEndSeconds ?? articleEnd.value)

const hasQuestionTrack = computed(() => {
  return props.questionStartSeconds != null && props.questionEndSeconds != null
})

const activeStart = computed(() => (range.value === 'article' ? articleStart.value : questionStart.value))
const activeEnd = computed(() => {
  const end = range.value === 'article' ? articleEnd.value : questionEnd.value
  return totalDuration.value > 0 ? Math.min(end, totalDuration.value) : end
})

const articleDuration = computed(() => Math.max(0, safeEndFor('article') - articleStart.value))
const questionDuration = computed(() => Math.max(0, safeEndFor('question') - questionStart.value))
const segmentDuration = computed(() => Math.max(0, activeEnd.value - activeStart.value))

const cues = computed(() => parseLrc(props.lrcContent))
const segmentCues = computed(() => {
  const start = range.value === 'article' ? articleStart.value : questionStart.value
  const end = range.value === 'article' ? articleEnd.value : questionEnd.value
  return sliceLrc(cues.value, start, end, true)
})
const activeCueIndex = computed(() => findCueIndex(segmentCues.value, currentTime.value))
const activeCue = computed(() => (activeCueIndex.value >= 0 ? segmentCues.value[activeCueIndex.value] : null))

const hasContent = computed(() => Boolean(props.transcript || props.lrcContent))

function safeEndFor(mode: RangeMode): number {
  const end = mode === 'article' ? articleEnd.value : questionEnd.value
  return totalDuration.value > 0 ? Math.min(end, totalDuration.value) : end
}

function formatTime(seconds: number): string {
  if (!Number.isFinite(seconds) || seconds < 0) return '00:00'
  const total = Math.floor(seconds)
  const minutes = Math.floor(total / 60)
  const remain = total % 60
  return `${String(minutes).padStart(2, '0')}:${String(remain).padStart(2, '0')}`
}

function syncCurrentTime() {
  const audio = audioEl.value
  if (!audio) return
  const relative = audio.currentTime - activeStart.value
  currentTime.value = Math.min(Math.max(round2(relative), 0), segmentDuration.value)
}

function round2(value: number) {
  return Math.round(value * 100) / 100
}

function seekToAbsolute(absolute: number) {
  const audio = audioEl.value
  if (!audio) return
  const start = activeStart.value
  const end = activeEnd.value
  const target = Math.min(Math.max(absolute, start), Math.max(start, end - 0.05))
  audio.currentTime = target
  currentTime.value = Math.min(Math.max(target - start, 0), segmentDuration.value)
}

function switchRange(next: RangeMode) {
  if (next === 'question' && !hasQuestionTrack.value) return
  if (range.value === next) return
  audioEl.value?.pause()
  range.value = next
  currentTime.value = 0
  void nextTick(() => seekToAbsolute(activeStart.value))
}

async function playRange(next: RangeMode) {
  if (next === 'question' && !hasQuestionTrack.value) return
  if (range.value !== next) {
    switchRange(next)
    await nextTick()
  }
  await toggle()
}

async function toggle() {
  const audio = audioEl.value
  if (!audio || hasError.value) return
  if (isPlaying.value) {
    audio.pause()
    return
  }
  if (audio.currentTime < activeStart.value || audio.currentTime >= activeEnd.value - 0.05) {
    audio.currentTime = activeStart.value
    currentTime.value = 0
  }
  try {
    await audio.play()
  } catch {
    hasError.value = true
    emit('error', '音频播放失败')
  }
}

async function replay() {
  const audio = audioEl.value
  if (!audio) return
  audio.currentTime = activeStart.value
  currentTime.value = 0
  try {
    await audio.play()
  } catch {
    hasError.value = true
    emit('error', '音频播放失败')
  }
}

async function replayRange(next: RangeMode) {
  if (next === 'question' && !hasQuestionTrack.value) return
  if (range.value !== next) {
    switchRange(next)
    await nextTick()
  }
  await replay()
}

function seekFrom(next: RangeMode, event: Event) {
  if (next === 'question' && !hasQuestionTrack.value) return
  if (range.value !== next) {
    audioEl.value?.pause()
    range.value = next
    currentTime.value = 0
  }
  const target = event.target as HTMLInputElement
  seekToAbsolute(activeStart.value + Number(target.value))
}

function seekToCue(relativeTime: number) {
  seekToAbsolute(activeStart.value + relativeTime)
}

function handleLoaded() {
  const audio = audioEl.value
  if (!audio) return
  const actual = Number.isFinite(audio.duration) ? audio.duration : 0
  duration.value = actual
  hasError.value = false
  if (audio.currentTime < activeStart.value || audio.currentTime >= activeEnd.value) {
    audio.currentTime = activeStart.value
  }
  syncCurrentTime()
  emit('loaded', actual)
}

function handleTimeUpdate() {
  const audio = audioEl.value
  if (!audio) return
  if (audio.currentTime < activeStart.value - 0.1) {
    audio.currentTime = activeStart.value
    currentTime.value = 0
    return
  }
  if (audio.currentTime >= activeEnd.value - 0.05) {
    audio.pause()
    audio.currentTime = activeEnd.value
    currentTime.value = segmentDuration.value
    emit('ended')
    return
  }
  syncCurrentTime()
  emit('timeupdate', {
    currentTime: currentTime.value,
    duration: segmentDuration.value,
    range: range.value,
  })
}

function handlePlay() {
  isPlaying.value = true
  emit('play')
}

function handlePause() {
  isPlaying.value = false
  emit('pause')
}

function handleEnded() {
  isPlaying.value = false
  emit('ended')
}

function handleError() {
  hasError.value = true
  isPlaying.value = false
  emit('error', '音频加载失败')
}

function reset() {
  const audio = audioEl.value
  if (audio) {
    audio.pause()
    audio.currentTime = 0
  }
  duration.value = 0
  currentTime.value = 0
  isPlaying.value = false
  hasError.value = false
  range.value = 'article'
  view.value = 'lyrics'
}

watch(() => props.src, reset)
watch(() => props.disabled, (value) => {
  if (value) audioEl.value?.pause()
})
watch(hasQuestionTrack, (value) => {
  if (!value) range.value = 'article'
})
watch(() => props.lrcContent, (value) => {
  view.value = value ? 'lyrics' : 'transcript'
}, { immediate: true })
watch([() => props.questionStartSeconds, () => props.questionEndSeconds], () => {
  const audio = audioEl.value
  if (!audio) return
  audio.pause()
  currentTime.value = 0
  void nextTick(() => {
    seekToAbsolute(range.value === 'article' ? articleStart.value : questionStart.value)
  })
})
watch(activeCueIndex, () => {
  void nextTick(() => {
    const container = lyricsEl.value
    if (!container) return
    const active = container.querySelector<HTMLElement>('[data-active="true"]')
    const target = (active || container.children.item(activeCueIndex.value)) as HTMLElement | null
    if (target) {
      container.scrollTop = target.offsetTop - container.clientHeight / 2 + target.clientHeight / 2
    }
  })
})

onBeforeUnmount(() => {
  audioEl.value?.pause()
})

defineExpose({ toggle, replay, reset })
</script>
