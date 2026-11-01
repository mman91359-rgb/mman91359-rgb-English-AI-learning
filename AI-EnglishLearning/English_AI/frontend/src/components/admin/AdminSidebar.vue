<template>
  <aside
    class="hidden md:flex flex-col h-screen fixed left-0 top-0 bg-surface border-r border-outline-variant z-50 transition-all duration-200"
    :class="collapsed ? 'w-[72px] px-2 py-6' : 'w-[240px] px-4 py-6'"
  >
    <div class="flex items-center gap-3 mb-8" :class="collapsed ? 'justify-center' : 'px-2'">
      <span class="w-10 h-10 rounded-2xl bg-primary text-on-primary flex items-center justify-center flex-shrink-0">
        <span class="material-symbols-outlined">admin_panel_settings</span>
      </span>
      <div v-if="!collapsed" class="min-w-0">
        <p class="font-label-lg text-label-lg text-primary font-bold truncate">Recall·睿考</p>
        <p class="font-label-md text-label-md text-on-surface-variant">{{ $t('admin.title') }}</p>
      </div>
    </div>

    <nav class="flex-1 flex flex-col gap-1">
      <router-link
        v-for="item in p0Items"
        :key="item.path"
        :to="item.path"
        class="flex items-center gap-3 px-3 py-3 rounded-xl transition-colors"
        :class="isActive(item.path)
          ? 'bg-primary-container/20 text-primary font-bold border-l-2 border-primary'
          : 'text-on-surface-variant hover:bg-surface-container hover:text-on-surface'"
        :title="collapsed ? item.label : undefined"
      >
        <span class="material-symbols-outlined flex-shrink-0">{{ item.icon }}</span>
        <span v-if="!collapsed" class="font-label-lg text-label-lg truncate">{{ item.label }}</span>
      </router-link>

      <div v-if="!collapsed" class="mt-4 px-3 font-label-md text-label-md text-outline uppercase tracking-wide">
        {{ $t('admin.nextRound') }}
      </div>
      <button
        v-for="item in p1Items"
        :key="item.path"
        type="button"
        class="flex items-center gap-3 px-3 py-3 rounded-xl text-on-surface-variant/50 cursor-not-allowed"
        :title="collapsed ? item.label : undefined"
        disabled
      >
        <span class="material-symbols-outlined flex-shrink-0">{{ item.icon }}</span>
        <span v-if="!collapsed" class="font-label-lg text-label-lg truncate">{{ item.label }}</span>
      </button>
    </nav>

    <div class="mt-auto pt-4 border-t border-outline-variant/30 space-y-1">
      <router-link to="/dashboard" class="flex items-center gap-3 px-3 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container hover:text-on-surface transition-colors" :title="collapsed ? $t('admin.backToLearning') : undefined">
        <span class="material-symbols-outlined flex-shrink-0">arrow_back</span>
        <span v-if="!collapsed" class="font-label-lg text-label-lg truncate">{{ $t('admin.backToLearning') }}</span>
      </router-link>
      <button type="button" class="w-full flex items-center gap-3 px-3 py-3 rounded-xl text-on-surface-variant hover:bg-surface-container hover:text-on-surface transition-colors" @click="$emit('toggle')">
        <span class="material-symbols-outlined flex-shrink-0">{{ collapsed ? 'chevron_right' : 'chevron_left' }}</span>
        <span v-if="!collapsed" class="font-label-lg text-label-lg">{{ collapsed ? $t('admin.expand') : $t('admin.collapse') }}</span>
      </button>
    </div>
  </aside>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRoute } from 'vue-router'
import { useI18n } from 'vue-i18n'

defineProps<{ collapsed: boolean }>()
defineEmits<{ toggle: [] }>()

const route = useRoute()
const { t } = useI18n()

const p0Items = computed(() => [
  { path: '/admin/overview', label: t('admin.overview'), icon: 'dashboard' },
  { path: '/admin/users', label: t('admin.users'), icon: 'group' },
  { path: '/admin/questions', label: t('admin.questions'), icon: 'fact_check' },
])
const p1Items = computed(() => [
  { path: '/admin/notices', label: t('admin.notices'), icon: 'campaign' },
  { path: '/admin/activities', label: t('admin.activities'), icon: 'event' },
  { path: '/admin/logs', label: t('admin.logs'), icon: 'receipt_long' },
])
const isActive = (path: string) => route.path === path || route.path.startsWith(`${path}/`)
</script>
