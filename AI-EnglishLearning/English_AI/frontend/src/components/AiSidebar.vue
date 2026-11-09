<template>
  <!-- overlay 模式：全局浮层（Teleport到body），页面有 inline 时自动隐藏 -->
  <template v-if="mode === 'overlay'">
    <template v-if="!aiStore.inlineMode">
      <Teleport to="body">
        <Transition name="sidebar">
          <div v-if="aiStore.isOpen" class="fixed top-0 right-0 h-full w-[400px] max-w-[90vw] bg-surface-container-lowest shadow-2xl z-50 flex flex-col border-l border-outline-variant">
            <AiSidebarContent @close="aiStore.close()" />
          </div>
        </Transition>
        <!-- 遮罩（移动端显示） -->
        <Transition name="fade">
          <div
            v-if="aiStore.isOpen"
            class="fixed inset-0 z-40 bg-scrim/20 md:hidden"
            @click="aiStore.close()"
          ></div>
        </Transition>
      </Teleport>
    </template>
  </template>

  <!-- inline 模式：内嵌到页面布局中，不覆盖 -->
  <template v-else>
    <Transition name="sidebar-inline">
      <!--
        高度锚定：父级只有 min-h-screen（无确定高度），h-full 会被内容撑高，
        导致消息区没有真正的滚动容器、输入区跟着页面滚走。
        改为 sticky + h-screen，让侧栏高度恒等于视口高度。

        窄屏整屏接管：360→400px 的固定宽度在 <768px 时会横向溢出，
        侧栏自己的关闭按钮被推到屏幕外，用户没有回路。故窄屏改 w-full。
      -->
      <div
        v-if="aiStore.isOpen"
        class="sticky top-0 flex h-screen w-full flex-shrink-0 flex-col border-l border-outline-variant bg-surface-container-lowest md:w-[400px]"
      >
        <!--
          返回题目：作为消息区的**同级节点**占据真实高度。
          若做成消息区内部的 sticky 浮层，会永久遮住滚到顶部的卡片的折叠入口（卡片头部即唯一开关）。
          桌面端题目仍在侧栏旁可见，故 md 以上不渲染。
        -->
        <button
          type="button"
          class="flex h-11 shrink-0 items-center gap-1.5 border-b border-outline-variant/40 px-5 font-label-lg text-label-lg text-primary transition-colors hover:bg-surface-container-low md:hidden"
          @click="aiStore.close()"
        >
          <span class="material-symbols-outlined text-icon-md" aria-hidden="true">arrow_back</span>
          <span>{{ t('ai.backToQuestion') }}</span>
        </button>

        <div class="min-h-0 flex-1">
          <AiSidebarContent @close="aiStore.close()" />
        </div>
      </div>
    </Transition>
  </template>
</template>

<script setup lang="ts">
import AiSidebarContent from './AiSidebarContent.vue'
import { useAiStore } from '@/stores/ai'
import { useI18n } from 'vue-i18n'

withDefaults(defineProps<{
  mode?: 'overlay' | 'inline'
}>(), {
  mode: 'overlay',
})

const { t } = useI18n()
const aiStore = useAiStore()
</script>

<style scoped>
.sidebar-enter-active,
.sidebar-leave-active {
  transition: transform 0.3s ease;
}
.sidebar-enter-from,
.sidebar-leave-to {
  transform: translateX(100%);
}

.sidebar-inline-enter-active,
.sidebar-inline-leave-active {
  transition: width 0.3s ease, opacity 0.3s ease;
  overflow: hidden;
}
.sidebar-inline-enter-from,
.sidebar-inline-leave-to {
  width: 0 !important;
  opacity: 0;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
