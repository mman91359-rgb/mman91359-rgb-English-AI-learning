<template>
  <Teleport to="body">
    <Transition name="modal-fade">
      <div
        v-if="open"
        class="fixed inset-0 z-[130] flex items-end justify-center bg-scrim/45 backdrop-blur-md sm:items-center"
        role="dialog"
        aria-modal="true"
        aria-labelledby="word-detail-title"
        @click.self="emit('close')"
      >
        <div
          ref="panelRef"
          tabindex="-1"
          class="flex max-h-[85dvh] w-full max-w-md animate-sheet-up flex-col overflow-hidden rounded-t-[28px] bg-surface soft-shadow focus:outline-none motion-reduce:animate-none sm:rounded-[28px]"
          @click.stop
        >
          <header class="bg-on-primary-container px-4 pb-3 pt-2 dark:bg-primary-container">
            <div class="mx-auto mb-2.5 h-1 w-7 rounded-full bg-surface/30 dark:bg-on-primary-container/40"></div>

            <div class="flex items-baseline justify-between gap-2.5">
              <div class="flex min-w-0 flex-wrap items-baseline gap-x-2">
                <h2
                  id="word-detail-title"
                  class="break-words font-headline-sm text-headline-sm text-surface dark:text-on-primary-container"
                >
                  {{ word }}
                </h2>
                <span
                  v-if="phonetic"
                  class="shrink-0 font-label-md text-label-md text-primary-container/80 dark:text-on-primary-container/70"
                >
                  {{ phonetic }}
                </span>
              </div>

              <div class="-mr-1.5 flex shrink-0 items-start">
                <button
                  type="button"
                  class="flex h-8 w-8 items-center justify-center rounded-full transition-all duration-200 hover:bg-surface/15 active:scale-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-surface dark:hover:bg-on-primary-container/15"
                  :class="
                    favorited
                      ? 'text-warning-container dark:text-warning'
                      : 'text-primary-container/85 dark:text-on-primary-container/80'
                  "
                  :aria-label="$t('word.favorite')"
                  :aria-pressed="favorited"
                  @click="toggleFavorite"
                >
                  <span class="material-symbols-outlined text-icon-md" :class="{ fill: favorited }">
                    {{ favorited ? 'star' : 'star_outline' }}
                  </span>
                </button>
                <button
                  type="button"
                  class="flex h-8 w-8 items-center justify-center rounded-full text-primary-container/85 transition-all duration-200 hover:bg-surface/15 hover:text-surface active:scale-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-surface dark:text-on-primary-container/80 dark:hover:bg-on-primary-container/15"
                  :aria-label="$t('word.close')"
                  @click="emit('close')"
                >
                  <span class="material-symbols-outlined text-icon-md">close</span>
                </button>
              </div>
            </div>

            <div v-if="supported" class="mt-2 flex items-center gap-2">
              <button
                type="button"
                class="flex h-8 w-8 items-center justify-center rounded-full bg-surface/15 text-surface transition-all duration-200 hover:bg-primary-container hover:text-on-primary-container active:scale-95 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-surface dark:bg-on-primary-container/15 dark:text-on-primary-container dark:hover:bg-on-primary-container dark:hover:text-primary-container"
                :aria-label="$t('word.speak')"
                @click="speak(word)"
              >
                <span class="material-symbols-outlined text-icon-sm">volume_up</span>
              </button>

              <div class="flex gap-0.5 rounded-full bg-surface/15 p-0.5 dark:bg-on-primary-container/15">
                <button
                  v-for="item in accents"
                  :key="item"
                  type="button"
                  class="rounded-full px-2.5 py-1 font-label-md text-label-md transition-colors"
                  :class="
                    accent === item
                      ? 'bg-primary-container text-on-primary-container dark:bg-on-primary-container dark:text-primary-container'
                      : 'text-primary-container/85 hover:text-surface dark:text-on-primary-container/80 dark:hover:text-on-primary-container'
                  "
                  @click="setAccent(item)"
                >
                  {{ item }}
                </button>
              </div>

              <span
                v-if="detail?.tags.length"
                class="ml-auto shrink-0 rounded-full bg-warning-container px-2 py-0.5 font-label-md text-label-md text-on-warning-container"
              >
                {{ detail.tags[0] }}
              </span>
            </div>
          </header>

          <div class="overflow-y-auto px-4 pb-4 pt-3">
            <div v-if="loading" class="flex items-center gap-2 py-6 text-on-surface-variant">
              <span class="material-symbols-outlined animate-spin text-icon-md">progress_activity</span>
              <span class="font-body-md text-body-md">{{ $t('word.loading') }}</span>
            </div>

            <div v-else-if="error" class="py-6 text-on-surface-variant">
              <p class="font-body-md text-body-md">{{ error }}</p>
            </div>

            <template v-else-if="detail">
              <div class="flex flex-col gap-1">
                <div v-for="(sense, index) in detail.senses" :key="index" class="flex items-baseline gap-2">
                  <span class="w-6 shrink-0 font-label-md text-label-md text-primary dark:text-primary-container">
                    {{ sense.pos }}
                  </span>
                  <span
                    class="text-on-surface"
                    :class="isHighlight(sense) ? 'font-sense-lg text-sense-lg' : 'font-body-md text-body-md'"
                  >
                    {{ sense.meaning }}
                  </span>
                </div>
                <p v-if="!detail.senses.length" class="font-body-md text-body-md text-on-surface-variant">
                  {{ $t('word.notFound') }}
                </p>
              </div>

              <div class="mt-2.5 rounded-2xl bg-surface-container px-3 py-2.5">
                <p class="mb-1 font-label-md text-label-md tracking-wider text-on-surface-variant">
                  {{ $t('word.collocation') }}
                </p>
                <template v-if="detail.collocations.length">
                  <div
                    v-for="(item, index) in detail.collocations"
                    :key="index"
                    class="flex items-baseline justify-between gap-2.5 py-0.5"
                  >
                    <span class="font-body-sm text-body-sm text-on-surface">{{ item.phrase }}</span>
                    <span v-if="item.translation" class="shrink-0 font-label-md text-label-md text-on-surface-variant">
                      {{ item.translation }}
                    </span>
                  </div>
                </template>
                <p v-else class="font-body-sm text-body-sm text-on-surface-variant">
                  {{ $t('word.collocationEmpty') }}
                </p>
              </div>

              <div class="mt-2.5 rounded-2xl border border-outline-variant/60 bg-surface-container-low px-3 py-2.5">
                <p class="mb-1 font-label-md text-label-md tracking-wider text-on-surface-variant">
                  {{ $t('word.example') }}
                </p>
                <div v-if="detail.examples.length" class="space-y-2">
                  <div v-for="(item, index) in detail.examples" :key="index">
                    <p class="font-body-md text-body-md text-on-surface">{{ item.en }}</p>
                    <p v-if="item.cn" class="mt-1 font-body-sm text-body-sm text-on-surface-variant">{{ item.cn }}</p>
                  </div>
                </div>
                <p v-else class="font-body-sm text-body-sm text-on-surface-variant">
                  {{ $t('word.exampleEmpty') }}
                </p>
              </div>
            </template>
          </div>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup lang="ts">
