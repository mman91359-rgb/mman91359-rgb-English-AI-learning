<template>
  <div class="space-y-4">
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

    <div class="bg-tertiary-container/10 rounded-[20px] p-5">
      <div class="flex items-center gap-2 mb-3">
        <span class="material-symbols-outlined text-tertiary text-[20px]">article</span>
        <span class="font-label-lg text-label-lg text-tertiary">{{ $t('listening.articleAudio') }}</span>
        <span class="ml-auto font-label-md text-label-md text-on-surface-variant">
          {{ range === 'article' ? formatTime(currentTime) : '0:00' }} / {{ formatTime(articleDuration) }}
        </span>
      </div>
      <div class="flex items-center gap-4">
        <button
          type="button"
          class="w-12 h-12 rounded-full bg-tertiary text-on-tertiary flex items-center justify-center flex-shrink-0 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(0,110,32,0.25)] disabled:opacity-50"
          :disabled="disabled || hasError"
          :aria-label="range === 'article' && isPlaying ? $t('listening.pause') : $t('listening.play')"
          @click="playRange('article')"
        >
          <span class="material-symbols-outlined text-[24px] fill">{{ range === 'article' && isPlaying ? 'pause' : 'play_arrow' }}</span>
        </button>
        <div
          class="flex-1 flex items-center gap-[3px] h-10 cursor-pointer"
          role="slider"
          :aria-label="$t('listening.progress')"
          :aria-valuenow="Math.round(articleProgress * 100)"
          aria-valuemin="0"
          aria-valuemax="100"
          tabindex="0"
          @click="seekByWave('article', $event)"
        >
          <span
            v-for="(height, index) in waveBars"
            :key="index"
            class="wave-bar w-1 rounded-full"
            :class="[barClass('article', index), { 'is-playing': isPlaying && range === 'article' }]"
            :style="{ height: `${height}px`, animationDelay: `${index * 0.05}s` }"
          ></span>
        </div>
        <button
          type="button"
          class="p-2 rounded-full text-tertiary hover:bg-tertiary/10 transition-colors flex-shrink-0 disabled:opacity-50"
          :disabled="disabled || hasError"
          :aria-label="$t('listening.replay')"
          @click="replayRange('article')"
        >
          <span class="material-symbols-outlined text-[20px]">replay</span>
        </button>
      </div>
    </div>

    <div v-if="hasQuestionTrack" class="bg-secondary-container/10 rounded-[20px] p-5">
      <div class="flex items-center gap-2 mb-3">
        <span class="material-symbols-outlined text-secondary text-[20px]">record_voice_over</span>
        <span class="font-label-lg text-label-lg text-secondary">{{ $t('listening.questionAudio') }}</span>
        <span class="ml-auto font-label-md text-label-md text-on-surface-variant">
          {{ range === 'question' ? formatTime(currentTime) : '0:00' }} / {{ formatTime(questionDuration) }}
        </span>
      </div>
      <div class="flex items-center gap-4">
        <button
          type="button"
          class="w-12 h-12 rounded-full bg-secondary text-on-secondary flex items-center justify-center flex-shrink-0 hover:opacity-90 transition-opacity shadow-[0_4px_14px_rgba(12,103,128,0.25)] disabled:opacity-50"
          :disabled="disabled || hasError"
          :aria-label="range === 'question' && isPlaying ? $t('listening.pause') : $t('listening.play')"
          @click="playRange('question')"
        >
          <span class="material-symbols-outlined text-[24px] fill">{{ range === 'question' && isPlaying ? 'pause' : 'play_arrow' }}</span>
        </button>
        <div
          class="flex-1 flex items-center gap-[3px] h-10 cursor-pointer"
          role="slider"
          :aria-label="$t('listening.progress')"
          :aria-valuenow="Math.round(questionProgress * 100)"
          aria-valuemin="0"
          aria-valuemax="100"
          tabindex="0"
          @click="seekByWave('question', $event)"
        >
          <span
            v-for="(height, index) in waveBars"
            :key="index"
            class="wave-bar w-1 rounded-full"
            :class="[barClass('question', index), { 'is-playing': isPlaying && range === 'question' }]"
            :style="{ height: `${height}px`, animationDelay: `${index * 0.05}s` }"
          ></span>
        </div>
        <button
          type="button"
          class="p-2 rounded-full text-secondary hover:bg-secondary/10 transition-colors flex-shrink-0 disabled:opacity-50"
          :disabled="disabled || hasError"
          :aria-label="$t('listening.replay')"
          @click="replayRange('question')"
        >
          <span class="material-symbols-outlined text-[20px]">replay</span>
        </button>
      </div>
    </div>

    <p v-if="hasError" class="font-label-md text-label-md text-error">
      {{ $t('listening.audioError') }}
    </p>
  </div>
