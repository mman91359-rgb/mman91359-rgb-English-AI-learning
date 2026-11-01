<template>
  <header class="sticky top-0 z-30 flex h-admin-topbar items-center gap-4 border-b border-outline-variant/50 bg-surface/90 px-6 backdrop-blur-md">
    <div class="flex min-w-0 flex-1 flex-col">
      <span class="truncate font-label-sm text-label-sm text-on-surface-variant">{{ $t('adminConsole.nav.adminConsole') }}</span>
      <h1 class="truncate font-headline-sm text-headline-sm text-on-surface">{{ pageTitle }}</h1>
    </div>

    <button
      type="button"
      class="flex h-9 items-center gap-1 rounded-full px-3 font-label-md text-label-md text-on-surface-variant transition-colors hover:bg-surface-container-high"
      :aria-label="$t('adminConsole.topbar.switchLocale')"
      @click="toggleLocale"
    >
      <span class="material-symbols-outlined text-icon-md">translate</span>
      {{ appStore.language === 'zh-CN' ? 'EN' : '中文' }}
    </button>

    <button
      type="button"
      class="flex h-9 w-9 items-center justify-center rounded-full text-on-surface-variant transition-all duration-200 hover:rotate-12 hover:bg-surface-container-high"
      :aria-label="$t('adminConsole.topbar.toggleTheme')"
      @click="appStore.toggleTheme"
    >
      <span class="material-symbols-outlined text-icon-md">{{ appStore.isDark ? 'light_mode' : 'dark_mode' }}</span>
    </button>

    <div class="flex items-center gap-3 border-l border-outline-variant/50 pl-4">
      <div class="flex h-9 w-9 items-center justify-center overflow-hidden rounded-full bg-primary-container text-on-primary-container">
        <img v-if="userStore.avatarUrl" :src="userStore.avatarUrl" alt="" class="h-full w-full object-cover" />
        <span v-else class="material-symbols-outlined text-icon-md">admin_panel_settings</span>
      </div>
      <div class="hidden flex-col sm:flex">
        <span class="font-label-md text-label-md text-on-surface">{{ userStore.username || $t('adminConsole.topbar.adminRole') }}</span>
        <span class="font-label-sm text-label-sm text-on-surface-variant">ROLE_ADMIN</span>
      </div>
      <button
        type="button"
        class="flex h-9 w-9 items-center justify-center rounded-full text-on-surface-variant transition-colors hover:bg-error-container hover:text-on-error-container"
        :aria-label="$t('adminConsole.topbar.logout')"
        :title="$t('adminConsole.topbar.logout')"
        @click="logout"
      >
        <span class="material-symbols-outlined text-icon-md">logout</span>
      </button>
    </div>
  </header>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useAppStore } from '../../stores/app'
import { useUserStore } from '../../stores/user'

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const appStore = useAppStore()
const userStore = useUserStore()

const pageTitle = computed(() => {
  const key = route.meta.adminTitleKey
  return typeof key === 'string' ? t(key) : t('adminConsole.nav.overview')
})

const toggleLocale = () => {
  appStore.setLanguage(appStore.language === 'zh-CN' ? 'en-US' : 'zh-CN')
}

const logout = () => {
  userStore.logout()
  router.push('/login')
}
</script>
