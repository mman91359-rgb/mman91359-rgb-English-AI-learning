<template>
  <router-view />
  <ToastNotification />
  <AiSidebar />
</template>

<script setup lang="ts">
import { onMounted } from 'vue'
import ToastNotification from '@/components/ToastNotification.vue'
import AiSidebar from '@/components/AiSidebar.vue'
import { useUserStore } from '@/stores/user'
import { useUserActivity } from '@/composables/useUserActivity'
import { useStudySession } from '@/composables/useStudySession'
import { useIdleLogout } from '@/composables/useIdleLogout'

const userStore = useUserStore()

// 全局活动监听、学习会话计时、空闲登出
useUserActivity()
const { flushAndStop } = useStudySession()
useIdleLogout({ onIdle: flushAndStop })

onMounted(() => {
  // 刷新页面后恢复金币与每组单词数量
  if (userStore.isLoggedIn) {
    void userStore.loadUserExtras()
  }
})
</script>
