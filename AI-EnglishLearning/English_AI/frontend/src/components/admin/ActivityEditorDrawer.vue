<template>
  <BaseDrawer
    :open="true"
    :title="activity ? $t('adminConsole.activity.editTitle') : $t('adminConsole.activity.createTitle')"
    :close-disabled="submitting"
    @close="emitClose"
  >
    <form class="flex flex-col gap-6" @submit.prevent="handleSubmit">
      <FormField :label="$t('adminConsole.activity.fieldTitle')" required :error="fieldError('title')">
        <input v-model="draft.title" :class="inputClass" />
      </FormField>

      <FormField :label="$t('adminConsole.activity.fieldSummary')" :hint="$t('adminConsole.activity.summaryHint')">
        <input v-model="draft.summary" :class="inputClass" />
      </FormField>

      <FormField :label="$t('adminConsole.activity.fieldContent')">
        <textarea v-model="draft.content" rows="5" :class="inputClass" class="resize-y" />
      </FormField>

      <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        <FormField :label="$t('adminConsole.activity.fieldType')" required>
          <select v-model="draft.activityType" :class="inputClass">
            <option v-for="type in ACTIVITY_TYPES" :key="type" :value="type">
              {{ $t(ACTIVITY_TYPE_META[type].labelKey) }}
            </option>
          </select>
        </FormField>
        <FormField :label="$t('adminConsole.activity.fieldAudience')" required>
          <select v-model="draft.targetAudience" :class="inputClass">
            <option v-for="audience in AUDIENCES" :key="audience" :value="audience">
              {{ $t(AUDIENCE_META[audience].labelKey) }}
            </option>
          </select>
        </FormField>
      </div>

      <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        <FormField :label="$t('adminConsole.activity.fieldStartAt')" required :error="fieldError('startAt')">
          <input v-model="draft.startAt" type="datetime-local" :class="inputClass" />
        </FormField>
        <FormField :label="$t('adminConsole.activity.fieldEndAt')" required :error="fieldError('endAt')">
          <input v-model="draft.endAt" type="datetime-local" :class="inputClass" />
        </FormField>
      </div>

      <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        <FormField :label="$t('adminConsole.activity.fieldBanner')" :hint="$t('adminConsole.activity.bannerHint')">
          <input v-model="draft.bannerUrl" :class="inputClass" />
        </FormField>
        <FormField :label="$t('adminConsole.activity.fieldSort')" :error="fieldError('sortOrder')" :hint="$t('adminConsole.activity.sortHint')">
          <input v-model="draft.sortOrder" type="number" :class="inputClass" />
        </FormField>
      </div>

      <p class="rounded-xl bg-surface-container-low px-4 py-3 font-body-sm text-body-sm text-on-surface-variant">
        {{ activity ? $t('adminConsole.activity.stateHint', { state: stateLabel }) : $t('adminConsole.activity.createHint') }}
      </p>
    </form>

    <template #footer>
      <button type="button" :class="btnSecondary" :disabled="submitting" @click="emitClose">
        {{ $t('adminConsole.common.cancel') }}
      </button>
      <button type="button" :class="btnPrimary" :disabled="submitting" @click="handleSubmit">
        {{ submitting ? $t('adminConsole.common.loading') : $t('adminConsole.activity.saveDraft') }}
      </button>
    </template>
  </BaseDrawer>
</template>

<script setup lang="ts">
import { computed, reactive, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import BaseDrawer from './BaseDrawer.vue'
import FormField from './FormField.vue'
import { inputClass } from '@/components/ui/formStyles'
import { btnPrimary, btnSecondary } from '@/components/ui/buttonStyles'
import { useToast } from '../../composables/useToast'
import {
  createActivity,
  getAdminErrorKey,
  updateActivity,
  type ActivityPayload,
  type ActivityType,
  type AdminActivity,
  type TargetAudience,
} from '../../api/admin'
import { ACTIVITY_DISPLAY_META, ACTIVITY_TYPE_META, AUDIENCE_META, getActivityDisplayState } from '../../utils/adminEnums'
import { fromInputDateTime, toInputDateTime } from '../../utils/format'

const props = defineProps<{ activity: AdminActivity | null }>()
const emit = defineEmits<{ close: [saved: boolean] }>()

const { t } = useI18n()
const { show: toast } = useToast()

const ACTIVITY_TYPES: readonly ActivityType[] = ['BANNER', 'CONTENT']
const AUDIENCES: readonly TargetAudience[] = ['ALL', 'CET4', 'CET6']

interface ActivityDraft {
  title: string
  summary: string
  content: string
  activityType: ActivityType
  targetAudience: TargetAudience
  startAt: string
  endAt: string
  bannerUrl: string
  sortOrder: string
}

const submitting = ref(false)

const draft = reactive<ActivityDraft>({
  title: props.activity?.title ?? '',
  summary: props.activity?.summary ?? '',
  content: props.activity?.content ?? '',
  activityType: props.activity?.activityType ?? 'BANNER',
  targetAudience: props.activity?.targetAudience ?? 'ALL',
  startAt: toInputDateTime(props.activity?.startAt),
  endAt: toInputDateTime(props.activity?.endAt),
  bannerUrl: props.activity?.bannerUrl ?? '',
  sortOrder: String(props.activity?.sortOrder ?? 0),
})

const errors = reactive<Partial<Record<keyof ActivityDraft, string>>>({})
const fieldError = (key: keyof ActivityDraft) => (errors[key] ? t(errors[key]) : undefined)

const stateLabel = computed(() => {
  if (!props.activity) return ''
  return t(ACTIVITY_DISPLAY_META[getActivityDisplayState(props.activity)].labelKey)
})

const validate = () => {
  ;(Object.keys(errors) as Array<keyof ActivityDraft>).forEach((key) => delete errors[key])
  if (!draft.title.trim()) errors.title = 'adminConsole.activity.errTitleRequired'
  if (!draft.startAt) errors.startAt = 'adminConsole.activity.errStartRequired'
  if (!draft.endAt) errors.endAt = 'adminConsole.activity.errEndRequired'
  if (draft.startAt && draft.endAt && draft.endAt <= draft.startAt) errors.endAt = 'adminConsole.activity.errEndBeforeStart'
  if (!/^-?\d+$/.test(draft.sortOrder.trim())) errors.sortOrder = 'adminConsole.activity.errSortInvalid'
  return Object.keys(errors).length === 0
}

const emitClose = () => emit('close', false)

const handleSubmit = async () => {
  if (!validate() || submitting.value) return
  const payload: ActivityPayload = {
    title: draft.title.trim(),
    summary: draft.summary.trim(),
    content: draft.content.trim(),
    bannerUrl: draft.bannerUrl.trim() || undefined,
    activityType: draft.activityType,
    targetAudience: draft.targetAudience,
    startAt: fromInputDateTime(draft.startAt) ?? '',
    endAt: fromInputDateTime(draft.endAt) ?? '',
    sortOrder: Number(draft.sortOrder),
  }
  submitting.value = true
  try {
    if (props.activity) await updateActivity(props.activity.id, payload)
    else await createActivity(payload)
    toast(t('adminConsole.activity.savedToast'), 'success')
    emit('close', true)
  } catch (error) {
    toast(t(getAdminErrorKey(error)), 'error')
  } finally {
    submitting.value = false
  }
}
</script>
