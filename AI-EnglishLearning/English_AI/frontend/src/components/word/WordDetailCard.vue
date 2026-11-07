<template>
  <Teleport to="body">
    <Transition name="modal-fade">
      <div
        v-if="open"
        class="fixed inset-0 z-[130] flex items-end justify-center bg-black/45 backdrop-blur-[2px] sm:items-center"
        role="dialog"
        aria-modal="true"
        @click.self="emit('close')"
      >
        <div
          class="flex max-h-[85vh] w-full max-w-md flex-col overflow-hidden rounded-t-[28px] bg-surface soft-shadow sm:rounded-[28px]"
          @click.stop
        >
          <header class="flex items-start justify-between gap-3 px-6 pb-2 pt-5">
            <div class="min-w-0">
              <div class="flex items-center gap-3">
                <h2 class="truncate font-headline-sm text-headline-sm text-on-surface">{{ word }}</h2>
                <button
                  v-if="supported"
                  type="button"
                  class="flex h-9 w-9 shrink-0 items-center justify-center rounded-full text-primary transition-colors hover:bg-primary-container/40"
                  :aria-label="$t('word.speak')"
                  @click="speak(word)"
                >
                  <span class="material-symbols-outlined text-icon-md">volume_up</span>
                </button>
              </div>
              <p v-if="detail?.phonetic" class="mt-1 font-body-md text-body-md text-on-surface-variant">
                {{ detail.phonetic }}
              </p>
            </div>
            <div class="flex shrink-0 items-center gap-1">
              <button
                v-if="supported"
                type="button"
                class="flex h-9 items-center gap-1 rounded-full px-2 font-label-md text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high"
                @click="toggleAccent"
              >
                <span class="material-symbols-outlined text-icon-sm">record_voice_over</span>
                {{ accent === 'US' ? 'US' : 'UK' }}
              </button>
              <button
                type="button"
                class="flex h-9 w-9 items-center justify-center rounded-full transition-colors hover:bg-surface-container-high"
                :class="favorited ? 'text-warning' : 'text-on-surface-variant'"
                :aria-label="$t('word.favorite')"
                @click="toggleFavorite"
              >
                <span class="material-symbols-outlined text-icon-md">{{ favorited ? 'star' : 'star_outline' }}</span>
              </button>
              <button
                type="button"
                class="flex h-9 w-9 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-surface-container-high"
                :aria-label="$t('adminConsole.common.close')"
                @click="emit('close')"
              >
                <span class="material-symbols-outlined text-icon-md">close</span>
              </button>
            </div>
          </header>

          <div class="overflow-y-auto px-6 py-4">
            <div v-if="loading" class="flex items-center gap-2 py-6 text-on-surface-variant">
              <span class="material-symbols-outlined animate-spin text-icon-md">progress_activity</span>
              <span class="font-body-md text-body-md">{{ $t('word.loading') }}</span>
            </div>

            <div v-else-if="error" class="py-6 text-on-surface-variant">
              <p class="font-body-md text-body-md">{{ error }}</p>
            </div>

            <div v-else-if="detail" class="flex flex-col gap-4">
              <div>
                <p class="mb-1 font-label-lg text-label-lg text-on-surface-variant">{{ detail.pos }}</p>
                <p class="font-body-lg text-body-lg text-on-surface">{{ detail.translation }}</p>
              </div>

              <div v-if="detail.collocation" class="rounded-2xl bg-surface-container-low p-4">
                <p class="mb-1 font-label-md text-label-md text-on-surface-variant">{{ $t('word.collocation') }}</p>
                <p class="font-body-md text-body-md text-on-surface">{{ detail.collocation }}</p>
              </div>

              <div v-if="detail.example" class="rounded-2xl bg-surface-container-low p-4">
                <p class="mb-1 font-label-md text-label-md text-on-surface-variant">{{ $t('word.example') }}</p>
                <p class="font-body-md text-body-md text-on-surface">{{ detail.example }}</p>
                <p v-if="detail.exampleTranslation" class="mt-1 font-body-md text-body-md text-on-surface-variant">
                  {{ detail.exampleTranslation }}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup lang="ts">
import { ref, watch } from 'vue'
import { getWordDetail } from '../../api/word'
import type { WordDetail } from '../../api/word'
import { addVocabularySmart } from '../../api/exercise'
import { useSpeech } from '../../composables/useSpeech'
import { useToast } from '../../composables/useToast'
import { useUserStore } from '../../stores/user'

/**
 * 单词详情弹窗：音标 + 分词性释义 + 英美发音切换 + 收藏到单词本。
 * 数据来源统一走 api/word.ts（为 C3 本地词典预留），收藏复用 vocabulary/smart。
 */
const props = defineProps<{
  /** 待查询的单词 */
  word: string
  /** 是否打开 */
  open: boolean
}>()

const emit = defineEmits<{
  (e: 'close'): void
  (e: 'favorite', word: string): void
}>()

const { show: toast } = useToast()
const userStore = useUserStore()
const { accent, supported, speak, toggleAccent } = useSpeech()

const loading = ref(false)
const error = ref('')
const detail = ref<WordDetail | null>(null)
const favorited = ref(false)

const load = async () => {
  if (!props.word) return
  loading.value = true
  error.value = ''
  detail.value = null
  favorited.value = false
  try {
    detail.value = await getWordDetail(props.word)
  } catch (e) {
    error.value = e instanceof Error ? e.message : '查询失败'
  } finally {
    loading.value = false
  }
}

const toggleFavorite = async () => {
  if (!userStore.userId) {
    toast('请先登录', 'warning')
    return
  }
  try {
    await addVocabularySmart({ userId: userStore.userId, word: props.word, source: 'quiz' })
    favorited.value = true
    emit('favorite', props.word)
    toast('已加入单词本', 'success')
  } catch (e) {
    toast(e instanceof Error ? e.message : '收藏失败', 'error')
  }
}

watch(
  () => [props.word, props.open] as const,
  ([word, open]) => {
    if (open && word) load()
  },
  { immediate: true },
)
</script>
