<template>
  <div class="min-h-screen bg-background text-on-background flex">
    <aside class="hidden md:flex fixed left-0 top-0 z-50 h-screen w-sidebar-width flex-col border-r border-outline-variant bg-surface px-4 py-8">
      <div class="mb-10 px-4">
        <AppLogo to="/login" />
      </div>
      <nav class="flex flex-col gap-2">
        <router-link to="/login" class="flex items-center gap-4 rounded-xl px-4 py-3 font-label-lg text-label-lg text-on-surface-variant transition-colors hover:bg-primary-container/10 hover:text-primary">
          <AppIcon name="login" size="lg" />
          {{ $t('auth.login') }}
        </router-link>
        <router-link to="/register" class="flex items-center gap-4 rounded-xl px-4 py-3 font-label-lg text-label-lg text-on-surface-variant transition-colors hover:bg-primary-container/10 hover:text-primary">
          <AppIcon name="person_add" size="lg" />
          {{ $t('auth.register') }}
        </router-link>
      </nav>
    </aside>

    <main class="flex min-h-screen w-full flex-1 flex-col md:ml-sidebar-width">
      <div class="flex flex-1 items-center px-gutter py-8">
        <div class="mx-auto w-full max-w-xl">
          <div class="relative overflow-hidden rounded-3xl bg-surface p-8 shadow-soft-glow sm:p-10">
            <div class="mb-8 text-center">
              <div class="mb-4 inline-flex h-16 w-16 items-center justify-center rounded-full bg-primary-container/10">
                <AppIcon name="lock_reset" size="lg" tone="primary" filled />
              </div>
              <h1 class="mb-2 font-headline-xl text-headline-xl text-on-surface">{{ $t('auth.forgotTitle') }}</h1>
              <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('auth.forgotSubtitle') }}</p>
            </div>

            <p class="mb-6 flex items-start gap-2 rounded-xl bg-warning-container px-4 py-3 font-body-sm text-body-sm text-on-warning-container">
              <AppIcon name="info" size="md" />
              <span>{{ $t('auth.mockSmsHint') }}</span>
            </p>

            <form class="space-y-5" novalidate @submit.prevent="handleReset">
              <div>
                <div class="relative group">
                  <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-4">
                    <span class="text-secondary transition-colors group-focus-within:text-primary"><AppIcon name="smartphone" size="lg" /></span>
                  </div>
                  <input
                    v-model="phone"
                    type="tel"
                    autocomplete="tel"
                    :class="[inputClassLg, 'pl-12 pr-4', errors.phone ? inputErrorClass : '']"
                    :aria-invalid="errors.phone ? 'true' : 'false'"
                    :placeholder="$t('auth.phonePlaceholder')"
                    @input="errors.phone = ''"
                  />
                </div>
                <FormHint v-if="errors.phone" :message="errors.phone" />
              </div>

              <div>
                <div class="flex flex-col gap-2 sm:flex-row">
                  <div class="relative flex-1 group">
                    <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-4">
                      <span class="text-secondary transition-colors group-focus-within:text-primary"><AppIcon name="verified_user" size="lg" /></span>
                    </div>
                    <input
                      v-model="code"
                      type="text"
                      inputmode="numeric"
                      maxlength="6"
                      :class="[inputClassLg, 'pl-12 pr-4 tracking-widest', errors.code ? inputErrorClass : '']"
                      :aria-invalid="errors.code ? 'true' : 'false'"
                      :placeholder="$t('auth.codePlaceholder')"
                      @input="errors.code = ''"
                    />
                  </div>
                  <button
                    type="button"
                    class="h-[52px] shrink-0 rounded-2xl border border-primary/30 bg-primary-container/20 px-4 font-label-lg text-label-lg text-primary disabled:cursor-not-allowed disabled:opacity-50"
                    :disabled="codeSending || (codeSent && remaining > 0)"
                    @click="sendCode"
                  >
                    {{ codeSent && remaining > 0 ? $t('auth.resendIn', { seconds: remaining }) : $t('auth.sendCode') }}
                  </button>
                </div>
                <FormHint v-if="errors.code" :message="errors.code" />
              </div>

              <div>
                <div class="relative group">
                  <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-4">
                    <span class="text-secondary transition-colors group-focus-within:text-primary"><AppIcon name="lock" size="lg" /></span>
                  </div>
                  <input
                    v-model="newPassword"
                    type="password"
                    autocomplete="new-password"
                    :class="[inputClassLg, 'pl-12 pr-4', errors.newPassword ? inputErrorClass : '']"
                    :aria-invalid="errors.newPassword ? 'true' : 'false'"
                    :placeholder="$t('auth.newPassword')"
                    @input="errors.newPassword = ''"
                  />
                </div>
                <FormHint v-if="errors.newPassword" :message="errors.newPassword" />
                <FormHint v-else tone="hint" :message="$t('auth.passwordRule')" />
              </div>

              <div>
                <div class="relative group">
                  <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-4">
                    <span class="text-secondary transition-colors group-focus-within:text-primary"><AppIcon name="lock" size="lg" /></span>
                  </div>
                  <input
                    v-model="confirmPassword"
                    type="password"
                    autocomplete="new-password"
                    :class="[inputClassLg, 'pl-12 pr-4', errors.confirmPassword ? inputErrorClass : '']"
                    :aria-invalid="errors.confirmPassword ? 'true' : 'false'"
                    :placeholder="$t('auth.confirmNewPassword')"
                    @input="errors.confirmPassword = ''"
                  />
                </div>
                <FormHint v-if="errors.confirmPassword" :message="errors.confirmPassword" />
              </div>

              <FormHint v-if="formError" :message="formError" />

              <button
                type="submit"
                :disabled="submitting"
                :class="btnPrimaryBlock"
              >
                <span>{{ submitting ? $t('common.loading') : $t('auth.resetPassword') }}</span>
                <span v-if="submitting" class="animate-spin"><AppIcon name="progress_activity" size="lg" /></span>
              </button>
            </form>

            <div class="mt-8 text-center">
              <router-link to="/login" class="font-label-lg text-label-lg text-primary hover:underline">
                {{ $t('auth.backToLogin') }}
              </router-link>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useToast } from '../composables/useToast'
