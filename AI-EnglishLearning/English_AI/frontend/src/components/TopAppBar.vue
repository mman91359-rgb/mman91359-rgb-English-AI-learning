<template>
  <!-- 通栏：顶栏铺满视口宽（左右各留 px-gutter），与主体 max-w-container-max 居中布局解耦；
       备考目标条据此贴最左，右侧通知/主题/语言/头像贴最右 -->
  <header class="h-20 sticky top-0 z-40 bg-background/80 backdrop-blur-md flex items-center justify-between px-gutter w-full">
    <div class="flex items-center gap-3 sm:gap-4">
      <div class="md:hidden">
        <AppIcon name="menu" size="md" tone="onSurface" class="cursor-pointer" />
      </div>
      <slot name="left" />
      <CoinBadge v-if="!hideCoinBadge" class="ml-1 sm:ml-2" />
    </div>
    <div class="flex items-center gap-2 sm:gap-4">
      <slot name="right">
        <!-- 通知按钮：铃铛，点击进入通知中心页；红点读服务端 unread-count 合计 -->
        <button
          class="relative"
          :class="btnIcon"
          :aria-label="$t('topbar.notifications')"
          @click="goNotifications"
        >
          <AppIcon name="notifications" size="md" />
          <span
            v-if="unreadTotal > 0"
            class="absolute top-1 right-1 w-2 h-2 bg-error rounded-full"
          ></span>
        </button>

        <!-- 主题切换按钮：太阳/月亮 -->
        <button
          :class="btnIcon"
          :aria-label="appStore.isDark ? $t('topbar.switchToLight') : $t('topbar.switchToDark')"
          @click="appStore.toggleTheme"
        >
          <AppIcon :name="appStore.isDark ? 'light_mode' : 'dark_mode'" size="md" />
        </button>

        <!-- 语言切换按钮：地球网格图标 -->
        <button
          :class="btnIcon"
          :aria-label="$t('topbar.currentLanguage') + ': ' + currentLanguageLabel"
          @click="cycleLanguage"
        >
          <AppIcon name="language" size="md" />
        </button>

        <!-- 用户头像：有头像显示图片，无头像显示首字母 -->
        <div
          class="rounded-full bg-primary text-on-primary flex items-center justify-center cursor-pointer font-bold select-none overflow-hidden transition-all duration-200 hover:scale-105 hover:ring-2 hover:ring-primary/40 active:scale-95"
          :class="compact ? 'w-8 h-8 text-sm' : 'w-10 h-10 text-base'"
          :title="userStore.username || '用户'"
          :aria-label="$t('profile.userInfo')"
          role="button"
          tabindex="0"
          @click="$emit('userClick')"
          @keydown.enter="$emit('userClick')"
        >
          <img
            v-if="topbarAvatarUrl"
            :src="topbarAvatarUrl"
            alt="头像"
            class="w-full h-full object-cover"
          />
          <span v-else>{{ avatarText }}</span>
        </div>
      </slot>
    </div>
  </header>
</template>

<script setup lang="ts">
import { computed, ref, onMounted, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useI18n } from 'vue-i18n'
import { useAppStore } from '@/stores/app'
import { useUserStore } from '@/stores/user'
import { useNotifications } from '@/composables/useNotifications'
import { fetchUnreadCount } from '@/api/notification'
import CoinBadge from '@/components/CoinBadge.vue'
import { btnIcon } from '@/components/ui/buttonStyles'
import AppIcon from './ui/AppIcon.vue'

defineEmits(['userClick'])

withDefaults(defineProps<{
  hideCoinBadge?: boolean
  compact?: boolean
}>(), {
  hideCoinBadge: false,
  compact: false,
})

const { t } = useI18n()
const appStore = useAppStore()
const userStore = useUserStore()
// 保留调用以注册答题成就监听（用户要求暂不删除产生逻辑）；列表与红点已改走服务端
useNotifications()

// 头像首字母
const avatarText = computed(() => {
  const name = userStore.user?.username || userStore.username || ''
  return name ? name.charAt(0).toUpperCase() : 'M'
})

// 头像完整URL（拼上网关前缀）
const topbarAvatarUrl = computed(() => {
  const url = userStore.avatarUrl
  if (!url) return ''
  return `/api${url}`
})

const currentLanguageLabel = computed(() => {
  const labels: Record<string, string> = {
    'zh-CN': t('settings.langZhCN'),
    'en-US': t('settings.langEnUS'),
  }
  return labels[appStore.language] || appStore.language
})

// 循环切换语言
const cycleLanguage = () => {
  const langs = ['zh-CN', 'en-US'] as const
  const idx = langs.indexOf(appStore.language)
  const next = langs[(idx + 1) % langs.length]
  appStore.setLanguage(next)
}

// 红点来源：服务端公告 + 个人通知合计；登录态变化与挂载时刷新
const unreadTotal = ref(0)
const router = useRouter()
const route = useRoute()
const goNotifications = () => void router.push('/notifications')

const refreshUnread = async () => {
  // 未登录时不发请求，避免 401 触发刷新链路
  if (!userStore.userId) {
    unreadTotal.value = 0
    return
  }
  try {
    const res = await fetchUnreadCount()
    unreadTotal.value = res.total
  } catch {
    unreadTotal.value = 0
  }
}

onMounted(refreshUnread)
// 路由切换（从通知页返回）与登录用户变化时重新取红点
watch(() => route.fullPath, refreshUnread)
watch(() => userStore.userId, refreshUnread)
</script>
