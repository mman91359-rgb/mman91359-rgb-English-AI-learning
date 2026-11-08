<template>
  <BaseDialog
    :visible="true"
    :title="$t('adminConsole.question.rejectTitle')"
    max-width="max-w-lg"
    :close-disabled="submitting"
    @update:visible="emit('close', false)"
  >
    <div class="flex flex-col gap-5">
      <p class="line-clamp-3 font-body-sm text-body-sm text-on-surface-variant">{{ question.stem }}</p>
      <FormField :label="$t('adminConsole.question.fieldComment')" required :error="error">
        <textarea v-model="comment" rows="4" :class="inputClass" class="resize-y" @input="error = ''" />
      </FormField>
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
        class="rounded-full bg-error px-5 py-2.5 font-label-lg text-label-lg text-on-error disabled:opacity-60"
        :disabled="submitting"
        @click="submit"
      >
        {{ submitting ? $t('adminConsole.common.loading') : $t('adminConsole.question.rejectConfirm') }}
      </button>
    </template>
  </BaseDialog>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useI18n } from 'vue-i18n'
import BaseDialog from '../ui/BaseDialog.vue'
import FormField from './FormField.vue'
import { inputClass } from '@/components/ui/formStyles'
import { useToast } from '../../composables/useToast'
import { getAdminErrorKey, rejectQuestion, type AdminQuestion } from '../../api/admin'

const props = defineProps<{ question: AdminQuestion }>()
const emit = defineEmits<{ close: [changed: boolean] }>()

const { t } = useI18n()
const { show: toast } = useToast()

const comment = ref('')
const error = ref('')
const submitting = ref(false)

const submit = async () => {
  const trimmed = comment.value.trim()
  if (!trimmed) {
    error.value = t('adminConsole.question.errCommentRequired')
    return
  }
  submitting.value = true
  try {
    await rejectQuestion(props.question.id, trimmed)
    toast(t('adminConsole.question.rejectToast'), 'success')
    emit('close', true)
  } catch (e) {
    toast(t(getAdminErrorKey(e)), 'error')
  } finally {
    submitting.value = false
  }
}
</script>