</template>

<script setup lang="ts">
import { computed, nextTick, onBeforeUnmount, ref, watch } from 'vue'

type RangeMode = 'article' | 'question'

const props = withDefaults(defineProps<{
  src: string
  durationSeconds?: number
  audioTotalSeconds?: number
  audioStartSeconds?: number
  audioEndSeconds?: number
  questionStartSeconds?: number
  questionEndSeconds?: number
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
  timeupdate: [payload: { currentTime: number; duration: number; range: RangeMode; absoluteTime: number }]
}>()

const waveBars = [12, 24, 36, 28, 40, 20, 32, 16, 36, 24, 28, 16, 36, 24, 40, 20, 32, 12, 28, 20, 36, 16, 32, 24, 12]

const audioEl = ref<HTMLAudioElement | null>(null)
const duration = ref(0)
const currentTime = ref(0)
const isPlaying = ref(false)
const hasError = ref(false)
const range = ref<RangeMode>('article')
const playbackRate = ref(1)

const totalDuration = computed(() => duration.value || props.audioTotalSeconds || props.durationSeconds || 0)
const articleStart = computed(() => props.audioStartSeconds ?? 0)
const articleEnd = computed(() => props.audioEndSeconds ?? totalDuration.value)
const questionStart = computed(() => props.questionStartSeconds ?? articleStart.value)
const questionEnd = computed(() => props.questionEndSeconds ?? articleEnd.value)
const hasQuestionTrack = computed(() => props.questionStartSeconds != null && props.questionEndSeconds != null)

const activeStart = computed(() => (range.value === 'article' ? articleStart.value : questionStart.value))
const activeEnd = computed(() => {
  const end = range.value === 'article' ? articleEnd.value : questionEnd.value
  return totalDuration.value > 0 ? Math.min(end, totalDuration.value) : end
})
const articleDuration = computed(() => Math.max(0, safeEndFor('article') - articleStart.value))
const questionDuration = computed(() => Math.max(0, safeEndFor('question') - questionStart.value))
const segmentDuration = computed(() => Math.max(0, activeEnd.value - activeStart.value))
const articleProgress = computed(() => (articleDuration.value > 0 && range.value === 'article' ? currentTime.value / articleDuration.value : 0))
const questionProgress = computed(() => (questionDuration.value > 0 && range.value === 'question' ? currentTime.value / questionDuration.value : 0))

function safeEndFor(mode: RangeMode): number {
  const end = mode === 'article' ? articleEnd.value : questionEnd.value
  return totalDuration.value > 0 ? Math.min(end, totalDuration.value) : end
}

function round2(value: number) {
  return Math.round(value * 100) / 100
}

function formatTime(seconds: number): string {
  if (!Number.isFinite(seconds) || seconds < 0) return '0:00'
  const total = Math.floor(seconds)
  const minutes = Math.floor(total / 60)
  const remain = total % 60
  return `${minutes}:${String(remain).padStart(2, '0')}`
}

function barClass(track: RangeMode, index: number): string {
  const progress = track === 'article' ? articleProgress.value : questionProgress.value
  const active = range.value === track && index < Math.round(progress * waveBars.length)
  if (track === 'article') {
    return active ? 'bg-tertiary' : 'bg-tertiary-container/40'
  }
  return active ? 'bg-secondary' : 'bg-secondary-container/40'
}

function toggleRate() {
  const next = playbackRate.value === 1 ? 1.25 : 1
  setPlaybackRate(next)
}

function setPlaybackRate(rate: number) {
  playbackRate.value = rate
  if (audioEl.value) audioEl.value.playbackRate = rate
}

function emitTime() {
  emit('timeupdate', {
    currentTime: currentTime.value,
    duration: segmentDuration.value,
    range: range.value,
    absoluteTime: round2(activeStart.value + currentTime.value),
  })
}

function syncCurrentTime() {
  const audio = audioEl.value
  if (!audio) return
  const relative = audio.currentTime - activeStart.value
  currentTime.value = Math.min(Math.max(round2(relative), 0), segmentDuration.value)
}

function seekToAbsolute(absolute: number) {
  const audio = audioEl.value
  if (!audio) return
  const start = activeStart.value
  const end = activeEnd.value
  const target = Math.min(Math.max(absolute, start), Math.max(start, end - 0.05))
  audio.currentTime = target
  currentTime.value = Math.min(Math.max(target - start, 0), segmentDuration.value)
  emitTime()
}

function setRange(next: RangeMode) {
  if (next === 'question' && !hasQuestionTrack.value) return
  if (range.value === next) return
  audioEl.value?.pause()
  range.value = next
  currentTime.value = 0
  void nextTick(() => {
    seekToAbsolute(activeStart.value)
  })
}

async function playRange(next: RangeMode) {
  if (next === 'question' && !hasQuestionTrack.value) return
  if (range.value !== next) {
    setRange(next)
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
    audio.playbackRate = playbackRate.value
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
    audio.playbackRate = playbackRate.value
    await audio.play()
  } catch {
    hasError.value = true
    emit('error', '音频播放失败')
  }
}

async function replayRange(next: RangeMode) {
  if (next === 'question' && !hasQuestionTrack.value) return
  if (range.value !== next) {
    setRange(next)
    await nextTick()
  }
  await replay()
}

function seekByWave(track: RangeMode, event: MouseEvent) {
  if (track === 'question' && !hasQuestionTrack.value) return
  if (range.value !== track) {
    audioEl.value?.pause()
    range.value = track
    currentTime.value = 0
  }
  const target = event.currentTarget as HTMLElement
  const rect = target.getBoundingClientRect()
  const ratio = Math.min(Math.max((event.clientX - rect.left) / rect.width, 0), 1)
  const start = track === 'article' ? articleStart.value : questionStart.value
  const end = track === 'article' ? articleEnd.value : questionEnd.value
  seekToAbsolute(start + ratio * Math.max(0, end - start))
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
  emitTime()
  emit('loaded', actual)
}

function handleTimeUpdate() {
  const audio = audioEl.value
  if (!audio) return
  if (audio.currentTime < activeStart.value - 0.1) {
    audio.currentTime = activeStart.value
    currentTime.value = 0
    emitTime()
    return
  }
  if (audio.currentTime >= activeEnd.value - 0.05) {
    audio.pause()
    audio.currentTime = activeEnd.value
    currentTime.value = segmentDuration.value
    emitTime()
    emit('ended')
    return
  }
  syncCurrentTime()
  emitTime()
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
  playbackRate.value = 1
}

watch(() => props.src, reset)
watch(() => props.disabled, (value) => {
  if (value) audioEl.value?.pause()
})
watch(hasQuestionTrack, (value) => {
  if (!value) range.value = 'article'
})
watch([() => props.questionStartSeconds, () => props.questionEndSeconds], () => {
  const audio = audioEl.value
  if (!audio) return
  audio.pause()
  currentTime.value = 0
  void nextTick(() => {
    seekToAbsolute(range.value === 'article' ? articleStart.value : questionStart.value)
  })
})

onBeforeUnmount(() => {
  audioEl.value?.pause()
})

defineExpose({ toggle, replay, reset, setPlaybackRate, seekToAbsolute, setRange, toggleRate })
</script>

<style scoped>
@keyframes wave-pulse {
  0%, 100% { transform: scaleY(0.4); }
  50% { transform: scaleY(1); }
}
.wave-bar {
  transform-origin: center;
  animation: wave-pulse 1.2s ease-in-out infinite;
  animation-play-state: paused;
}
.wave-bar.is-playing {
  animation-play-state: running;
}
</style>
