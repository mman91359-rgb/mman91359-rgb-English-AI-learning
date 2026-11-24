<template>
  <div class="w-full max-w-3xl mx-auto flex flex-col items-center px-gutter py-8">
    <LoadingState v-if="loading" class="flex-1" :message="$t('common.loading')" />

    <template v-else-if="!finished && currentWord">
      <!-- 顶栏：进度 + 收藏/标熟/填词F + 只拼错词开关（A 阶段） -->
      <div class="w-full flex items-center gap-4 mb-6">
        <QuizProgressBar :answered="stageAnswered" :total="pack.length" class="flex-1 min-w-0" />
        <div class="flex items-center gap-2 shrink-0">
          <label v-if="stage === 'A'" class="flex items-center gap-2">
            <span class="font-label-sm text-label-sm text-on-surface-variant">{{ $t('vocabNew.onlyWrong') }}</span>
            <Switch v-model="onlyWrongWords" :aria-label="$t('vocabNew.onlyWrong')" />
          </label>
          <button :class="btnSecondarySm" :disabled="favoriting" @click="toggleFavorite">
            <AppIcon :name="isFavorite ? 'bookmark' : 'bookmark_border'" size="sm" />
            {{ isFavorite ? $t('vocabNew.favorited') : $t('vocabNew.favorite') }}
          </button>
          <button :class="btnSecondarySm" :disabled="familiarizing" @click="markFamiliarCurrent">
            <AppIcon name="check" size="sm" />
            {{ $t('vocabNew.markFamiliar') }}
          </button>
          <button :class="btnSecondarySm" disabled :aria-label="$t('learning.comingSoon')" @click="notifySpellComingSoon">
            <AppIcon name="edit_note" size="sm" />
            {{ $t('vocabNew.fillShortcut') }}
          </button>
        </div>
      </div>

      <!-- 阶段标签 -->
      <p class="w-full text-left font-label-sm text-label-sm text-tertiary">
        {{ stage === 'A' ? $t('vocabNew.stageA') : $t('vocabNew.stageB') }}
      </p>

      <!-- 单词区：英文靠左，点击发音 -->
      <div class="w-full flex items-start gap-4 text-left py-4">
        <div class="flex-1 min-w-0">
          <button :class="wordButtonClass" @click="playAudio">{{ currentWord.word }}</button>
          <p v-if="currentWord.phonetic" class="mt-2 font-body-lg text-body-lg text-on-surface-variant">
            {{ currentWord.phonetic }}
          </p>
          <p v-if="currentWord.pos" class="mt-1 font-label-sm text-label-sm text-tertiary">{{ currentWord.pos }}</p>
        </div>
        <!-- A 阶段竖排四点：答对亮一颗，答错整组隐藏 -->
        <div v-if="stage === 'A' && showDots" class="flex flex-col gap-1 shrink-0 pt-1">
          <span
            v-for="n in streakTarget"
            :key="n"
            class="w-2.5 h-2.5 rounded-full border-2"
            :class="dotFilled(n) ? 'border-tertiary bg-tertiary' : 'border-outline'"
          ></span>
        </div>
      </div>

      <!-- A 阶段：挖空例句 + 中文翻译（出题线索） -->
      <template v-if="stage === 'A'">
        <div v-if="currentStem" class="w-full text-left">
          <p class="font-body-lg text-body-lg text-on-surface-variant">{{ currentStem }}</p>
          <p v-if="currentTranslation" class="mt-2 font-body-md text-body-md text-on-surface-variant">
            {{ currentTranslation }}
          </p>
        </div>

        <!-- 竖排通栏横条选项（四选一，后端判） -->
        <div class="w-full flex flex-col gap-2 mt-4">
          <button
            v-for="row in optionRows"
            :key="row.index"
            :class="[btnSecondaryBlock, 'justify-start']"
            :disabled="checking || !!feedback"
            @click="submitChoice(row.raw)"
          >
            <span class="w-6 shrink-0 text-left font-label-md text-label-md text-tertiary">{{ row.index }}</span>
            <span v-if="row.posTag" class="shrink-0 font-label-sm text-label-sm text-tertiary">{{ row.posTag }}</span>
            <span class="text-left">{{ row.meaning }}</span>
          </button>
        </div>
      </template>

      <!-- B 阶段：句子挖空填词（后端判），填错可显示答案跳过 -->
      <template v-else>
        <div v-if="currentFill" class="w-full text-left">
          <p class="font-body-lg text-body-lg text-on-surface-variant">{{ currentFill.stem }}</p>
          <p v-if="currentFill.hint" class="mt-2 font-body-md text-body-md text-on-surface-variant">
            {{ $t('vocabNew.hint') }}：{{ currentFill.hint }}
          </p>
        </div>
        <div class="w-full flex flex-col items-center mt-4">
          <input
            v-model="fillAnswer"
            class="w-full h-14 bg-surface-container-low border-b-2 rounded-t-lg px-4 text-center font-headline-md text-headline-md text-on-surface outline-none focus:border-primary"
            :disabled="checking || !!feedback"
            :placeholder="$t('vocabNew.fillPlaceholder')"
            @keyup.enter="submitFill"
          />
          <button
            v-if="!feedback"
            :class="[btnPrimaryBlock, 'mt-6']"
            :disabled="checking || !fillAnswer.trim()"
            @click="submitFill"
          >
            {{ $t('vocabNew.submit') }}
          </button>
        </div>
      </template>

      <!-- 反馈：A 答后还原完整句+翻译+正确释义；B 答后显示答案 -->
      <div v-if="feedback" class="w-full flex flex-col items-center mt-4">
        <p class="font-body-md text-body-md" :class="feedback.correct ? 'text-tertiary' : 'text-error'">
          {{ feedback.correct ? $t('vocabNew.correct') : $t('vocabNew.wrong') }}
        </p>
        <template v-if="stage === 'A' && feedback.fullSentence">
          <p class="mt-2 w-full text-left font-body-lg text-body-lg text-on-surface">{{ feedback.fullSentence }}</p>
          <p v-if="feedback.fullTranslation" class="mt-1 w-full text-left font-body-md text-body-md text-on-surface-variant">
            {{ feedback.fullTranslation }}
          </p>
        </template>
        <p class="mt-1 font-body-md text-body-md text-on-surface">
          {{ $t('vocabNew.correctAnswer') }}：{{ feedback.correctAnswer }}
        </p>
      </div>

      <!-- 底部统一按钮位：答题前「看答案」→ 答题后「下一词」；B 阶段仅答后出「下一词」 -->
      <div class="w-full mt-6">
        <button
          v-if="stage === 'A'"
          :class="feedback ? btnPrimaryBlock : btnSecondaryBlock"
          @click="feedback ? nextWord() : revealAnswer()"
        >
          {{ feedback ? $t('wordReview.next') : $t('vocabNew.showAnswer') }}
        </button>
        <button v-else-if="feedback" :class="btnPrimaryBlock" @click="nextWord">
          {{ $t('wordReview.next') }}
        </button>
      </div>
    </template>

    <!-- 完成总结 -->
    <template v-else-if="finished">
      <AppIcon name="celebration" size="3xl" tone="primary" />
      <p class="mt-4 font-headline-md text-headline-md text-on-surface">{{ $t('vocabNew.doneTitle') }}</p>
      <p class="mt-2 font-body-md text-body-md text-on-surface-variant">
        {{ $t('vocabNew.doneSummary', { count: passedIds.length }) }}
      </p>
      <button :class="[btnPrimary, 'mt-8']" @click="emit('complete')">
        {{ $t('common.finish') }}
      </button>
    </template>

    <!-- 空词包 -->
    <template v-else>
      <p class="font-body-lg text-body-lg text-on-surface-variant">{{ $t('vocabNew.empty') }}</p>
      <button :class="[btnPrimary, 'mt-6']" @click="emit('complete')">
        {{ $t('common.finish') }}
      </button>
    </template>
  </div>
