<template>
  <div class="w-full max-w-3xl mx-auto flex flex-col items-center px-gutter py-8">
    <LoadingState v-if="loading" class="flex-1" :message="$t('common.loading')" />

    <template v-else-if="!finished && currentWord">
      <!-- 顶栏：进度 + 收藏/标熟/填词F（发音与看答案已下移到各自位置） -->
      <div class="w-full flex items-center gap-4 mb-6">
        <QuizProgressBar :answered="stageProgress" :total="pack.length" class="flex-1 min-w-0" />
        <div class="flex items-center gap-2 shrink-0">
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

      <!-- 单词区：英文整体靠最左（原 P 发音方块的位置），点击单词发音 -->
      <div class="w-full flex items-start gap-4 text-left py-6">
        <template v-if="!isListen">
          <div class="flex-1 min-w-0">
            <button :class="wordButtonClass" @click="playAudio">{{ currentWord.word }}</button>
            <p v-if="currentWord.phonetic" class="mt-2 font-body-lg text-body-lg text-on-surface-variant">
              {{ currentWord.phonetic }}
            </p>
            <p v-if="currentWord.pos" class="mt-1 font-label-sm text-label-sm text-tertiary">{{ currentWord.pos }}</p>
            <p class="mt-1 font-label-sm text-label-sm text-tertiary">{{ $t('vocabNew.tapToSpeak') }}</p>
          </div>
          <!-- 竖排四点：答对亮一颗，答错整组隐藏 -->
          <div v-if="showDots" class="flex flex-col gap-1 shrink-0 pt-1">
            <span
              v-for="n in streakTarget"
              :key="n"
              class="w-2.5 h-2.5 rounded-full border-2"
              :class="dotFilled(n) ? 'border-tertiary bg-tertiary' : 'border-outline'"
            ></span>
          </div>
        </template>
        <!-- 听音形式：单词隐藏，发音按钮 + 右侧四点 -->
        <template v-else>
          <button :class="[btnSecondary, 'shrink-0']" :disabled="checking" @click="playAudio">
            <AppIcon name="volume_up" size="sm" />
            {{ $t('vocabNew.play') }}
          </button>
          <div v-if="showDots" class="flex flex-col gap-1 shrink-0">
            <span
              v-for="n in streakTarget"
              :key="n"
              class="w-2.5 h-2.5 rounded-full border-2"
              :class="dotFilled(n) ? 'border-tertiary bg-tertiary' : 'border-outline'"
            ></span>
          </div>
        </template>
      </div>

      <!-- 例句：A 阶段非听音展示完整句；B 阶段展示挖空句 + 提示 -->
      <div class="w-full text-left">
        <template v-if="stage === 'A' && !isListen">
          <p v-if="primaryExample" class="font-body-lg text-body-lg text-on-surface-variant">
            {{ primaryExample.sentence }}
          </p>
        </template>
        <template v-else>
          <p v-if="currentFill" class="font-body-lg text-body-lg text-on-surface-variant">
            {{ currentFill.stem }}
          </p>
          <p v-if="currentFill?.hint" class="mt-2 font-body-md text-body-md text-on-surface-variant">
            {{ $t('vocabNew.hint') }}：{{ currentFill.hint }}
          </p>
        </template>
      </div>

      <!-- A 阶段：选中文（形式 ①③，后端判）—— 竖排通栏横条 -->
      <div v-if="stage === 'A' && isChoice" class="w-full flex flex-col gap-2 mt-4">
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

      <!-- A 阶段：形式 ② 想中文（前端自评） -->
      <div v-else-if="stage === 'A'" class="w-full grid grid-cols-2 gap-3 mt-4">
        <button :class="btnPrimaryBlock" :disabled="checking" @click="selfRate(true)">
          {{ $t('vocabNew.recalled') }}
        </button>
        <button :class="btnSecondaryBlock" :disabled="checking" @click="selfRate(false)">
          {{ $t('vocabNew.notRecalled') }}
        </button>
      </div>

      <!-- B 阶段：句子填词（后端判） -->
      <div v-else class="w-full flex flex-col items-center mt-2">
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

      <!-- 反馈文字（按钮位置见底部统一操作区） -->
      <div v-if="feedback" class="w-full flex flex-col items-center mt-4">
        <p class="font-body-md text-body-md" :class="feedback.correct ? 'text-tertiary' : 'text-error'">
          {{ feedback.correct ? $t('vocabNew.correct') : $t('vocabNew.wrong') }}
        </p>
        <p v-if="!feedback.correct && feedback.correctAnswer" class="mt-1 font-body-md text-body-md text-on-surface">
          {{ $t('vocabNew.correctAnswer') }}：{{ feedback.correctAnswer }}
        </p>
      </div>

      <!-- 底部统一按钮位：答题前「看答案」→ 答题后同位置切换「下一题」 -->
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

    <!-- 完成总结：调 complete 后展示 -->
    <template v-else-if="finished">
      <AppIcon name="celebration" size="3xl" tone="primary" />
      <p class="mt-4 font-headline-md text-headline-md text-on-surface">{{ $t('vocabNew.doneTitle') }}</p>
      <p class="mt-2 font-body-md text-body-md text-on-surface-variant">
        {{ $t('vocabNew.doneSummary', { count: completedCount }) }}
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
import QuizProgressBar from '../quiz/QuizProgressBar.vue'
import LoadingState from '../ui/LoadingState.vue'
import {
  btnPrimary,
  btnPrimaryBlock,
  btnSecondary,
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
/** A 阶段队列：未通过的词，答错回队尾 */
const queueA = ref<NewWordPackVO[]>([])
/** B 阶段队列：A 通过且有 fill 的词，填错回队尾 */
const queueB = ref<NewWordPackVO[]>([])
const streaks = ref<Record<number, number>>({})
const formCount = ref<Record<number, number>>({})
const passedIds = ref<number[]>([])

const fillAnswer = ref('')
const feedback = ref<{ correct: boolean; correctAnswer: string } | null>(null)

const streakTarget = NEW_WORD_MASTERY_STREAK
/** 点击单词发音：去除默认按钮底色，保留单词字号 + 虚线下划线提示可点 */
const wordButtonClass =
  'rounded-full font-display-lg text-display-lg text-on-surface underline decoration-dashed decoration-outline-variant underline-offset-8 hover:text-primary'

const currentWord = computed<NewWordPackVO | null>(() =>
  stage.value === 'A' ? (queueA.value[0] ?? null) : (queueB.value[0] ?? null)
)
const currentWordId = computed(() => currentWord.value?.wordId ?? 0)
const currentFill = computed(() => currentWord.value?.fill ?? null)
const primaryExample = computed(() => currentWord.value?.examples?.[0] ?? null)
/** 形式轮换：0=选中文 1=想中文 2=听音选中文 3=听音想中文 */
const form = computed<'CHOICE' | 'RECALL' | 'LISTEN_CHOICE' | 'LISTEN_RECALL'>(() => {
  const n = formCount.value[currentWordId.value] ?? 0
  return (['CHOICE', 'RECALL', 'LISTEN_CHOICE', 'LISTEN_RECALL'] as const)[n % 4]
})
const isListen = computed(() => form.value === 'LISTEN_CHOICE' || form.value === 'LISTEN_RECALL')
const isChoice = computed(() => form.value === 'CHOICE' || form.value === 'LISTEN_CHOICE')
/** 进度 = 已离开当前阶段队列的词数（A 通过离队 / B 填对离队） */
const stageProgress = computed(() =>
  stage.value === 'A'
    ? pack.value.length - queueA.value.length
    : pack.value.length - queueB.value.length
)
/** 完成计数 = 真正通过 + 标熟（标熟=直接完成入库，后端 complete 跳过它们） */
const completedCount = computed(() =>
  pack.value.filter(w => passedIds.value.includes(w.wordId) || familiarizedIds.value.includes(w.wordId)).length
)

const streakOf = (id: number) => streaks.value[id] ?? 0
/** 答错反馈时整组隐藏；下一次回答（streak 已清零）回到 4 个空心 */
const showDots = computed(() => stage.value === 'A' && !(feedback.value && !feedback.value.correct))
const dotFilled = (n: number) => streakOf(currentWordId.value) >= n

/** 选项全文拆出词性前缀（后端 translation 自带 "n. "/ "adj. " 前缀），不做脑补 */
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

/** 播放单词发音（点击单词 / 听音形式按钮）；有例句时连同例句一起朗读 */
const playAudio = () => {
  const word = currentWord.value
  if (!word) return
  const example = word.examples?.[0]?.sentence
  speak(example ? `${word.word}. ${example}` : word.word)
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

/** 顶栏「填词 F」= 随手拼独立入口；拼写页等后端专用接口，当前只提示开发中 */
const notifySpellComingSoon = () => {
  toast(t('learning.comingSoon'), 'info')
}

const advanceForm = (id: number) => {
  formCount.value = { ...formCount.value, [id]: (formCount.value[id] ?? 0) + 1 }
}

const markPassed = (word: NewWordPackVO) => {
  if (passedIds.value.includes(word.wordId)) return
  passedIds.value = [...passedIds.value, word.wordId]
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

const selfRate = (recalled: boolean) => {
  const word = currentWord.value
  if (!word || checking.value || feedback.value) return
  const correctAnswer = word.meanings?.[0]?.meaning ?? word.word
  applyResult(word, recalled, correctAnswer)
}

/** 看答案 = 放弃本题：显示正确答案、streak 清零回队尾，底部按钮切到「下一题」 */
const revealAnswer = () => {
  const word = currentWord.value
  if (!word || feedback.value) return
  const correctAnswer = word.meanings?.[0]?.meaning ?? word.word
  applyResult(word, false, correctAnswer)
}

/** A 阶段统一结果处理：连对达标离队进 B，答错清零回队尾 */
const applyResult = (word: NewWordPackVO, correct: boolean, correctAnswer: string) => {
  feedback.value = { correct, correctAnswer }
  advanceForm(word.wordId)
  if (correct) {
    const next = streakOf(word.wordId) + 1
    streaks.value = { ...streaks.value, [word.wordId]: next }
    // fill=null 的词没有 B 阶段，A 达标即算通过；有 fill 的词留给 B 阶段填对后标记
    if (next >= streakTarget && !word.fill) markPassed(word)
  } else {
    streaks.value = { ...streaks.value, [word.wordId]: 0 }
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

/** 当前词离队后的队列推进；标熟也走这里（不进 B、不标记 passed） */
const dropCurrentAndAdvance = async () => {
  if (!currentWord.value) return
  feedback.value = null
  fillAnswer.value = ''
  if (stage.value === 'A') {
    queueA.value = queueA.value.slice(1)
    if (queueA.value.length === 0) {
      stage.value = 'B'
      queueB.value = shuffle(queueB.value)
      if (queueB.value.length === 0) await finish()
    }
  } else {
    queueB.value = queueB.value.slice(1)
    if (queueB.value.length === 0) await finish()
  }
}

/** 下一词：A 阶段达标离队、未达标回队尾；B 阶段填对离队、填错回队尾 */
const nextWord = async () => {
  const word = currentWord.value
  if (!word) return
  const correct = feedback.value?.correct ?? false
  feedback.value = null
  fillAnswer.value = ''

  if (stage.value === 'A') {
    const passed = streakOf(word.wordId) >= streakTarget
    queueA.value = queueA.value.slice(1)
    if (passed) {
      if (word.fill) queueB.value = [...queueB.value, word]
    } else {
      queueA.value = [...queueA.value, word]
    }
    if (queueA.value.length === 0) {
      stage.value = 'B'
      queueB.value = shuffle(queueB.value)
      if (queueB.value.length === 0) await finish()
    }
  } else {
    queueB.value = queueB.value.slice(1)
    if (correct) markPassed(word)
    else queueB.value = [...queueB.value, word]
    if (queueB.value.length === 0) await finish()
  }
}

const finish = async () => {
  // 标熟词已自行入库并置 FAMILIAR，complete 里传 false 让后端跳过，避免重置其排期
  const items = pack.value.map(w => ({
    wordId: w.wordId,
    passed: passedIds.value.includes(w.wordId) && !familiarizedIds.value.includes(w.wordId),
  }))
  try {
    await completeNewWords(items)
  } catch (e) {
    toast(e instanceof Error ? e.message : t('vocabNew.completeFailed'), 'error')
  } finally {
    finished.value = true
  }
}
</script>
