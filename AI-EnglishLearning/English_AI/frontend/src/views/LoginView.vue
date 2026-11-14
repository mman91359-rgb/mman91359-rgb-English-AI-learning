<template>
  <div class="bg-background text-on-background min-h-screen flex antialiased">
    <aside class="hidden md:flex flex-col h-screen fixed left-0 top-0 w-sidebar-width bg-surface border-r border-outline-variant py-8 px-4 z-50">
      <div class="mb-8 px-4">
        <AppLogo to="/login" />
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
          <button :class="btnIcon"></button>
        </div>
      </header>

      <div class="flex-1 px-gutter py-8 w-full max-w-container-max mx-auto space-y-8 flex flex-col justify-center">
        <div class="grid grid-cols-1 md:grid-cols-12 gap-gutter">
          <div class="col-span-1 md:col-span-6 md:col-start-4 bg-surface rounded-[24px] p-8 sm:p-10 shadow-soft-glow relative overflow-hidden">
            <div class="text-center mb-10">
              <div class="inline-flex items-center justify-center w-16 h-16 rounded-full bg-primary-container/10 mb-4">
                <span class="material-symbols-outlined text-primary text-3xl fill">auto_stories</span>
              </div>
              <h1 class="font-headline-xl text-headline-xl text-on-surface mb-2">{{ $t('app.title') }}</h1>
              <p class="font-body-md text-body-md text-on-surface-variant">{{ $t('app.subtitle') }}</p>
            </div>

            <form class="space-y-5" novalidate @submit.prevent="handleLogin">
              <div>
                <div class="relative group">
                  <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                    <span class="material-symbols-outlined text-secondary group-focus-within:text-primary transition-colors">alternate_email</span>
                  </div>
                  <input
                    v-model="account"
                    :class="[inputClassLg, 'pl-12 pr-4', errors.account ? inputErrorClass : '']"
                    :placeholder="$t('auth.accountPlaceholder')"
                    :aria-invalid="errors.account ? 'true' : 'false'"
                    type="text"
                    autocomplete="off"
                    @input="errors.account = ''"
                  />
                </div>
                <FormHint v-if="errors.account" :message="errors.account" />
              </div>
              <div>
                <div class="relative group">
                  <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                    <span class="material-symbols-outlined text-secondary group-focus-within:text-primary transition-colors">lock</span>
                  </div>
                  <input
                    v-model="password"
                    :type="showPassword ? 'text' : 'password'"
                    :class="[inputClassLg, 'pl-12 pr-12', errors.password ? inputErrorClass : '']"
                    :placeholder="$t('auth.password')"
                    :aria-invalid="errors.password ? 'true' : 'false'"
                    autocomplete="new-password"
                    @input="errors.password = ''"
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
                </div>
                <FormHint v-if="errors.password" :message="errors.password" />
              </div>
              <div class="flex justify-between items-center">
                <FormHint tone="hint" :message="$t('auth.passwordRule')" class="!mt-0" />
                <router-link to="/forgot-password" class="font-label-md text-label-md text-primary hover:underline">
                  {{ $t('auth.forgotPassword') }}
                </router-link>
              </div>
              <FormHint v-if="formError" :message="formError" />
              <div class="pt-2">
                <button
                  :disabled="isLoading"
                  :class="btnPrimaryBlock"
                  type="submit"
                >
                  <span>{{ isLoading ? $t('auth.login') + '...' : $t('auth.login') }}</span>
                  <span v-if="isLoading" class="material-symbols-outlined animate-spin">progress_activity</span>
                </button>
              </div>
            </form>

            <div class="mt-8 text-center">
              <p class="font-body-md text-body-md text-on-surface-variant">
                {{ $t('auth.noAccount') }}
                <router-link class="text-primary font-bold hover:underline underline-offset-4 transition-all" to="/register">{{ $t('auth.goRegister') }}</router-link>
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
import { inputClassLg, inputErrorClass } from '@/components/ui/formStyles'
import FormHint from '@/components/ui/FormHint.vue'
import { btnIcon, btnPrimaryBlock } from '@/components/ui/buttonStyles'
import AppLogo from '@/components/ui/AppLogo.vue'

const { t } = useI18n()
const route = useRoute()
const router = useRouter()
const userStore = useUserStore()
const { show: toast } = useToast()

const isLogin = computed(() => route.path === '/login')

const account = ref('')
const password = ref('')
const showPassword = ref(false)

/** 字段级校验错误：与注册页一致，内联展示在输入框下方 */
const errors = ref({ account: '', password: '' })
/** 服务端返回的整体性错误（账号或密码错误等） */
const formError = ref('')

const isLoading = computed(() => userStore.isLoading)

const togglePassword = () => {
  showPassword.value = !showPassword.value
}

const validate = (): boolean => {
  const err = { account: '', password: '' }
  let valid = true

  if (!account.value.trim()) {
    err.account = t('auth.accountEmpty')
    valid = false
  }
  if (!password.value) {
    err.password = t('auth.passwordRequired')
    valid = false
  }

  errors.value = err
  return valid
}

const handleLogin = async () => {
  formError.value = ''
  if (!validate()) return

  try {
    await userStore.login({ account: account.value.trim(), password: password.value })
    toast(t('auth.loginSuccess'), 'success')
    // 等下一个微任务周期确保 store 状态已经更新，再导航
    await new Promise(r => setTimeout(r, 50))
    if (userStore.isAdmin) {
      router.push('/admin/overview')
      return
    }
    const redirect = typeof route.query.redirect === 'string' ? route.query.redirect : '/dashboard'
    router.push(redirect)
  } catch (error: any) {
    formError.value = error?.message || t('auth.loginFailed')
  }
}
</script>

<style scoped>
/*
 * 隐藏 Edge / IE 自带的密码显示按钮（::-ms-reveal）。
 * 本页已有 Material Symbols 的自定义眼睛，原生按钮会与之并列出现两个。
 * 仅作用于本页，避免影响未提供自定义切换的页面（忘记密码、设置页）。
 */
input[type='password']::-ms-reveal,
input[type='password']::-ms-clear {
  display: none;
}
</style>


