<template>
  <BaseDialog
    :visible="true"
    :title="$t('adminConsole.question.generateTitle')"
    max-width="max-w-xl"
    :close-disabled="submitting"
    @update:visible="emit('close', false)"
  >
    <div class="flex flex-col gap-5">
      <p v-if="error" role="alert" class="font-label-md text-label-md text-error">{{ error }}</p>
      <FormField :label="$t('adminConsole.question.fieldKnowledge')" required>
        <input v-model="draft.knowledgePoint" :class="inputClass" />
      </FormField>
      <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        <FormField :label="$t('adminConsole.question.fieldCet')" required>
          <select v-model="draft.cetLevel" :class="inputClass">
            <option value="CET4">CET4</option>
            <option value="CET6">CET6</option>
          </select>
        </FormField>
        <FormField :label="$t('adminConsole.question.fieldType')" required>
          <input v-model="draft.questionType" :class="inputClass" />
        </FormField>
      </div>
      <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        <FormField :label="$t('adminConsole.question.fieldDifficulty')" required :hint="$t('adminConsole.question.difficultyHint', { min: DIFFICULTY_MIN, max: DIFFICULTY_MAX })">
          <input v-model="draft.difficulty" type="number" :min="DIFFICULTY_MIN" :max="DIFFICULTY_MAX" :class="inputClass" />
        </FormField>
        <FormField :label="$t('adminConsole.question.fieldCount')" required :hint="$t('adminConsole.question.countHint', { min: COUNT_MIN, max: COUNT_MAX })">
          <input v-model="draft.count" type="number" :min="COUNT_MIN" :max="COUNT_MAX" :class="inputClass" />
        </FormField>
      </div>
    </div>
    <template #footer>
      <button
        type="button"
        class="rounded-full border border-outline-variant px-5 py-2.5 font-label-lg text-label-lg text-on-surface-variant"
        :disabled="submitting"
        @click="emit('close', false)"
      >
        {{ $t('adminConsole.common.cancel') }}
      </button>
      <button
        type="button"
        class="flex items-center gap-2 rounded-full bg-primary px-5 py-2.5 font-label-lg text-label-lg text-on-primary disabled:opacity-60"
        :disabled="submitting"
        @click="submit"
      >
        <span class="material-symbols-outlined text-icon-md">add_notes</span>
        {{ submitting ? $t('adminConsole.common.loading') : $t('adminConsole.question.generateConfirm') }}
      </button>
    </template>
  </BaseDialog>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import BaseDialog from '../ui/BaseDialog.vue'
import FormField from './FormField.vue'
import { inputClass } from '@/components/ui/formStyles'
import { useToast } from '../../composables/useToast'
import { generateQuestions, getAdminErrorKey, type CetLevel } from '../../api/admin'

const emit = defineEmits<{ close: [generated: boolean] }>()

const { t } = useI18n()
const { show: toast } = useToast()

const DIFFICULTY_MIN = 1
const DIFFICULTY_MAX = 8
const COUNT_MIN = 1
const COUNT_MAX = 20

const draft = reactive({
  knowledgePoint: '',
  cetLevel: 'CET4' as CetLevel,
  difficulty: '3',
  questionType: 'FILL_BLANK',
  count: '5',
})

const error = ref('')
const submitting = ref(false)

const submit = async () => {
  error.value = ''
  const difficulty = Number(draft.difficulty)
  const count = Number(draft.count)
  if (!draft.knowledgePoint.trim() || !draft.questionType.trim()) {
    error.value = t('adminConsole.question.errFieldsRequired')
    return
  }
  if (!Number.isInteger(difficulty) || difficulty < DIFFICULTY_MIN || difficulty > DIFFICULTY_MAX) {
    error.value = t('adminConsole.question.errDifficulty', { min: DIFFICULTY_MIN, max: DIFFICULTY_MAX })
    return
  }
  if (!Number.isInteger(count) || count < COUNT_MIN || count > COUNT_MAX) {
    error.value = t('adminConsole.question.errCount', { min: COUNT_MIN, max: COUNT_MAX })
    return
  }
  submitting.value = true
  try {
    const savedCount = await generateQuestions({
      knowledgePoint: draft.knowledgePoint.trim(),
      cetLevel: draft.cetLevel,
      difficulty,
      questionType: draft.questionType.trim(),
      count,
    })
    if (savedCount === 0) toast(t('adminConsole.question.generateEmpty'), 'info')
    else toast(t('adminConsole.question.generateToast', { count: savedCount }), 'success')
    emit('close', savedCount > 0)
  } catch (e) {
    toast(t(getAdminErrorKey(e)), 'error')
  } finally {
    submitting.value = false
  }
}
</script>
