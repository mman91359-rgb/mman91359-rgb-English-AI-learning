<template>
  <div class="min-h-screen bg-background text-on-background flex">
    <aside class="hidden md:flex fixed left-0 top-0 z-50 h-screen w-sidebar-width flex-col border-r border-outline-variant bg-surface px-4 py-8">
      <div class="mb-10 flex items-center gap-3 px-4">
        <span class="flex h-10 w-10 items-center justify-center rounded-full bg-primary-container/20 text-primary">
          <span class="material-symbols-outlined fill">auto_stories</span>
        </span>
        <div>
          <p class="font-headline-md text-headline-md font-bold text-primary">{{ $t('app.title') }}</p>
          <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('app.subtitle') }}</p>
        </div>
      </div>
      <nav class="flex flex-col gap-2">
        <router-link to="/login" class="flex items-center gap-4 rounded-xl px-4 py-3 font-label-lg text-label-lg text-on-surface-variant transition-colors hover:bg-primary-container/10 hover:text-primary">
          <span class="material-symbols-outlined">login</span>
          {{ $t('auth.login') }}
        </router-link>
        <router-link to="/register" class="flex items-center gap-4 rounded-xl px-4 py-3 font-label-lg text-label-lg text-on-surface-variant transition-colors hover:bg-primary-container/10 hover:text-primary">
          <span class="material-symbols-outlined">person_add</span>
          {{ $t('auth.register') }}
        </router-link>
      </nav>
    </aside>

    <main class="flex min-h-screen w-full flex-1 flex-col md:ml-sidebar-width">
      <div class="flex flex-1 items-center px-gutter py-8">
        <div class="mx-auto w-full max-w-xl">
          <div class="relative overflow-hidden rounded-[24px] bg-surface p-8 shadow-soft-glow sm:p-10">
            <div class="mb-8 text-center">
              <div class="mb-4 inline-flex h-16 w-16 items-center justify-center rounded-full bg-primary-container/10">
                <span class="material-symbols-outlined fill text-3xl text-primary">lock_reset</span>
              </div>
              <h1 class="mb-2 font-headline-xl text-headline-xl text-on-surface">{{ $t('auth.forgotTitle') }}</h1>
              <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('auth.forgotSubtitle') }}</p>
            </div>

            <p class="mb-6 flex items-start gap-2 rounded-xl bg-warning-container px-4 py-3 font-body-sm text-body-sm text-on-warning-container">
              <span class="material-symbols-outlined text-icon-md">info</span>
              <span>{{ $t('auth.mockSmsHint') }}</span>
            </p>

            <form class="space-y-5" @submit.prevent="handleReset">
              <div class="relative group">
                <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-4">
                  <span class="material-symbols-outlined text-secondary transition-colors group-focus-within:text-primary">smartphone</span>
                </div>
                <input
                  v-model="phone"
                  type="tel"
                  required
                  autocomplete="tel"
                  :class="[inputClassLg, 'pl-12 pr-4']"
                  :placeholder="$t('auth.phonePlaceholder')"
                />
              </div>

              <div class="flex flex-col gap-2 sm:flex-row">
                <div class="relative flex-1 group">
                  <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-4">
                    <span class="material-symbols-outlined text-secondary transition-colors group-focus-within:text-primary">verified_user</span>
                  </div>
                  <input
                    v-model="code"
                    type="text"
                    required
                    inputmode="numeric"
                    maxlength="6"
                    :class="[inputClassLg, 'pl-12 pr-4 tracking-widest']"
                    :placeholder="$t('auth.codePlaceholder')"
                  />
                </div>
                <button
                  type="button"
                  class="h-[52px] shrink-0 rounded-2xl border border-primary/30 bg-primary-container/20 px-4 font-label-lg text-label-lg text-primary disabled:cursor-not-allowed disabled:opacity-50"
                  :disabled="codeSent && remaining > 0"
                  @click="sendCode"
                >
                  {{ codeSent && remaining > 0 ? $t('auth.resendIn', { seconds: remaining }) : $t('auth.sendCode') }}
                </button>
              </div>

              <div class="relative group">
                <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-4">
                  <span class="material-symbols-outlined text-secondary transition-colors group-focus-within:text-primary">lock</span>
                </div>
                <input
                  v-model="newPassword"
                  type="password"
                  required
                  autocomplete="new-password"
                  :class="[inputClassLg, 'pl-12 pr-4']"
                  :placeholder="$t('auth.newPassword')"
                />
              </div>
              <p class="mt-1.5 px-1 font-label-sm text-label-sm text-on-surface-variant flex items-center gap-1">
                <span class="material-symbols-outlined text-sm">info</span>
                {{ $t('auth.passwordRule') }}
              </p>

              <div class="relative group">
                <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-4">
                  <span class="material-symbols-outlined text-secondary transition-colors group-focus-within:text-primary">lock</span>
                </div>
                <input
                  v-model="confirmPassword"
                  type="password"
                  required
                  autocomplete="new-password"
                  :class="[inputClassLg, 'pl-12 pr-4']"
                  :placeholder="$t('auth.confirmNewPassword')"
                />
              </div>

              <button
                type="submit"
                :disabled="submitting"
                class="flex w-full items-center justify-center gap-2 rounded-full bg-primary px-4 py-3.5 font-label-lg text-label-lg text-on-primary shadow-md transition-all duration-200 hover:bg-on-primary-fixed-variant hover:shadow-lg active:scale-95 disabled:cursor-not-allowed disabled:opacity-80"
              >
                <span>{{ submitting ? $t('common.loading') : $t('auth.resetPassword') }}</span>
                <span v-if="submitting" class="material-symbols-outlined animate-spin">progress_activity</span>
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
import { resetPasswordByPhone } from '../api/user'
import { inputClassLg } from '@/components/ui/formStyles'

const router = useRouter()
const { t } = useI18n()
const { show: toast } = useToast()

const phone = ref('')
const code = ref('')
const newPassword = ref('')
const confirmPassword = ref('')
const submitting = ref(false)
const codeSent = ref(false)
const { remaining, reset } = useCountdown(60, undefined, false)

const phonePattern = /^1[3-9]\d{9}$/
const passwordRulePattern = /^(?=.*[a-z])(?=.*\d).{10,}$/

const sendCode = () => {
  if (!phonePattern.test(phone.value)) {
    toast(t('auth.invalidPhone'), 'warning')
    return
  }
  codeSent.value = true
  toast(t('auth.codeSentMock', { code: '123456' }), 'success')
  reset()
}

const handleReset = async () => {
  if (!phonePattern.test(phone.value)) {
    toast(t('auth.invalidPhone'), 'warning')
    return
  }
  if (!code.value.trim()) {
    toast(t('auth.invalidCode'), 'warning')
    return
  }
  if (!passwordRulePattern.test(newPassword.value)) {
    toast(t('auth.passwordTooShort'), 'warning')
    return
  }
  if (newPassword.value !== confirmPassword.value) {
    toast(t('auth.passwordMismatch'), 'warning')
    return
  }
  submitting.value = true
  try {
    await resetPasswordByPhone({
      phone: phone.value,
      code: code.value.trim(),
      newPassword: newPassword.value,
    })
    toast(t('auth.resetSuccess'), 'success')
    await router.push('/login')
  } catch (error) {
    toast(error instanceof Error ? error.message : t('auth.resetPassword'), 'error')
  } finally {
    submitting.value = false
  }
}
</script>
