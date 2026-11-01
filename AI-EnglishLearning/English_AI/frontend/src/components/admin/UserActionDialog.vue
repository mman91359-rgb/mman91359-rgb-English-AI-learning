<template>
  <ConfirmDialog
    v-if="kind === 'status'"
    :open="true"
    :danger="disabling"
    :title="disabling ? $t('adminConsole.users.disableTitle') : $t('adminConsole.users.enableTitle')"
    :target-name="targetName"
    :impact="disabling ? $t('adminConsole.users.disableImpact') : $t('adminConsole.users.enableImpact')"
    :confirm-label="disabling ? $t('adminConsole.users.confirmDisable') : $t('adminConsole.users.confirmEnable')"
    :loading="submitting"
    @cancel="close"
    @confirm="runStatus"
  />

  <ConfirmDialog
    v-else-if="kind === 'reset' && tempPassword === null"
    :open="true"
    danger
    :title="$t('adminConsole.users.resetTitle')"
    :target-name="targetName"
    :impact="$t('adminConsole.users.resetImpact')"
    :confirm-label="$t('adminConsole.users.confirmReset')"
    :loading="submitting"
    @cancel="close"
    @confirm="runReset"
  />

  <BaseDialog
    v-else-if="kind === 'reset'"
    :visible="true"
    :title="$t('adminConsole.users.tempPasswordTitle')"
    max-width="max-w-lg"
    @update:visible="close"
  >
    <div class="flex flex-col gap-4">
      <p class="font-body-sm text-body-sm text-on-surface-variant">
        {{ $t('adminConsole.users.tempPasswordDesc', { name: displayName }) }}
      </p>
      <code class="select-all rounded-xl bg-surface-container-low px-4 py-3 text-center font-mono font-headline-sm text-headline-sm tracking-widest text-on-surface">
        {{ tempPassword }}
      </code>
      <p class="flex items-start gap-2 rounded-xl bg-warning-container px-4 py-3 font-body-sm text-body-sm text-on-warning-container">
        <span class="material-symbols-outlined text-icon-md">warning</span>
        <span>{{ $t('adminConsole.users.tempPasswordOnce') }}</span>
      </p>
    </div>
    <template #footer>
      <button
        type="button"
        class="flex items-center gap-1 rounded-full border border-outline-variant px-4 py-2 font-label-lg text-label-lg text-on-surface-variant"
        @click="copyTemporaryPassword"
      >
        <span class="material-symbols-outlined text-icon-sm">content_copy</span>
        {{ $t('adminConsole.common.copy') }}
      </button>
      <button type="button" class="rounded-full bg-primary px-5 py-2.5 font-label-lg text-label-lg text-on-primary" @click="close">
        {{ $t('adminConsole.common.done') }}
      </button>
    </template>
  </BaseDialog>

  <BaseDialog
    v-else
    :visible="true"
    :title="$t('adminConsole.users.roleTitle')"
    max-width="max-w-lg"
    :close-disabled="submitting"
    @update:visible="close"
  >
    <div class="flex flex-col gap-5">
      <p class="font-body-sm text-body-sm text-on-surface-variant">
        {{ $t('adminConsole.users.roleTarget', { name: targetName }) }}
      </p>
      <FormField :label="$t('adminConsole.users.roleField')" :hint="$t('adminConsole.users.roleImpact')">
        <select v-model="role" :class="inputClass">
          <option value="ROLE_USER">{{ $t('adminConsole.enum.roleUser') }}</option>
          <option value="ROLE_ADMIN">{{ $t('adminConsole.enum.roleAdmin') }}</option>
        </select>
      </FormField>
    </div>
    <template #footer>
      <button
        type="button"
        class="rounded-full border border-outline-variant px-5 py-2.5 font-label-lg text-label-lg text-on-surface-variant"
        :disabled="submitting"
        @click="close"
      >
        {{ $t('adminConsole.common.cancel') }}
      </button>
      <button
        type="button"
        class="rounded-full bg-primary px-5 py-2.5 font-label-lg text-label-lg text-on-primary disabled:opacity-60"
        :disabled="submitting || role === currentRole"
        @click="runRole"
      >
        {{ submitting ? $t('adminConsole.common.loading') : $t('adminConsole.common.save') }}
      </button>
    </template>
  </BaseDialog>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue'
import { useI18n } from 'vue-i18n'
import BaseDialog from '../ui/BaseDialog.vue'
import ConfirmDialog from './ConfirmDialog.vue'
import FormField from './FormField.vue'
import { inputClass } from './formStyles'
import { useToast } from '../../composables/useToast'
import {
  getAdminErrorKey,
  resetUserPassword,
  updateUserRole,
  updateUserStatus,
  type UserRole,
} from '../../api/admin'
import type { UserAction } from './userActionTypes'

const props = defineProps<{ action: UserAction }>()
const emit = defineEmits<{ close: [changed: boolean] }>()

const { t } = useI18n()
const { show: toast } = useToast()

const submitting = ref(false)
const changed = ref(false)
const tempPassword = ref<string | null>(null)

const user = computed(() => props.action.user)
const kind = computed(() => props.action.kind)
const displayName = computed(() => user.value.nickname || user.value.username)
const targetName = computed(() => `${displayName.value} (${user.value.username})`)
const disabling = computed(() => user.value.status === 1)
const currentRole = computed<UserRole>(() => (user.value.roles.includes('ROLE_ADMIN') ? 'ROLE_ADMIN' : 'ROLE_USER'))
const role = ref<UserRole>(currentRole.value)

const close = () => emit('close', changed.value)

const runAction = async (task: () => Promise<unknown>, successMessage: string) => {
  submitting.value = true
  try {
    await task()
    changed.value = true
    toast(successMessage, 'success')
    emit('close', true)
  } catch (error) {
    toast(t(getAdminErrorKey(error)), 'error')
    submitting.value = false
  }
}

const runStatus = () =>
  runAction(
    () => updateUserStatus(user.value.id, disabling.value ? 0 : 1),
    disabling.value ? t('adminConsole.users.disabledToast') : t('adminConsole.users.enabledToast'),
  )

const runRole = () => runAction(() => updateUserRole(user.value.id, role.value), t('adminConsole.users.roleToast'))

const runReset = async () => {
  submitting.value = true
  try {
    const result = await resetUserPassword(user.value.id)
    changed.value = true
    tempPassword.value = result.temporaryPassword
  } catch (error) {
    toast(t(getAdminErrorKey(error)), 'error')
  } finally {
    submitting.value = false
  }
}

const copyTemporaryPassword = async () => {
  if (!tempPassword.value) return
  try {
    await navigator.clipboard.writeText(tempPassword.value)
    toast(t('adminConsole.users.copied'), 'success')
  } catch {
    toast(t('adminConsole.error.generic'), 'error')
  }
}
</script>
