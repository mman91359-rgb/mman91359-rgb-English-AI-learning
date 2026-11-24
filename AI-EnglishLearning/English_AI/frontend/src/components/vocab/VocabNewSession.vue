<template>
  <div class="w-full max-w-3xl mx-auto flex flex-col items-center px-gutter py-8">
    <LoadingState v-if="loading" class="flex-1" :message="$t('common.loading')" />

    <template v-else-if="!finished && currentWord">
      <!-- 进度：A 阶段按已通过词数，B 阶段按已填对词数 -->
      <div class="w-full flex items-center gap-4 mb-8">
        <QuizProgressBar :answered="stageProgress" :total="pack.length" />
      </div>

      <div class="w-full flex flex-col items-center text-center py-6">
        <span class="font-label-sm text-label-sm text-tertiary">
          {{ stage === 'A' ? $t('vocabNew.stageA') : $t('vocabNew.stageB') }}
        </span>
        <p class="mt-4 font-display-lg text-display-lg text-on-surface">{{ currentWord.word }}</p>
        <p v-if="currentWord.phonetic" class="mt-3 font-body-lg text-body-lg text-on-surface-variant">
          {{ currentWord.phonetic }}
        </p>
        <p v-if="currentWord.pos" class="mt-1 font-label-sm text-label-sm text-tertiary">{{ currentWord.pos }}</p>

        <!-- 例句：A 阶段展示完整句；B 阶段展示挖空句 + 中文提示 -->
        <template v-if="stage === 'A'">
          <p v-if="primaryExample" class="mt-6 font-body-lg text-body-lg text-on-surface-variant">
            {{ primaryExample.sentence }}
          </p>
        </template>
        <template v-else>
          <p v-if="currentFill" class="mt-6 font-body-lg text-body-lg text-on-surface-variant">
            {{ currentFill.stem }}
          </p>
          <p v-if="currentFill?.hint" class="mt-2 font-body-md text-body-md text-on-surface-variant">
            {{ $t('vocabNew.hint') }}：{{ currentFill.hint }}
          </p>
        </template>
      </div>

      <!-- A 阶段：形式 ① 选中文（后端判） -->
      <div v-if="stage === 'A' && form === 'CHOICE'" class="w-full grid grid-cols-2 gap-3 mt-2">
        <button
          v-for="(option, idx) in currentWord.choice.options"
          :key="idx"
          :class="btnSecondaryBlock"
          :disabled="checking"
          @click="submitChoice(option.text)"
        >
          {{ option.text }}
        </button>
      </div>

      <!-- A 阶段：形式 ② 想中文（前端自评） -->
      <div v-else-if="stage === 'A'" class="w-full grid grid-cols-2 gap-3 mt-2">
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

      <!-- 连对进度（仅 A 阶段）：本词已连续答对 n / 4 -->
      <p v-if="stage === 'A'" class="mt-6 font-label-md text-label-md text-on-surface-variant">
        {{ $t('vocabNew.streak', { current: streakOf(currentWordId), total: streakTarget }) }}
      </p>

      <!-- 反馈 + 下一词 -->
      <div v-if="feedback" class="w-full flex flex-col items-center mt-6">
        <p class="font-body-md text-body-md" :class="feedback.correct ? 'text-tertiary' : 'text-error'">
          {{ feedback.correct ? $t('vocabNew.correct') : $t('vocabNew.wrong') }}
        </p>
        <p v-if="!feedback.correct && feedback.correctAnswer" class="mt-1 font-body-md text-body-md text-on-surface">
          {{ $t('vocabNew.correctAnswer') }}：{{ feedback.correctAnswer }}
        </p>
        <button :class="[btnPrimaryBlock, 'mt-6']" @click="nextWord">
          {{ $t('wordReview.next') }}
        </button>
      </div>

      <!-- 完成态在下方 finished 分支展示 -->
    </template>

    <!-- 完成总结：调 complete 后展示 -->
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
import QuizProgressBar from '../quiz/QuizProgressBar.vue'
import LoadingState from '../ui/LoadingState.vue'
import { btnPrimary, btnPrimaryBlock, btnSecondaryBlock } from '../ui/buttonStyles'
import { attemptNewWord, completeNewWords, getNewWordPack, type NewWordPackVO } from '@/api/exercise'
import { useUserStore } from '@/stores/user'
import { useToast } from '@/composables/useToast'
import { NEW_WORD_MASTERY_STREAK } from '@/config/constants'
import { shuffle } from '@/utils/array'

const emit = defineEmits<{ complete: [] }>()

const { t } = useI18n()
const userStore = useUserStore()
const { show: toast } = useToast()

const pack = ref<NewWordPackVO[]>([])
const loading = ref(true)
const finished = ref(false)
const checking = ref(false)

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

const currentWord = computed<NewWordPackVO | null>(() =>
  stage.value === 'A' ? (queueA.value[0] ?? null) : (queueB.value[0] ?? null)
)
const currentWordId = computed(() => currentWord.value?.wordId ?? 0)
const currentFill = computed(() => currentWord.value?.fill ?? null)
const primaryExample = computed(() => currentWord.value?.examples?.[0] ?? null)
/** 形式轮换：0=选中文（后端判），1=想中文（前端自评） */
const form = computed<'CHOICE' | 'RECALL'>(() =>
  (formCount.value[currentWordId.value] ?? 0) % 2 === 0 ? 'CHOICE' : 'RECALL'
)
/** 进度 = 已离开当前阶段队列的词数（A 通过离队 / B 填对离队） */
const stageProgress = computed(() =>
  stage.value === 'A'
    ? pack.value.length - queueA.value.length
    : pack.value.length - queueB.value.length
)

const streakOf = (id: number) => streaks.value[id] ?? 0

onMounted(async () => {
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
      // 所有词都 fill=null：无 B 阶段，直接收口
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
  const items = pack.value.map(w => ({ wordId: w.wordId, passed: passedIds.value.includes(w.wordId) }))
  try {
    await completeNewWords(items)
  } catch (e) {
    toast(e instanceof Error ? e.message : t('vocabNew.completeFailed'), 'error')
  } finally {
    finished.value = true
  }
}
</script>
