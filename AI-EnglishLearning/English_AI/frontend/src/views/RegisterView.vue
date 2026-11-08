<template>
  <div class="bg-background text-on-background min-h-screen flex">
    <aside class="hidden md:flex flex-col h-screen fixed left-0 top-0 w-sidebar-width bg-surface border-r border-outline-variant py-8 px-4 z-50">
      <div class="flex items-center gap-3 mb-8 px-4">
        <div class="w-10 h-10 bg-primary-fixed rounded-xl flex items-center justify-center">
          <span class="material-symbols-outlined text-primary text-3xl">school</span>
        </div>
        <span class="text-headline-md font-headline-md font-bold text-primary">{{ $t('app.title') }}</span>
      </div>
      <nav class="flex-1 flex flex-col gap-2">
        <router-link
          to="/login"
          :class="[
            'group relative flex items-center gap-4 px-4 py-3 rounded-xl overflow-hidden transition-all duration-300 ease-out hover:translate-x-1 hover:bg-primary-container/15 hover:shadow-sm active:scale-[0.98]',
            isLogin
              ? 'bg-primary-container/10 text-primary font-bold'
              : 'text-on-surface-variant hover:text-primary'
          ]"
        >
          <span
            class="absolute left-0 top-1/2 -translate-y-1/2 w-0.5 h-6 rounded-full bg-primary origin-center transition-all duration-300"
            :class="isLogin ? 'opacity-100 scale-y-100' : 'opacity-0 scale-y-0'"
          ></span>
          <span class="material-symbols-outlined transition-transform duration-300 group-hover:scale-110">login</span>
          <span class="font-label-lg text-label-lg transition-all duration-300 group-hover:tracking-wide">{{ $t('auth.login') }}</span>
        </router-link>
        <router-link
          to="/register"
          :class="[
            'group relative flex items-center gap-4 px-4 py-3 rounded-xl overflow-hidden transition-all duration-300 ease-out hover:translate-x-1 hover:bg-primary-container/15 hover:shadow-sm active:scale-[0.98]',
            !isLogin
              ? 'bg-primary-container/10 text-primary font-bold'
              : 'text-on-surface-variant hover:text-primary'
          ]"
        >
          <span
            class="absolute left-0 top-1/2 -translate-y-1/2 w-0.5 h-6 rounded-full bg-primary origin-center transition-all duration-300"
            :class="!isLogin ? 'opacity-100 scale-y-100' : 'opacity-0 scale-y-0'"
          ></span>
          <span class="material-symbols-outlined transition-transform duration-300 group-hover:scale-110">person_add</span>
          <span class="font-label-lg text-label-lg transition-all duration-300 group-hover:tracking-wide">{{ $t('auth.register') }}</span>
        </router-link>
      </nav>
    </aside>

    <main class="flex-1 w-full md:ml-sidebar-width flex flex-col min-h-screen relative">
      <header class="h-20 sticky top-0 z-40 bg-background/80 backdrop-blur-md flex items-center justify-between px-gutter w-full max-w-container-max mx-auto">
        <div class="flex items-center gap-4">
          <div class="md:hidden">
            <span class="material-symbols-outlined text-on-surface text-2xl cursor-pointer">menu</span>
          </div>
        </div>
        <div class="flex items-center gap-4">
          <button class="p-2 text-on-surface-variant hover:bg-surface-container-high/50 rounded-full transition-all"></button>
        </div>
      </header>

      <div class="flex-1 px-gutter py-8 w-full max-w-container-max mx-auto space-y-8 flex flex-col justify-center">
        <div class="grid grid-cols-1 md:grid-cols-12 gap-gutter">
          <div class="col-span-1 md:col-span-8 md:col-start-3 lg:col-span-6 lg:col-start-4 bg-surface rounded-[24px] p-8 sm:p-10 shadow-soft-glow relative overflow-hidden">
            <div class="text-center mb-10">
              <div class="inline-flex items-center justify-center w-16 h-16 rounded-full bg-primary-container/10 mb-4">
                <span class="material-symbols-outlined text-primary text-3xl fill">person_add</span>
              </div>
              <h1 class="font-headline-xl text-headline-xl text-on-surface mb-2">{{ $t('auth.register') }}</h1>
              <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('app.subtitle') }}</p>
            </div>

            <form class="space-y-5" @submit.prevent="handleRegister">
              <div class="relative group">
                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                  <span class="material-symbols-outlined text-secondary group-focus-within:text-primary transition-colors">badge</span>
                </div>
                <input
                  v-model="form.nickname"
                  :class="[inputClassLg, 'pl-12 pr-4']"
                  :placeholder="$t('auth.nicknamePlaceholder')"
                  type="text"
                />
                <p v-if="validationErrors.nickname" class="mt-1.5 px-1 font-label-sm text-label-sm text-error flex items-center gap-1">
                  <span class="material-symbols-outlined text-sm">error</span>
                  {{ validationErrors.nickname }}
                </p>
              </div>

              <div class="relative group">
                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                  <span class="material-symbols-outlined text-secondary group-focus-within:text-primary transition-colors">alternate_email</span>
                </div>
                <input
                  v-model="form.account"
                  :class="[inputClassLg, 'pl-12 pr-4']"
                  :placeholder="$t('auth.accountPlaceholderRegister')"
                  type="text"
                  autocomplete="off"
                />
                <p v-if="validationErrors.account" class="mt-1.5 px-1 font-label-sm text-label-sm text-error flex items-center gap-1">
                  <span class="material-symbols-outlined text-sm">error</span>
                  {{ validationErrors.account }}
                </p>
              </div>

              <div class="flex flex-col gap-2 sm:flex-row">
                <div class="relative flex-1 group">
                  <div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-4">
                    <span class="material-symbols-outlined text-secondary transition-colors group-focus-within:text-primary">verified_user</span>
                  </div>
                  <input
                    v-model="form.code"
                    type="text"
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
              <p v-if="validationErrors.code" class="mt-1.5 px-1 font-label-sm text-label-sm text-error flex items-center gap-1">
                <span class="material-symbols-outlined text-sm">error</span>
                {{ validationErrors.code }}
              </p>

              <div class="relative group">
                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                  <span class="material-symbols-outlined text-secondary group-focus-within:text-primary transition-colors">lock</span>
                </div>
                <input
                  v-model="form.password"
                  :type="showPassword ? 'text' : 'password'"
                  :class="[inputClassLg, 'pl-12 pr-12']"
                  :placeholder="$t('auth.password')"
                  required
                />
                <button
                  class="absolute inset-y-0 right-0 pr-4 flex items-center text-secondary hover:text-on-surface transition-colors"
                  type="button"
                  @click="togglePassword"
                >
                  <Transition name="icon-fade" mode="out-in">
                    <span :key="showPassword ? 'visible' : 'hidden'" class="material-symbols-outlined">
                      {{ showPassword ? 'visibility' : 'visibility_off' }}
                    </span>
                  </Transition>
                </button>
                <p v-if="validationErrors.password" class="mt-1.5 px-1 font-label-sm text-label-sm text-error flex items-center gap-1">
                  <span class="material-symbols-outlined text-sm">error</span>
                  {{ validationErrors.password }}
                </p>
              </div>

              <div class="relative group">
                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                  <span class="material-symbols-outlined text-secondary group-focus-within:text-primary transition-colors">lock_reset</span>
                </div>
                <input
                  v-model="form.confirmPassword"
                  :type="showConfirmPassword ? 'text' : 'password'"
                  :class="[inputClassLg, 'pl-12 pr-12']"
                  :placeholder="$t('auth.confirmPassword')"
                  required
                />
                <button
                  class="absolute inset-y-0 right-0 pr-4 flex items-center text-secondary hover:text-on-surface transition-colors"
                  type="button"
                  @click="toggleConfirmPassword"
                >
                  <span class="material-symbols-outlined">{{ showConfirmPassword ? 'visibility' : 'visibility_off' }}</span>
                </button>
                <p v-if="validationErrors.confirmPassword" class="mt-1.5 px-1 font-label-sm text-label-sm text-error flex items-center gap-1">
                  <span class="material-symbols-outlined text-sm">error</span>
                  {{ validationErrors.confirmPassword }}
                </p>
              </div>

              <div class="relative group">
                <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                  <span class="material-symbols-outlined text-secondary group-focus-within:text-primary transition-colors">school</span>
                </div>
                <select
                  v-model="form.cetLevel"
                  :class="[inputClassLg, 'pl-12 pr-4 appearance-none cursor-pointer']"
                  required
                >
                  <option value="" disabled>{{ $t('auth.cefLevel') }}</option>
                  <option value="CET4">{{ $t('auth.cet4') }}</option>
                  <option value="CET6">{{ $t('auth.cet6') }}</option>
                </select>
                <p v-if="validationErrors.cetLevel" class="mt-1.5 px-1 font-label-sm text-label-sm text-error flex items-center gap-1">
                  <span class="material-symbols-outlined text-sm">error</span>
                  {{ validationErrors.cetLevel }}
                </p>
              </div>

              <div class="pt-2">
                <button
                  :disabled="isLoading"
                  class="w-full py-3.5 px-4 bg-primary hover:bg-on-primary-fixed-variant text-on-primary font-label-lg text-label-lg rounded-full shadow-md hover:shadow-lg transition-all duration-200 flex items-center justify-center gap-2 active:scale-95 disabled:opacity-80 disabled:cursor-not-allowed"
                  type="submit"
                >
                  <span>{{ isLoading ? $t('auth.register') + '...' : $t('auth.register') }}</span>
                  <span v-if="isLoading" class="material-symbols-outlined animate-spin">progress_activity</span>
                </button>
              </div>
            </form>

            <div class="mt-8 text-center">
              <p class="font-body-md text-body-md text-on-surface-variant">
                {{ $t('auth.hasAccount') }}
                <router-link class="text-primary font-bold hover:underline underline-offset-4 transition-all" to="/login">{{ $t('auth.goLogin') }}</router-link>
              </p>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useUserStore } from '@/stores/user'
