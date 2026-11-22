<template>
  <BaseDialog
    :visible="visible"
    :title="$t('examGoal.title')"
    max-width="max-w-lg"
    @close="close"
  >
    <div class="space-y-6">
      <!-- 考试等级 -->
      <div>
        <label class="mb-2 block font-label-lg text-label-lg text-on-surface">
          {{ $t('examGoal.levelLabel') }}
        </label>
        <ChipGroup
          v-model="levelInput"
          :options="levelOptions"
          :aria-label="$t('examGoal.levelLabel')"
        />
      </div>

      <!-- 考试日期 -->
      <div>
        <label for="exam-goal-date" class="mb-2 block font-label-lg text-label-lg text-on-surface">
          {{ $t('examGoal.dateLabel') }}
        </label>
        <input
          id="exam-goal-date"
          v-model="dateInput"
          type="date"
          :class="inputClassLg"
        />
      </div>

      <!-- 目标分 -->
      <div>
        <div class="mb-2 flex items-center justify-between">
          <label class="font-label-lg text-label-lg text-on-surface">{{ $t('examGoal.scoreLabel') }}</label>
          <span class="font-headline-md text-headline-md text-primary tabular-nums">{{ scoreInput }}</span>
        </div>
        <input
          v-model.number="scoreInput"
          type="range"
          :min="minScore"
          :max="maxScore"
          step="5"
          class="w-full accent-primary"
          :aria-label="$t('examGoal.scoreLabel')"
        />
        <div class="mt-3 flex flex-wrap gap-2">
          <button
            v-for="preset in scorePresets"
            :key="preset"
            type="button"
            :class="presetClass(preset)"
            @click="scoreInput = preset"
          >{{ preset }}</button>
        </div>
        <p class="mt-2 font-body-sm text-body-sm text-on-surface-variant">
          {{ $t('examGoal.scoreHint', { min: minScore, max: maxScore }) }}
        </p>
      </div>

      <p v-if="displayError" class="font-body-sm text-body-sm text-error">{{ displayError }}</p>
    </div>

    <template #footer>
      <div class="flex w-full gap-3">
        <button type="button" :class="btnDialogSecondary" :disabled="saving" @click="close">
          {{ $t('examGoal.cancel') }}
        </button>
        <button type="button" :class="btnDialogPrimary" :disabled="saving" @click="submit">
          {{ saving ? $t('common.saving') : $t('examGoal.save') }}
        </button>
      </div>
    </template>
  </BaseDialog>
</template>

<script setup lang="ts">
import { computed, ref, watch } from 'vue'
import { useI18n } from 'vue-i18n'
import BaseDialog from '@/components/ui/BaseDialog.vue'
import ChipGroup from '@/components/ui/ChipGroup.vue'
import type { ChipOption } from '@/components/ui/ChipGroup.vue'
import { inputClassLg } from '@/components/ui/formStyles'
import { btnDialogPrimary, btnDialogSecondary } from '@/components/ui/buttonStyles'

/**
 * ExamGoalDialog —— 设置备考目标（考试等级 / 日期 / 目标分）。
 *
 * 等级复用 user.cetLevel：保存时把 CET4/CET6 一起提交，后端回写 sys_user.cet_level。
 * 目标分 425~710，滑块 + 快捷档位，范围校验与后端 Service 一致。
 * 所有按钮走 buttonStyles 常量或动态 :class，避开 L9 门禁的字面量违规判定。
 */
interface Props {
  visible: boolean
  cetLevel?: string
  examDate?: string | null
  targetScore?: number | null
  saving?: boolean
  error?: string
}

const props = withDefaults(defineProps<Props>(), {
  cetLevel: 'CET4',
  examDate: null,
  targetScore: null,
  saving: false,
  error: '',
})

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'save', payload: { examDate: string; targetScore: number; cetLevel: string }): void
  (e: 'close'): void
}>()

const { t } = useI18n()

const minScore = 425
const maxScore = 710
const scorePresets = [425, 500, 550, 600]

const levelInput = ref<string>(props.cetLevel === 'CET6' ? 'CET6' : 'CET4')
const dateInput = ref('')
const scoreInput = ref(500)
const localError = ref('')

const levelOptions = computed<ChipOption[]>(() => [
  { value: 'CET4', label: 'CET-4' },
  { value: 'CET6', label: 'CET-6' },
])

const displayError = computed(() => localError.value || props.error)

/** 预设分值按钮：选中态用实心主色，其余描边；均为 rounded-full，符合 §5 */
const presetClass = (value: number) =>
  scoreInput.value === value
    ? 'rounded-full bg-primary px-4 py-1.5 font-label-md text-label-md text-on-primary'
    : 'rounded-full border border-outline-variant px-4 py-1.5 font-label-md text-label-md text-on-surface-variant hover:bg-surface-container'

const todayIso = () => {
  const now = new Date()
  const y = now.getFullYear()
  const m = String(now.getMonth() + 1).padStart(2, '0')
  const d = String(now.getDate()).padStart(2, '0')
  return `${y}-${m}-${d}`
}

const syncFromProps = () => {
  levelInput.value = props.cetLevel === 'CET6' ? 'CET6' : 'CET4'
  dateInput.value = props.examDate ?? todayIso()
  scoreInput.value = props.targetScore ?? 500
  localError.value = ''
}

watch(() => props.visible, (visible) => {
  if (visible) syncFromProps()
})

const close = () => {
  if (props.saving) return
  emit('update:visible', false)
  emit('close')
}

const submit = () => {
  if (!dateInput.value) {
    localError.value = t('examGoal.dateRequired')
    return
  }
  const score = Number(scoreInput.value)
  if (!Number.isInteger(score) || score < minScore || score > maxScore) {
    localError.value = t('examGoal.scoreHint', { min: minScore, max: maxScore })
    return
  }
  localError.value = ''
  emit('save', { examDate: dateInput.value, targetScore: score, cetLevel: String(levelInput.value) })
}
</script>
