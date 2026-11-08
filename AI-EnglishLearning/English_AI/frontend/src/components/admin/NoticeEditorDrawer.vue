<template>
  <BaseDrawer
    :open="true"
    :title="isEdit ? $t('adminConsole.notice.editTitle') : $t('adminConsole.notice.createTitle')"
    :close-disabled="submitting"
    @close="emitClose"
  >
    <form class="flex flex-col gap-6" @submit.prevent="handleSubmit">
      <FormField
        :label="$t('adminConsole.notice.fieldTitle')"
        required
        :error="fieldError('title')"
        :hint="$t('adminConsole.notice.titleHint', { max: TITLE_MAX })"
      >
        <input v-model="draft.title" :class="inputClass" />
      </FormField>

      <FormField :label="$t('adminConsole.notice.fieldContent')" required :error="fieldError('content')">
        <textarea v-model="draft.content" rows="5" :class="inputClass" class="resize-y" />
      </FormField>

      <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        <FormField :label="$t('adminConsole.notice.fieldType')" required>
          <select v-model="draft.noticeType" :class="inputClass">
            <option v-for="type in NOTICE_TYPES" :key="type" :value="type">
              {{ $t(NOTICE_TYPE_META[type].labelKey) }}
            </option>
          </select>
        </FormField>
        <FormField :label="$t('adminConsole.notice.fieldAudience')" required>
          <select v-model="draft.targetAudience" :class="inputClass">
            <option v-for="audience in AUDIENCES" :key="audience" :value="audience">
              {{ $t(AUDIENCE_META[audience].labelKey) }}
            </option>
          </select>
        </FormField>
      </div>

      <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        <FormField :label="$t('adminConsole.notice.fieldPublishAt')" :hint="$t('adminConsole.notice.publishAtHint')">
          <input v-model="draft.publishAt" type="datetime-local" :class="inputClass" />
        </FormField>
        <FormField :label="$t('adminConsole.notice.fieldExpireAt')" :error="fieldError('expireAt')" :hint="$t('adminConsole.notice.expireAtHint')">
          <input v-model="draft.expireAt" type="datetime-local" :class="inputClass" />
        </FormField>
      </div>

      <section :aria-label="$t('adminConsole.notice.preview')" class="flex flex-col gap-3">
        <span class="font-label-lg text-label-lg text-on-surface">{{ $t('adminConsole.notice.preview') }}</span>
        <div class="flex flex-col gap-3 rounded-[16px] border border-outline-variant/40 bg-surface-container-low p-5">
          <div class="flex items-center gap-2">
            <span class="material-symbols-outlined text-icon-md text-primary">notifications</span>
            <span class="font-label-lg text-label-lg text-on-surface">
              {{ draft.title.trim() || $t('adminConsole.notice.previewPlaceholderTitle') }}
            </span>
          </div>
          <p class="whitespace-pre-line font-body-sm text-body-sm text-on-surface-variant">
            {{ draft.content.trim() || $t('adminConsole.notice.previewPlaceholderContent') }}
          </p>
          <span class="font-label-sm text-label-sm text-outline">
            {{ draft.publishAt ? formatAdminDateTime(fromInputDateTime(draft.publishAt)) : $t('adminConsole.notice.publishNow') }}
          </span>
        </div>
      </section>
    </form>

    <template #footer>
      <button type="button" :class="btnSecondary" :disabled="submitting" @click="emitClose">
        {{ $t('adminConsole.common.cancel') }}
      </button>
      <button type="button" :class="btnPrimary" :disabled="submitting" @click="handleSubmit">
        {{ submitting ? $t('adminConsole.common.loading') : $t('adminConsole.notice.saveDraft') }}
      </button>
    </template>
  </BaseDrawer>
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import BaseDrawer from './BaseDrawer.vue'
import FormField from './FormField.vue'
import { inputClass } from '@/components/ui/formStyles'
import { btnPrimary, btnSecondary } from '@/components/ui/buttonStyles'
import { useToast } from '../../composables/useToast'
import { createNotice, getAdminErrorKey, updateNotice, type AdminNotice, type NoticePayload, type NoticeType, type TargetAudience } from '../../api/admin'
import { AUDIENCE_META, NOTICE_TYPE_META } from '../../utils/adminEnums'
import { formatAdminDateTime, fromInputDateTime, toInputDateTime } from '../../utils/format'

const props = defineProps<{ notice: AdminNotice | null }>()
const emit = defineEmits<{ close: [saved: boolean] }>()

const { t } = useI18n()
const { show: toast } = useToast()

const NOTICE_TYPES: readonly NoticeType[] = ['SYSTEM', 'REMINDER', 'ACTIVITY']
const AUDIENCES: readonly TargetAudience[] = ['ALL', 'CET4', 'CET6']
const TITLE_MAX = 60
const CONTENT_MAX = 1000

interface NoticeDraft {
  title: string
  content: string
  noticeType: NoticeType
  targetAudience: TargetAudience
  publishAt: string
  expireAt: string
}

const isEdit = props.notice !== null
const submitting = ref(false)

const draft = reactive<NoticeDraft>({
  title: props.notice?.title ?? '',
  content: props.notice?.content ?? '',
  noticeType: props.notice?.noticeType ?? 'SYSTEM',
  targetAudience: props.notice?.targetAudience ?? 'ALL',
  publishAt: toInputDateTime(props.notice?.publishAt),
  expireAt: toInputDateTime(props.notice?.expireAt),
})

const errors = reactive<Partial<Record<keyof NoticeDraft, string>>>({})

const fieldError = (key: keyof NoticeDraft) => (errors[key] ? t(errors[key]) : undefined)

const validate = () => {
  ;(Object.keys(errors) as Array<keyof NoticeDraft>).forEach((key) => delete errors[key])
  if (!draft.title.trim()) errors.title = 'adminConsole.notice.errTitleRequired'
  else if (draft.title.trim().length > TITLE_MAX) errors.title = 'adminConsole.notice.errTitleTooLong'
  if (!draft.content.trim()) errors.content = 'adminConsole.notice.errContentRequired'
  else if (draft.content.length > CONTENT_MAX) errors.content = 'adminConsole.notice.errContentTooLong'
  if (draft.publishAt && draft.expireAt && draft.expireAt <= draft.publishAt) {
    errors.expireAt = 'adminConsole.notice.errExpireBeforePublish'
  }
  return Object.keys(errors).length === 0
}

const emitClose = () => emit('close', false)

const handleSubmit = async () => {
  if (!validate() || submitting.value) return
  const payload: NoticePayload = {
    title: draft.title.trim(),
    content: draft.content.trim(),
    noticeType: draft.noticeType,
    targetAudience: draft.targetAudience,
    publishAt: fromInputDateTime(draft.publishAt),
    expireAt: fromInputDateTime(draft.expireAt),
  }
  submitting.value = true
  try {
    if (props.notice) await updateNotice(props.notice.id, payload)
    else await createNotice(payload)
    toast(t('adminConsole.notice.savedToast'), 'success')
    emit('close', true)
  } catch (error) {
    toast(t(getAdminErrorKey(error)), 'error')
  } finally {
    submitting.value = false
  }
}
</script>