import { useToast } from '@/composables/useToast'
import { useCountdown } from '@/composables/useCountdown'
import { inputClassLg } from '@/components/ui/formStyles'

const route = useRoute()
const router = useRouter()
const userStore = useUserStore()
const { t } = useI18n()
const { show: toast } = useToast()

const isLogin = computed(() => route.path === '/login')

const form = ref({
  nickname: '',
  account: '',
  code: '',
  password: '',
  confirmPassword: '',
  cetLevel: ''
})

const validationErrors = ref({
  nickname: '',
  account: '',
  code: '',
  password: '',
  confirmPassword: '',
  cetLevel: ''
})

const showPassword = ref(false)
const showConfirmPassword = ref(false)
const codeSent = ref(false)
const { remaining, reset } = useCountdown(60, undefined, false)

const isLoading = computed(() => userStore.isLoading)

const phonePattern = /^1[3-9]\d{9}$/
const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
const passwordRulePattern = /^(?=.*[a-z])(?=.*\d).{10,}$/

const togglePassword = () => {
  showPassword.value = !showPassword.value
}

const toggleConfirmPassword = () => {
  showConfirmPassword.value = !showConfirmPassword.value
}

/** 判断账号是手机号还是邮箱 */
const resolveAccountType = (value: string): 'phone' | 'email' | null => {
  const v = value.trim()
  if (phonePattern.test(v)) return 'phone'
  if (emailPattern.test(v)) return 'email'
  return null
}

