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

    <div class="flex items-center gap-3">
      <button
        type="button"
        class="w-12 h-12 rounded-full bg-primary text-on-primary flex items-center justify-center hover:bg-primary/90 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
        :disabled="disabled || hasError"
        :aria-label="isPlaying ? $t('listening.pause') : $t('listening.play')"
        @click="toggle"
      >
        <span class="material-symbols-outlined text-2xl">{{ icon }}</span>
      </button>

      <div class="flex-1 min-w-0">
        <input
          type="range"
          min="0"
          :max="duration || durationSeconds || 0"
          step="0.1"
          :value="currentTime"
          class="w-full accent-primary disabled:opacity-50"
          :disabled="disabled || hasError"
          :aria-label="$t('listening.progress')"
          @input="seek"
        />
        <div class="flex justify-between font-label-md text-label-md text-on-surface-variant mt-1">
          <span>{{ formatTime(currentTime) }}</span>
          <span>{{ formatTime(duration || durationSeconds || 0) }}</span>
        </div>
      </div>

      <button
        type="button"
        class="w-10 h-10 rounded-full bg-surface-container-lowest text-on-surface-variant flex items-center justify-center hover:text-primary transition-colors disabled:opacity-50"
        :disabled="disabled || hasError"
        :aria-label="$t('listening.replay')"
        @click="replay"
      >
        <span class="material-symbols-outlined text-xl">replay</span>
      </button>
    </div>

    <p v-if="hasError" class="mt-2 font-label-md text-label-md text-error">
      {{ $t('listening.audioError') }}
    </p>

    <div v-if="transcript" class="mt-3">
      <button
        type="button"
        class="font-label-md text-label-md text-primary hover:underline"
        @click="showTranscript = !showTranscript"
      >
        {{ showTranscript ? $t('listening.hideTranscript') : $t('listening.showTranscript') }}
      </button>
      <p v-if="showTranscript" class="mt-2 font-body-md text-body-md text-on-surface-variant leading-relaxed">
        {{ transcript }}
      </p>
    </div>
  </div>
</template>

<script setup lang="ts">
import { computed, onBeforeUnmount, ref, watch } from 'vue'

const props = withDefaults(defineProps<{
  src: string
  durationSeconds?: number
  transcript?: string
  title?: string
  disabled?: boolean
  autoplay?: boolean
}>(), {
  disabled: false,
  autoplay: false,
})

const emit = defineEmits<{
  loaded: [duration: number]
  play: []
  pause: []
  ended: []
  error: [message: string]
  timeupdate: [payload: { currentTime: number; duration: number }]
}>()

const audioEl = ref<HTMLAudioElement | null>(null)
const currentTime = ref(0)
const duration = ref(0)
const isPlaying = ref(false)
const hasError = ref(false)
const showTranscript = ref(false)

const icon = computed(() => (isPlaying.value ? 'pause' : 'play_arrow'))

const formatTime = (seconds: number) => {
  if (!Number.isFinite(seconds) || seconds < 0) return '00:00'
  const total = Math.floor(seconds)
  const minutes = Math.floor(total / 60)
  const remain = total % 60
  return `${String(minutes).padStart(2, '0')}:${String(remain).padStart(2, '0')}`
}

const toggle = async () => {
  const audio = audioEl.value
  if (!audio) return
  if (isPlaying.value) {
    audio.pause()
    return
  }
  try {
    await audio.play()
  } catch {
    hasError.value = true
    emit('error', '音频播放失败')
  }
}

const replay = async () => {
  const audio = audioEl.value
  if (!audio) return
  audio.currentTime = 0
  currentTime.value = 0
  try {
    await audio.play()
  } catch {
    hasError.value = true
    emit('error', '音频播放失败')
  }
}

const seek = (event: Event) => {
  const target = event.target as HTMLInputElement
  const value = Number(target.value)
  if (audioEl.value) {
    audioEl.value.currentTime = value
  }
  currentTime.value = value
}

const handleLoaded = () => {
  const audio = audioEl.value
  if (!audio) return
  duration.value = Number.isFinite(audio.duration) ? audio.duration : 0
  hasError.value = false
  emit('loaded', duration.value)
}

const handleTimeUpdate = () => {
  const audio = audioEl.value
  if (!audio) return
  currentTime.value = audio.currentTime
  emit('timeupdate', { currentTime: audio.currentTime, duration: duration.value })
}

const handlePlay = () => {
  isPlaying.value = true
  emit('play')
}

const handlePause = () => {
  isPlaying.value = false
  emit('pause')
}

const handleEnded = () => {
  isPlaying.value = false
  emit('ended')
}

const handleError = () => {
  hasError.value = true
  isPlaying.value = false
  emit('error', '音频加载失败')
}

const reset = () => {
  const audio = audioEl.value
  if (audio) {
    audio.pause()
    audio.currentTime = 0
  }
  currentTime.value = 0
  duration.value = 0
  isPlaying.value = false
  hasError.value = false
  showTranscript.value = false
}

watch(() => props.src, reset)

onBeforeUnmount(() => {
  audioEl.value?.pause()
})

defineExpose({ toggle, replay, reset })
</script>