import { useCountdown } from '../composables/useCountdown'
import { resetPasswordByPhone, sendVerificationCode } from '../api/user'
import { inputClassLg, inputErrorClass } from '@/components/ui/formStyles'
import FormHint from '@/components/ui/FormHint.vue'
import AppIcon from '@/components/ui/AppIcon.vue'
import AppLogo from '@/components/ui/AppLogo.vue'
import { btnPrimaryBlock } from '@/components/ui/buttonStyles'

const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()

const phone = ref('')
const code = ref('')
const newPassword = ref('')
const confirmPassword = ref('')
const submitting = ref(false)
const codeSent = ref(false)
const codeSending = ref(false)
const { remaining, reset } = useCountdown(60, undefined, false)

/** 字段级校验错误：与登录/注册页一致，内联展示在输入框下方 */
const errors = ref({
  phone: '',
  code: '',
  newPassword: '',
  confirmPassword: '',
})
/** 服务端返回的整体性错误 */
const formError = ref('')

const phonePattern = /^1[3-9]\d{9}$/
const passwordRulePattern = /^(?=.*[a-z])(?=.*\d).{10,}$/

const sendCode = async () => {
  if (!phonePattern.test(phone.value)) {
    errors.value.phone = t('auth.invalidPhone')
    return
  }
  errors.value.phone = ''
  errors.value.code = ''
  formError.value = ''
  codeSending.value = true
  try {
    const result = await sendVerificationCode(phone.value.trim(), 'FORGOT_PASSWORD')
    codeSent.value = true
    toast(t('auth.codeSentMock', { code: result.mockCode ?? '------' }), 'success')
    reset()
  } catch (error) {
    errors.value.code = error instanceof Error ? error.message : t('auth.codeSendFailed')
  } finally {
    codeSending.value = false
  }
}

const validate = (): boolean => {
  const err = { phone: '', code: '', newPassword: '', confirmPassword: '' }
  let valid = true

  if (!phonePattern.test(phone.value)) {
    err.phone = t('auth.invalidPhone')
    valid = false
  }
  if (!code.value.trim()) {
    err.code = t('auth.invalidCode')
    valid = false
  }
  if (!passwordRulePattern.test(newPassword.value)) {
    err.newPassword = t('auth.passwordInvalid')
    valid = false
  }
  if (newPassword.value !== confirmPassword.value) {
    err.confirmPassword = t('auth.passwordMismatch')
    valid = false
  }

  errors.value = err
  return valid
}

const handleReset = async () => {
  formError.value = ''
  if (!validate()) return

  submitting.value = true
  try {
    await resetPasswordByPhone({
      phone: phone.value.trim(),
      code: code.value.trim(),
      newPassword: newPassword.value,
    })
    toast(t('auth.resetSuccess'), 'success')
    await router.push('/login')
  } catch (error) {
    formError.value = error instanceof Error ? error.message : t('auth.resetFailed')
  } finally {
    submitting.value = false
  }
}
</script>
