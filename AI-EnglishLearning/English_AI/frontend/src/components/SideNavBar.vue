<template>
  <aside class="hidden md:flex flex-col h-screen fixed left-0 top-0 w-sidebar-width bg-surface border-r border-outline-variant py-8 px-4 z-50">
    <div class="mb-10 px-4">
      <div class="flex items-center gap-2">
        <span class="material-symbols-outlined text-primary text-3xl">school</span>
        <h1 class="text-headline-md font-headline-md font-bold text-primary">{{ $t('app.title') }}</h1>
      </div>
      <div class="mt-2 flex flex-col">
        <span class="text-label-md font-label-md text-on-surface-variant">{{ $t('dashboard.streakDays') }}</span>
        <span class="text-headline-md font-headline-md text-primary font-bold">{{ checkInStreak }} {{ $t('stats.days') }}<span v-if="checkInStreak >= 3" class="ml-1">🔥</span></span>
      </div>
    </div>
    <nav class="flex-1 flex flex-col gap-2">
      <router-link
        v-for="item in mainNavItems"
        :key="item.name"
        :to="item.path"
        :class="[
          'group relative flex items-center gap-4 px-4 py-3 rounded-xl overflow-hidden transition-all duration-300 ease-out hover:translate-x-1 hover:bg-primary-container/15 hover:shadow-sm active:scale-[0.98]',
          isActive(item.path)
            ? 'bg-primary-container/10 text-primary font-bold'
            : 'text-on-surface-variant hover:text-primary'
        ]"
      >
        <span
          class="absolute left-0 top-1/2 -translate-y-1/2 w-0.5 h-6 rounded-full bg-primary origin-center transition-all duration-300"
          :class="isActive(item.path) ? 'opacity-100 scale-y-100' : 'opacity-0 scale-y-0'"
        ></span>
        <span
          class="material-symbols-outlined transition-transform duration-300 group-hover:scale-110"
          :class="{ 'fill': isActive(item.path) }"
        >{{ item.icon }}</span>
        <span class="font-label-lg text-label-lg transition-all duration-300 group-hover:tracking-wide">{{ item.label }}</span>
      </router-link>
    </nav>
    <div class="mt-auto flex flex-col gap-2">
      <router-link
        v-for="item in bottomNavItems"
        :key="item.name"
        :to="item.path"
        :class="[
          'group relative flex items-center gap-4 px-4 py-3 rounded-xl overflow-hidden transition-all duration-300 ease-out hover:translate-x-1 hover:bg-primary-container/15 hover:shadow-sm active:scale-[0.98]',
          isActive(item.path)
            ? 'bg-primary-container/10 text-primary font-bold'
            : 'text-on-surface-variant hover:text-primary'
        ]"
      >
        <span
          class="absolute left-0 top-1/2 -translate-y-1/2 w-0.5 h-6 rounded-full bg-primary origin-center transition-all duration-300"
          :class="isActive(item.path) ? 'opacity-100 scale-y-100' : 'opacity-0 scale-y-0'"
        ></span>
        <span
          class="material-symbols-outlined transition-transform duration-300 group-hover:scale-110"
          :class="{ 'fill': isActive(item.path) }"
        >{{ item.icon }}</span>
        <span class="font-label-lg text-label-lg transition-all duration-300 group-hover:tracking-wide">{{ item.label }}</span>
      </router-link>
    </div>
  </aside>
</template>

<script setup lang="ts">
import { computed, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useUserStore } from '@/stores/user'

const { t } = useI18n()
const route = useRoute()
const userStore = useUserStore()

// 连续签到天数：从 userStore 读取后端签到数据
const checkInStreak = computed(() => userStore.checkInStreak)

// 组件挂载时，如果签到信息还未加载则加载一次
onMounted(() => {
  if (userStore.userId && !userStore.coinLoaded) {
    void userStore.loadCoinInfo()
  }
})

const mainNavItems = computed(() => [
  { name: 'home', path: '/dashboard', label: t('nav.home'), icon: 'home' },
  { name: 'stats', path: '/stats', label: t('nav.stats'), icon: 'analytics' },
  { name: 'learning', path: '/learning', label: t('nav.learning'), icon: 'school' },
  { name: 'profile', path: '/profile', label: t('nav.profile'), icon: 'person' },
])

const bottomNavItems = computed(() => [
  { name: 'settings', path: '/settings', label: t('nav.settings'), icon: 'settings' },
  { name: 'logout', path: '/logout', label: t('nav.logout'), icon: 'logout' },
])

const isActive = (path: string) => {
  if (path === '/dashboard') {
    return route.path === '/dashboard' || route.path === '/'
  }
  if (path === '/learning') {
    return route.path === '/learning'
      || route.path.startsWith('/learning/practice')
      || route.path === '/vocab-quiz'
      || route.path === '/grammar-quiz'
  }
  return route.path.startsWith(path)
}
</script>
