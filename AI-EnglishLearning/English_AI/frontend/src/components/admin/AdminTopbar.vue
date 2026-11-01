<template>
  <header class="h-16 sticky top-0 z-40 bg-background/90 backdrop-blur-md border-b border-outline-variant/30 px-4 md:px-8 flex items-center justify-between">
    <div class="min-w-0">
      <div class="flex items-center gap-2 font-label-md text-label-md text-on-surface-variant">
        <span>{{ $t('admin.title') }}</span>
        <span class="material-symbols-outlined text-[14px]">chevron_right</span>
        <span class="text-on-surface font-semibold truncate">{{ pageTitle }}</span>
      </div>
      <p class="font-body-sm text-body-sm text-on-surface-variant truncate">{{ pageSubtitle }}</p>
    </div>

    <div class="flex items-center gap-2 sm:gap-3">
      <button
        type="button"
        class="p-2 rounded-full text-on-surface-variant hover:bg-surface-container-high/50 transition-colors"
        :aria-label="$t('topbar.switchToDark')"
        @click="appStore.toggleTheme"
      >
        <span class="material-symbols-outlined">{{ appStore.isDark ? 'light_mode' : 'dark_mode' }}</span>
      </button>
      <div class="hidden sm:flex flex-col items-end">
        <span class="font-label-lg text-label-lg text-on-surface">{{ userStore.username }}</span>
        <span class="font-label-md text-label-md text-primary">{{ $t('admin.roleAdmin') }}</span>
      </div>
      <div class="w-9 h-9 rounded-full bg-primary text-on-primary flex items-center justify-center font-bold overflow-hidden">
        <img v-if="userStore.avatarUrl" :src="userStore.avatarUrl" alt="" class="w-full h-full object-cover" />
        <span v-else>{{ avatarText }}</span>
      </div>
      <button
        type="button"
        class="p-2 rounded-full text-on-surface-variant hover:bg-error-container/30 hover:text-error transition-colors"
        :aria-label="$t('nav.logout')"
        @click="logout"
      >
        <span class="material-symbols-outlined">logout</span>
      </button>
    </div>
  </header>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useUserStore } from '../../stores/user'
import { useAppStore } from '../../stores/app'

const route = useRoute()
const router = useRouter()
const { t } = useI18n()
const userStore = useUserStore()
const appStore = useAppStore()

const pageTitle = computed(() => {
  const title = route.meta.adminTitle
  if (typeof title === 'string' && title) return title
  const map: Record<string, string> = {
    '/admin/overview': t('admin.overview'),
    '/admin/users': t('admin.users'),
    '/admin/questions': t('admin.questions'),
  }
  return map[route.path] || t('admin.title')
})

const pageSubtitle = computed(() => {
  if (route.path === '/admin/overview') return t('admin.overviewSubtitle')
  if (route.path.startsWith('/admin/users')) return t('admin.usersSubtitle')
  if (route.path === '/admin/questions') return t('admin.questionsSubtitle')
  return ''
})

const avatarText = computed(() => (userStore.username || 'A').slice(0, 1).toUpperCase())

const logout = () => {
  userStore.logout()
  router.push('/login')
}
</script>
