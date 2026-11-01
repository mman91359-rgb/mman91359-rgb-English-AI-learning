<template>
  <aside
    class="fixed inset-y-0 left-0 z-40 hidden flex-col border-r border-outline-variant/50 bg-surface-container-lowest transition-[width] duration-300 md:flex"
    :class="collapsed ? 'w-admin-sidebar-collapsed' : 'w-admin-sidebar'"
  >
    <div class="flex h-admin-topbar items-center gap-3 px-4" :class="collapsed ? 'justify-center' : ''">
      <span class="flex h-10 w-10 shrink-0 items-center justify-center rounded-xl bg-primary text-on-primary">
        <span class="material-symbols-outlined text-icon-md">school</span>
      </span>
      <div v-if="!collapsed" class="flex min-w-0 flex-col">
        <span class="truncate font-label-lg text-label-lg text-primary">Recall-睿考</span>
        <span class="truncate font-label-sm text-label-sm text-on-surface-variant">{{ $t('adminConsole.nav.adminConsole') }}</span>
      </div>
    </div>

    <nav class="flex flex-1 flex-col gap-6 overflow-y-auto px-3 py-4" :aria-label="$t('adminConsole.nav.adminConsole')">
      <div v-for="group in navGroups" :key="group.titleKey" class="flex flex-col gap-1">
        <span v-if="!collapsed" class="px-3 pb-1 font-label-xs text-label-xs uppercase tracking-wider text-outline">
          {{ $t(group.titleKey) }}
        </span>
        <router-link
          v-for="item in group.items"
          :key="item.path"
          :to="item.path"
          :title="collapsed ? $t(item.labelKey) : undefined"
          :aria-current="isActive(item.path) ? 'page' : undefined"
          class="group flex h-10 items-center gap-3 rounded-xl border-l-2 px-3 font-body-sm text-body-sm transition-all duration-200 hover:translate-x-0.5"
          :class="isActive(item.path)
            ? 'border-primary bg-primary-container/20 font-semibold text-primary'
            : 'border-transparent text-on-surface-variant hover:bg-surface-container-high hover:text-on-surface'"
          :style="collapsed ? 'justify-content:center' : undefined"
        >
          <span class="material-symbols-outlined text-icon-md transition-transform duration-200 group-hover:scale-110">
            {{ item.icon }}
          </span>
          <span v-if="!collapsed" class="truncate">{{ $t(item.labelKey) }}</span>
        </router-link>
      </div>
    </nav>

    <div class="mt-auto flex flex-col gap-1 border-t border-outline-variant/30 p-3">
      <router-link
        to="/dashboard"
        :title="collapsed ? $t('adminConsole.nav.backToLearning') : undefined"
        class="flex h-10 items-center gap-3 rounded-xl px-3 font-body-sm text-body-sm text-on-surface-variant transition-colors hover:bg-surface-container-high hover:text-on-surface"
        :style="collapsed ? 'justify-content:center' : undefined"
      >
        <span class="material-symbols-outlined text-icon-md">arrow_back</span>
        <span v-if="!collapsed" class="truncate">{{ $t('adminConsole.nav.backToLearning') }}</span>
      </router-link>
      <button
        type="button"
        class="flex h-10 items-center justify-center gap-2 rounded-xl text-on-surface-variant transition-colors hover:bg-surface-container-high"
        :aria-label="collapsed ? $t('adminConsole.nav.expand') : $t('adminConsole.nav.collapse')"
        @click="$emit('toggle')"
      >
        <span class="material-symbols-outlined text-icon-md">{{ collapsed ? 'chevron_right' : 'chevron_left' }}</span>
        <span v-if="!collapsed" class="font-label-md text-label-md">{{ $t('adminConsole.nav.collapse') }}</span>
      </button>
    </div>
  </aside>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRoute } from 'vue-router'

defineProps<{ collapsed: boolean }>()
defineEmits<{ toggle: [] }>()

const route = useRoute()

interface NavItem {
  path: string
  labelKey: string
  icon: string
}

interface NavGroup {
  titleKey: string
  items: NavItem[]
}

const navGroups = computed<NavGroup[]>(() => [
  { titleKey: 'adminConsole.nav.groupOverview', items: [{ path: '/admin/overview', labelKey: 'adminConsole.nav.overview', icon: 'dashboard' }] },
  { titleKey: 'adminConsole.nav.groupUsers', items: [{ path: '/admin/users', labelKey: 'adminConsole.nav.users', icon: 'group' }] },
  {
    titleKey: 'adminConsole.nav.groupOperations',
    items: [
      { path: '/admin/notices', labelKey: 'adminConsole.nav.notices', icon: 'campaign' },
      { path: '/admin/activities', labelKey: 'adminConsole.nav.activities', icon: 'celebration' },
    ],
  },
  { titleKey: 'adminConsole.nav.groupSystem', items: [{ path: '/admin/operation-logs', labelKey: 'adminConsole.nav.operationLogs', icon: 'history' }] },
  { titleKey: 'adminConsole.nav.groupContent', items: [{ path: '/admin/questions', labelKey: 'adminConsole.nav.questions', icon: 'fact_check' }] },
])

const isActive = (path: string) => route.path === path || route.path.startsWith(`${path}/`)
</script>
