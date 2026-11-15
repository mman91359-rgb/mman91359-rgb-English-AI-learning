<script setup lang="ts">
import { computed } from 'vue'
import AppIcon from '@/components/ui/AppIcon.vue'

interface Option {
  key: string
  text: string
}

const props = defineProps<{
  options: Option[]
  selected?: string
  answerKey?: string
  isCorrect?: boolean
  revealed: boolean
  disabled: boolean
}>()

const emit = defineEmits<{
  select: [key: string]
}>()

// 别名层：仅在揭示答案时构造 submitResult；isCorrect 归一化（undefined → true），
// 保证原函数体里的 !isCorrect 不会把正确选项误标红（§11.6）。
const submitResult = computed(() =>
  props.revealed
    ? { correctAnswerKey: props.answerKey, isCorrect: props.isCorrect !== false }
    : undefined,
)

// 以下两函数的判断逻辑从 ListeningQuizView 逐字搬入，仅将页面级响应式引用替换为 props。
const optionClass = (key: string): string => {
  if (props.revealed) {
    if (submitResult.value?.correctAnswerKey === key) return 'border-tertiary bg-tertiary-container/10'
    if (props.selected === key && !submitResult.value?.isCorrect) return 'border-error bg-error-container/20'
  }
  if (props.selected === key) return 'border-tertiary bg-tertiary-container/10'
  return 'border-outline-variant/30 hover:border-tertiary/50'
}

const optionKeyClass = (key: string): string => {
  if (props.revealed && submitResult.value?.correctAnswerKey === key) return 'bg-tertiary text-on-tertiary'
  if (props.revealed && props.selected === key && !submitResult.value?.isCorrect) return 'bg-error text-on-error'
  if (props.selected === key) return 'bg-tertiary text-on-tertiary'
  return 'bg-surface-variant/50 text-on-surface-variant'
}
</script>

<template>
  <div class="grid grid-cols-1 gap-3">
    <button
      v-for="option in props.options"
      :key="option.key"
      type="button"
      class="w-full text-left border-2 rounded-2xl p-4 transition-all flex items-center gap-3"
      :class="optionClass(option.key)"
      :disabled="props.disabled"
      @click="emit('select', option.key)"
    >
      <span
        class="w-8 h-8 rounded-full flex items-center justify-center font-label-lg text-label-lg font-bold transition-colors"
        :class="optionKeyClass(option.key)"
      >
        {{ option.key }}
      </span>
      <span class="font-body-md text-body-md text-on-surface">{{ option.text }}</span>
      <AppIcon
        v-if="props.revealed && submitResult?.correctAnswerKey === option.key"
        name="check"
        size="lg"
        class="text-tertiary ml-auto"
      />
      <AppIcon
        v-else-if="props.revealed && props.selected === option.key && !submitResult?.isCorrect"
        name="close"
        size="lg"
        class="text-error ml-auto"
      />
    </button>
  </div>
</template>