</template>

<script setup lang="ts">
import { computed, onMounted, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import AppIcon from '../ui/AppIcon.vue'
import Switch from '../ui/Switch.vue'
import QuizProgressBar from '../quiz/QuizProgressBar.vue'
import LoadingState from '../ui/LoadingState.vue'
import {
  btnPrimary,
  btnPrimaryBlock,
  btnSecondaryBlock,
  btnSecondarySm,
} from '../ui/buttonStyles'
import {
  attemptNewWord,
  completeNewWords,
  getNewWordPack,
  addVocabulary,
  markFamiliar,
  addWordFavorite,
  removeWordFavorite,
  getWordFavorites,
  type NewWordPackVO,
} from '@/api/exercise'
import { useUserStore } from '@/stores/user'
import { useToast } from '@/composables/useToast'
import { useSpeech } from '@/composables/useSpeech'
import { NEW_WORD_MASTERY_STREAK } from '@/config/constants'
import { shuffle } from '@/utils/array'

const emit = defineEmits<{ complete: [] }>()

const { t } = useI18n()
const userStore = useUserStore()
const { show: toast } = useToast()
const { speak } = useSpeech()

const pack = ref<NewWordPackVO[]>([])
const loading = ref(true)
const finished = ref(false)
const checking = ref(false)
const favoriting = ref(false)
const familiarizing = ref(false)
const favorites = ref<Set<string>>(new Set())
const familiarizedIds = ref<number[]>([])

type Stage = 'A' | 'B'
const stage = ref<Stage>('A')
/** A 阶段队列：未达标词，答错回队尾 */
const queueA = ref<NewWordPackVO[]>([])
/** B 阶段队列：整组 A 达标后统一进入的填词队列 */
const queueB = ref<NewWordPackVO[]>([])
const streaks = ref<Record<number, number>>({})
const passedIds = ref<number[]>([])
/** A 阶段答错过的词（供「只拼错词」筛选 B 队列） */
const wrongIds = ref<number[]>([])
/** 只拼错词开关：开启后 B 只收 A 答错过的词 */
const onlyWrongWords = ref(false)

const fillAnswer = ref('')
type Feedback = { correct: boolean; correctAnswer: string; fullSentence?: string; fullTranslation?: string }
const feedback = ref<Feedback | null>(null)

const streakTarget = NEW_WORD_MASTERY_STREAK
const wordButtonClass =
  'rounded-full font-display-lg text-display-lg text-on-surface underline decoration-dashed decoration-outline-variant underline-offset-8 hover:text-primary'

const currentWord = computed<NewWordPackVO | null>(() =>
  stage.value === 'A' ? (queueA.value[0] ?? null) : (queueB.value[0] ?? null)
)
const currentWordId = computed(() => currentWord.value?.wordId ?? 0)
const currentFill = computed(() => currentWord.value?.fill ?? null)
/** A 出题：后端权威挖空句（fill.stem）；fill=null 时退化为空（该词无挖空线索） */
const currentStem = computed(() => currentWord.value?.fill?.stem ?? '')
/** A 出题：例句中文翻译 */
const currentTranslation = computed(() => currentWord.value?.examples?.[0]?.translation ?? '')

/** 进度：A=已达标离队数；B=已填对/跳过离队数 */
const stageAnswered = computed(() =>
  stage.value === 'A'
    ? pack.value.length - queueA.value.length
    : totalB.value - queueB.value.length
)
const totalB = ref(0)

const streakOf = (id: number) => streaks.value[id] ?? 0
const showDots = computed(() => stage.value === 'A' && !(feedback.value && !feedback.value.correct))
const dotFilled = (n: number) => streakOf(currentWordId.value) >= n

const splitOption = (text: string) => {
  const m = text.match(/^([a-z]+\.)\s*(.*)$/)
  return m ? { posTag: m[1], meaning: m[2] } : { posTag: '', meaning: text }
}
const optionRows = computed(() =>
  (currentWord.value?.choice?.options ?? []).map((o, i) => ({
    index: i + 1,
    raw: o.text,
    ...splitOption(o.text),
  }))
)

const isFavorite = computed(() =>
  !!currentWord.value && favorites.value.has(currentWord.value.word.toLowerCase())
)

onMounted(async () => {
  const userId = userStore.userId
  if (userId) {
    getWordFavorites(userId)
      .then(list => { favorites.value = new Set(list.map(f => f.word.toLowerCase())) })
      .catch(() => { /* 收藏状态拉取失败不阻塞新学流程 */ })
  }
  try {
    pack.value = await getNewWordPack(userStore.dailyNewWords ?? 10)
    queueA.value = shuffle([...pack.value])
  } catch (e) {
    toast(e instanceof Error ? e.message : t('vocabNew.loadFailed'), 'error')
    pack.value = []
  } finally {
    loading.value = false
  }
})

const playAudio = () => {
  const word = currentWord.value
  if (!word) return
  speak(word.word)
}

const toggleFavorite = async () => {
  const word = currentWord.value
  const userId = userStore.userId
  if (!word || !userId || favoriting.value) return
  favoriting.value = true
  const key = word.word.toLowerCase()
  try {
    if (favorites.value.has(key)) {
      await removeWordFavorite(userId, word.word)
      const next = new Set(favorites.value)
      next.delete(key)
      favorites.value = next
    } else {
      await addWordFavorite(userId, word.word)
      const next = new Set(favorites.value)
      next.add(key)
      favorites.value = next
    }
  } catch (e) {
    toast(e instanceof Error ? e.message : t('vocabNew.favoriteFailed'), 'error')
  } finally {
    favoriting.value = false
  }
}

/** 标熟 = 直接完成入库、不再安排复习：addVocabulary 幂等拿 id → markFamiliar */
const markFamiliarCurrent = async () => {
  const word = currentWord.value
  const userId = userStore.userId
  if (!word || !userId || familiarizing.value) return
  familiarizing.value = true
  try {
    const saved = await addVocabulary({
      userId,
      word: word.word,
      translation: word.meanings?.[0]?.meaning,
      source: 'vocab-new',
    })
    await markFamiliar(saved.id, userId, true)
    familiarizedIds.value = [...familiarizedIds.value, word.wordId]
    toast(t('vocabNew.familiarDone'), 'success')
    await dropCurrentAndAdvance()
  } catch (e) {
    toast(e instanceof Error ? e.message : t('vocabNew.familiarFailed'), 'error')
  } finally {
    familiarizing.value = false
  }
}

/** 填词 F = 随手拼独立入口；拼写页等后端专用接口，当前禁用 */
const notifySpellComingSoon = () => {
  toast(t('learning.comingSoon'), 'info')
}

const advance = (id: number) => {
  streaks.value = { ...streaks.value, [id]: (streaks.value[id] ?? 0) + 1 }
}

const markPassed = (word: NewWordPackVO) => {
  if (!passedIds.value.includes(word.wordId)) passedIds.value = [...passedIds.value, word.wordId]
}

const markWrong = (word: NewWordPackVO) => {
  if (!wrongIds.value.includes(word.wordId)) wrongIds.value = [...wrongIds.value, word.wordId]
}

const submitChoice = async (answer: string) => {
  const word = currentWord.value
  if (!word || checking.value || feedback.value) return
  checking.value = true
  try {
    const res = await attemptNewWord({ wordId: word.wordId, phase: 'CHOICE', userAnswer: answer })
    applyResult(word, res.isCorrect, res.correctAnswer)
  } catch (e) {
    toast(e instanceof Error ? e.message : t('vocabNew.attemptFailed'), 'error')
  } finally {
    checking.value = false
  }
}

/** 看答案 = 放弃本题：显示答案、streak 清零、回队尾 */
const revealAnswer = () => {
  const word = currentWord.value
  if (!word || feedback.value) return
  const correctAnswer = word.meanings?.[0]?.meaning ?? word.word
  applyResult(word, false, correctAnswer)
}

/** A 统一结果：答对 streak+1、答错清零记错词；达标不立即出队，留到 nextWord */
const applyResult = (word: NewWordPackVO, correct: boolean, correctAnswer: string) => {
  feedback.value = {
    correct,
    correctAnswer,
    fullSentence: word.examples?.[0]?.sentence ?? '',
    fullTranslation: word.examples?.[0]?.translation ?? '',
  }
  if (correct) {
    advance(word.wordId)
  } else {
    streaks.value = { ...streaks.value, [word.wordId]: 0 }
    markWrong(word)
  }
}

const submitFill = async () => {
  const word = currentWord.value
  const fill = currentFill.value
  if (!word || !fill || checking.value || feedback.value || !fillAnswer.value.trim()) return
  checking.value = true
  try {
    const res = await attemptNewWord({ wordId: word.wordId, phase: 'FILL', userAnswer: fillAnswer.value.trim() })
    feedback.value = { correct: res.isCorrect, correctAnswer: res.correctAnswer }
  } catch (e) {
    toast(e instanceof Error ? e.message : t('vocabNew.attemptFailed'), 'error')
  } finally {
    checking.value = false
  }
}

/** 当前词离队后的队列推进（标熟也走这里：不记 passed、不进 B） */
const dropCurrentAndAdvance = async () => {
  if (!currentWord.value) return
  feedback.value = null
  fillAnswer.value = ''
  if (stage.value === 'A') {
    queueA.value = queueA.value.slice(1)
    if (queueA.value.length === 0) {
      await saveGroup()
      enterStageB()
    }
  } else {
    queueB.value = queueB.value.slice(1)
    if (queueB.value.length === 0) finished.value = true
  }
}

/** A 阶段下一词：达标出队、未达标回队尾；整组达标即落库并进入 B */
const nextWord = async () => {
  const word = currentWord.value
  if (!word) return
  const correct = feedback.value?.correct ?? false
  feedback.value = null
  fillAnswer.value = ''

  if (stage.value === 'A') {
    const passed = streakOf(word.wordId) >= streakTarget
    queueA.value = queueA.value.slice(1)
    if (!passed) queueA.value = [...queueA.value, word]

    if (queueA.value.length === 0) {
      // 整组 A 达标 → 全部落库（含标熟词排除），不再等 B
      await saveGroup()
      enterStageB()
    }
  } else {
    queueB.value = queueB.value.slice(1)
    if (correct) {
      markPassed(word)
      if (queueB.value.length === 0) finished.value = true
    } else {
      // 填错回队尾重填，直到填对才离开（像不背单词拼写）
      queueB.value = [...queueB.value, word]
    }
  }
}

/** 整组 A 达标落库：passed=true（标熟词自行入库，传 false 让后端跳过） */
const saveGroup = async () => {
  pack.value.forEach(markPassed)
  const items = pack.value.map(w => ({
    wordId: w.wordId,
    passed: !familiarizedIds.value.includes(w.wordId),
  }))
  try {
    await completeNewWords(items)
  } catch (e) {
    toast(e instanceof Error ? e.message : t('vocabNew.completeFailed'), 'error')
  }
}

/** 整组进入 B：fill=null 跳过；「只拼错词」开启时只收 A 答错词 */
const enterStageB = () => {
  let candidates = pack.value.filter(w => w.fill)
  if (onlyWrongWords.value) candidates = candidates.filter(w => wrongIds.value.includes(w.wordId))
  queueB.value = shuffle([...candidates])
  totalB.value = queueB.value.length
  stage.value = 'B'
  if (queueB.value.length === 0) finished.value = true
}
</script>
