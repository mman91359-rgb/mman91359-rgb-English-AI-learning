<template>
  <div class="bg-background text-on-background min-h-screen flex">
    <SideNavBar />
    <main class="flex-1 w-full md:ml-sidebar-width flex flex-col min-h-screen relative">
      <slot name="topbar">
        <TopAppBar v-if="!hideTopBar" :hide-coin-badge="hideCoinBadge" @user-click="goProfile">
          <template #left>
            <ExamGoalStrip />
          </template>
        </TopAppBar>
      </slot>
      <div :class="flush ? 'flex-1 w-full max-w-container-max mx-auto px-gutter py-8 pb-24 md:pb-8' : 'flex-1 px-gutter py-8 w-full max-w-container-max mx-auto space-y-8 pb-24 md:pb-8'">
        <slot />
      </div>
    </main>
    <BottomNavBar />
  </div>
</template>

<script setup lang="ts">
import { useRouter } from 'vue-router'
import SideNavBar from './SideNavBar.vue'
import TopAppBar from './TopAppBar.vue'
import BottomNavBar from './BottomNavBar.vue'
import ExamGoalStrip from './ExamGoalStrip.vue'

withDefaults(defineProps<{
  /** 去掉默认的 space-y-8，由页面自己控制内容间距。
   *  ⚠️ 与 `PageHeader` 的 `flush` **同名不同义**：这里去掉的是外层容器的 `space-y-8`，
   *  那边只去掉组件自身的 `mb-8`，两者互不影响。 */
  flush?: boolean
  /** 隐藏顶栏金币徽章（静态稿顶栏没有金币） */
  hideCoinBadge?: boolean
  /** 隐藏默认顶栏，页面通过 #topbar 插槽自定义 */
  hideTopBar?: boolean
}>(), {
  flush: false,
  hideCoinBadge: false,
  hideTopBar: false,
})

const router = useRouter()
const goProfile = () => router.push('/profile')
</script>