/** 发送验证码（本地模拟，固定 123456） */
const sendCode = () => {
  if (!resolveAccountType(form.value.account)) {
    toast(t('auth.accountEmpty'), 'warning')
    return
  }
  codeSent.value = true
  toast(t('auth.codeSentMock', { code: '123456' }), 'success')
  reset()
}

const validate = (): boolean => {
  const err = { nickname: '', account: '', code: '', password: '', confirmPassword: '', cetLevel: '' }
  let valid = true

  // 昵称可选，但填了则限制长度
  if (form.value.nickname.trim() && form.value.nickname.trim().length > 20) {
    err.nickname = '昵称长度不能超过20个字符'
    valid = false
  }
  // 账号：手机号或邮箱必填且格式正确
  const accountType = resolveAccountType(form.value.account)
  if (!accountType) {
    err.account = t('auth.accountEmpty')
    valid = false
  }
  // 验证码必填
  if (!form.value.code.trim()) {
    err.code = t('auth.invalidCode')
    valid = false
  }
  // 密码强度：至少10位且含小写字母和数字
  if (!passwordRulePattern.test(form.value.password)) {
    err.password = t('auth.passwordInvalid')
    valid = false
  }
  if (form.value.password !== form.value.confirmPassword) {
    err.confirmPassword = t('auth.passwordMismatch')
    valid = false
  }
  if (!form.value.cetLevel) {
    err.cetLevel = '请选择考试级别'
    valid = false
  }

  validationErrors.value = err
  return valid
}

const handleRegister = async () => {
  if (!validate()) return

  // 解析账号类型，分别填入 phone / email
  const accountType = resolveAccountType(form.value.account)
  const phone = accountType === 'phone' ? form.value.account.trim() : undefined
  const email = accountType === 'email' ? form.value.account.trim() : undefined

  try {
    // 1. 注册
    await userStore.register({
      nickname: form.value.nickname.trim() || undefined,
      phone,
      email,
      code: form.value.code.trim(),
      password: form.value.password,
      cetLevel: form.value.cetLevel
    })
    // 2. 直接登录（用手机号或邮箱其一）
    await userStore.login({
      account: form.value.account.trim(),
      password: form.value.password
    })
    toast(t('auth.registerSuccess'), 'success')
    router.push('/assess')
  } catch (error: any) {
    toast(error.message || t('auth.register'), 'error')
  }
}
</script>