import { computed, onBeforeUnmount, ref, watch } from 'vue'
import { getWordDetail } from '../../api/word'
import type { ExamLevel, WordDetail, WordSense } from '../../api/word'
import type { Accent } from '../../composables/useSpeech'
import { addVocabularySmart } from '../../api/exercise'
import { useSpeech } from '../../composables/useSpeech'
import { useToast } from '../../composables/useToast'
import { useModalBehavior } from '../../composables/useModalBehavior'
import { useUserStore } from '../../stores/user'

/**
 * 单词详情弹层：深紫头段 + 浅色释义段。
 * 头段承载词头、音标、英美发音与收藏；正文以定宽词性导轨排列多义项，
 * 常用搭配（平染卡）与例句（描边卡）靠材质区分。
 * 数据来源统一走 api/word.ts（已归一化为结构化字段）。
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

const panelRef = ref<HTMLElement | null>(null)

useModalBehavior({
  isOpen: () => props.open,
  container: panelRef,
  onEscape: () => emit('close'),
})

const { show: toast } = useToast()
const userStore = useUserStore()
const { accent, supported, speak, toggleAccent } = useSpeech()

const loading = ref(false)
const error = ref('')
const detail = ref<WordDetail | null>(null)
const favorited = ref(false)

/** 英音/美音切换项 */
const accents: Accent[] = ['US', 'UK']

/**
 * 用户考试等级：后端词库暂未提供义项级 examLevel 数据，先留空。
 * 接入后改为读取用户档案的考试等级，命中义项自动加粗为常考义。
 */
const examLevel = ref<ExamLevel | null>(null)

/** 命中考级标记的义项按常考义渲染（18/600） */
const isHighlight = (sense: WordSense): boolean =>
  examLevel.value !== null && (sense.examLevel === examLevel.value || sense.examLevel === 'both')

/** 音标随口音切换，缺对应音标时回落到默认音标 */
const phonetic = computed(() => {
  if (!detail.value) return ''
  const { phonetics, phonetic: fallback } = detail.value
  return (accent.value === 'UK' ? phonetics.uk : phonetics.us) || fallback
})

const setAccent = (next: Accent) => {
  if (accent.value !== next) toggleAccent()
}

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

const onKeydown = (event: KeyboardEvent) => {
  if (event.key === 'Escape') emit('close')
}

watch(
  () => [props.word, props.open] as const,
  ([word, open]) => {
    if (open && word) load()
    if (open) window.addEventListener('keydown', onKeydown)
    else window.removeEventListener('keydown', onKeydown)
  },
  { immediate: true },
)

onBeforeUnmount(() => window.removeEventListener('keydown', onKeydown))
</script>
